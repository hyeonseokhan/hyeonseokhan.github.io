---
title: BAEKJOON-Virus(#2606)
author: toycode
date: 2023-01-02 00:00:00 +0000
categories: [Algorithm, BFS/DFS]
tags: [Algorithm, BFS/DFS, BAEKJOON]
math: true
pin: false
---

# 깊이 우선 탐색(Depth First Search, DFS)

> _깊이 우선 탐색은 저장된 그래프의 모든 정점을 1번 방문하는 방법 중 하나이다._

깊이 우선 탐색은 스택(Stack)을 이용하며, 갈 수 있는 만큼 최대한 많이 가고 갈 수 없을 경우 이전 정점으로 돌아가서 다시 탐색을 하는 방법이다.
> 문제풀이 유형중 모든 노드를 방문 하고자 하는 경우에 이 방법을 선택한다.
{: .prompt-tip }


## 알고리즘 특징
- 자기 자신을 호출하는 순환 알고리즘의 형태를 가지고 있다.
- 전위 순회(Pre-Order Traversals)를 포함한 다른 형태의 트리 순회는 모두 DFS의 한 종류이다.
- 그래프 탐색의 경우 어떤 노드를 방문했었는지 여부를 반드시 검사해야 한다.

## 그래프의 종류
그래프를 저장하는 방법에는 크게 2가지 방법이 있다.

### 인접행렬(adjacency matrix)
인접 행렬은 그래프의 연결 관계를 `이차원 배열`로 나타내는 방식이다. 인접 행렬을 `adj[][]` 라고 한다면 `adj[i][j]` 에 대해서 다음과 같이 정의할 수 있다.
> `adj[i][j]`: 노드 `i` 에서 노드 `j` 로 가는 간선이 있으면 `1` , 아니면 `0`
{: .prompt-info }

### 인접리스트(adjacency list)
인접 리스트는 그래프의 연결 관계를 `vector의 배열(vector<Integer>adj[])` 로 나타내는 방식이다. 이 때, vector<Integer>에는 노드의 번호가 직접 저장된다.
인접 리스트는 `adj[i]` 를 다음과 같이 정의할 수 있다.
> `adj[i]`: 노드 `i` 에 연결된 노드들을 원소로 갖는 `vector`
{: .prompt-info }

## 실전문제

[BEAKJOON, Virus#2606](https://www.acmicpc.net/problem/2606)

```java
package com.toycode.algorithms.dfs;

import java.util.ArrayList;
import java.util.Scanner;

public class Virus {
  static ArrayList<Integer>[] lists;
  static boolean[] visits;
  static int count = 0;

  public static void main(String[] args) {
    Scanner sc = new Scanner(System.in);
    int nodes = sc.nextInt();   // 모든 노드의 수
    int lines = sc.nextInt();   // 모든 간선의 수
    int root = 1;               // 시작할 노드

    lists = new ArrayList[nodes + 1]; // 인덱스 편의상 '0' 번째 인덱스를 사용하지 않기위해 'nodes + 1' 을 한다.
    visits = new boolean[nodes + 1]; // 인덱스 편의상 '0' 번째 인덱스를 사용하지 않기위해 'nodes + 1' 을 한다.

    for (int i = 1; i <= nodes; i++)
      lists[i] = new ArrayList<>();

    for (int i = 0; i < lines; i++) {   // 노드관계 리스트 그리
      int from = sc.nextInt();        // 'A to B' 노드연결 구조에서 '기준노드'는 (A) 이다. 즉, 'from' == 'A' 이다.
      int to = sc.nextInt();          // 'A to B' 노드연결 구조에서 '대상노드'는 (B) 이다. 즉, 'to' == 'B' 이다.
      lists[from].add(to);            // 'lists[from]' 인덱스에 기준노드를 등록해준다. '.add(to)' 값에는 대상노드를 등록해준다.
      lists[to].add(from);            // Tip) 문제의 조건이 양방향일 경우 반대의 수도 등록해 준다.
    }

    dfs(root); // 루트노드 부터 탐색을 진행할 수 있도록 지정해준다.
    System.out.printf("%s", count);
  }

  static void dfs(int node) {
    visits[node] = true;            // 탐색을 시작한 노드의 방문여부를 채크한다.
    System.out.printf("visited %s%n", node);
    for (int to : lists[node]) {    // 노드관계 리스트에서 '기준노드'의 '대상노드'를 찾는다.
      if (!visits[to]) {          // '대상노드'의 방문여부 확인.
        dfs(to);                // 방문여부가 'false' 일경우 '대상노드'부터 다시 탐색한다.
        count++;
      }
    }
  }
}
```
## Reference
- <https://limkydev.tistory.com/93>
