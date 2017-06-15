<jsp:directive.page language="java" contentType="text/html; charset=utf-8"
pageEncoding="utf-8"/>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 상세보기</title>

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
  height :auto !important;
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
height : initial;
}
.replylev2{
padding-left : 20px;
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
background : #24B3A8;
color : white;
height : 40px;
}
.ncontent{

resize : none;
height : 100%;
width : 100%;
}
.rImage {
height : 40px;
width : 40px;
}

@media screen and (min-width : 380px)
{
.nImage{
height : 100px;
width : 100px;
}
}
@media screen and (max-width :379px){
.nImage{
height : 20px;
width : 20px;
}
}
.nInfo{
display : inline-block;
}

.nDate{
color : gray;
font-size : 17px;
}
#nDetailContent{
min-height : 500px;
}
.buttons{
float:right;
}
.buttons a{
display:block;
}
</style>
</head>
<body>

<jsp:include page="/WEB-INF/views/common/menubar.jsp" flush="true" />
<hr>

<script>

function insertReply(lev, upbno, replybno){
	if(lev == 1){
	var ncontent = $("#ncontent").val();
	}
	else{
		ncontent = $('#rereplyContent').val();
	}
	var ano = '${account.ano}';
	var upbno = upbno;
	var bname = '${n.bname}';
	var page = '${page}';
	var replybno = replybno;
	var top = new Number(1);
	var newestNno = new Number(1);
	var newestReply = new Number(1);
	var replylist = "";
	$.ajax({
		url : "replyInsert.no",
		data : {"ncontent" : ncontent, "ano" : ano, "upbno" : upbno, "bname": bname, "nreply_lev" : lev, "page" : page, "replybno" : replybno},
		contentType : "application/json",
		success : function(data){
				$('#replyList').html('<br>');
				$('.categoryName').html("<b>"+ data.length+"</b>개의 댓글이 달려있습니다.");
			 	for(var i in data){
					if(data[i].nreply_lev == '1'){
						replylist = "<br><div id='replyContent"+ i +"' class='replyContent replyContent"+ i+ "' style='padding-bottom:20px;'>" ;
					}else{
						replylist = "<div id='replyContent"+ i +"' class='replyContent replyContent"+ i+ "'>" +
				 		"⇒<div class= 'replylev2'>";
					}
					if(data[i].pimage == null){
						replylist +=  "<p><img class='rImage' src='/funfund/images/myinfo/dimages.png'>" +
						data[i].nickname +"</p><br>" +
						"<p class='rcontent' style='text-indent:50px;'>" +data[i].ncontent +"</p><br><p>" +
						data[i].ndate+
						"</p><input type='hidden'  value='"+ data[i].nno+ "'>";
					}else{
					 replylist += "<p><img class='rImage' src='images/myinfo/"+data[i].pimage + "'>"+ 
					 	data[i].nickname +"</p>" +
						"<p class='rcontent' style='text-indent:50px;'>" +data[i].ncontent +"</p><p>" +
						data[i].ndate+
						"</p><input type='hidden'  value='"+ data[i].nno+ "'>";
					}
					var ano = parseInt('${account.ano}');
					if(data[i].nreply_lev == '1' && ano == 1){
						replylist +="<button id='addreply' class='admin btn btn-default' onclick='createReplyForm(" + i + ", " + data[i].upbno + ", " + data[i].nno +" )'>답글달기</button>"; 
					}
					if(data[i].ano == ano){
						replylist += "<button id='redact' class='btn btn-default' onclick='redactForm(" + i + "," + data[i].nno + ", " + data[i].ano+ ")'>댓글수정</button>" +
						"<button class='btn btn-default' oncilck='ndelete(" + data[i].nno + ", ${n.nno})'>댓글삭제</button>" + 
						"</div><br>";
					}
					if('${account.idtype}' != '관리자'){
						$('#addreply').remove();
					}
					$('#replyList').html($('#replyList').html() + replylist);
					var ano = parseInt('${account.ano}');
					if(data[i].ano == ano){
							if(data[i].nno > newestNno){
							 newestNno = data[i].nno;
							 newestReply = i;
							 console.log(newestReply);
							}
						} 
				} 
			 	top = $('#replyContent' +newestReply).offset().top;	
			 	$('body').scrollTop(top - 300);
			 $('.replylev2').children('#addreply').remove();
			}
		
		});
}
function ndelete(nno, upbno){
			if(nno == upbno){
				$.ajax({
					url : "nDelete.no",
					data : {"nno" : nno, "bname" : '{$n.bname}', "upbno" :upbno, "page" : '${page}', "ntitle" : '${n.ntitle}' },
					contentType : "application/json",
					success : function(data){
						if(data.message == '댓글삭제'){
							 location.href="nDetail.no?nno=${n.nno}&bname='${n.bname}'&page=${page}";	
						}else if('본글삭제'){
							location.href="nList.no?bname=${n.bname }&page=${page}";
						}else{
							alert(data.message);
							location.href="nList.no?bname=${n.bname }&page=${page}";
						}
							}	
						});
			}else{
				$.ajax({
					url : "nDelete.no",
					data : {"nno" : nno, "bname" : '{$n.bname}', "upbno" :upbno, "page" : '${page}' },
					contentType : "application/json",
					success : function(data){
						if(data.message == '댓글삭제'){
							 location.href="nDetail.no?nno=${n.nno}&bname='${n.bname}'&page=${page}";	
						}else{
							location.href="nList.no?bname=${n.bname }&page=${page}";
						}
							}	
						});
			}
	}
function redactForm(index, y, ano){
			 var division =  '.replyContent' + index;
			 var content = $(division).children('.rcontent').text();
				$(division).html(
						$(division).html() +
						"<textarea id='redactContent' class='ncontent' name='redactContent' rows='6' cols='77' style='overflow-y:hidden' maxlength='150px'>" +
				   		  content +  "</textarea>"+
							"<input type='hidden' name='nno' value= " + y + ">" +
							   "<br><button onclick='updateReply("+ index + ");'>수정</button>"
				);	
				$(division).children('#addreply').attr('disabled', true);
				$(division).children('#redact').attr('disabled', true);
}
function updateReply(x){
			var division =  '.replyContent' + x;
			var nno = $(division).children('input[name=nno]').val();
			var ano = '${account.ano}';
			var bname =  "${n.bname}";
			var upbno = ${n.nno};
			var ncontent = $(division).children('textarea').val();
			var page = parseInt('${page}');
			$.ajax({
				url : "nUpdate.no",
				data : {"ano" : ano, "bname" : bname, "ncontent" : ncontent, "upbno" : upbno, "page" : page, "nno" : nno},
				contentType : "application/json",
				success : function(data){
					console.log('${data}');
					if(data.message == 'success'){
						location.href= "nDetail.no?nno=${n.nno}&bname='${n.bname}'&page=${page}";	
					}else{
						alert("댓글이 존재하지 않습니다.");
						location.href="nList.no?bname=${n.bname}&page=${page}";
					}
				}	
			});
		}
function createReplyForm(index, upbno, replybno){
			var division =  '.replyContent' + index;
			$(division).html(
					$(division).html()
					+"<textarea id='rereplyContent' class='ncontent' placeholder='대댓글을 입력하세요' name='rereplyContent' rows='6' cols='77' style='overflow-y:hidden' maxlength='150px'>" +
			    	  "</textarea>" +
					  "<br><button onclick='insertReply(2, "+ upbno + ", "+ replybno + ");'>답글등록</button>"
			);	
			$(division).children('#addreply').attr('disabled', true);
			$(division).children('#redact').attr('disabled', true);
}	
</script>
<div class="container">
		<div class="col-lg-4 col-md-0 col-sm-0 col-xs-0"></div>
		<div class=" col-lg-12 col-md-12 col-sm-12 col-xs-12">
			<div class="category">
				<p class="categoryName"><a class="nDetailCategory">&lt; ${n.bname} </a></p>
			</div>
		<br>
		<p class="title" >&nbsp; &nbsp; ${n.ntitle}</p>
		
		<p class ="nInfo">
		<c:if test="${empty n.pimage }"> <img class="nImage" src="/funfund/images/myinfo/dimages.png"></c:if>
			<c:if test="${!empty n.pimage}"> <img class="nImage" src="images/myinfo/${n.pimage}"></c:if>
		<span>${n.nickname}</span>
		<p></p>
		<span class="nDate">${n.ndate}</span>
		<br>
		</p>
			<div id="nDetailContent"> ${n.ncontent}</div>
			<div class="buttons">
				<c:if test="${account.ano eq n.ano }">
				<a  class="btn btn-default" href="goUpdateView.no?nno=${n.nno}&page=${page}">수정하기</a>
				<button  class="btn btn-default" onclick="ndelete(${n.nno}, ${n.nno} )">삭제하기</button>
				</c:if>
			</div>
		</div>
		<div class="col-lg-4 col-md-0 col-sm-0 col-xs-0" > </div>
	</div>
<div class="row replyTable">
	<div class="">
	<div class="col-lg-3 col-md-0 col-sm-0 col-xs-0"></div>
		<div class=" col-lg-6 col-md-12 col-sm-12 col-xs-12">
		<div class="category">
			<p class="categoryName">${fn:length(nList)}개의 댓글이 달려있습니다.</p>
		</div>
			<br>
			<br>
			<%-- <c:if test="${!empty account}"> --%>
			<textarea id="ncontent" class='ncontent' name="ncontent" rows="6" cols="77" style="overflow-y:hidden" maxlength="150px" required ></textarea>
			<br>
			<c:if test="${!empty sessionScope.account }">
			<button class="replyButton" onclick="insertReply(1, ${n.nno}, 0);">작성하기</button>
			</c:if>
			<%-- </c:if> --%>
			<div id="replyList">
			<br><br>
			<c:forEach var="reply" items="${ nList}" varStatus="status">
			<br>
			<div id="replyContent${status.index}"  class="replyContent replyContent${status.index}" >
				<c:if test="${reply.nreply_lev ==2 }">
				⇒<div class='replylev2'> 
				</c:if>
					<p>
					<c:if test="${empty reply.pimage }"> <img class="rImage" src="/funfund/images/myinfo/dimages.png"></c:if>
					<c:if test="${!empty reply.pimage }"> <img class="rImage" src="images/myinfo/${reply.pimage}"></c:if>
					${reply.nickname}</p><br>
					<p class='rcontent' style="text-indent:50px;"> ${reply.ncontent}</p><br>
					<p style="color:#cac4c4">${reply.ndate}</p>
					<input type="hidden" name="nno"  value="${reply.nno}">
					<c:if test="${! empty account && reply.nreply_lev == 1 }"> <!-- 관리자 확인 조건 account.idtype== '관리자' -->
					<button id='addreply' class="btn btn-default" onclick="createReplyForm(${status.index}, ${reply.upbno} ,${ reply.nno})">답글달기</button>
					</c:if>
					<c:if test="${account.ano eq reply.ano }">
					<button id='redact' class="btn btn-default" onclick="redactForm(${status.index}, ${ reply.nno}, ${reply.ano})" >댓글수정</button>
					<button class="btn btn-default" onclick="ndelete(${reply.nno}, ${reply.upbno})" >댓글삭제</button>
					</c:if>
				<c:if test="${reply.nreply_lev ==2}">
				</div>
				</c:if>
			</div>
			</c:forEach>
			</div>
			<div align="right">
			<a href="nList.no?bname=${n.bname }&page=${page}">목록으로 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a>
			</div>
		
		</div>
		</div>
		<jsp:include page="/WEB-INF/views/common/footer.jsp" flush="true"/>
</body>
</html>