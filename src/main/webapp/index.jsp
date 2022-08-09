<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>* EL(Expression Language) 표현언어 </h1>
	<p>
		기존에 사용했던 표현식(출력식) &lt;%= name &gt; 와 같이 <br>
		JSP상에 표현하고자 하는 값을 \${ name }의 형식으로 표현해서 작성하는 것
	</p>
	
	<h4><a href="el.do">01_EL의 기본구문</a></h4>
	<h4><a href="operation.do">01_EL의 연산자</a></h4>
	
	<!-- 
		* JSP 표현법
		1. 스크립트 원소 : JSP페이지에서 자바코드를 직접 기술할 수 있게 하는 기술
					   ex) 스크립틀릿, 표현식(출력식) 등등...
					   
		2. 지시어 : JSP페이지 정보에 대한 내용을 표현 (page지시어)하거나 또다른 페이지를 포함(include지시어)할 때 사용
				  jsp기능을 확장시키는 라이브러리 등록(taglib지시어)할 때도 사용
				  
		3. 액션태그(표준액션태그, 커스텀액션태그) : XML 기술을 이용해서 기존의 JSP문법을 확정하는 기능을 제공하는 태그
		
			>> 표준액션태그 (Standard Action Tag) : jsp페이지에서 바로 기술 가능 (별도의 라이브러리 연동 필요없음)
												모든 태그명 앞에 jsp: 접두어 붙음
												
			>> 커스템액션태그 (Custom Action Tag) : jsp페이지에서 바로 기술 불가능 (별도의 라이브러리 연동 필요, 선언 필요)
												모든 태그명 앞에 jsp: 외의 접두어 붙음 (종류는 다양)
												가장 대표적인 유용한 라이브러리 == JSTL
	 -->
	 
	 <h1>JSP Action Tag</h1>
	 <p>XML 기술을 이용해서 기존의 JSP문법을 확장시키는 기술을 제공하는 태그들 </p>
	 
	 <h3>1. 표준액션태그</h3>
	 
	 <a href="views/02_standardAction/include.jsp">01_jsp:include</a> <br>
	 <a href="views/02_standardAction/forward.jsp">02_jsp:forward</a>
	
</body>
</html>