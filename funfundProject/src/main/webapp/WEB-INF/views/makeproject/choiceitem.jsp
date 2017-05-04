<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html">
<html>
<head>
<meta charset="UTF-8">

<style>
img{
   max-width:100%;
}
.choice{
   padding:0px !important;
}
.overwrap{
   position:relative;
   z-index:100;
   top:-600px;
   background:rgba(0,0,0,0.5);
   max-width:100%;
   width:100%;
   height:600px;;
}
.row{
   max-width:100%;
}
.img-menu{
   position:relative;
   z-index:1;
   height:600px;
}
.btn-makeitem{
   background:orangered;
}
</style>

<title>Insert title here</title>

</head>
<body>
<jsp:include page="/WEB-INF/views/common/menubar.jsp" flush="true"/>
<div class="row">
   <div class="choice col-lg-6 col-md-6 col-sm-12 col-xs-12">
      <img class="img-menu" src=images/makeproject/reward.jpg>
      <div class="overwrap">
         <p style="color:white;text-align:center;padding-top:80px;font-size:40px;">리워드형<br>REWARD</p>
         <p style="color:white;text-align:center;padding-top:50px;font-size:15px;">
            리워드형 크라우드펀딩은 제품/서비스를<br>보상으로 주면서 자금을 조달할 수 있는 방법입니다.<br>공익 목적의 캠페인에서부터 하드웨어까지,<br>다양한 아이디어를 알리고 현실로 만들 수 있습니다.
            <br><br><br><br><br><br><br><br>
            <button class="btn btn-makeitem" align="center">신청하기</button>
         </p>
      </div>
   </div>
   <div class="choice col-lg-6 col-md-6 col-sm-12 col-xs-12">
      <img class="img-menu" src=images/makeproject/donation.jpg>
      <div class="overwrap">
         <p style="color:white;text-align:center;padding-top:80px;font-size:40px;">후원형<br>DONATION</p>
         <p style="color:white;text-align:center;padding-top:50px;font-size:15px;">
            후원형 크라우드펀딩은<br>공익 목적의 자금을 조달할 수 있는 방법입니다.<br>공익 목적의 캠페인에서부터 하드웨어까지,<br>다양한 아이디어를 알리고 후원을 받을 수 있습니다.
            <br><br><br><br><br><br><br><br>
            <button class="btn btn-makeitem" align="center">신청하기</button>
         </p>
         
      </div>
   </div>
</div>

</body>
</html>