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

<img src="https://docs.spring.io/spring-framework/docs/current/reference/html/images/container-magic.png">
_The Spring IoC container_

애플리케이션 클래스는 `Configuration Metadata`와 결합되어 `ApplicationContext` 생성 및 초기화된 후 완전히 구성되어 실행 가능한 시스템 또는 애플리케이션이된다.
- POJO(Plain Old Java Object)로써 Spring 애플리케이션을 구성하는 핵심 객체이다.
- Spring IoC/DI 컨테이너에 의해 생성 및 관리된다.
- class, id, scope, constructor, args 등의 속성을 가진다.

> 이전 포스팅 [제어의 역전(IoC)과 의존관계 주입(DI)](https://hyeonseokhan.github.io/posts/IoC_DI/) 를 참조해 주세요.
{: .prompt-info }

`Spring` 에서는 위와 같은 `Bean` 의 구성 요소를 바탕으로 등록되어 있는 `Bean` 을 `SingleTon` 객체로 생성하여 관리한다. 그래서 `Bean` 을 등록하기 위한 다양한 방법들을 제공하고 있는데 각각의 방법들에 대해 살펴보도록 하자.

## Spring Bean 등록 방법
### @Configuration, @Bean
```java
@Getter @Setter
@AllArgsConstructor
public class Address {
    private String street;
    private int number;
}


@Configuration
public class MyAppConfig {
    @Bean
    public Address getAddress() {
        return new Address("High Street", 100);
    }
}
```
- 개발자가 직접 제어가 불가능한 라이브러리를 활용할 때 사용
- 애플리케이션에서 싱글톤을 보장받아야 할 때 사용
- 다형성을 활용하여 여러 구현체를 등록해주어야 할 때 사용

### @Component
```java
@Getter @Setter
@AllArgsConstructor
public class Address {
    private String street;
    private int number;
}

@Getter @Setter
@AllArgsConstructor
@Component
public class Company {
  private Address address;
}

@Configuration
public class MyAppConfig {
    @Bean
    public Address getAddress() {
        return new Address("High Street", 100);
    }
}
```
- 자동으로 스프링 컨테이너에 빈을 등록하는 방법이다.
- 스프링의 컴포넌트 스캔 기능이 `@Component` 어노테이션이 있는 클래스를 자동으로 찾아서 빈으로 등록한다.
- 대부분의 경우 `@Component`를 이용한 자동 등록 방식을 사용하는 것이 좋음
- `@Component`하위 어노테이션으로 `@Configuration`, `@Controller`, `@Service`, `@Repository` 등이 있다.

## Reference
- <https://docs.spring.io/spring-framework/docs/current/reference/html/core.html#beans-introduction>
- <https://www.baeldung.com/spring-bean>
- <https://mangkyu.tistory.com/75>
- <https://melonicedlatte.com/2021/07/11/232800.html>
- <https://thiago6.tistory.com/158>
