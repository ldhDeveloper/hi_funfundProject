<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Insert title here</title>
<style>
body{
	background:rgba(255,255,25,0.1);
}
</style>
<script>
	function deleteone(){
		var al_no = $("input[type=hidden]").val();
		
		location.href="deleteone.al?al_no=" + al_no;
	}
	function myFunction(){
		alert("쪽지 닫기!");
	}
</script>

</head>
<body onunload="myFunction()">
	<div style="text-align:center;background:orange;color:white;height:50px;valign:middle;padding-top:15px;margin-bottom:10px;">상세 보기</div>
	<table style=width:100%;>
		<tr><td style="text-align:center;width:80px;">제 목</td><td style="width:20px;"> : </td><td><c:out value='${ alert.al_title }'/></td></tr>
		<tr><td style="text-align:center;">발 신</td><td> : </td><td>관리자<input type="hidden" value="<c:out value='${ alert.al_no }'/>"></td></tr>
		<tr><td style="text-align:center;">발신일</td><td> : </td><td><c:out value='${ alert.s_al_date }'/></td></tr>
		<tr><td style="text-align:center;">내 용</td><td> : </td><td><textarea rows="6" style="width:230px;resize:none;" readonly><c:out value='${ alert.al_content }'/></textarea></td></tr>
	</table>
	<div align="center">
		<button class="btn btn-xs btn-success" onclick=history.go(-1);>목록으로</button>&nbsp;
		<button class="btn btn-xs btn-danger" onclick="deleteone();">삭제하기</button>
	</div>
	
	
	
</body>
</html>