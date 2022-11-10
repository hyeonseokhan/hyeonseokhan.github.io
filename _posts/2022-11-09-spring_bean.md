---
title: Spring Bean
author: toycode
date: 2022-11-09 12:00:00 +0900
categories: [Spring, Bean]
tags: [Spring, Springboot, DI, Bean, Configuration, Component, Annotation]
pin: false
---
## Spring Bean 이란?
> _In Spring, the objects that form the backbone of your application and that are managed by the Spring IoC container are called beans. A bean is an object that is instantiated, assembled, and otherwise managed by a Spring IoC container._

안타깝게도 Spring bean 이 실제로 무엇인지에 대한 명확한 답은 없습니다. 하지만 Spring Framework 문서에서의 정의된 내용은 _Spring IoC 컨테이너에 의해 관리되는 객체_ 를 `Bean` 이라고 풀어 정의하고 있습니다.
- POJO(Plain Old Java Object)로써 Spring 어플리케이션을 구성하는 핵심 객체이다.
- Spring IoC/DI 컨테이너에 의해 생성 및 관리된다.
- class, id, scope, constructor, args 등의 속성을 가진다.

> 이전 포스팅 [제어의 역전(IoC)과 의존관계 주입(DI)](https://hyeonseokhan.github.io/posts/IoC_DI/) 를 참조해 주세요.
{: .prompt-info }

`Spring` 에서는 위와 같은 `Bean` 의 구성 요소를 바탕으로 등록되어 있는 `Bean` 을 `SingleTon` 객체로 생성하여 관리한다. 그래서 `Bean` 을 등록하기 위한 다양한 방법들을 제공하고 있는데 각각의 방법들에 대해 살펴보도록 하자.

## Spring Bean 등록 방법
### @Configuration, @Bean
```java

```

### @Component
```java

```

## Reference
- <https://docs.spring.io/spring-framework/docs/current/reference/html/core.html#beans-introduction>
- <https://www.baeldung.com/spring-bean>
- <https://mangkyu.tistory.com/75>
- <https://melonicedlatte.com/2021/07/11/232800.html>
- <https://thiago6.tistory.com/158>
