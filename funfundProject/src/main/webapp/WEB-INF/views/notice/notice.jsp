<jsp:directive.page  language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"/>
<!DOCTYPE html >
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<title>Insert title here</title>
<style>
.totalN{
font-size : 13px;
color : rgb(124, 130, 136);

}
.nlist{
width:970px;
margin:auto;
padding:24px;

}
.nList:hover {
background : #aaa;
taxt-decoration : none;
}

.titleContainer{
background : #666;
height : 150px;
}

.noticeTitle{

text-align : center;
color: white;
    padding: 32px 16px;
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
@media screen and (min-width: 960px){
.noticeTitle {
    width: 960px;
    margin: 0 auto;
    padding: 48px 24px 40px;
}
}
.downbar{
align-content : center;
float: center;
margin: auto;
padding-bottom : 30px; 
}

.paging {
list-style : none;
text-align : center;
margin: auto;
}
.paging li {
float : left;
}
button {
background-repeat-y:
;
background-size:
auto
;
border-bottom-color:
rgb(0, 204, 163)
;
border-bottom-style:
solid
;
border-bottom-width:
1.11111px
;
border-image-outset:
0px
;
border-image-repeat:
stretch
;
border-image-slice:
100%
;
border-image-source:
none
;
border-image-width:
1
;
border-left-color:
rgb(0, 204, 163)
;
border-left-style:
solid
;
border-left-width:
1.11111px
;
border-right-color:
rgb(0, 204, 163)
;
border-right-style:
solid
;
border-right-width:
1.11111px
;
border-top-color:
rgb(0, 204, 163)
;
border-top-style:
solid
;
border-top-width:
1.11111px
;

background-color:
rgb(0, 204, 163)
;
;
font-family:
Roboto, "Noto Sans KR", sans-serif
;
font-size:
15px
;
}
</style>

</head>
<body>
<jsp:include page="/WEB-INF/views/common/menubar.jsp" flush="true"/>

<div class="titleContainer">
<div class="noticeTitle" >
 <h2>공지사항</h2> <p/>
<p>펀펀드의 소식이 담겨있습니다.</p> 
</div>
</div>
<div class="container">
<div class="col-lg-12 col-md-12 col-xs-12">
<div class="nlist">

<p class="totalN">총 건수 </p>
<button>공지사항</button> <button>FnQ</button> <button>QnA</button>
<!-- 1.여기서부터  -->
<a class="nList" style="display:block;" href="nDetail.no">
<hr>
<p> <em>공지사항</em>  <span class="nTitle"> 제목</span> </p>
<p> <span class="nWriter"> 작성자</span> <span class="nDate">작성일</span> </p>
<hr>
</a>
<!-- 1.여기까지 db에서 불러와서 포문으로 풀어넣기 -->
<div class="downbar" align="center">
<a>1</a> &nbsp;
<a>1</a> &nbsp;<a>1</a> &nbsp;<a>1</a> &nbsp;<a>1</a> &nbsp;<a>1</a> &nbsp;<a>1</a> &nbsp;

<a href="nInsertView.no">글쓰기</a>
</div>
<div align="center">
<form action="#" method="post" > <select>
<option value="title">제목</option>
<option value="writer">작성자</option>
 </select>
 <input type="text" placeholder="내용을 입력하세요">
 <input type="submit" value="검색"> 
 </form>

</div>
</div>
</div>
</div>
</body>
</html>