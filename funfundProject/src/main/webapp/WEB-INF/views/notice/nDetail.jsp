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
padding : 20px;
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
	var contentlist = "";
	var top = new Number(1);
	var date = new Date(2017, 01, 01, 01, 01, 01, 01);
	var comparedDate = new Date(); 
	alert(date);
	var edgenum = "";
	$.ajax({
		url : "replyInsert.no",
		data : {"ncontent" : ncontent, "ano" : ano, "upbno" : upbno, "bname": bname, "nreply_lev" : lev, "page" : page, "replybno" : replybno},
		contentType : "application/json",
		success : function(data){
				$('#replyList').html('<br><br>');
				$('.categoryName').html("<b>"+ data.length+"</b>개의 댓글이 달려있습니다.");
			 	for(var i in data){
					var replylist = "";
					if(data[i].nreply_lev =='1'){
							if(data[i].pimage == null){
								if(data[i].ano != '${account.ano}'){
									replylist = 
								 		"<div id='replyContent"+ i +"' class='replyContent replyContent"+ i+ "'>" +
										"<p><img class='rImage' src='/funfund/images/myinfo/dimages.png'>" + 
										data[i].nickname +"</p>" +
										"<p style='text-indent:50px;'>" +data[i].ncontent +"</p><p>" +
										data[i].ndate+
										"</p><input type='hidden'  value='"+ data[i].nno+ "'>"+
									 	"<button id='addreply' class='admin btn btn-default' onclick='createReplyForm(" + i + ", " + data[i].upbno +" )'>답글달기</button>" + 
										"</div><br>";
								}else{
									replylist = 
								 		"<div id='replyContent"+ i +"' class='replyContent replyContent"+ i+ "'>" +
										"<p><img class='rImage' src='/funfund/images/myinfo/dimages.png'>" + 
										data[i].nickname +"</p>" +
										"<p style='text-indent:50px;'>" +data[i].ncontent +"</p><p>" +
										data[i].ndate+
										"</p><input type='hidden'  value='"+ data[i].nno+ "'>"+
									 	"<button id='addreply' class='admin btn btn-default' onclick='createReplyForm(" + i + ", " + data[i].upbno + ", " + data[i].nno +" )'>답글달기</button>" +
										"<button id='redact' class='btn btn-default' onclick='redactForm(" +i+ "," + data[i].nno + data[i].ano+ ")'>댓글수정</button>" +
										"<button class='btn btn-default' href='nDelete.no?nno=" +data[i].nno +"&bname=" +data[i].bname + "&upbno=" +data[i].upbno +"&page=${page}' >댓글삭제</a>" + 
										"</div><br>";
								}	
						}else{
							if(data[i].ano != '${account.ano}'){
								replylist = 
							 		"<div id='replyContent"+i+"' class='replyContent replyContent"+ i+ "'>" +
						 		"<p><img class='rImage' src='"+data[i].pimage + "'>"+  
									data[i].nickname +"</p>" +
									"<p style='text-indent:50px;'>" +data[i].ncontent +"</p><p>" +
									data[i].ndate+
									"</p><input type='hidden'  value='"+ data[i].nno+ "'>"+
									
									"</div><br>";
							}else{
								replylist = 
							 		"<div id='replyContent"+i+"' class='replyContent replyContent"+ i+ "'>" +
							 		 "<p><img class='rImage' src='"+data[i].pimage + "'>"+  
									data[i].nickname +"</p>" +
									"<p style='text-indent:50px;'>" +data[i].ncontent +"</p><p>" +
									data[i].ndate+
									"</p><input type='hidden'  value='"+ data[i].nno+ "'>"+
									"<button id='redact' class='btn btn-default' onclick='redactForm(" +i+ "," + data[i].nno + data[i].ano+ ")'>댓글수정</button>" +
									"<a class='btn btn-default' href='nDelete.no?nno=" +data[i].nno +"&bname=" +data[i].bname + "&upbno=" +data[i].upbno +"&page=${page}' >댓글삭제</a>"+  
									"</div><br>";
							}
							} 
					}else{
							if(data[i].pimage == null){
								if(data[i].ano != '${account.ano}'){
									replylist  =
								 		"<div id='replyContent"+i+"' class='replyContent replyContent"+ i+ "'>" +
								 		"<div class= 'replylev2'>" +
										 "<p><img class='rImage' src='/funfund/images/myinfo/dimages.png'>" + 
										data[i].nickname +"</p>" +
										"<p style='text-indent:50px;'>" +data[i].ncontent +"</p><p>" +
										data[i].ndate+
										"</p><input type='hidden'  value='"+ data[i].nno+ "'>"+
										"<button id='addreply' class='admin btn btn-default' onclick='createReplyForm(" +i +", " + data[i].upbno + ", " + data[i].nno +" )'>답글달기</button>" +
										
										"</div></div><br>";
								}else{
									replylist  =
								 		"<div id='replyContent"+i+"' class='replyContent replyContent"+ i+ "'>" +
								 		"<div class= 'replylev2'>" +
										"<p><img class='rImage' src='/funfund/images/myinfo/dimages.png'>" + 
										data[i].nickname +"</p>" +
										"<p style='text-indent:50px;'>" +data[i].ncontent +"</p><p>" +
										data[i].ndate+
										"</p><input type='hidden'  value='"+ data[i].nno+ "'>"+
										"<button id='addreply' class='admin btn btn-default' onclick='createReplyForm(" +i +", " + data[i].upbno + ", " + data[i].nno +" )'>답글달기</button>" +
										"<button id='redact' class='btn btn-default' onclick='redactForm(" +i+ "," + data[i].nno + ")'>댓글수정</button>" +
										"<a class='btn btn-default' href='nDelete.no?nno=" +data[i].nno +"&bname=" +data[i].bname + "&upbno=" +data[i].upbno +"&page=${page}' >댓글삭제</a>" + 
										"</div></div><br>";
								}
						}else{
							if(data[i].ano != '${account.ano}'){
								replylist = 
							 		"<div id='replyContent"+i+"' class='replyContent replyContent"+ i+ "'>" +
							 		"<div class= 'replylev2'>" +
							 		  "<p><img class='rImage' src='"+data[i].pimage + "'>"+  
									data[i].nickname +"</p>" +
									"<p style='text-indent:50px;'> " +data[i].ncontent +"</p><p>" +
									data[i].ndate+
									"</p><input type='hidden'  value='"+ data[i].nno+ "'>"+
									 "<button id='addreply' class='admin btn btn-default' onclick='createReplyForm(" +i +", " + data[i].upbno + ", " + data[i].nno +" )'>답글달기</button>" +
									"</div></div><br>";
							}else{
								replylist = 
							 		"<div id='replyContent"+i+"' class='replyContent replyContent"+ i+ "'>" +
							 		"<div class= 'replylev2'>" +
							 		  "<p><img class='rImage' src='"+data[i].pimage + "'>"+ 
									data[i].nickname +"</p>" +
									"<p style='text-indent:50px;'> " +data[i].ncontent +"</p><p>" +
									data[i].ndate+
									"</p><input type='hidden'  value='"+ data[i].nno+ "'>"+
									 "<button id='addreply' class='admin btn btn-default' onclick='createReplyForm(" +i +", " + data[i].upbno + ", " + data[i].nno +" )'>답글달기</button>" +
									"<button id='redact' class='btn btn-default' onclick='redactForm(" +i+ "," + data[i].nno + ")'>댓글수정</button>" +
									"<a class='btn btn-default' href='nDelete.no?nno=" +data[i].nno +"&bname=" +data[i].bname + "&upbno=" +data[i].upbno +"&page=${page}' >댓글삭제</a>"+ 
									"</div></div><br>";
							}
						}
					}
					
					
					
					$('#replyList').html($('#replyList').html() + replylist);
					if(data[i].ano == ${account.ano}){
						comparedDate.setFullYear(data[i].ndate.slice(0, 4));
						comparedDate.setDate(data[i].ndate.slice(8, 10));
						comparedDate.setMonth(data[i].ndate.slice(5, 7));
						comparedDate.setHours(0);
						comparedDate.setMinutes(0);
						comparedDate.setSeconds(0);
						if( date < comparedDate ){
							date = data[i].ndate;
						edgenum = i;}
						} 
					if('${account.idtype}' != '관리자'){
						$('#addreply').remove();
					}
				} 
			 	top = $('#replyContent' +edgenum).offset().top;	
			 	$('body').scrollTop(top - 300);
			 
			}
		});
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
	
	location.href="nUpdate.no?ano="+ano+"&bname="+bname+"&ncontent="+ncontent +"&upbno="+upbno+"&page=${page}&nno="+nno;
}
function createReplyForm(index, upbno, replybno){
	/* if('${account.idtype}' == '관리자'){ */
	var division =  '.replyContent' + index;
	$(division).html(
			$(division).html()
			+"<textarea id='rereplyContent' class='ncontent' placeholder='대댓글을 입력하세요' name='rereplyContent' rows='6' cols='77' style='overflow-y:hidden' maxlength='150px'>" +
	    	  "</textarea>" +
			  "<br><button onclick='insertReply(2, "+ upbno + ", "+ replybno + ");'>답글등록</button>"
	);	
	$(division).children('#addreply').attr('disabled', true);
	$(division).children('#redact').attr('disabled', true);
/* 	}else{
		alert('답글은 오직 관리자만이 달 수 있습니다.');
	} */
	
}	

</script>
<div class="container">
		<div class="col-lg-4 col-md-0 col-sm-0 col-xs-0"></div>
		<div class=" col-lg-12 col-md-12 col-sm-12 col-xs-12">
			<div class="category">
				<p class="categoryName"><a class="nDetailCategory">&lt; ${n.bname} </a></p>
			</div>
		<br>
		<p class="title">&nbsp; &nbsp; ${n.ntitle}</p>
		
		<p class ="nInfo">
		<c:if test="${empty reply.pimage }"> <img class="nImage" src="/funfund/images/myinfo/dimages.png"></c:if>
			<c:if test="${!empty reply.pimage }"> <img class="nImage" src="${n.pimage}"></c:if>
		<span>${n.nickname}</span>
		<p></p>
		<span class="nDate">${n.ndate}</span>
		<br>
		</p>
			<div id="nDetailContent"> ${n.ncontent}</div>
			<div class="buttons">
				<c:if test="${account.ano eq n.ano }">
				<a href="goUpdateView.no?nno=${n.nno}&page=${page}">수정하기</a>
				<a href="nDelete.no?ntitle=${n.ntitle}&nno=${n.nno}&bname=${n.bname}&page=${page}">삭제하기</a></c:if>
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
			<textarea id="ncontent"  class='ncontent' name="ncontent" rows="6" cols="77" style="overflow-y:hidden" maxlength="150px" required ></textarea>
			<br>
			<button class="replyButton" onclick="insertReply(1, ${n.nno}, 0);">작성하기</button>
			<%-- </c:if> --%>
			<div id="replyList">
			<br><br>
			<c:forEach var="reply" items="${ nList}" varStatus="status">
			<div id="replyContent${status.index}" class="replyContent replyContent${status.index}">
				<c:if test="${reply.nreply_lev ==2 }">
				<div class='replylev2'>
				</c:if>
					<p>
					<c:if test="${empty reply.pimage }"> <img class="rImage" src="/funfund/images/myinfo/dimages.png"></c:if>
					<c:if test="${!empty reply.pimage }"> <img class="rImage" src="${reply.pimage}"></c:if>
					${reply.nickname}</p><br>
					<p class='rcontent' style="text-indent:50px;"> ${reply.ncontent}</p><br>
					<p>${reply.ndate}</p>
					<input type="hidden" name="nno"  value="${reply.nno}">
					<c:if test="${!empty account }">
					<c:if test="${!empty account && reply.nreply_lev == 1 }"> <!-- 관리자 확인 조건 account.idtype== '관리자' -->
					
					<button id='addreply' class="btn btn-default" onclick="createReplyForm(${status.index}, ${reply.upbno} ,${ reply.nno})">답글달기</button>
					</c:if>
					<button id='redact' class="btn btn-default" onclick="redactForm(${status.index}, ${ reply.nno}, ${reply.ano })" >댓글수정</button>
					<a class="btn btn-default" href="nDelete.no?nno=${reply.nno}&bname=${reply.bname}&upbno=${reply.upbno}&page=${page}" >댓글삭제</a>
					</c:if>
				<c:if test="${reply.nreply_lev ==2 }">
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
		</div>
</body>
</html>