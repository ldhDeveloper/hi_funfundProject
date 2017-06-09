<jsp:directive.page  language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"/>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html >
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.4.js"></script> <!-- 아임포트 본인 인증 -->
<title>Insert title here</title>
<script>
$(function(){

	switch('${bname}'){
	case '공지사항' :
		var admin = '${account.idtype}';
		$('#no').css({"background": "#00CCA3", "border-color" : "#00CCA3", "color": "#fff" });
		$('#bTitle').text('공지사항');
		$('#bComent').text('펀펀드의 공지사항입니다.');
		$("#searchBar").children("form").children("#searchCategory").html(
		"<option value='ntitle'>제목</option>");	
		if( admin == '관리자'){
		$("#searchBar").children("form").html($("#searchBar").children("form").html()
				+" &nbsp; <a class='btn btn-default' href='nInsertView.no?bname=${bname}&page=${page}'>글쓰기</a>");
		}
		break;	
	   case 'FnQ' : $('#fnq').css({"background": "#00CCA3", "border-color" : "#00CCA3", "color": "#fff" });
					$('#bTitle').text('FnQ');
			     	$('#bComent').text('자주묻는 질문입니다.');
			     	
					$('.nListContainer').html( 
			  				"<hr><div class='panel-group' id='accordion'>"+
			  				"<c:forEach var='nlist' items='${nList}' varStatus='status'>" +
						  	"<div class='panel panel-default'>"+
						  	"<div class='panel-heading'>"+
						  	"<h4 class='panel-title'>"+
						  	"<a href='#collapse2' class='fontfamily1' style='text-decoration:none;'>${nlist.ntitle}</a></h4>"+
						  	"</div>"+
						  	"<div id='collapse2' class='panel-collapse collapse'>"+
						   	"<div class='panel-body fontfamily2'>${nlist.ncontent}</div>"+  
						  	"</div>"+
						  	"</div>"+
						  	"</c:forEach>" +
						  	"</div>"); 
					$("#pageBar").remove();
					$("#searchBar").remove();
				// 아코디언과 내용
				break;  
	case 'QnA' :$('#qna').css({"background": "#00CCA3", "border-color" : "#00CCA3", "color": "#fff" });
	$('#bTitle').text('QnA');
	$('#bComent').text('사용자와의 소통이 이루어 집니다.');
	$("#searchBar").children("form").children("#searchCategory").html(
	"<option value='ntitle'>제목</option><option value='nickname'>작성자</option>");	
	if('${account}' != ""){
		$("#searchBar").children("form").html($("#searchBar").children("form").html()
				+" &nbsp; <a class='btn btn-default' href='nInsertView.no?bname=${bname}&page=${page}'>글쓰기</a>");
		}
		break;
	};
	
	$('.panel-heading').hover(function(){
		$(this).css('cursor', 'pointer');
	});
	$('.panel-heading').click(function(){
		var cname = $(this).siblings("div:first").attr("class");
		if(cname =="panel-collapse collapse"){
			$(this).siblings("div:first").attr("class", "panel-collapse collapse in");
		} else {
			$(this).siblings("div:first").attr("class", "panel-collapse collapse");
		}
		
	});

});

</script>
<!-- 게시판넘기는버튼  -->
<script>

function category(x){

switch(x){

case 1 :  location.href="nList.no?bname=공지사항&page=1"; break;
case 2 :  location.href="nList.no?bname=FnQ&page=1"; break;
case 3 :  location.href="nList.no?bname=QnA&page=1"; break;
}

} 
function checkOption(){
	if($("select").val() == 'nickname'){
	$('input[name=ntitle]').attr('name', 'nickname');
	}
	return true;
}


</script>
<style>
button.accordion {
    background-color: #eee;
    color: #444;
    cursor: pointer;
    padding: 18px;
    width: 100%;
    text-align: left;
    border: none;
    outline: none;
    transition: 0.4s;
}
.panel-heading {
	background: -webkit-linear-gradient(#ffffff, #b0e0e6);
	background: -o-linear-gradient(#ffffff, #b0e0e6);
	background: -moz-linear-gradient(#ffffff, #b0e0e6);
	background: linear-gradient(#ffffff, #b0e0e6);
	border: solid 1px #2a82a3;
	height: 52px;
	border-radius: 4px;
	padding-top: 0.8%;
	font-size: 12pt;
	box-shadow: 3px 3px 5px silver;
}
button.accordion.active, button.accordion:hover {
    background-color: #ddd;
}

.fontfamily2 {
	font-family: google !important;
}
/* Style the accordion panel. Note: hidden by default */
div.panel {
    
    background-color: white;
    display: block;
}


.totalN{
font-size : 13px;
color : rgb(124, 130, 136);

}
.nlist{
width:970px;
margin:auto;
padding:24px;
display : block;
min-height : 900px;
}
.nList:hover {
background : RGB(245,247,250);
taxt-decoration : none;
}

.titleContainer{
height:150px;
line-height:22.5px;
text-size-adjust:100%;
background : RGB(96,101,106);
height : 150px;
}
.FnQtitle{ display: block;}
.FnQcontent{
display : none;}


.titleContainer h2 {
font-size:36px;
font-style:normal;
font-weight:500;
letter-spacing:-0.72px;
line-height:44px;
margin-bottom:8px;
}
.noticeTitle{
text-align : center;
color: white;
    padding: 15px 16px;
}
em{
	font-style : normal;
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
    padding: 15px 24px 40px;
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
 display: inline-block;
    padding: 0 12px;
    width : 10%;
    height : 15%;
    line-height: 30px;
    font-size: 15px;
    color: #4a4a4a;
    border: 1px solid #e4e4e4;
    background: #fff;
}
.FnQcontainer{
display : block;
background : gray;


}
.FnQtitle {
  color: #444;
    cursor: pointer;
    padding: 18px;
    width: 100%;
    text-align: left;
    border: none;
    outline: none;
    transition: 0.4s;
}
.FnQtitle.active .FnQtitle:hover{
background-color = #444;
}
div.FnQcontent {
padding : 0 18px;
background-color : white;
display:none;}

</style>

</head>
	<body>
		<jsp:include page="/WEB-INF/views/common/menubar.jsp" flush="true"/>
	
	<div class="titleContainer">
		<div class="noticeTitle" >
	 		<h2 id='bTitle'></h2> <p/>
				<p id='bComent'></p> 
		</div>
	</div>
	<div class="container">
		<div class="col-lg-12 col-md-12 col-xs-12">
			<div class="nlist">
				<p class="totalN">총 ${listCount} 건수 </p>
					<button onclick="category(1);" id="no">공지사항</button>
	 				<button onclick="category(2);" id="fnq">FnQ</button>
	 				<button onclick="category(3);" id="qna">QnA</button>
					<!-- 1.여기서부터  -->
					<div class="nListContainer">
					<hr>
					<c:forEach var="nlist" items="${nList}">
						<a class="nList" style="display:block;" href="nDetail.no?bname=${nlist.bname}&nno=${nlist.nno}&page=${page}">
							<p> <em>${nlist.bname}</em>  <span class="nTitle">${nlist.ntitle}</span> </p>
							<p> <span class="nWriter"> ${nlist.nickname }</span> <span class="nDate">${nlist.ndate}</span> </p>
							<hr>
						</a>
					</c:forEach>
					</div>
					<!-- 1.여기까지 db에서 불러와서 포문으로 풀어넣기 -->
					<div class="downbar" id="pageBar" align="center">
						<br>
						<fmt:parseNumber var = "pageCount" value = "${page/10 }" integerOnly="true" type="number"/>
						<c:set var ="pageNumber" value="${pageCount +1}"/>
						<c:forEach var="i" begin='${pageNumber}' end="${pageNumber +9}">
							<a class="nPage" href="nList.no?bname=${bname}&page=${i}">${i}</a> &nbsp;
						</c:forEach>						
					</div>
					<div align="center" id="searchBar">
						<form action="nList.no"  onsubmit="return checkOption();" > 
							<select id="searchCategory">
	 						</select>
		 					<input type="text" name="ntitle" placeholder="내용을 입력하세요" required>
	 						<input type="hidden" name="bname" value="${bname}">
	 						<input type="hidden" name="page" value="1">
	 						<input type="submit" class="btn btn-default" value="검색"> 
	 					</form>
					</div>
				</div>
			</div>
						
			
			
			
			
			
			
		</div>
	</body>
</html>