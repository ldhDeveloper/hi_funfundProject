
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>home</title>
</head>
<body>
<jsp:include page="/WEB-INF/views/common/menubar.jsp" flush="true"/>
<h1>
	Hello world!  
</h1>
<button class="btn btn-warning">
테스트</button>

<P>  The time on the server is ${serverTime}. </P>
<p>test</p>
<p>test2</p>
<p>test3</p>
</body>
</html>
