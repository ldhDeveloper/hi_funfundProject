<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
.noticeTitle{
background : #666;
text-align : center;
color: white;
}

.ndetail{
width:970px;
margin:auto;
padding:80px;
}
.ntable, th, td {

font-weight:bold;
text-align:center;
font-size: 13px;
border: 1px solid #aaaaaa;
}
.column{
background : #cccccc;
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
<div class="ndetail">
<form action="#" method="post">
<table class="ntable">
<tr><td class="column">제목</td><td><input id="ntitle" name="ntitle"> </td></tr>
<tr><td class="column">이름</td><td><input id="writer" value="" readonly></td></tr>
<tr><td class="column">내용</td><td></td></tr>
<tr><td class="column">첨부파일</td><td><input type="file"></td></tr>
<tr><td class="column"></td><td></td></tr>
</table>
<input type="submit" value="작성">
</form> 
 </div>
</div>
</div>
</body>
</html>