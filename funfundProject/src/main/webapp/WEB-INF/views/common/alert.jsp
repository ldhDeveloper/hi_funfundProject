<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>
body{
	background:rgba(255,255,25,0.1);
}
</style>
<script>
	$(function(){
		var ano = ${sessionScope.account.ano};
		
		$.ajax({
			url:"selectlist.al?ano=" + ano,
		  	success:function(data){
		  		var length = data.alist.length;
		  		
		  		for(var i = 0; i < length; i++){
		  			if(data.alist[i].readyn == 'n'){
		  				$("#msglist").html($("#msglist").html() 
		  			  		+ "<tr><td align='center'><input type='checkbox'></td><td>관리자</td><td>"
		  			  		+ data.alist[i].al_title 
		  			  		+ " &nbsp; <label style='background:red;color:white;font-size:0.7em;'>&nbsp; N &nbsp;</label>"
		  			  		+ "</td><td>" 
		  			  		+ data.alist[i].s_al_date 
		  			  		+ "</td></tr>" );
		  			}else{
		  				$("#msglist").html($("#msglist").html() 
			  			  		+ "<tr><td align='center'><input type='checkbox'></td><td>관리자</td><td>"
			  			  		+ data.alist[i].al_title 
			  			  		+ "</td><td>" 
			  			  		+ data.alist[i].s_al_date 
			  			  		+ "</td></tr>" );
		  			}
		  		}
		  			
		  		
		  	}
		});
	});
</script>
<body>
	<div style="text-align:center;background:orange;color:white;height:50px;valign:middle;padding-top:15px;">쪽 지
	
	</div>
	

	<table class="table table-hover table-condensed" id="msglist">
		<tr><th style="width:50px;">&nbsp;</th><th  style="width:100px;">보낸사람</th><th style="width:250px;text-align:center;">내 용</th><th style="width:120px;text-align:center;">날짜</th></tr>
		
		<!-- <tr><td align="center"><input type="checkbox"></td><td>관리자</td><td>게시물 등록 완료!</td><td>2017-06-07</td></tr>
		<tr><td align="center"><input type="checkbox"></td><td>관리자</td><td>게시물 등록 완료!</td><td>2017-06-07</td></tr>
		<tr><td align="center"><input type="checkbox"></td><td>관리자</td><td>게시물 등록 완료!</td><td>2017-06-07</td></tr> -->
	</table>
	<div align="right" style="backgroung:orange;">
		<button class="btn btn-xs btn-default" >전체선택</button><button class="btn btn-xs btn-danger">삭제</button>
	</div>
	<hr>
	<footer>
	<div align="center">
		<div class="btn-group" align="center">
  			<button type="button" class="btn btn-warning btn-xs"><<</button>
  			<button type="button" class="btn btn-warning btn-xs"><</button>
  			<button type="button" class="btn btn-warning btn-xs">1</button>
  			<button type="button" class="btn btn-warning btn-xs">2</button>
  			<button type="button" class="btn btn-warning btn-xs">3</button>
  			<button type="button" class="btn btn-warning btn-xs">4</button>
  			<button type="button" class="btn btn-warning btn-xs">5</button>
  			<button type="button" class="btn btn-warning btn-xs">></button>
  			<button type="button" class="btn btn-warning btn-xs">>></button>
		</div>
	</div>
	</footer>
</body>
</html>