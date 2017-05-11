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


.contentTitle{
    background: #f5fafb;
padding: 16px 10px;
   
    font-size: 16px;
    color: violet;
    word-break: break-all;
    border-bottom: 1px solid #d7d7d7;
    display: block;
    border-top : 3px solid navy;
}

.otherInfo{
padding: 13px 10px;
    border-bottom: 1px solid #d7d7d7;
}
.content{ 
background : #cccccc;
height : 700px;
}
.buttonList{
float:right;}
.nDetail{
margin: auto;
    width: 700px;
  
   
}
@media screen and (max-width: 700px) {
    .nDetail {
        width: 400px;
        padding: 0;
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
<div class="nDetail">
<div class="contentTitle"> 우리들의 든든한 중개자 funfund 입니다. </div>
<div class="otherInfo"> <span>날짜</span>  <span>작성자</span></div>
<br>
<div class="content">내용 </div>
<hr>
<div class="buttonList" ><button>목록</button> </div>
</div>
<div>
<p></p>
<p></p>
</div>


</div>
</div>

</body>
</html>