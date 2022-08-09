<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>EL에서의 연산</h1>
	
	<h3>1. 산술 연산</h3>
	기존방식 (el안쓰는 경우) : <%=(int)request.getAttribute("big") + (int)request.getAttribute("small") %>
	<br><br>
	
	el방식 <br>
	10 + 3 = ${ big + small } <br>
	10 - 3 = ${ big - small } <br>
	10 x 3 = ${ big * small } <br>
	10 / 3 = ${ big / small } 또는 ${ big div small } <br> <!-- 몫 -->
	10 % 3 = ${ big % small } 또는 ${ big mod small } <br> <!-- 나머지 -->
	
	<%--
	${ sOne + sTwo } <br> <!-- 문자열끼리 합치는 것 => 오류 발생 (내부적으로 int형으로 parse하므로) -->
	el안에서 산술 연산시 무조건 숫자로 파싱한 후 연산을 하기 때문에 문자열간의 덧셈 연산 안됨
	 --%>
	<br>
	문자열을 연이어서 표현하고자 할 경우 : ${sOne} ${sTwo} <br>
	<!-- el구문을 서로 연이어서 작성하면됨 -->
	
	<h3>2. 대소 비교 연산</h3>
	10이 3보다 크다 : ${big > small} 또는 ${big gt small} <br>
	10이 3보다 작다 : ${big < small} 또는 ${big lt small} <br>
	10이 3보다 크거나 같다 : ${big >= small} 또는 ${big ge small} <br>
	10이 3보다 작거나 같다 : ${big <= small} 또는 ${big le small} <br><br>
	
	<h3>3. 동등 비교 연산</h3>
	<!-- el에서의 == 비교는 자바에서의 equals()와 같은 동작 -->
	
	sOne과 sTwo이 일치합니까? ${sOne == sTwo} 또는 ${sOne eq sTwo } <br>
	sOne과 sTwo가 일치하지 않습니까? ${sOne != sTwo } 또는 ${sOne ne sTwo } <br>
	
	<!-- 문자열, 숫자 모두 동등비교시 동일하게 코드 사용 -->
	big에 담긴 값이 10과 일치합니까? ${big == 10} 또는 ${big eq 10 } <br>
	sOne에 담긴 값이 "안녕"과 일치합니까? ${sOne == "안녕" } 또는 ${sOne eq '안녕' }
	<!-- el 안에서 문자열 리터럴 제시시 홑따옴표든 쌍따옴표든 상관없음 -->
	
	<h3>4. 객체가 null인지 또는 리스트가 비어있는지 비교</h3>
	
	pTwo가 null입니까? ${pTwo == null } 또는 ${empty pTwo } <br>
	pOne가 null입니까? ${pOne == null } 또는 ${empty pOne } <br>
	pOne이 null이 아닙니까? ${pOne != null} 또는 ${not empty pOne } <br><br>
	
	lOne이 텅비어있습니까? ${empty lOne } <br>
	lTwo가 텅비어있습니까? ${empty lTwo } <br>
	
	<h3>5. 논리연산자</h3>
	${true && true } 또는 ${true and true } <br>
	${false || true } 또는 ${false or true } <br><br>
	
	
	big이 small보다 크고 lOne이 텅 비어있습니까?
	${big > small && lOne == null } 또는
	${big gt small and empty lOne }
	
 

	
	
	 
</body>
</html>