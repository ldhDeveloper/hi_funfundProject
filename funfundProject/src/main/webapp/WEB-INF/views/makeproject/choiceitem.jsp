<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% HttpSession user = request.getSession();%>
    
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
   position:absolute;
   z-index:100;
   background:rgba(0,0,0,0.5);
   max-width:100%;
   width:100%;
   height:600px;;
}
.row{
   max-width:100%;
}
.img-menu{
   position:absolute;
   z-index:1;
   height:600px;
}
.list-menu{
	position:relative;
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
<script>
	$(function(){
		var ano = ${sessionScope.account.ano};
		$.ajax({
			url:"checkproject.it",
			data:ano,
			success:function(){
				
			}
		});
	});
</script>
<div class="row" style="padding:0;">
   <div class="choice col-lg-6 col-md-6 col-sm-12 col-xs-12">
   	  <div class="list-menu">
      <img class="img-menu" src=images/makeproject/reward.jpg>
      <div class="overwrap">
         <p style="color:white;text-align:center;padding-top:80px;font-size:40px;">리워드형<br>REWARD</p>
         <p style="color:white;text-align:center;padding-top:50px;font-size:15px;">
            리워드형 크라우드펀딩은 제품/서비스를<br>보상으로 주면서 자금을 조달할 수 있는 방법입니다.<br>공익 목적의 캠페인에서부터 하드웨어까지,<br>다양한 아이디어를 알리고 현실로 만들 수 있습니다.
            <br><br><br><br><br><br><br><br>
            
            <button id="modalpop" class="btn btn-makeitem" align="center" data-toggle="modal" data-target="#projectcheck">신청하기(모달)</button>
            <button id="makeproject" class="btn btn-makeitem" onclick="location.href='insert.it?ano=${sessionScope.account.ano}'">신청하기(바로)</button>
         </p>
      </div>
      </div>
   </div>
   
   <!-- 모달영역 -->
   
   <div class="modal fade" id="projectcheck" role="dialog">
    <div class="modal-dialog modal-sm">
    
      <!-- Modal content-->
      <div class="modal-content">
        
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        
        <div class="modal-body" align="center">
          <p style="text-align:center">작성중인 프로젝트가 있습니다.<br>수정페이지로 이동하시겠습니까?</p><br><br>
          <button type="button" class="btn btn-default" data-dismiss="modal" onclick="location.href='insert.it?ano=${sessionScope.account.ano}'">새로 작성</button>
          <button type="button" class="btn btn-default" data-dismiss="modal">수정 하기</button>
        </div>
       
      </div>
     </div>
     </div>
   
   
   
   
   
   <div class="choice col-lg-6 col-md-6 col-sm-12 col-xs-12">
   	  <div class="list-menu">
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
</div>

</body>
</html>