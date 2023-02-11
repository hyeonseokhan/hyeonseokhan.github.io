---
title: Java Garbage Collection
author: toycode
date: 2023-02-11 00:00:00 +0000
categories: [CS, GC]
tags: [Computer Science, Garbage Collection, Java, JVM]
math: true
pin: false
---

## JVM(Java Virtual Machine)이란?
운영체제의 메모리 영역에 접근하여 메모리를 관리하는 프로그램이다.
- 메모리 관리
- Garbage Collector 수행

## Garbage Collector
>_Garbage collection was invented by American computer scientist John McCarthy around 1959 to simplify manual memory management in Lisp._

Java 응용프로그램에서 `동적으로 할당된 메모리` 중 더 이상 사용하지 않는 메모리를 자동으로 확보하는 프로세스이며 메모리 누수(memory leak) 및 기타 관련 버그의 원인이 될 수 있는 메모리 할당 및 할당 해제를 수동으로 관리해야 하는 부담을 덜어주는 Java의 중요한 기능입니다.

### 메모리 영역
- Stack: 지역변수, 매개변수, 리턴값 등이 저장되는 영역

- Heap: 동적으로 할당된 메모리 영역

### Example Code
```java
public class GarbageCollectionExample {
    public static void main(String[] args) {

        String str1 = new String("Hello");
        String str2 = new String("World");

        str1 = str1;

        System.gc();
    }
}
```
1. 위의 예제코드에서 두 개의 String 객체가 생성되고 값이 할당됩니다.
2. 이후 `str1` 변수에 `str2` 값이 다시 할당되어 `str1` 변수는 가비지 수집 대상이 됩니다.
3. 가비지 수집을 명시적으로 요청하기 위해 `System.gc()` 함수를 호출합니다.
4. JVM 은 정기적으로 `Garbage Collector` 를 실행하여 가비지 수집 대상의 객체의 메모리를 회수합니다.

## Reference
- <https://johngrib.github.io/wiki/jvm-memory/>
- <https://d2.naver.com/helloworld/1329>
- <https://docs.oracle.com/en/java/javase/14/docs/api/java.base/java/lang/System.html#gc()>
- <https://www.youtube.com/watch?v=vZRmCbl871I>
