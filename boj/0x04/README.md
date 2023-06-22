# 0x04 연결리스트

해당 내용은 [바킹독의 실전 알고리즘 강의 - 연결리스트편](https://blog.encrypted.gg/932)을 학습하고 정리한 내용입니다.

## C++ 기준

### 연결 리스트의 성질

- k번째 원소를 확인/변경하기 위해서 O(K)
- 임의의 위치에 원소를 추가/ 제거 O(1) → 임의의 위치 주소를 아는 경우
- 메모리 상에 연속하게 있지 않아 cache hit rate이 낮음

### 연결 리스트의 종류

<img width="650" alt="Untitled" src="https://github.com/Brandnew-one/Practice-Algorithm/assets/88618825/4908f085-8fdb-40b9-aa3b-3be3c0f26ef4">

3번째 원소의 위치에 어떤 값을 추가하거나 삭제하는 경우를 생각해보자.

- 배열의 경우 3번째 위치에 해당하는 인덱스에 데이터를 추가/제거하고 기존의 데이터를 연속하게 정렬하는 과정에서 O(N)의 시간 복잡도가 발생한다.
- 연결 리스트의 경우, 우선 첫번째 부터 세번째 원소의 위치까지 O(3)까지 찾아가는 과정이 필요하다
- 이후 해당 위치에 원소를 추가/제거하는 과정은 이전과 이후의 주소값만 변경하면 되기 때문에 O(1)의 시간 복잡도가 필요하다

→ 임의의 위치에 원소를 추가/제거 하는 연산을 많이 해야하는 경우에 연결 리스트를 고려해보자

### 연결 리스트의 구현

- 배열을 이용한 야매구현
- STL 이용

STL이 제한되지 않는 상황에서는 STL을 사용하지 않을 이유가 없지만 혹여나 제한된 상황에서는 정석적인 링크드리스트 구현하는데는 시간적으로 무리가 있기 때문에 배열을 이용해서 야매로 구현하자

```cpp
const int MX = 100005;
int dat[MX], prev[MX], next[MX];
int unused = 1;

file(pre, pre + MX, -1);
file(next, next + MX, -1);
```

<img width="916" alt="Untitled 1" src="https://github.com/Brandnew-one/Practice-Algorithm/assets/88618825/175821bc-1b72-46ee-9a7a-bc7e8095e441">

그림을 통해서도 이해할 수 있지만 0번 인덱스를 dummny node로 사용, next값이 -1이 나올때 까지 순회하는 방식으로 구현한다. 위의 형식을 기반으로 insert, erase는 Swift로 정리할 때 한번 구현해보자

(Swift에 링크드 리스트는 없으니까…)

```cpp
list<int> L = {1, 2};
list<int> :: iterator t = L.begin();
L.push_front(3); // {3, 1, 2}
cout << *t; // 1
L.insert(t, 6); // {3, 6, 1, 2}

```

C++을 이용한 풀이에서는 위와 같이 STL을 적극 활용하도록 하자

### List를 사용할 때 주의할 점 및 Tip

- List.end()는 제일 마지막 원소의 한 칸 뒤를 가르킨다
- insert, erase가 많을 때 cursor와 List를 함께 이용해야 시간복잡도에서 의미가 있다

```cpp
void solution(string &s) {
    list<char> L = {};
    list<char>::iterator it = L.begin();

    for(int i = 0; i < s.size(); i++) {
        if(s[i] == '<') {
            if(it != L.begin()) {
                it--;
            }
        } else if(s[i] == '>') {
            if(it != L.end()) {
                it++;
            }
        } else if(s[i] == '-') {
            if(it == L.begin()) continue;
            it--;
            it = L.erase(it);
        } else {
            L.insert(it, s[i]);
        }
    }

    for(list<char>::iterator t = L.begin(); t != L.end(); t++) {
        cout << *t;
    }
    cout << '\n';
}
```

List.end()가 제일 마지막 원소의 한 칸 뒤를 가르키는것을 이용하면 각 원소의 우측에 커서가 있는것으로 생각할 수 있다.

ex) ^1^2^3^4^

---

## Swift 기준

아주 슬프게도 Swift에서 기본적으로 제공해주는 자료구조에 연결 리스트는 없다. (물론 스택도 큐도 그래프도 트리도.. 사실 있는게 없다) 그럼 Swift로 연결 리스트가 필요한 문제는 어떻게 풀어야 하나요? → 만들어야 한다.

- 야매 연결리스트

실제 문제를 풀 때는 야매 연결리스트를 사용해서 풀이 할 예정이다. 정말 Swift를 이용해서 풀이해햐 하는 상황이 아니라면 개인적으로 다른 언어를 이용하는 것을 추천한다.
