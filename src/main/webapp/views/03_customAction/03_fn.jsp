<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h1>JSTL Function Library</h1>
	
	<c:set var="str" value="How Are You?" />
	
	str : ${str } <br>
	 
	문자열의 길이(fn안쓰고) : ${str.length() } <br> 
	문자열의 길이(fn쓰고) : ${fn:length(str) } <br><br>
	<!-- 배열 또는 ArrayList도 제시가능 -->

	모두 대문자로 출력 : ${fn:toUpperCase(str) } <br>
	모두 소문자로 출력 : ${fn:toLowerCase(str) } <br>
	
	Are의 시작인덱스 : ${fn:indexOf(str, 'Are') } <br><br>
	
	문자열 추출 : ${fn:substring(str, 0, 3) } <br><br>
	<!-- 3번인덱스 이전인 2번인덱스까지만 추출 -->
	
	Are => Were 변경 : ${fn:replace(str, 'Are', 'Were') } <br><br>
	
	<c:if test="${fn:contains(str,'Are') }" >
		Are이 포함되어있음 <br>
	</c:if>
	
	<c:if test="${fn:containsIgnoreCase(str, 'are') }" >
		are이 대소문자를 가리지 않고 포함되어있음 <br>
	</c:if>


</body>
</html>