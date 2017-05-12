<jsp:directive.page language="java" contentType="text/html; charset=utf-8"
pageEncoding="utf-8"/>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html >
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.noticeTitle{
background : lightgreen;
text-align : center;
color: white;
}
.nTitle{
font-size: 22px;
}
.content{
width:970px;
margin:auto;
padding:24px;
}
.contentInfo{
display:inline-block;
font-size: 13px;
    line-height: 20px;
}
.pimage{

display: inline-block;
    vertical-align: bottom;
    margin-right: 5px;
    width: 45px;
    height: 45px;
    border-radius: 50%;
    background: no-repeat center center;
    background-size: cover;

}
.bottomLine{

    background: #FAFAFA;
    margin: 0 !important;
    padding: 0 !important; 
    width:100% !important;
}
@media screen and (min-width: 260px){
.bottomContent{
    width: 960px;
    margin: 0 auto;
    padding: 40px 0;
}
}
.form{
width:100%;
}
</style>


</head>
<body>

<jsp:include page="/WEB-INF/views/common/menubar.jsp" flush="true" />
<div class="noticeTitle" >
<h2>공지사항</h2> <p/>
<p>펀펀드의 소식이 담겨있습니다.</p> 
</div>
<div class="container">
<div class="col-lg-12 col-md-12 col-xs-12">
<div class="content">
<p class="nTitle">제목</p>
<br>
<div>
<em class="pimage" style="background-image:uri()">ass</em><span class="contentInfo">작성자 <br> 날짜</span>
<div class="context">
</div>
</div>
</div>
</div>
</div>
<div class="container bottomLine">
<div class="col-lg-12 col-md-12 col-xs-12">
<div class="bottomContent" align="center">
<form action="#" method="post" class="form">
<textarea class="replyContent" name="replyContent" required></textarea>
<input type="submit" value="등록">
</form>
</div>
</div>
</div>

</body>
</html>