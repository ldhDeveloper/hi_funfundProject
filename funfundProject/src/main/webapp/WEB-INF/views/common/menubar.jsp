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
</style>

<title>Insert title here</title>

</head>
<body>
   <div class="middle-menubar">
      <table style="width:1500px">
         <tr>
            <td><img src="images/common/logo.png" style="widht:400px;height:70px;"></td>
            <td style="width:600px;">&nbsp;</td>
            <td></td>
            <td></td>
            <td style="width:150px;"><a href="make.do">프로젝트 등록하기</a></td>
            <td style="width:150px;"><a href="funding.do">프로젝트 둘러보기</a></td>
            <td style="width:80px;"><a href="#">고객센터</a></td>
            <td style="width:50px;"><a href="#">로그인</a></td>
         </tr>
      </table>
      
   </div>
</body>
</html>