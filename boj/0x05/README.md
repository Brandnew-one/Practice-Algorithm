# 0x05 스택

해당 내용은 [바킹독의 실전 알고리즘 강의 - 스택편](https://blog.encrypted.gg/933)을 학습하고 정리한 내용입니다.

한쪽 끝에서만 자료를 넣거나 뺄 수 있는 자료구조 → FILO

### 스택의 성질

- 원소의 추가 O(1)
- 원소의 제거 O(1)
- 제일 상단의 원소확인 O(1)
- 제일 상단이 아닌 나머지 원소들의 확인/변경은 원칙적으로 불가능

## 스택의 구현

배열, 연결리스트를 이용해서 구현하거나 STL을 사용

### 배열을 이용한 스택 구현

```cpp
// pos를 현재 스택의 top 다음 인덱스를 가리키도록 구현
const int N = 99999999;
int stack[N];
int pos = 0;
```

```cpp
// 값을 넣어준 후 pos를 증가
void push(int x) {
	stack[post++] = x;
}

// 이후 push과정에서 값을 덮어 쓸것이기 때문에 pos만 줄임
void pop() {
	pos--;
}

// top인덱스 = pos - 1의 값을 보여줌
int top() {
	return stack[pos - 1];
}
```

### STL을 이용

```cpp
stack<int> s;
s.push(10); // 10
s.push(20); // 10, 20

s.top() // 20;
s.pop() // 10
```

스택이 비어있는 경우에 top, pop 메서드를 호출하면 런타임 에러가 날 수 있음에 주의
