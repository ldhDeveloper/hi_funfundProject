<jsp:directive.page language="java" contentType="text/html; charset=utf-8"
pageEncoding="utf-8"/>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html >
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
// 불러온 리스트 값을 여기서 뿌린다.
$(function(){
$(".nDetailCategory").html();
$("").html();


	
	
});
</script>
<style>
body {
line-height : 1px;
}
#nDetailContainer{

    text-align: center;
    
    padding: 20px;
    width: 100%;
    height: 450px;
    float: left;
}
.category{
    padding: 15px 10px 10px 10px;
    height: 70px;
    border-bottom: 1px solid #e4e4e4;
}
.categoryName{
float: left;
}
.categoryName a{
display: inline-block;
    height: 40px;
   
    font-size: 16px;
    font-weight: 400px;
}
.replyTable{
 
    
    padding: 20px;
    width: 100%;
    height: 450px;
    float: left;
  display: block;
   background-color: #F9F7F5;
}
#content{
width : 100%;
border : 1px solid #e4e4e4;
}
.replyButton{
float:right;
display: inline-block;
    padding: 0 18px;
    height: 40px;
    line-height: 40px;
    font-size: 14px;
    background: #50e3c2;
    color: #fff;
    border: none;
    cursor: pointer;
    -webkit-appearance: none;}
.replyContent{
background : white;
border : 1px solid #e4e4e4;
border-
}
em{
    display: inline-block;
    margin-right: 4px;
    line-height: 24px;
    font-size: 17px;
    font-weight: 400;
    color: orange;
}
.nTitle{
    font-weight: 500;
    color: #0D0F12;
}
.nWriter, .nDate{
padding-right: 8px;
font-size: 13px;
    line-height: 16px;
    color: #7C8288;
}
.title{
float : left;
font-size: 22px;
}
</style>
</head>
<body>

<jsp:include page="/WEB-INF/views/common/menubar.jsp" flush="true" />
<hr>

	<div id="nDetailContainer">
		<div class="col-lg-3 col-md-0 col-sm-0 col-xs-0"></div>
		<div class=" col-lg-6 col-md-12 col-sm-12 col-xs-12">
		<div class="category">
			<p class="categoryName"><a class="nDetailCategory">&lt; </a></p>
			
		</div>
		<br>
		<p class="title">&nbsp; &nbsp; ${n.ntitle}</p>
		<br>
		<p>${n.nickname}</p>
		<p>${n.ndate}</p>
		</div>
		<div id="nDetailContent" class="col-lg-3 col-md-0 col-sm-0 col-xs-0"></div>
		
	</div>
	<div class="row"></div>
	<div class="replyTable">
	<div class="col-lg-3 col-md-0 col-sm-0 col-xs-0"></div>
		<div class=" col-lg-6 col-md-12 col-sm-12 col-xs-12">
		<div class="category">
			<p class="categoryName">0개의 댓글이 달려있습니다.</p>
			<form>
			<textarea id="content" name="content"></textarea>
			<input type="hidden" value="작성자">
			<input type="hidden" value="프로젝트번호">
			<input type="hidden" value="작성자번호">
			<input type="checkbox" value="문의유형">문의유형
			<br>
			<input class="replyButton" type="submit" value="작성하기">
			</form>
			<br><br>
			<div class="replyContent">
			<img><p>이름</p>
			<p>내용</p>
			<p>작성일시</p>
			<br>
			</div>
		</div>
		</div>
		<div class="col-lg-3 col-md-0 col-sm-0 col-xs-0"></div>
	</div>
	<div class="replyTable">
		<div class="col-lg-3 col-md-0 col-sm-0 col-xs-0"></div>
		<div class=" col-lg-6 col-md-12 col-sm-12 col-xs-12" style="margin-left:15px;" >
			<p> 다른 게시물</p>
			<hr>				
				<p> <em>공지사항</em>  <span class="nTitle"> 제목</span> </p>
				<p> <span class="nWriter"> 작성자</span> <span class="nDate">작성일</span> </p>
			<hr>
			<div>
			
			</div>
		</div>
		<div class="col-lg-3 col-md-0 col-sm-0 col-xs-0"></div>
	</div>

</body>
</html>