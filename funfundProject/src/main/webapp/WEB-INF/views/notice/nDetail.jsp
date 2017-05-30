<jsp:directive.page language="java" contentType="text/html; charset=utf-8"
pageEncoding="utf-8"/>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
body {
line-height : 1px;
}
#nDetailContainer{
    padding: 20px;
    width: 100%;
    min-height: 600px;
    height: auto;
}
.category{
    padding: 15px 10px 10px 10px;
    border-bottom: 1px solid #e4e4e4;
    height : 80px;
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
  display:block;
  height : auto;
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

font-size: 22px;
}
#ncontent{

resize : none;
height : 100%;
width : 100%;
}
.rImage {
height : 15%;
width : 15%;
}
.nInfo{
display : inline-block;
}

.nDate{
color : gray;
}
</style>
</head>
<body>

<jsp:include page="/WEB-INF/views/common/menubar.jsp" flush="true" />
<hr>

<script>


function insertReply(){
	var ncontent = $("#ncontent").val();
	var ano = '${account.ano}';
	var upbno = '${n.nno}';
	var bno = '${n.bno}';
	location.href= "nInsert.no?ano="+ano+"&upbno="+upbno+"&ncontent="+ncontent +"&bno="+bno+"&spage='${spage}'";
}
function redactForm(x, y){
 var division =  '.replyContent' + x;

	$(division).html("<textarea id='ncontent' name='ncontent' rows='6' cols='77' style='overflow-y:hidden' maxlength='150px'></textarea>"
		+	"<input type='hidden' name='nno' value= " + y + ">" 
		+	"<input type='hidden' name='bno' value=${n.bno}>"
		+	"<input type='hidden' name='upbno' value=${n.nno}>"
		+   "<br><button onclick='updateReply("+ x + ");'>수정</button>"
	);	
	
}
function updateReply(x){
	var division =  '.replyContent' + x;
	var nno = $(division).children('input[name=nno]').val();
	var ano = '${account.ano}';
	var bno =  $(division).children('input[name=bno]').val();

	var upbno = $(division).children('input[name=upbno]').val();
	var ncontent = $(division).children('textarea').val();
	
	location.href="nUpdate.no?ano="+ano+"&bno="+bno+"&ncontent="+ncontent +"&upbno="+upbno+"&page=${page}&nno="+nno;
}


</script>
	<div id="nDetailContainer">
		<div class="col-lg-3 col-md-0 col-sm-0 col-xs-0"></div>
		<div class=" col-lg-6 col-md-12 col-sm-12 col-xs-12">
			<div class="category">
				<p class="categoryName"><a class="nDetailCategory">&lt; ${n.bname} </a></p>
			</div>
		<br>
		<p class="title">&nbsp; &nbsp; ${n.ntitle}</p>
		
		<p class ="nInfo">
		<c:if test="${empty reply.pimage }"> <img class="rImage" src="/funfund/images/myinfo/dimages.png"></c:if>
			<c:if test="${!empty reply.pimage }"> <img class="rImage" src="${n.pimage}"></c:if>
		<span>${n.nickname}</span>
		<p/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class="nDate">${n.ndate}</span>
		</p>
			<div id="nDetailContent"> ${n.ncontent}</div>
			<div>
				<c:if test="${account.ano eq n.ano }">
				<a href="goUpdateView.no?nno=${n.nno}&page=${page}">수정하기</a>
				<a href="nDelete.no?ntitle=${n.ntitle}&nno=${n.nno}&bno=${n.bno}&page=${page}">삭제하기</a></c:if>
			</div>
		</div>
		<div class="col-lg-3 col-md-0 col-sm-0 col-xs-0" > </div>
	</div>
	

	<div class="replyTable">
	<div class="col-lg-3 col-md-0 col-sm-0 col-xs-0"></div>
		<div class=" col-lg-6 col-md-12 col-sm-12 col-xs-12">
		<div class="category">
			<p class="categoryName">${fn:length(nList)}개의 댓글이 달려있습니다.</p>
			<br>
			<br>
			<%-- <c:if test="${!empty account}"> --%>
			<textarea id="ncontent" name="ncontent" rows="6" cols="77" style="overflow-y:hidden" maxlength="150px" required ></textarea>
			<br>
			<button class="replyButton" onclick="insertReply();">작성하기</button>
			
			<%-- </c:if> --%>
			<br><br>
			<c:forEach var="reply" items="${ nList}" varStatus="status">
			<div class="replyContent replyContent${status.index}">
			<p>
			<c:if test="${empty reply.pimage }"> <img class="rImage" src="/funfund/images/myinfo/dimages.png"></c:if>
			<c:if test="${!empty reply.pimage }"> <img class="rImage" src="${reply.pimage}"></c:if>
			
			${reply.nickname}</p>
			<p> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${reply.ncontent}</p>
			<p>${reply.ndate}</p>
			
			<button onclick="redactForm(${status.index}, ${ reply.nno})" >댓글수정</button>
			<a href="nDelete.no?nno=${reply.nno}&bno=${reply.bno}&upbno=${reply.upbno}&page=${page}" >댓글삭제</a>
			
			</div>
			<br>
			</c:forEach>
			<div align="right">
			<a href="javascript:history.go(-1)">목록으로 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a>
			</div>
		</div>
		</div>
		</div>
		
</body>
</html>