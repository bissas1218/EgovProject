<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<header>
	<nav class="navbar navbar-expand-xl justify-content-between">
	
		<div class="container-fluid">
		
			<div id="navbar-logo">
				<a href="/"><img src="/images/doyun.png" alt="Home"></a>
			</div>
			
			<!-- 모바일 1차메뉴 -->
			<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
				<svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" class="bi" fill="currentColor" viewBox="0 0 16 16">
					<path fill-rule="evenodd" d="M2.5 11.5A.5.5 0 0 1 3 11h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5zm0-4A.5.5 0 0 1 3 7h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5zm0-4A.5.5 0 0 1 3 3h10a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5z"></path>
				</svg>
			</button>
			
			<div class="collapse navbar-collapse" id="navbarNav">
			
				<!-- PC 1차메뉴 -->
				<ul class="navbar-nav mr-auto">
				<c:forEach items="${menuDepth1List}" var="menu1">
					<li class="nav-item"><a href="/menuCall.do?menuCd=<c:out value="${menu1.id }"/>" class="nav-link"><c:out value="${menu1.nm }"/></a></li>
				</c:forEach>
				</ul>
				
				<!-- 검색어 입력창 -->
				<div class="container-fluid" id="search-form">
					<div class="row" id="searchbox">
					</div>
				</div>
				
			</div>
			
			<!-- 검색결과 -->
			<div id="floatingResults" style="display:none;">
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
                 			</li>
                 			<li class="ais-Hits-item" role="option" tabindex="-1" aria-posinset="1" aria-setsize="20">
			                     <article>
			                        <p><a href="/learn/the-stream-api/">
			                            The <mark class="ais-Highlight-highlighted">S</mark>tream API
			                        </a></p>
			                        <p>Process your in-memory data with Java <mark class="ais-Highlight-highlighted">s</mark>treams and collectors. Process them faster with parallel <mark class="ais-Highlight-highlighted">s</mark>treams.</p>
			                     </article>
			                 </li>
			                 <li class="ais-Hits-item" role="option" tabindex="-1" aria-posinset="2" aria-setsize="20">
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