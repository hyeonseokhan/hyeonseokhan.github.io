---
title: HACKERRANK-Bigger is Greater
author: toycode
date: 2022-12-26 00:00:00 +0000
categories: [Algorithm, Implementation]
tags: [Algorithm, Implementation, Hackerrank]
math: true
pin: false
---

# 구현 알고리즘(Implementation)

> _구현 알고리즘이란 말 그대로 문제를 해결할 수 있는 방법을 소스코드로 바꾸는 과정이라고 할 수 있다._

보통 구현문제는 '풀이를 떠올리는 것은 쉽지만 소스코드로 옮기기 어려운 문제'를 의미한다. 예를 들어서 완전 탁샘, 시뮬레이션 문제 유형이 있다.
완전 탐색은 모든 경우의 수를 계산하는 방법을 의미하고, 시뮬레이션은 문제에서 제시한 알고리즘을 한 단계씩 차례대로 직접 수행해야하는 문제유형을 의미한다.

## 실전문제

[Hackerrank, Bigger is Greater](https://www.hackerrank.com/challenges/bigger-is-greater/problem?isFullScreen=true)

이번 구현 알고리즘 풀이는 코드의 주석을 통해 주어진 문제의 풀이방향을 적으며 진행하였습니다.

```java
import java.io.*;
import java.util.Arrays;
import java.util.stream.IntStream;

public class Main {
  public static void main(String[] args) throws IOException {
    BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
    BufferedWriter bw = new BufferedWriter(new FileWriter(System.getenv("OUTPUT_PATH")));

    int T = Integer.parseInt(br.readLine().trim());

    IntStream.range(0, T).forEach(TItr -> {
      try {
        String w = br.readLine();
        String result = biggerIsGreater(w);
        bw.write(result);
        bw.newLine();
      } catch (IOException ex) {
        throw new RuntimeException(ex);
      }
    });

    br.close();
    bw.close();
  }

  static String biggerIsGreater(String w) throws IOException {
    // Write your code here
    // ex) 2,4,3,1
    // 마지막 문자의 인덱스 번호를 구한다. ex) 2, 4, 3, (1)
    int lastIndex = w.length() - 1;
    // 다음으로 큰 수의 문자 재배열을 위해 기준점을 구한다.
    // 기준점은 큰 자리 수로 이동한다. ex) 2, 4, (3), 1
    for (int index = lastIndex - 1; index >= 0; index--) {
      char lChar = w.charAt(index); // ex) 3 -> 4 -> 2
      char[] subStrA = w.substring(index + 1).toCharArray(); // ex) 1 -> 3, 1 -> 4, 3, 1
      Arrays.sort(subStrA); // ex) 1 -> 1, 3 -> 1, 3, 4
      for (int j = 0; j < subStrA.length; j++) {
        char eChar = subStrA[j]; // ex) 1 -> 1, 3 -> 1, 3, 4
        if (lChar < eChar) {
          StringBuilder begining = new StringBuilder(w.substring(0, index + 1)); // ex) 2
          begining.replace(index, index + 1, String.valueOf(eChar)); // ex) 3
          subStrA[j] = lChar; // ex) 1, 2, 4
          Arrays.sort(subStrA); // ex) 1, 2, 4
          return begining + String.valueOf(subStrA); // ex) 3, 1, 2, 4
        }
      }
    }
    return "no answer";
  }
}
```

