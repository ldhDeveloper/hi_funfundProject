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
a:hover {
background : #aaa;
taxt-decoration : none;
}

.noticeTitle{
background : #666;
text-align : center;
color: white;
}
</style>

</head>
<body>
<jsp:include page="/WEB-INF/views/common/menubar.jsp" flush="true"/>

<div class="noticeTitle" >
 <h2>공지사항</h2> <p/>
<p>펀펀드의 소식이 담겨있습니다.</p> 
</div>
<div class="container">
<div class="col-lg-12 col-md-12 col-xs-12">
<div class="nlist">

<p class="totalN">총 건수 </p>
<button>공지사항</button> <button>FnQ</button> <button>QnA</button>
<!-- 1.여기서부터  -->
<a  style="display:block;" href="nDetail.no">
<hr>
<p> <em>공지사항</em>  <span> 제목</span> </p>
<p> <span> 작성자</span> <span>작성일</span> </p>
<hr>
</a>
<!-- 1.여기까지 db에서 불러와서 포문으로 풀어넣기 -->
<div align="center">
<form action="#" method="post" > <select class="select-list">
<option value="title">제목</option>
<option value="writer">작성자</option>
 </select>
 <input type="text" placeholder="내용을 입력하세요">
 <input type="submit" value="검색"> 
 </form>
 <a href="nInsertView.no">글쓰기</a>
</div>
</div>
</div>
</div>
</body>
</html>