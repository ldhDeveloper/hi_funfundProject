<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
<script type="text/javascript" src="/funfund/lib/js/jquery-3.2.1.min.js">
</script>
<link rel="canonical" href="https://github.com/froala/wysiwyg-editor/blob/master/js/languages/ko.js" data-pjax-transient>
  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.4.0/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.4.0/css/font-awesome.min.css"
	rel="stylesheet" type="text/css" />
<link rel="stylesheet"
 href="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.25.0/codemirror.min.css">
<link href="https://cdnjs.cloudflare.com/ajax/libs/froala-editor/2.6.0/css/froala_editor.pkgd.min.css"
 rel="stylesheet" type="text/css" />
<link href="https://cdnjs.cloudflare.com/ajax/libs/froala-editor/2.6.0/css/froala_style.min.css"
 rel="stylesheet" type="text/css" />
 <script>
$(function() {
	  $('textarea#froala-editor').froalaEditor({
		  theme: 'Royal',
		  heightMin : '900',
		  heightMax : '1500',
		  language : 'fr',
		  direction: 'ltr',
		  toolbarButtons : ['fullscreen', 
			  				'bold', 'italic', 'underline',
			  				'|', 'fontFamily', 'fontSize', 'color',
			  				'inlineStyle', 'paragraphStyle', '|',
			  				'paragraphFormat', 'align', 'formatOL',
			  				'formatUL', 'outdent', 'indent', 
			  				'-', 'insertLink', 'insertImage', 
			  				 'insertTable', '|',
			  				'specialCharacters', 'insertHR', 'selectAll',
			  				'clearFormatting', '|', 'print', 
			  				'html', '|', 'undo', 'redo']
	  });
	  $('#ntitle').focus();
	});
</script>
</head>
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
text-align: right;
}
.ntable {
width:800px;
margin:auto;

}

.ntable {
width : 800px; 
margin : auto;
font-weight:bold;
text-align:center;
font-size: 13px;
border: 1px solid #aaaaaa;
}
.column{
background : #ff9dff;
width: 70px;
height: 50px;
font-size: 20px;
}

.details{
width: 100%;
border : none;
height : 50px;
font-size : 20px;
}

.submit{
width: 100px !important;

}
.fr-element {
min-height : 500px !important;
}
.insertF {
border-style : outset;
border-bottom: none;
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
<form class="insertF" action="#" method="post" onsubmit="return false" >
<table class="ntable">
	<tr><td class="column">제목</td><td> 
<input class="details" id="ntitle" name="ntitle" required></td></tr>
	<tr><td class="column">이름</td><td><input id="writer"  class="details" value="${account.nickname}" readonly></td></tr>
		<tr><td colspan="2" class="insertContext"><textarea id="froala-editor" required>
		</textarea></td></tr>
</table>
<button class="btn btn-default" onclick="insertN()">작성</button>
</form> 
<div class = "down"></div>
<script>
function insertN(){

var ncontent =  $('textarea#froala-editor').froalaEditor('html.get');
var ano = ${account.ano};
var bname = '${bname}';
var page = ${page};
var ntitle = $('input[name=ntitle]').val();


 location.href = "nInsert.no?ano=${account.ano}&bname=${bname}&ntitle="+ntitle+"&ncontent="+ncontent+"&page=${page}";


	
}
</script>
<script type="text/javascript" src="/funfund/langs/ko.js">
 <script type="text/javascript"
  src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
  <script type="text/javascript" 
  src="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.25.0/codemirror.min.js">
  </script>
  <script type="text/javascript" 
  src="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.25.0/mode/xml/xml.min.js"></script>
  <script type="text/javascript" 
  src="https://cdnjs.cloudflare.com/ajax/libs/froala-editor/2.6.0//js/froala_editor.pkgd.min.js"></script>
 </div>
</div>
</div>
</body>
</html>