<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String cp = request.getContextPath(); %>

<!DOCTYPE html >
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>
.middle-menubar{
   margin-left:auto;
   margin-right:auto;
}
a{
   text-decoration:none;
}
.fun-menu{
	color:orange;
	font-weight:bold;
	position:relative;
	top:20px;
}
</style>

<title>Insert title here</title>

</head>
<body>
   <div class="row middle-menubar hidden-xs">
   
   <div class="col-lg-2 col-md-2 col-sm-2">
   	<img src="images/common/logo.png" style="widht:400px;height:70px;">
   </div>
   <div class="col-lg-5 col-md-4 col-sm-3">
   	&nbsp;
   </div>
   <div class="col-lg-4 col-md-4 col-sm-4">
   		<table style="width:430px">
        	<tr>
            	<td style="width:150px;"><a class="fun-menu" href="make.do">프로젝트 등록하기</a></td>
           	 	<td style="width:150px;"><a class="fun-menu" href="funding.do">프로젝트 둘러보기</a></td>
            	<td style="width:80px;"><a class="fun-menu" href="#">고객센터</a></td>
            	<td style="width:50px;"><a class="fun-menu" href="#">로그인</a></td>
            	<td style="width:50px;"><a class="fun-menu" href="myinfo.do">회원정보보기</a></td>
         	</tr>
      </table>
   </div>
   
      
      
   </div>
</body>
</html>