<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Running Your First Java Application</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />

<link rel="stylesheet" href="/css/study/common.css" />

</head>
<body>

<header>
	<nav>
		<div class="container-fluid">
			<div id="navbar-logo">
				<a href="/"><img src="/images/doyun.png" alt="Home"></a>
			</div>
			<ul class="navbar-nav mr-auto">
				<li class="nav-item"><a href="/study/egov/intro.do" class="nav-link">EgovFramework</a></li>
				<li class="nav-item"><a href="/study/java/firstJavaApp.do" class="nav-link active">Java</a></li>
				<li class="nav-item"><a href="" class="nav-link">Html</a></li>
				<li class="nav-item"><a href="" class="nav-link">Css</a></li>
				<li class="nav-item"><a href="" class="nav-link">JavaScript</a></li>
				<li class="nav-item"><a href="" class="nav-link">Jquery</a></li>
				<li class="nav-item"><a href="" class="nav-link">React</a></li>
				<li class="nav-item"><a href="" class="nav-link">Chart</a></li>
				<li class="nav-item"><a href="" class="nav-link">Mysql</a></li>
				<li class="nav-item"><a href="" class="nav-link">Oracle</a></li>
				<li class="nav-item"><a href="" class="nav-link">Tomcat</a></li>
				<li class="nav-item"><a href="" class="nav-link">Linux</a></li>
			</ul>
		</div>
	</nav>
</header>

<div id="subheader">
	<ul class="nav">
		<li class="nav-item"><a class="nav-link" href="/study/java/firstJavaApp.do">Running Your First Java Application</a></li>
		<li class="nav-item"><a class="nav-link active" href="/study/java/stayAwareOfNewFeatures.do">Staying Aware of New Features</a></li>
		<li class="nav-item"><a class="nav-link" href="">Getting to Know the Language</a></li>
		<li class="nav-item"><a class="nav-link" href="">Mastering the API</a></li>
		<li class="nav-item"><a class="nav-link" href="">Organizing your Application</a></li>
		<li class="nav-item"><a class="nav-link" href="">Getting to know the JVM</a></li>
	</ul>
</div>

<main>
	<div class="container">
	
		<div id="bread-crumb">
			<a href="/">Home</a> > Java > Staying Aware of New Features
		</div>

		<h1>Java Platform Evolution 자바 플랫폼의 진화</h1>
		
		Java has been around since 1995 and is used by over 10 million developers in almost every country in the world. 
		Java는 1995년부터 사용되었으며 전 세계 거의 모든 국가에서 천만 명 이상의 개발자가 사용하고 있습니다.<br/>
		
		It truly is one of the most successful technologies in history. 
		이것은 진정으로 역사상 가장 성공적인 기술 중 하나입니다. <br/>
		
		But this doesn't mean the platform is standing still. Quite the opposite in fact.
		그러나 이것이 플랫폼이 정지되어 있다는 것을 의미하지는 않습니다. 실제로는 정반대입니다.<br/>

		Java 8, released in 2014, brought Lambda expressions to the Java platform as well as the Stream API, Optional class, and a host of other great features. 
		2014년 에 출시된 Java 8 은 Stream API, Optional 클래스 및 기타 여러 가지 훌륭한 기능은 물론 Java 플랫폼에 Lambda 표현식 을 가져왔습니다 . <br/>
		
		This is one of the reasons why Java 8 became the most popular version in Java's history. 
		이것이 Java 8이 Java 역사상 가장 인기 있는 버전이 된 이유 중 하나입니다.<br/> 

		Even today, it remains one of the most widely used versions of Java.
		오늘날에도 가장 널리 사용되는 Java 버전 중 하나로 남아 있습니다.<br/>

		But choosing Java 8 today prevents developers from gaining access to an immense amount of progress in the language, JVM, tooling, and more.
		그러나 오늘날 Java 8을 선택하면 개발자가 언어, JVM, 도구 등의 엄청난 발전에 액세스할 수 없습니다.<br/>
		
		This article will attempt to summarize much of this progress. 
		이 기사에서는 이 진행 상황의 대부분을 요약하려고 합니다.<br/>
		
		But don't just take our word for it, go try the latest version of Java today!
		하지만 우리의 말을 그대로 받아들이지 말고 지금 바로 최신 버전의 Java를 사용해 보십시오 !<br/>

		<h2>Thoughtful Evolution</h2>
		Before we dive in, let's take a minute to view how the stewards of Java think about the evolution of the Java Platform. Brian Goetz, Java Language Architect, talks quite a bit about this subject. One talk in particular, Stewardship: The Sobering Parts, is a great starting point. Brian talks about the challenges, and joys, of being that unique type of person who is happy stewarding a language over many years, carefully balancing the forces of conservatism (move slower, stay compatible) with innovation (move faster, adapt to change), only to continually find out you've upset people on both sides.
		
		<p>
			<img src="/images/release_cadence.png" alt="">
		</p>
				
		<h2>Accelerating Innovation</h2>
		
		Now with this thoughtful evolution in mind and the careful balance of conservatism and innovation, the Java team set out to increase innovation. The foundation of this effort was in changes to Java's long-standing release cadence that was feature driven over many year cycles. First proposed by Mark Reinhold in his Moving Java Forward Faster post, Java moved to a 6-month, time-based release cadence in 2017 with a new feature release of Java becoming available like clockwork every March and September. This shift has had a dramatic impact on the ecosystem for many reasons, some obvious, and some not.
		
		
	</div>
	
</main>

<footer>
	<div class="container-fluid text-center">
		<p id="copyright">
		Copyright © 2021 Oracle and/or its affiliates.  All rights reserved. 
		</p>
	</div>
</footer>

</body>
</html>