<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h3>1. formatNumber</h3>
	<p>
		숫자데이터의 포맷(형식) 지정 <br>
		- 표현하고자하는 숫자데이터의 형식을 통화기호, % 등 원하는 쓰임에 맞게 형식을 지정하는 태그 <br>
		
		(fmt:formatNumber value="출력할데이터(숫자)" [groupingUsed="true|false" type="percent|currency" currencySymbol="통화기호문자"])		
	</p>
	
	<c:set var="num1" value="123456789"/>
	<c:set var="num2" value="0.75" />
	<c:set var="num3" value="50000"/>

	그냥 출력 : ${num1 } <br>
	세자리마다 구분자가 출력 : <fmt:formatNumber value="${num1 }"/> <br>
	<!-- groupingUsed : 세자리마다 구분해서 출력하겠다 (기본값 : true)
		false인 경우 : 구분자없이 출력 -->
	숫자 그대로 출력 : <fmt:formatNumber value="${num1 }" groupingUsed="false"/> <br><br>
	<!-- groupingUsed : 세자리마다 구분자(,) 표시 여부 지정 -->
	
	percent : <fmt:formatNumber value="${num2 }" type="percent" /> <br> <!-- 퍼센트 -->
	currency : <fmt:formatNumber value="${num3 }" type="currency" groupingUsed="false"/> <br> <!-- 통화기호 -->
	
	currency $ : <fmt:formatNumber value="${num3 }" type="currency" currencySymbol="$"/> <br>
	
	<!-- 
		type : 백분율(%), 통화기호 형식 지정
		currencySymbol : 통화기호 문자 지정
	 -->
	
	<hr>
	
	<h3>2. formatDate</h3>
	<p>날짜 및 시간 데이터의 포맷 지정(단, java.util.Date 객체 사용)</p>
	
	<!-- 현재 날짜, 시간이 담김 -->
	<c:set var="current" value="<%= new java.util.Date() %>" /> 
	
	그냥 출력 : ${current } <br>
	현재 날짜 : <fmt:formatDate value="${current }" /> <br> 
	<!-- 시간 출력 x => type속성 생략시 기본값 date -->
	현재 시간 : <fmt:formatDate value="${current }" type="time"/> <br> 
	<!-- 시간 출력 o -->
	둘 다 : <fmt:formatDate value="${current }" type="both" /> <br><br> 
	<!-- type : 날짜/시간/둘다 출력 여부 지정 (기본값음 date) -->
	
	<!-- dateStyle, timeStyle : 날짜 및 시간에 대한 형식 스타일 지정 (생략시 기본값 medium) -->
	Medium : <fmt:formatDate value="${current }" type="both" dateStyle="medium" timeStyle="medium"/> <br> <!-- 2022. 8. 11. 오전 10:38:10 -->
	long : <fmt:formatDate value="${current }" type="both" dateStyle="long" timeStyle="long"/> <br> <!-- 2022년 8월 11일 오전 10시 38분 10초 KST -->
	full : <fmt:formatDate value="${current }" type="both" dateStyle="full" timeStyle="full"/> <br> <!-- 2022년 8월 11일 목요일 오전 10시 39분 56초 대한민국 표준시 -->
	short : <fmt:formatDate value="${current }" type="both" dateStyle="short" timeStyle="short"/> <br> <!-- 22. 8. 11. 오전 10:39 -->
	
	내 패턴 : <fmt:formatDate value="${current }" type="both" pattern="yyyy-MM-dd(E) HH:mm:ss(a)" /> 
	<!-- pattern을 통해 나만의 형식을 지정할 수 있음 -->
	
	
	
	
	
	
	
	
	
	
	
</body>
</html>