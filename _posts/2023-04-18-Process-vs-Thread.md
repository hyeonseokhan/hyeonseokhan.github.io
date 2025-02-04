---
title: Process vs Thread
author: toycode
date: 2023-04-18 00:00:00 +0000
categories: [Computer Science, Process & Thread]
tags: [Computer Science, Process, Thread, CPU, Memory]
pin: false
---

# Goal
- [x] Process 가 무엇인지 설명할 수 있다.
- [x] Thread 가 무엇인지 설명할 수 있다.
- [x] Multi-Process 와 Multi-Thread 의 차이점을 설명할 수 있다.
- [x] CPU 의 Context Switching 의 개념을 설명할 수 있다.

## 프로그램(Program)과 프로세스(Process)
<img width="100%" src="/posts/20230418/image-1.png" alt="프로그램과 프로세스">
_프로그램파일이 로드되어 프로세스가 되는 과정_

`프로그램`은 실행 가능한 파일로, 컴퓨터가 실행할 수 있는 `명령어들의 집합`입니다. 여기서 `명령어들의 집합`은 프로그래밍 언어로 작성된 소스 코드는 컴파일러나 인터프리터를 통해 `목적코드(Object Code)`로 변환되어 `이진 코드(Binary Code)` 형태로 컴퓨터가 이해할 수 있는 명령어들의 집합입니다.

`프로세스`는 실행 중인 프로그램의 인스턴스로, 운영체제에 의해 생성되고 관리됩니다. 프로세스는 실행 중인 프로그램의 `Code`, `Data`, `Heap`, `Stack` 등의 상태를 포함하며, 운영체제가 할당한 시스템 자원을 사용합니다. 또한 해당 프로세스에 대한 정보를 담고 있는 `PCB(Process Control Block)`이 함께 생성됩니다.

## 프로세스(Process)의 동시성(Concurrency)
일반적으로 컴퓨터를 사용하게되면 동시에 여러개의 프로그램을 실행시켜 사용하는 경우 즉, `멀티태스킹(Multitasking)` 작업이 빈번합니다. `CPU` 여러개의 프로그램을 동시에 작업이 진행되는 것 처럼 동작할 수 있도록 `컨텍스트 스위칭(Context Switching)` 작업을 반복하게 됩니다.

### 컨텍스트 스위칭(Context Switching)
만약, `Browser` 와 `IDE` 프로그램을 동시에 실행시킨다고 할 경우 각, 프로세스는 운영체제의 `프로세스 스케줄링(Process Scheduling)` 의해서 시분할로 프로세스의 실행상태가 관리됩니다. 먼저 Browser 가 실행상태일 경우 PCB 가 CPU 에 의해서 처리되고 IDE 의 실행상태는 준비 상태가 됩니다. 그리고 Browser 가 준비상태가 된다면 현재 상태를 저장 후 IDE 는 실행상태가 되고 PCB 가 CPU 에 의해 처리됩니다. 이러한 작업을 컨텍스트 스위칭이라고 합니다.

## 스레드(Thread)
스레드는 프로세스 내에서 실행되는 `작은 실행 단위`입니다. 프로세스는 하나 이상의 스레드를 가질 수 있으며, 이러한 스레드는 부모 프로세스의 `Code`, `Data`, `Heap` 자원을 공유하며 `Stack` 은 각, 스레드마다 고유하게 가지게 됩니다. 이러한 스레드의 자원 공유는 컨텍스트 스위칭이 일어날 때 캐싱 적중률이 올라도록 합니다. 즉, 스레드는 하나의 프로세스 내에서 서로 다른 실행 경로를 가질 수 있도록 해주는 개념입니다.

## 멀티 프로세스와 멀티 스레드
멀티 프로세스와 멀티 스레드는 모두 `하나의 어플리케이션`에 대한 `처리방식의 일종`입니다. 여기서 주의해야 하는 개념은 단순히 여러개의 프로그램을 구동시켜 멀티 프로세스가 동작하고 있다고 생각하면 멀티 스레드란 개념과 비교하기 어렵습니다. 때문에 한 어플리케이션 내에서 다른 처리방식으로 두 가지의 개념을 설명합니다.

### 멀티 프로세스의 사례
많은 사람들이 사용하고 있는 `Chrome 브라우저`에 대해서 예를들 수 있다. Chrome 브라우저는 멀티프로세스 아키텍처를 사용한 좋은 예로 각, 브라우저 탭은 `부모 프로세스를 fork()` 하여 별도의 프로세스로 실행되며 이는 안정성과 보안을 높이는데 도움이 됩니다. 하나의 탭에서 문제가 발생하더라도 전체 브라우저가 충돌하는 것을 방지할 수 있으며 탭간의 서로 영향을 미치지 않도록 분리된 메모리 공간을 사용합니다.

**단점**
- 멀티프로세스 아키텍처 때문에별도의 프로세스로 실행되어 메모리 사용량이 증가합니다.
- IPC 를 사용한 통신
- Context Switching 비용이 크다. 

### 멀티 스레드의 사례
멀티 스레드의 사례는 너무 많은 어플리케이션으로 예로들 수 있다. 예로 설명드리는 어플리케이션은 사용자의 요청을 받아 처리도 하며 스케쥴러가 동작하여 처리하는 일이 있다고 했을때 스케쥴러는 별도의 스레드로 `무언가 처리를 해야하는 하나의 실행 단위`로 별도로 동작하게 되고 `다른 스레드는 사용자의 요청을 처리`를 할 수 있다. 즉, 하나의 어플리케이션 내에서 작업의 단위가 나뉘어질 때 스레드가 병렬로 동시에 실행하는 예로 설명할 수 있다. 

**단점**
- 공유 자원에 대한 관리를 해야한다.

## 멀티 코어(Multi Core)
멀티 프로세스와 멀티 스레드는 `소프트웨어적` 동시성 작업을 위한 처리방식의 일종이다. 멀티 코어는 물리적 동시성 및 병렬성 작업을 위한 처리방식으로 `여러 개의 코어(= Multi Processer, 멀티 프로세서)`를 하나의 프로세서 칩(CPU)에 통합하여 각, 코어가 동시에 작업을 처리할 수 있도록 합니다. 이를 통해 하나의 컴퓨터 시스템 내에서 여러 개의 프로세스 또는 스레드를 `병렬적(Parallelism)`으로 실행할 수 있습니다. 

## Reference
{% include embed/youtube.html id='1grtWKqTn50' %}

