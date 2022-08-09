<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<h3>1. 기존 방식 (스크립틀릿과 표현식을 이용)</h3>
	
	<%-- jsp용 주석 --%>
	<%--
	<%
		String classRoom = (String)request.getAttribute("classroom");
		Person student = (Person)request.getAttribute("student");
		
		String academy = (String)session.getAttribute("academy");
		Person teacher = (Person)session.getAttribute("teacher");		
	%>
	
	<p>
		학원명 : <%=academy %>
		강의장 : <%=classRoom %>
		강사 : <%=teacher.getName() %>, <%=teacher.getAge() %>, <%=teacher.getGender() %>
		<br><br>
		수강생정보
		<ul>
			<li>이름 : <%=student.getName() %></li>
			<li>나이 : <%=student.getAge() %></li>
			<li>성별 : <%=student.getGender() %></li>
		</ul>
		
	</p>
 	--%>
 	
 	<h3>2. EL을 이용해서 보다 쉽게 해당 Scope에 저장된 값을 출력하기</h3>
 	<p>
 		EL을 이용하면 getXXX을 통해서 값을 빼올 필요없이 EL내에 키만 제시하면 바로 접근 가능 <br>
 		기본적으로 EL은 JSP내장 객체를 구분하지 않고 모든 내장 객체에 탐색해서 존재하는 값을 가져옴
 	</p>
 	
 	<p>
 		학원명 : ${ academy } <br>
 		강의장 : ${ classRoom } <br>
 		강사 : ${ teacher.name }, ${ teacher.age }, ${ teacher.gender } <br><br>
 		<!-- person객체의 getXXX 메소드에 접근 -->
 		<!-- teacher에 접근하면 value값은 Person객체형 
 			 해당 객체에 필드까지 접근하고자 한다면  .필드명 으로 접근하면됨
 			 => 내부적으로 getter메소드 찾아서 실행됨
 			 	즉, vo클래스에 getter메소드는 필수로 만들어둬야됨!
 		-->
 		수강생정보
 		<ul>
 			<li>이름 : ${ student.name }</li>
 			<li>나이 : ${ student.age }</li>
 			<li>성별 : ${ student.gender }</li>
 		</ul>
 	</p>
 	
 	<h3>3. 단, EL사용시 여러 내장객체들에 저장된 키값이 동일할 경우</h3>
 	<!-- scope라는 키값으로 request, session, application에 각가 담겨있음 -->
 	scope값 : ${ scope } <!-- request안에 저장된 value값이 출력됨 --> <br>
 	<!-- 
 		EL은 공유범위가 가장 작은 Scope에서부터 탐색
 		Page => request => session => application 순으로 탐색
 		
 		만약 모든 영역에서 못찾을 경우? => 아무것도 출력안도미 (오류안남)
 	 -->
 	 test값 : ${ test } <br>
 	 
 	 <h3>4. 직접 scope를 지정해서 접근하기</h3>
 	 <%
 	 	// pageScope에 데이터 담기
 	 	pageContext.setAttribute("scope", "page");
 	 %>
 	 
 	 pageScope에 담긴 값 : ${pageScope.scope } <br>
 	 requestScope에 담긴 값 : ${ requestScope.scope } <br>
 	 sessionScope에 담긴 값 : ${ sessionScope.scope } <br>
 	 applicationScope에 담긴 값 : ${ applicationScope.scope } 
 	 <br><br>
 	 
 	 ${ requestScope.ttt } <!-- 오류, 페이지에 표현 x -->
 	 
 	 
 	
 	
</body>
</html>