<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.titlebar {
	height: 400px;
	background: orange;
	text-align: center;
}
 ul{
  list-style:none;
 }
 
 .titleimg{
   float:left;
   padding:0px;
 }
 
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/menubar.jsp" flush="true" />
	<div class="row">
		<div class="col-lg-12 col-md-12 col-sm-12 col-sm-12 titlebar">
				<h3>리워드</h3>
				<br>
				<table id="table" align="center" border="1px" width="960px">
			    <tr><td rowspan="3">1</td><td>2</td><td>3</td></tr>
			    <tr><td>5</td><td>6</td></tr>
			    <tr><td>8</td><td>9</td></tr>
			    <tr><td>10</td><td>11</td><td>12</td></tr>
			</table>
	    </div>

			
	</div>
</body>
</html>