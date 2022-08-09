<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	   <h3>jsp:include</h3>
   <p>또다른 페이지를 포함하고자 할 때 쓰는 태그</p>
   
   <h4>1. 기존의 include 지시어를 이용한 방식(정적 include 방식 == 컴파일 시 애초에 포함되어 있는 형태)</h4>
   
   <%-- 
   <%@ include file="footer.jsp" %>
   <br>
   
   특징 : include 하고 있는 페이지 상에 선언되어 있는 변수를 현재 이 페이지에서도 사용 가능 <br>
   include 한 footer.jsp에 선언되어 있는 year 변수 값 : <%= year %> <br><br>   
   
   ==> 단, 현재 이 페이지에서 동일한 이름의 변수를 재선언할 수 없음 <br>
   <% int year = 2022; %>
    --%>
    
   <h4>2. JSP 표준액션 태그를 이용한 방식 (동적 include 방식 == 런타임(실제 실행) 시 포함되는 형태)</h4>
   
   <jsp:include page="footer.jsp"/>
   <%-- 시작태그와 종료태그 사이에 별도로 쓸 내용이 없다면 시작태그 끝에 / 를 작성하면 종료태그를 의미함 --%>
   <br><br>
   
   특징1 : include하고 있는 페이지 상에 선언된 변수를 공유하지 않음 <br>
   &lt;%= year %&gt; ==> 사용할 수 없음 <br>
   ==> 따라서 동일한 이름의 변수를 재선언할 수 있음 <br>
   <% int year = 2022; %>
   <%= year %>
   <br><br>
   
   특징2 : 해당 그 페이지를 포함할 때 include하는 페이지로 값을 전달할 수 있음 <br>
   <jsp:include page="footer.jsp">
      <jsp:param name="test" value="Hello"/>   
   </jsp:include>

   <br><br>
   
   <jsp:include page="footer.jsp">
      <jsp:param name="test" value="Bye"/>
   </jsp:include>
   
   <br><br>
   
   <%
   		// 혹시라도 한글을 전달할 경우 아래의 구문 작성해야됨
   		request.setCharacterEncoding("UTF-8");
   %>
   
   <%-- 한글을 전달하는 경우 --%>
   <jsp:include page="footer.jsp">
      <jsp:param name="test" value="안녕"/>
   </jsp:include>

	
	
</body>
</html>