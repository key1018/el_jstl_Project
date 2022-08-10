<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, com.br.model.vo.Person"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h1>JSTL Core Library</h1>
	
	<h3>1. 변수 (속성 == attribute)</h3>
	<pre>
	* 변수에 선언과 동시에 초기화 (c:set var="" value="" [scope=""])
	- 변수 선언하고 초기값을 대입해두는 기능을 제공
	- 해당 변수를 어떤 scope에 담아둘껀지 지정가능함 (생략시 기본적으로 page Scope에 담김) <!-- page Scope : 현재 이 페이지에서만 사용가능 -->
	=> 즉, 해당 scope에 setAttribute를 통해서 key-value형태로 데이터를 담아놓는 거라고 생각하면됨
	=> c:set으로 선언된 변수는 무조건 EL로 접근해서 사용가능 (스크립팅 원소로는 접근 불가!)
	
	- 타입을 별도로 지정하지 않음
	- 초기값을 반드시 지정해야됨
	</pre>
	
	<c:set var="num1" value="10" /> <!-- pageContext.setAttribute("num1", 10); -->
	<!-- tablib에 쓰인 접두어와 동일하게 시작해야됨 => tablib을 안쓰면 사용불가능! -->
	<c:set var="num2" value="20" scope="request" /> <!-- request.setAttribute("num2", 20); -->
	
	num1 값 : ${num1 } <br>
	num2 값 : ${num2 } <br><br>
		
	<c:set var="result" value="${num1 + num2 }" scope="session" />
	<!-- el구문 안에서 산술연산 가능 => 숫자로 parse 후 변경 -->
	
	result 값 : ${result } <br><br>
	
	${ pageScope.num1 } <br>
	${ requestScope.num2 } <br>
	${ requestScope.result } <br> <!-- 값이 없으므로 출력 x -->
	${ sessionScope.result } <br><br>
	
	<c:set var="result" scope="request">9999</c:set> <!-- value 속성 대신에 시작태그와 종료태그 사이에 초기값 지정 가능 -->
	
	${ requestScope.result }
	
	<hr>
	
	<pre>
		* 변수 삭제 (c:remove var="제거하고자하는 속성명" [scope=""])
		- 해당 scope영역에서 해당 속성을 찾아서 제거하는 태그
		- scope 지정 생략시 모든 scope에서 해당 속성을 다 찾아서 제거
		=> 즉, 해당 scope에 removeAttribute를 통해 제거하는거라고 생각하면됨 
	</pre>
	
	삭제 전 result : ${result } <br><br>
	<!-- page => request => session => application 순으로 찾아서 출력되므로 request값이 나옴 -->
	
	1) 특정 scope 지정해서 삭제 <br>
	<c:remove var="result" scope="request"/>
	
	request삭제 후 : ${result } <br><br> <!-- session에 있는 result 값이 출력됨 -->
 	
 	2) 모든 scope에서 삭제 <br>
 	<c:remove var="result" /> <br> <!--  별도의 scope 지정 x => 모두 삭제 -->
	모두 식제 후 result : ${result } <br><br>
	
	<hr>
	
	<pre>
	* 변수(데이터) 출력 (c:out value="출력하고자하는 값" [default="기본값"] [escapeXml="true|false"]) 
	<!-- 출력하고자하는 값이 존재하지 않은 경우 default를 통해 기본값 출력 가능 -->
	</pre>
	
	<c:out value="${num1 }" /> <br>
	<c:out value="${result }" default="없음" /> <br><br>
	
	<c:set var="outTest" value="<b>출력테스트</b>" />
	
	<c:out value="${outTest }" /> <br> <!-- escapteXml 생략시 기본값이 true => 태그 해석안됨 => 텍스트로 취급 -->
	<c:out value="${outTest }" escapeXml="false"/> <br> <!-- escapeXml이 false일 경우  html 태그가 반영되어서 출력됨 -->
	
	<hr>
	
	<h3>2. 조건문 - if (c:if test="조건식") </h3>

	<pre>
		- JAVA의 단일 if문과 비슷한 역할을 하는 태그 => 매번 조건을 제시해야됨
		- 조건식은 test속성에 작성 (단, 반드시 EL구문으로 기술해야됨)
	</pre>
	

	<%-- 	
		<!-- 기존 방식 -->
		<% if(num1 > num2) { %>
		
		<% } %> 
	--%>
	
	<!-- EL 방식 => 시작,종료 태그 사이에 조건충족식 출력되는 값 출력 -->
	<c:if test="${num1 gt num2 }">
		<b>num1이 num2보다 큽니다.</b> 
	</c:if> <br>
	
	<c:if test="${num1 le num2 }">
		<b>num1이 num2보다 작거나 같습니다.</b>
	</c:if>

	<br>
	
	<c:set var="str" value="안녕" />
	
	<c:if test="${str eq '안녕' }">
		<h4>Hello World</h4>
	</c:if>
	
	<c:if test="${ str ne '안녕'}">
		<h4>Bye World</h4>
	</c:if>

	<br>
	
	<h3>3. 조건문 Choose (c:choose, c:when, c:otherwise)</h3>
	<pre>
		- JAVA의 if-else, if-else if문과 비슷한 역할을 하는 태그
		- 각 조건들을 c:choose의 하위요소로 c:when을 통해서 작성 (else 블럭 역할 == c:otherwise)
	</pre>
	
	<%-- 
		<% if(num1 > 20) { %>
		
		<% } else if (num1 >= 10) { %>
		
		<% } else {  %>
		
		<% } %> 
	--%>
	
	<c:choose>
		<c:when test="${num1 gt 20 }"> <!-- if -->
			<b>처음 뵙겠습니다.</b>
		</c:when>
		<c:when test="${num1 ge 10}"> <!-- else if -->
			<b>다시 만나서 반갑습니다.</b>
		</c:when>
		<c:otherwise> <!-- else -->
			<b>안녕하세요</b>
		</c:otherwise>
	</c:choose>
	
	<hr>
	
	<h3>4. 반복문 - c:forEach</h3>
	<pre>
		for loop문 - (c:forEach var="변수명" begin="초기값" end="끝값" [step="반복시 증가값"])
		<!-- for(int i = 1; i <= 5; i++) => var : i, begin : 1, end : 5 -->
		향상된 for문 - (c:forEach var="변수명" items="순차적으로접근하고자하는객체(배열|컬렉션)" [varStatus="현재 접근된 요소의 상태값을 보관할 변수명"])
		<!--  for(Member m : list) => items : list -->
		
		var속성으로 선언된 변수에 접근하고자 할 때는 반드시 EL구문으로 접근
	</pre>
	
	<%-- 	
		<% for(int i = 1; i <= 10; i+=2) { %>
			
		<% } %> 
	--%>
	
	<c:forEach var="i" begin="1" end="10" step="2">
		<b>반복확인 : ${i }</b> <br>
	</c:forEach> 
	<br>
	
	<c:forEach var="i" begin="1" end="6">
		<h${i }>태그안에서도 적용가능 </h${i }> <br>
	</c:forEach>
	<br>
	
	<%
		String [] color = {"red", "yellow", "green", "pink"};
		request.setAttribute("colors", color);
	%>
	
	<%-- 	
		<% for(String s : colors) { %>
			
		<% } %> 
	--%>
	
	<ul>
		<c:forEach var="c" items="${colors }">
			<li style="color:${c}">${c }</li>
		</c:forEach>
	</ul>
	
	<%
		ArrayList<Person> list = new ArrayList<>();
		list.add(new Person("홍길동", 20, "남자"));
		list.add(new Person("김말순", 30, "여자"));
		list.add(new Person("김개똥", 40, "남자"));
		
		request.setAttribute("pList", list);
	%>
	
	<table border="1">
		<thead>
			<tr>
				<th>번호</th>
				<th>이름</th>
				<th>나이</th>
				<th>성별</th>
			</tr>
		</thead>
		
		<tbody>
		<%-- 		
			<% if(pList.isEmpty()) { %>
			
			<% } else { %>
				<% for(Person p : pList) { %>
				
				<% } %>
			<% } %>
		--%>
		
		<c:choose>
			<c:when test="${empty pList }">
				<tr>
					<td colospan="3">조회된 사람이 없습니다.</td>
				</tr>
			</c:when>
			<c:otherwise>
				<c:forEach var="p" items="${pList }" varStatus="status"> <!-- varStatus :  순차적으로 접근되는 p요소의 상태에 대한 정보를 보관(순번, 인덱스 포함) -->
					<tr>
						<td>${ status.count }</td> <!-- index속성 : 0 부터 시시작 / count속성 : 1부터 시작 -->
						<td>${ p.name }</td>
						<td>${ p.age }</td>
						<td>${ p.gender }</td>
					</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
		</tbody>
	
	</table>
	
	<br>
	
	<h3>5. 반복문 - forTokens</h3>
	<pre>
	(c:forTokens var="변수명" items="분리시키고자하는문자열" delims="구분자")
	
	- 구분자를 통해서 분리된 각각의 문자열에 순차적으로 접근하면서 반복 수행
	- split("구분자") 또는 Java에서의 StringTokenizer와 비슷한 기능 처리
	</pre>
	
	<c:set var="device" value="컴퓨터,핸드폰,TV.에어컨/냉장고.세탁기"/>
	
	<ol>
		<c:forTokens var="d" items="${device }" delims=",./"> <!-- 구분자들을 나열하면 됨 -->
			<li>${d}</li>
		</c:forTokens>
	</ol>
	
	<hr>
	
	<h3>6. url, 쿼리스트링관련 - c:url, c:param</h3>
	
	<pre>
	- url의 경로를 생성하고, 쿼리스트링을 정의해둘 수 있는 태그
	
	c:url var="변수명" value="요청하고자하는url"
		c:param name="키값" value="전달할값" /
		c:param name="키값" value="전달할값" /
 	/c:url
	</pre>
	
	 <a href="list.do?cpage=1&num=2">기존방식</a> <br>
	 
	 <!-- ----------------------------------------------------------- -->
	 
	 <c:url var="ttt" value="list.do">
	 	<c:param name="cpage" value="1" />
	 	<c:param name="num" value="2" />
	 </c:url>
	 
	 <a href="${ttt }">c:url이용한 방식</a> <br>
	
	
	
	
	
	





	

</body>
</html>