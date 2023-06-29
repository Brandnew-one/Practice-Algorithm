# 0x06 큐

- 원소의 추가, 제거 O(1)
- 제일 앞/뒤의 원소 확인이 O(1)
- 제일 앞/뒤가 아닌 원소들의 확인/변경이 원칙적으로 불가능

## C++ 기준

스택과 마찬가지로 배열, 연결리스트를 이용해서 구현하거나 STL을 사용할 수 있다.

### 배열을 이용한 구현

<img width="1294" alt="Untitled 1" src="https://github.com/Brandnew-one/Practice-Algorithm/assets/88618825/718d81bc-8fb6-4d3a-9c30-4ba5d0bbdc14">

- head: 가장 앞에 있는 원소의 인덱스
- tail: 가장 뒤에 있는 원소의 인덱스 + 1

그림과 같이 배열을 이용해 단순히 구현할 경우, 삭제와 삽입을 반복하다보면 앞쪽의 공간을 활용하지 못하는 문제가 발생하기 때문에 원형으로 구현한다.

(물론, 코테를 풀때는 공간 복잡도를 고려해서 그냥 array의 크기를 크게 사용할 수도 있다.)

### STL을 이용한 구현

```cpp
queue<int> q;
q.push(10);
q.push(20);
q.push(30); // 10 20 30

q.pop(); // 20 30
q.front(); // 20
q.back(); // 30
```

---

## Swift 기준

당연하게도 Swift에서는 Queue라는 자료구조를 제공하지 않는다(ㅠㅠ). 하지만 큐는 자주 출제되는 유형인 bfs, flood fill에서 사용하기 때문에 Swift로도 한번 정리하고 넘어가자

### 배열을 이용한 원형 큐

```cpp
struct Queue<T> {
  private var head: Int = 0
  private var tail: Int = 0
  private var content: [T?] = Array(repeating: nil, count: 100)

  var isEmpty: Bool {
    head == tail
  }

  mutating func push(_ data: T) {
    content[tail] = data
    tail += 1
    if tail >= 100 {
      tail = 0
    }
  }

  mutating func pop() {
    head += 1
    if head >= 100 {
      head = 0
    }
  }

  func front() -> T? {
    content[head]
  }

  func back() -> T? {
    tail == 0 ? content.last ?? nil : content[tail - 1]
  }

}

var q = Queue<Int>()

q.push(1) // 1
q.push(2) // 1, 2

print(q.front()) // 1
print(q.back()) // 2
```

큐의 크기가 제한된다는 한계점이 있긴 하지만 공간 복잡도 제한이 여유롭다면 원형이 아닌 선형 큐로 간단하게 구현해서 문제를 해결해도 된다.

### 스택2개를 이용하는 방법

<img width="929" alt="Untitled 2" src="https://github.com/Brandnew-one/Practice-Algorithm/assets/88618825/c559c4c1-4a75-4fa6-8f39-9f3be63a457c">

자료구조 수업시간에 한번쯤은 들어봤을 그 방법을 한번 사용해보도록 하자

1. A(push용 스택), B(pop용 스택)을 하나 둔다
2. pop하는 경우에는 A스택에 있던 데이터들을 하나씩 pop시켜 B스택에 넣는다.
3. B스택에서 pop을 한다.

즉, enqueue를 통해서 들어오는 값은 무조건 A스택에서 나가고 dequeue시 B스택이 비어 있으면 A스택의 값을 B스택에 넣은후 pop을 시키고, 비어 있지 않다면 B스택에서 pop을 하면 된다.

**A → B로 스택을 옮기는게 O(N)의 시간복잡도를 가지기 때문에 O(1)를 기대할 수 없는것 아닌가요?**

맞다. 하지만 Swift에서는 reversed() 메서드가 O(1)의 시간 복잡도를 가지기 때문에 시간 복잡도를 줄일 수 있다. (근데 값을 복사하면서 결국 O(N)의 시간 복잡도를 가질것 같은데 이부분은 테스트를 해봐야할것 같다.)

```cpp
struct Queue<T> {
  var left: [T] = []
  var right: [T] = []

  var isEmpty: Bool {
    left.isEmpty && right.isEmpty
  }

  var first: T? {
    right.isEmpty ? left.first : right.last
  }

  var last: T? {
    left.isEmpty ? right.first : left.last
  }

  mutating func push(_ value: T) {
    left.append(value)
  }

  mutating func pop() -> T? {
    if right.isEmpty {
      right = left.reversed()
      left.removeAll()
    }
    return right.popLast()
  }
}
```

### + 추가 정리

right = left.reversed() 의 시간복잡도는 O(N)이다.

left.reversed()의 시간복잡도는 O(1)이지만 left의 값을 복사해서 할당하는 과정에서 O(N)의 시간 복잡도가 필요하다.

