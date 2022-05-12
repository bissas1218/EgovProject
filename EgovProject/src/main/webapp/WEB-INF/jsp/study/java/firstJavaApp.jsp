<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Running Your First Java Application</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />

<link rel="stylesheet" href="/css/study/style.css" />

</head>
<body>

<header>
	<nav class="navbar navbar-expand-xl justify-content-between">
		<div class="container-fluid">
			<div id="navbar-logo">
				<a href="/"><img src="/images/doyun.png" alt="Home"></a>
			</div>
			
			<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
				<svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" class="bi" fill="currentColor" viewBox="0 0 16 16">
					<path fill-rule="evenodd" d="M2.5 11.5A.5.5 0 0 1 3 11h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5zm0-4A.5.5 0 0 1 3 7h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5zm0-4A.5.5 0 0 1 3 3h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5z"></path>
				</svg>
			</button>
			
			<div class="collapse navbar-collapse" id="navbarNav">
			
				<ul class="navbar-nav mr-auto">
					<li class="nav-item"><a href="/study/egov/intro.do" class="nav-link">EgovFramework</a></li>
					<li class="nav-item"><a href="/study/java/firstJavaApp.do" class="nav-link active">Java</a></li>
					<li class="nav-item"><a href="" class="nav-link">Html</a></li>
					<!-- 
					<li class="nav-item"><a href="" class="nav-link">Css</a></li>
					<li class="nav-item"><a href="" class="nav-link">JavaScript</a></li>
					<li class="nav-item"><a href="" class="nav-link">Jquery</a></li>
					<li class="nav-item"><a href="" class="nav-link">React</a></li>
					<li class="nav-item"><a href="" class="nav-link">Chart</a></li>
					<li class="nav-item"><a href="" class="nav-link">Mysql</a></li>
					<li class="nav-item"><a href="" class="nav-link">Oracle</a></li>
					<li class="nav-item"><a href="" class="nav-link">Tomcat</a></li>
					<li class="nav-item"><a href="" class="nav-link">Linux</a></li>
					 -->
				</ul>
				
				<div class="container-fluid" id="search-form">
					<div class="row" id="searchbox" style="width:200px;">
						<div class="ais-SearchBox">
							<form action="" role="search" class="ais-SearchBox-form" novalidate="">
<input class="ais-SearchBox-input" type="search" placeholder="" autocomplete="off" autocorrect="off" autocapitalize="off" spellcheck="false" maxlength="512" role="combobox" id="ais-SearchBox-input" aria-label="Search" aria-autocomplete="list" aria-owns="autocomplete-overlay__listbox" aria-expanded="false"><button class="ais-SearchBox-submit" type="submit" title="Submit the search query."><svg class="ais-SearchBox-submitIcon" xmlns="http://www.w3.org/2000/svg" width="10" height="10" viewBox="0 0 40 40"> <path d="M26.804 29.01c-2.832 2.34-6.465 3.746-10.426 3.746C7.333 32.756 0 25.424 0 16.378 0 7.333 7.333 0 16.378 0c9.046 0 16.378 7.333 16.378 16.378 0 3.96-1.406 7.594-3.746 10.426l10.534 10.534c.607.607.61 1.59-.004 2.202-.61.61-1.597.61-2.202.004L26.804 29.01zm-10.426.627c7.323 0 13.26-5.936 13.26-13.26 0-7.32-5.937-13.257-13.26-13.257C9.056 3.12 3.12 9.056 3.12 16.378c0 7.323 5.936 13.26 13.258 13.26z">
</path> </svg></button><button class="ais-SearchBox-reset" type="reset" title="Clear the search query." hidden="">
<svg class="ais-SearchBox-resetIcon" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20" width="10" height="10"> 
<path d="M8.114 10L.944 2.83 0 1.885 1.886 0l.943.943L10 8.113l7.17-7.17.944-.943L20 1.886l-.943.943-7.17 7.17 7.17 7.17.943.944L18.114 20l-.943-.943-7.17-7.17-7.17 7.17-.944.943L0 18.114l.943-.943L8.113 10z"></path> 
</svg></button>
<span class="ais-SearchBox-loadingIndicator" hidden="">
<svg class="ais-SearchBox-loadingIcon" width="16" height="16" viewBox="0 0 38 38" xmlns="http://www.w3.org/2000/svg" stroke="#444"> 
<g fill="none" fillrule="evenodd"> 
<g transform="translate(1 1)" strokewidth="2"> 
<circle strokeopacity=".5" cx="18" cy="18" r="18"></circle> 
<path d="M36 18c0-9.94-8.06-18-18-18"> 
<animateTransform attributeName="transform" type="rotate" from="0 18 18" to="360 18 18" dur="1s" repeatCount="indefinite"></animateTransform> 
</path> 
</g> 
</g> 
</svg>
</span>
</form>
						</div>
					</div>
				</div>
			</div>
			
			<div id="floatingResults">
          <div id="searchResults">
    <div class="ais-Hits">
    <ul class="ais-Hits-list" role="listbox" id="autocomplete-overlay__listbox">
      <li class="ais-Hits-item" role="option" tabindex="-1" aria-posinset="0" aria-setsize="20">
                     <article>
                        <p><a href="/learn/using-maps-to-store-key-value-pairs/">
                            Using Maps to <mark class="ais-Highlight-highlighted">S</mark>tore Key Value Pairs
                        </a></p>
                        <p>Introducing the Map Hierarchy.</p>
                     </article>
                 </li><li class="ais-Hits-item" role="option" tabindex="-1" aria-posinset="1" aria-setsize="20">
                     <article>
                        <p><a href="/learn/the-stream-api/">
                            The <mark class="ais-Highlight-highlighted">S</mark>tream API
                        </a></p>
                        <p>Process your in-memory data with Java <mark class="ais-Highlight-highlighted">s</mark>treams and collectors. Process them faster with parallel <mark class="ais-Highlight-highlighted">s</mark>treams.</p>
                     </article>
                 </li><li class="ais-Hits-item" role="option" tabindex="-1" aria-posinset="2" aria-setsize="20">
                     <article>
                        <p><a href="/learn/the-security-tools/">
                            The <mark class="ais-Highlight-highlighted">S</mark>ecurity Tools
                        </a></p>
                        <p><mark class="ais-Highlight-highlighted">S</mark>etting <mark class="ais-Highlight-highlighted">s</mark>ecurity policies with the JDK tools and commands.</p>
                     </article>
                 </li>
    </ul>
    </div>
  </div>
        </div>
        
		</div>
	</nav>
</header>

<div id="subheader">
	<ul class="nav">
		<li class="nav-item"><a class="nav-link active" href="/study/java/firstJavaApp.do">Running Your First Java Application</a></li>
		<li class="nav-item"><a class="nav-link" href="/study/java/stayAwareOfNewFeatures.do">Staying Aware of New Features</a></li>
		<li class="nav-item"><a class="nav-link" href="">Getting to Know the Language</a></li>
		<li class="nav-item"><a class="nav-link" href="">Mastering the API</a></li>
		<li class="nav-item"><a class="nav-link" href="">Organizing your Application</a></li>
		<li class="nav-item"><a class="nav-link" href="">Getting to know the JVM</a></li>
	</ul>
</div>

<main>
	<div class="container">
	
		<div id="bread-crumb">
			<a href="/">Home</a> > Java > Running Your First Java Application
		</div>

		<h1>Getting Started with Java 자바 시작하기</h1>
		
		<h2 id="elements-of-a-java-application">Elements of a Java Application 자바 애플리케이션의 요소</h2>
		
		I understand that you are eager(열망,간절히바라는) to type some code in your editor and run it to see your first Java application in action!<br/>
		편집기에 일부 코드를 입력하고 실행하여 첫 번째 Java 응용 프로그램이 실행되는 것을 보고 싶어한다는 것을 이해합니다!<br/>
		Do not worry, your expectation(기대) will be fulfilled(충족) by the end of this tutorial.<br/>
		But before we move on, I would like to do through several elements that you need to know to fully understand what you are doing.<br/>
		그러나 계속 진행하기 전에 수행 중인 작업을 완전히 이해하기 위해 알아야 할 몇 가지 요소를 살펴보고 싶습니다.<br/>
		Even if you are familiar with some other programming language, know about compilation, know what an executable file is you may be interested in the following because Java works in a way that differs from C or C++.<br/>
		다른 프로그래밍 언어에 익숙하더라도 컴파일에 대해 알고 실행 파일이 무엇인지 알고 Java는 C 또는 C++와 다른 방식으로 작동하기 때문에 다음에 관심이 있을 수 있습니다.<br/>
		
		<h2>Compiling and Executing Java Code 자바코드 컴파일 및 실행</h2>
		
		There are several steps that you need to follow to create a Java application.<br/>
		Java 애플리케이션을 작성하기 위해 따라야 하는 몇 가지 단계가 있습니다.<br/>
		This tutorial shows you how to create a very simple Java application.<br/> 
		If you need to create an enterprise application, the creation process is more complex but at its core you will find these simple steps.<br/>
		
		
		
		
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