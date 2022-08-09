<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h3>jsp: forward</h3>
	<p>현재 jsp에서 또다른 페이지로 바로 포워딩하고자 할 때 </p>
	
	<!-- url로는 localhost:8887/eljstl/02_standardAction/forward.jsp 찍혀있음  -->
	<jsp:forward page="footer.jsp" /> <!-- 실제로 보여지는 값 -->
	

</body>
</html>