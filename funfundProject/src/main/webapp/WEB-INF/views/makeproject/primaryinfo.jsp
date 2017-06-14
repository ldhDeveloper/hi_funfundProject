<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.hi.funfund.common.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<!-- <link rel="stylesheet" href="/resources/demos/style.css"> -->
<!-- 편집기사용 -->

<!-- Include external CSS. -->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.4.0/css/font-awesome.min.css"
	rel="stylesheet" type="text/css" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.25.0/codemirror.min.css">
<link rel="stylesheet"
	href="/funfund/lib/font-awesome/font-awesome/css/font-awesome.css">
<!-- Include Editor style. -->
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/froala-editor/2.5.1/css/froala_editor.pkgd.min.css"
	rel="stylesheet" type="text/css" />
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/froala-editor/2.5.1/css/froala_style.min.css"
	rel="stylesheet" type="text/css" />
<link href="/funfund/lib/froala_editor_2.5.1/css/themes/royal.min.css"
	rel="stylesheet" type="text/css" />

<!-- <link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css"> -->
<!-- Include external JS libs. -->
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.25.0/codemirror.min.js"></script>
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.25.0/mode/xml/xml.min.js"></script>


<!-- 끝 -->

<style>
@font-face {
    font-family: myFirstFont;
    src: url('fonts/10X10.ttf');
    font-weight: bold;
}

body {
	font-family:myFirstFont;
	background: #f8f8f8 !important;
}

li {
	background: light-gray;
	border-radius: 5px;
}

.middle-submenu {
	width: 900px;
	margin-left: auto;
	margin-right: auto;
}

.active-active {
	background: orange;
	color: white;
}

.input-form {
	width: 900px;
	background: white;
	margin-left: auto;
	margin-right: auto;
	border: 1px solid gray;
	margin-top: 50px;
	padding: 20px;
	margin-left: auto;
}

#primary-info2, #primary-info3, #primary-info4, #primary-info5, #saveall
	{
	display: none;
}

#sortable {
	list-style-type: none;
	margin: 0;
	padding: 0;
	width: 450px;
}

#sortable li {
	margin: 3px 3px 3px 0;
	padding: 10px;
	float: left;
	width: 130px;
	height: 130px;
	font-size: 4em;
	text-align: center;
}

.wrap {
	width: 500px;
	height: auto;
	position: relative;
	display: inline-block;
}

.wrap textarea {
	resize: none;
	height: 60px;
	max-height: 60px;
	min-height: 60px;
}

.wrap span {
	position: absolute;
	bottom: 5px;
	right: 15px;
}

#counter {
	background: rgba(255, 0, 0, 0.5);
	border-radius: 0.5em;
	padding: 0 .5em 0 .5em;
	font-size: 0.75em;
}
.option-none{
	display:none;
}
.nav>li>a:active{
	background-color:orange;
}

</style>



<title>Insert title here</title>
</head>
<body oncontextmenu="return false">

	<jsp:include page="/WEB-INF/views/common/menubar.jsp" />
	
	<script>
		$(function() {
			$('li[id^=info]').click(function() {

				$('li[id^=info]').removeClass("active-active")

				$(this).addClass("active-active");
				$('div[id^=primary-info]').hide();
				$('#nextorsave').hide();
				$('#saveall').hide();

				var id = $(this).attr('id');
				var num = id.substr(id.length - 1, 1);

				var str = "#primary-info" + num;

				$('#nextorsave').val(num);

				$(str).show();

				if (num == 5) {
					$('#saveall').show();
				} else {
					$('#nextorsave').show();
				}
			});

			$('#nextorsave').click(function() {

				var page = Number($(this).val()) + 1;
				var str = "#primary-info" + page;
				var str2 = "#info" + page;
				console.log(page);

				$('#nextorsave').val(page);

				$('li[id^=info]').removeClass("active-active")
				$(str2).addClass("active-active");
				$('div[id^=primary-info]').hide();

				$('#nextorsave').hide();
				$('#saveall').hide();

				$(str).show();

				if (page == 5) {
					$('#saveall').show();
				} else {
					$('#nextorsave').show();
				}
			});
			$("#showpage").click(function(){
				var url = "preview.it?pro_no=${pro_no}";
				window.open(url, "", "");
			});
			
			$(".sendadmin").click(function(){
				var url = "updateStatus.it";
				var pro_no = ${pro_no};
				var pstatus = "승인요청";
				var itype = "<c:out value='${param.itype}'/>";
				$.ajax({
					url:url,
					data:{"pro_no":pro_no, "pstatus" : pstatus},
					success:function(){
						alert("검토 요청 완료!!");
						if(itype == 'donation'){
							document.location.href="newsponproject.ao";
						}else{
							document.location.href="newproject.ao";
						}
						
					}
				});
				
			});
		});
	</script>


	<br>
	<div class="middle-submenu" style="width:630px;">
		<ul class="nav nav-pills"
			style="width: 100%; align: center;">
			<li id="info1" class="active-active"><a href="#">기본정보</a></li>
			<li id="info2"><a href="#">리워드</a></li>
			<li id="info3"><a href="#">스토리</a></li>
			<li id="info4"><a href="#">메이커정보</a></li>
			<li id="info5"><a href="#">정산</a></li>
			<li id="showpage" style="margin-left: 20px;cursor:pointer;"><a> 미리보기</a></li>
			<li class="sendadmin" style="margin-left: 20px;"><a href="#">검토
					요청하기</a></li>
		</ul>
	</div>
	<script>
		$(function(){
			
			
			var pro_no = ${pro_no};
			var itype = "<c:out value='${param.itype}'/>";
			console.log("itype : " + itype);
			$.ajax({
				url:"selectone.it?pro_no=" + pro_no,
				success:function(data){
					console.log($(data));
					console.log("프로젝트명 : " + data.item.pname)
					if(data.item.pname != null){
						$('[name=pname]').val(data.item.pname);
					} 
					if(data.item.pcontent != null){
						$('[name=pcontent]').froalaEditor('html.set', data.item.pcontent);;
					} 
					if(data.item.category != null){
						$('[name=category]').val(data.item.category);
					}
					if(data.item.s_psdate != null){
						$('[name=s_psdate]').val(data.item.s_psdate);
					}
					if(data.item.s_pedate != null){
						$('[name=s_pedate]').val(data.item.s_pedate);
					}
					if(data.item.pshort != null){
						$('[name=pshort]').val(data.item.pshort);
					}
					if(data.item.ecost != 0){
						$('[name=ecost]').val(data.item.ecost);
					}
					if(data.item.refund != null){
						var refundarr = data.item.refund.split('^');
						$('[name=refund]').html("");
						for(var i = 0; i < refundarr.length; i++){
							$('[name=refund]').html($('[name=refund]').html() + refundarr[i] + "<br>");
						} 
						
						
					}
					if(data.item.pvideo != null){
						$('[name=pvideo]').val(data.item.pvideo);
					}
					if(data.item.checkacc == "인증됨"){
						$("#sbm-flag").attr("checked", "checked");
						$("#sbm-ok").show();
						$("#sbm-no").hide();
						$("#confirmacc").hide();
						$("#changeacc").show();
						$("[name=accpnm]").attr("readonly", "readonly");
						$("[name=accnum]").attr("readonly", "readonly");
						$("[name=bankcode]").not(":selected").attr("disabled", "disabled");

					
						if(data.item.bankcode != null){
							$('[name=bankcode]').val(data.item.bankcode);
						} 
						if(data.item.accpnm != null){
							$('[name=accpnm]').val(data.item.accpnm);
						} 
						if(data.item.accnum != null){
							$('[name=accnum]').val(data.item.accnum);
						} 
						
					}
					if(data.item.cname != null){
						$('[name=cname]').val(data.item.cname);
					}
					if(data.item.cs_email != null){
						$('[name=cs_email]').val(data.item.cs_email);
					} 
					if(data.item.cs_phone != null){
						$('[name=cs_phone]').val(data.item.cs_phone);
					} 
					if(data.images.thumbnail0 !=null){
						$('#titleimage').attr("src", "images/makeproject/titleimg/" + data.images.thumbnail0);
					}
					if(data.images.makerimg0 !=null){
						$('#makerprofileimage').attr("src", "images/makeproject/makerimg/" + data.images.makerimg0);
					}	
				} 
			});
			
			$("#changeacc").click(function(){
				$("#sbm-ok").hide();
				$("#sbm-no").show();
				$("#confirmacc").show();
				$("#changeacc").hide();
				$("[name=accpnm]").attr("readonly", false);
				$("[name=accnum]").attr("readonly", false);
				$("[name=bankcode]").not(":selected").attr("disabled", false);
				$("[name=accpnm]").val("");
				$("[name=accnum]").val("");
				$("[name=bankcode]").val("");
			});
			
			if(itype == 'donation'){
				$("[name=category]").find(".re-option").addClass("option-none");
				$("[name=category]").find(".do-option").removeClass("option-none");
				$(".do-option").attr("selected", "selected");
			}
			if(itype == 'reward'){
				$("[name=category]").find(".do-option").addClass("option-none");
				$("[name=category]").find(".re-option").removeClass("option-none");
			}
		});
	
	
	</script>
	


	<form id="frm" action="update.it?pro_no=${ pro_no }" method="post"
		onsubmit="return false;" enctype="multipart/form-data" name="frm">
		
		<input type="hidden" name="flag" value="false">
		<%-- <input type="hidden" name="pro_no" value="${pro_no }"> --%>
		<!-- 기본정보 입력 화면 -->
		<div id="primary-info1" class="input-form">
			<table>
				<tr style="width: 900px;">
					<td rowspan="2" style="width: 200px; font-size: 0.7em">펀펀드 안내
						가능 연락처<br>프로젝트와 관련된 중요 안내사항은 메이커님의 계정으로 등록된 인증된 이메일과 휴대폰번호로
						전달됩니다.<br>이메일 변경이나 인증이 필요하시면 회원정보설정에서 수정해주세요.
					</td>
					<td style="width: 500px;">
						<div
							style="width: 450px; border: 1px solid #ddd; height: 50px; background: #f8f8f8; margin-left: 10px; padding: 10px;">
							${ sessionScope.account.id }</div>
					</td>
					<td style="width: 200px;"></td>
				</tr>
				<tr>

					<td>
						<div
							style="width: 450px; border: 1px solid #ddd; height: 50px; background: #f8f8f8; margin-left: 10px; padding: 10px;">
							${ sessionScope.party.phone }</div>
					</td>
					<td></td>
				</tr>
				<tr>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td style="width: 200px; font-size: 0.7em">프로젝트의 제목<br>제목만
						보고도 어떤 프로젝트인지 알 수 있도록 직관적으로 작성해 주세요.
					</td>
					<td>
						<div
							style="width: 450px; border: 1px solid #ddd; height: 50px; background: #f8f8f8; margin-left: 10px; padding: 10px;">
							<input type="text" name="pname" size="52">
						</div>
					</td>
					<td></td>
				</tr>
				<tr>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td style="width: 200px; font-size: 0.7em">목표 금액<br>프로젝트를
						통해 모으고자 하는 금액을 적어 주세요.
					</td>
					<td>
						<div
							style="width: 450px; border: 1px solid #ddd; height: 50px; background: #f8f8f8; margin-left: 10px; padding: 10px;">
							<input type="text" name="ecost" size="48" style="text-align:right">&nbsp; 원
						</div>
					</td>
					<td></td>
				</tr>
				<tr>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td style="width: 200px; font-size: 0.7em">프로젝트 대표 이미지<br>프로젝트
						카드와 공유 이미지로 사용됩니다. 이미지 등록 가이드를 반드시 확인하고 이미지를 등록해주시기 바랍니다.
					</td>
					<td rowspan="10">
						<div
							style="width: 450px; border: 1px solid #ddd; height: 350px; background: #f8f8f8; margin-left: 10px; padding-left: 75px; padding-top: 30px; cursor: pointer;"
							onclick="document.all.uploadFile.click();">
							 <img
								id="titleimage" src="images/makeproject/camera.PNG"
								style="max-width: 300px; max-height: 200px; width: 300px; heigh: 200px;">
							<br> <br>
							<ul>
								<li>사이즈 : 가로 800px, 세로 600px</li>
								<li>용량 : 1 MB 미만</li>
								<li>텍스트 및 로고 삽입 금지</li>
							</ul>
						</div>
					</td>
					<td></td>
				</tr>
				<script>
					function LoadImg(value) {
						if (value.files && value.files[0]) {
							var reader = new FileReader();
							reader.onload = function(e) {
								$("#titleimage").attr("src", e.target.result);
							}
							reader.readAsDataURL(value.files[0]);
						}
					}
				</script>

				<tr>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
				</tr>

				<tr>
					<td style="width: 200px; font-size: 0.7em">카테고리<br>카테고리에
						따른 분류를 선택해주세요.
					</td>
					<td>
						<div
							style="width: 450px; border: 1px solid #ddd; height: 50px; background: #f8f8f8; margin-left: 10px; padding: 10px;">
							<select name="category">
								<option value="" class="re-option">선택하세요
								<option value="tech" class="re-option">테크
								<option value="beauty" class="re-option">패션/뷰티
								<option value="food" class="re-option">푸드
								<option value="design" class="re-option">디자인제품
								<option value="art" class="re-option">예술
								<option value="game" class="re-option">게임
								<option value="trip" class="re-option">여행
								<option value="sport" class="re-option">스포츠
								<option value="support" class="do-option option-none">후원
							</select>
						</div>
					</td>
					<td></td>
				</tr>
				<tr>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td style="width: 200px; font-size: 0.7em">프로젝트 시작일<br>프로젝트
						시작일을 입력해주세요. 평균 모금기간은 약 45일입니다.<br>오픈 후 수정 불가하니 신중하게 선택해주세요.
					</td>
					<td>
						<div
							style="width: 450px; border: 1px solid #ddd; height: 50px; background: #f8f8f8; margin-left: 10px; padding: 10px;">
							<input type="text" id="datepicker1" style="padding-left: 15px"
								name="s_psdate">
						</div>
					</td>
					<td></td>
				</tr>
				<tr>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td style="width: 200px; font-size: 0.7em">프로젝트 종료일<br>프로젝트
						종료일을 입력해주세요. 평균 모금기간은 약 45일입니다.<br>오픈 후 수정 불가하니 신중하게 선택해주세요.
					</td>
					<td>
						<div
							style="width: 450px; border: 1px solid #ddd; height: 50px; background: #f8f8f8; margin-left: 10px; padding: 10px;">
							<input type="text" id="datepicker2" style="padding-left: 15px"
								name="s_pedate">
							<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
							<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
							<script>
								$(function() {
									$("#datepicker1")
											.datepicker(
													{
														showOn : "button",
														buttonImage : "images/makeproject/calendar2.png",
														buttonImageOnly : true,
														buttonText : "Select date",
														altField : "#datepicker1",
														altFormat : "yy-mm-dd"
													});
									$("#datepicker2")
											.datepicker(
													{
														showOn : "button",
														buttonImage : "images/makeproject/calendar2.png",
														buttonImageOnly : true,
														buttonText : "Select date",
														altField : "#datepicker2",
														altFormat : "yy-mm-dd"
													});
								});
							</script>
						</div>
					</td>
					<td></td>
				</tr>
				<tr>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
				</tr>
			</table>

		</div>

		<!-- 리워드 입력화면 -->
		<div id="primary-info2" class="input-form">
			<table id="addTable" style="width: 900px;">
				<tr>
					<td colspan="3"><h3 align="center">등록된 리워드</h3>
						<div
							style="width: 860px; height: 250px; background: #f8f8f8; border: 1px solid #ddd; overflow: scroll;">
							<table class="table table-hover table-condensed"
								style="text-align: center;" id="rlist">
								<tr>
									<th>순서</th>
									<th>리워드명</th>
									<th>금액</th>
									<th>제한수량</th>
									<th>배송예정일</th>
									<th>수정/삭제</th>
								</tr>
							</table>
						</div></td>
				</tr>

				<tr>
					<td colspan="3">&nbsp;</td>
				</tr>
				<tr>
					<td style="width: 700px;">
						<div id="reward"
							style="width: 640px; background: #f8f8f8; border: 1px solid #ddd; padding: 10px;">
							<table style="width: 620px;" cellspacing="3">
								<tr>
									<td style="width: 150px;">리워드등록</td>
									<td style="width: 100px;">금액</td>
									<td style="width: 150px;"><input type="text" size="15"
										name="mcost"></td>
									<td style="width: 50px;">원</td>
									<td style="width: 20px;">&nbsp;</td>
									<td style="width: 120px;">정렬순서</td>
									<td><input type="text" size="5" value="1" name="mnum"></td>
								</tr>
								<tr>
									<td>&nbsp;</td>
									<td>리워드명</td>
									<td colspan="5"><input type="text" size="51" name="mname"></td>
								</tr>
								<tr>
									<td>&nbsp;</td>
									<td>상세설명</td>
									<td colspan="5"><textarea cols="44" rows="5"
											style="overflow: auto; width: 100%; resize: none"
											name="mcontent"></textarea></td>
								</tr>
								<tr>
									<td>&nbsp;</td>
									<td>제한수량</td>
									<td><input type="text" size="3" name="mcount"></td>
									<td>배송일</td>
									<td colspan="2"><input type="text" class="datepicker3" id="datepicker3"
										style="padding-left: 5px" name="s_mdate" size="11"> <!-- <script
											src="https://code.jquery.com/jquery-1.12.4.js"></script> <script
											src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script> -->
										<script>
											$(function() {
												$(".datepicker3")
														.datepicker(
																{
																	showOn : "button",
																	buttonImage : "images/makeproject/calendar2.png",
																	buttonImageOnly : true,
																	buttonText : "Select date",
																	altField : "#datepicker3",
																	altFormat : "yy-mm-dd"
																});
											});
										</script></td>
								</tr>
							</table>

						</div>
					</td>
					<td></td>
				</tr>

			</table>
			<br> <br>
			<div align="center">
				<button class="btn btn-warning" id="addReward">추가하기</button>
			</div>
			<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
			<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
			<script>
				$(function() {
					var pro_no = ${pro_no};
					var urladd = "selectfmenu.fm?pro_no=" + pro_no;
					$.ajax({
						url:urladd,
						success:function(data){
							
							console.log($(data));
							var length = data.fmenulist.length;
							
							for(var i = 0; i < length; i++){
								$("#rlist")
								.html(
										$(
												"#rlist")
												.html()
												+ "<tr><td>"
												+ data.fmenulist[i].mnum
												+ "</td><td>"
												+ data.fmenulist[i].mname
												+ "</td><td>"
												+ data.fmenulist[i].mcost
												+ "</td><td>"
												+ data.fmenulist[i].mcount
												+ "</td><td>"
												+ data.fmenulist[i].s_mdate
												+ "</td><td><button class='btn btn-xs btn-success'>수정</button>&nbsp; <button class='btn btn-xs btn-danger'>삭제</button></td></tr>")

							}
							
						}
					});
					
					$("#addReward")
							.click(
									function() {
										var pro_no = ${pro_no};

										console.log("pro_no : " + pro_no);

										var mname = $("[name=mname]").val();
										var mcost = $("[name=mcost]").val();
										var mnum = $("[name=mnum]").val();
										var s_mdate = $("[name=s_mdate]").val();
										var mcount = $("[name=mcount]").val();
										var mcontent = $("[name=mcontent]")
												.val();

										$
												.ajax({
													url : "insertReward.it",
													type : "POST",
													async : true,
													data : {
														"pro_no" : pro_no,
														"mname" : mname,
														"mcost" : mcost,
														"mnum" : mnum,
														"s_mdate" : s_mdate,
														"mcount" : mcount,
														"mcontent" : mcontent
													},
													success : function(data) {
														var i = Number(data.fmlist.length) - 1;
														console.log($(data));
														console
																.log(data.fmlist[i].mname);

														$("#rlist")
																.html(
																		$(
																				"#rlist")
																				.html()
																				+ "<tr><td>"
																				+ data.fmlist[i].mnum
																				+ "</td><td>"
																				+ data.fmlist[i].mname
																				+ "</td><td>"
																				+ data.fmlist[i].mcost
																				+ "</td><td>"
																				+ data.fmlist[i].mcount
																				+ "</td><td>"
																				+ data.fmlist[i].s_mdate
																				+ "</td><td><button class='btn btn-xs btn-success'>수정</button>&nbsp; <button class='btn btn-xs btn-danger'>삭제</button></td></tr>")

													}

												});
									});
				});
			</script>
		</div>

		<!-- 스토리 내용 입력 화면 -->
		<div id="primary-info3" class="input-form">
			<table style="width: 900px;">
				<tr>
					<td style="width: 200px; font-size: 0.7em;">영상 등록하기<br>프로젝트에
						우선 유튜브 혹은 비메오에 영상을 업로드해 주세요.<br>비메오는 해당 영상 URL을 바로 올려도 되지만
						유튜브의 경우, 해당 영상 페이지 하단의 공유(Share) 버튼을 클릭하면 나오는 짧은 링크를 등록해 주세요.
					</td>
					<td style="width: 500px;">
						<div
							style="width: 430px; height: 50px; background: #f8f8f8; border: 1px solid #ddd; padding: 10px; margin-left: 10px;">
							<input type="text" size="30" name="pvideo">
						</div>
					</td>
					<td style="width: 200px;"></td>
				</tr>
				<tr>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td style="width: 200px; font-size: 0.7em;">영상 대체 이미지<br>위
						영상을 등록하지 않는 경우, 프로젝트 주요 이미지를 등록해 주세요. 여러 장 등록하시면 슬라이드 형식으로 노출됩니다.
					</td>
					<td>
						<div
							style="width: 430px; min-height: 350px; background: #f8f8f8; border: 1px solid #ddd; padding: 10px; margin-left: 10px; font-size: 0.7em;">

							<div id=""
								style="width: 400px; min-height: 200px; border: 1px solid #ddd; background: #f8f8f8; cursor: pointer">
								<ul id="sortable">

								</ul>

							</div>
							<br style="clear: both">
							<div align="center">
								<button class="btn btn-primary btn-xs"
									style="margin-left: 10px;"
									onclick="document.all.slidefile.click();">사진찾기</button>
								&nbsp;
								<button class="btn btn-primary btn-xs"
									style="margin-left: 10px;" id="saveslideimgs">사진저장</button>
							</div>
							<br> 정렬이 바뀔 경우 하단 [저장> 버튼을 클릭하셔야만 변경된 순서가 반영됩니다.<br>(사이즈
							: 630x400 pixel, 용량 : 2MB, 형식 : jpg, jpeg, gif, png)
						</div>
					</td>
					<td style="width: 200px;"></td>
				</tr>
				<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
				<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
				<script>
					$(function() {
						var positions = "";

						$("#sortable").sortable({
							update : function(event, ui) {
								var order = $(this).sortable('toArray');
								positions = order.join(';');
								console.log(positions);
							}
						});
						$("#sortable").disableSelection();

						$("#saveslideimgs")
								.click(
										function() {
											var formData = new FormData();
											var pro_no = ${pro_no};
											console.log("pro_no" + pro_no);

											for (var i = 0; i < $("#slidefile")[0].files.length; i++) {
												formData
														.append(
																"slidefile["+ i + "]",
																$("#slidefile")[0].files[i]);
												console
														.log($("#slidefile")[0].files[i]);
											}
											console.log("전송" + positions);
											var url = "insertSlide.at?positions="+ positions+ "&pro_no="+ pro_no;
											$.ajax({
												type : 'post',
												url : url,
												data : formData,
												processData : false,
												contentType : false,
												success : function(html) {
													alert("파일 업로드하였습니다.");
												},
												error : function(error) {
													alert("파일 업로드에 실패하였습니다.");
													console.log(error);
													console.log(error.status);
												}
											});
										});
					});
					var j = 0;
					function LoadSlideImg(value) {

						/* if(value.files.length != 0){
							j = value.files.length + 1;
						} */

						for (var i = 0; i < value.files.length; i++) {

							if (value.files && value.files[i]) {
								var reader = new FileReader();
								reader.onload = function(e) {

									$("#sortable")
											.html(
													$("#sortable").html()
															+ "<li class='ui-state-default' id='" + j + "'>"
															+ "<img class='ui-state-default' style='max-width:110px;max-height:110px;min-width:110px;min-height:110px;' src='"
							 							+ e.target.result + "'></li>");
									console.log('index : ' + j);
									j++;
								}
								reader.readAsDataURL(value.files[i]);
							}

						}

					}
				</script>
				<tr>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td rowspan="3" style="width: 200px; font-size: 0.7em;">핵심메시지<br>참여자들이
						페이지를 열었을 때 가장 처음 보는 문장으로, 사람들이 이 문장을 읽고 “아~ 이게 어떤 프로젝트구나~” 라는 것을 알
						수 있도록 작성해주세요. 3줄 이하로 작성되면 좋겠습니다. 너무 길지 않게 적어주세요.
					</td>
					<td>
						<div class="wrap"
							style="width: 430px; height: 100px; background: #f8f8f8; border: 1px solid #ddd; padding: 10px; margin-left: 10px; font-size: 0.7em;">
							<textarea rows='3' style="width: 405px; resize: none"
								name="pshort" id="pshort" maxlength="200"></textarea>
							<span id="counter">###</span>
							<script>
								$(function() {
									$('#pshort')
											.keyup(
													function(e) {
														var content = $(this)
																.val();
														$(this)
																.height(
																		((content
																				.split('\n').length + 1) * 1.5)
																				+ 'em');
														$('#counter')
																.html(
																		content.length
																				+ '/200');
													});
									$('#pshort').keyup();

								});
							</script>
						</div>
					</td>
					<td style="width: 200px;"></td>
				</tr>
				<tr>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td colspan="3"><textarea id="froala-editor"
							style="width: 860px; max-height: 700px;" name="pcontent">
						
						</textarea> <!-- Include Editor JS files. --> <script type="text/javascript"
							src="https://cdnjs.cloudflare.com/ajax/libs/froala-editor/2.5.1//js/froala_editor.pkgd.min.js"></script>
						<script>
							$(function() {
								$('#froala-editor').froalaEditor(
										{
											theme : 'royal',
											zIndex : 2002,
											heightMin : 500,
											heightMax : 500,
											width : 855,
											toolbarBottom : false,
											toolbarButtons : [ 'fullscreen',
													'bold', 'italic',
													'underline',
													'strikeThrough',
													'subscript', 'superscript',
													'fontFamily', 'fontSize',
													'|', 'color', 'emoticons',
													'inlineStyle',
													'paragraphStyle', '|',
													'paragraphFormat', 'align',
													'formatOL', 'formatUL',
													'outdent', 'indent', '-',
													'insertLink',
													'insertImage',
													'insertVideo',
													'insertFile',
													'insertTable', '|',
													'quote', 'insertHR',
													'undo', 'redo',
													'clearFormatting',
													'selectAll', 'html' ]
										});
							});
						</script></td>
				</tr>
				<tr>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td colspan="2">
						<p style="font-size: 0.7em;">
							위험 요인과 해결방안<br> <br> 기본으로 입력되어 있는 내용 중 해당 프로젝트에 맞게 하단
							6가지를 수정해 주세요.<br> 1) 완제품이 아닌 리워드의 발송은 펀딩결과 및 시기에 따라 배송 지연이
							발생할 수 있다는 것에 대한 안내<br> 2) 리워드 발송이 1달 이내 지연될 경우, 서포터분들에게 공지할
							방법 (새소식, SMS 포함)<br> 3) 리워드 발송이 1달 이상 지연될 경우, 서포터분들에게 제공할
							혜택/서비스<br> 4) 약 1달 정도의 리워드 지연을 사유로 펀딩 취소(환불)이 불가한 것에 대한 안내<br>
							5) 리워드 발송이 *달 이상 지연 시, 100% 환불 가능한 것에 대한 안내 및 환불 신청한 메이커 연락처/이메일<br>
							6) 해당 프로젝트의 리워드 교환/반품/AS 정책<br>
						</p>
					</td>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td colspan="2" style="">
						<div
							style="width: 650px; height: 340px; padding: 15px; border: 1px solid #ddd; background: #f8f8f8;">
							<textarea
								style="overflow: auto; width: 100%; height: 310px; resize: none; width; font-size: 0.7em;"
								name="refund">
§업체명/메이커명§은 펀딩해주신 서포터분들께 감사의 표시인 리워드 제공 일정을 준수하기 위해 최선을 다할 것을 약속합니다.
단, 펀딩을 받아야만 생산을 시작할 수 있는 크라우드펀딩 특성 및 생산과정에서의 예상치못한 상황으로 인하여 리워드 제공일이 다소 지연될 수 있는 점을 알려 드립니다.

약속된 발송일 (yyyy-mm-dd)으로부터 1달 이내 (yyyy-mm-dd) 리워드 제공이 지연될 경우
-리워드 제공 지연이 예상되는 시점에 즉시 새소식과 SMS으로 변경된 리워드 제공일을 알려 드립니다.
-단, 리워드 제공 지연 사유로 인한 펀딩 취소는 불가합니다.

약속된 발송일 (yyyy-mm-dd)으로부터 1달 이상 (yyyy-mm-dd) 리워드 제공이 지연될 경우
-리워드 제공 지연이 예상되는 시점에 즉시 새소식과 SMS으로 변경된 리워드 제공일을 알려 드립니다.
-§리워드금액§에 해당하는 §리워드명§에 해당하는 추가 리워드를 함께 보내드립니다.
-예상보다 리워드 제공이 많이 지연되었으므로 §메이커 이메일주소§ 으로 신청해주신 서포터에 한해 펀딩하신 금액의 100%를 본인의 계좌로 환불해 드립니다.

해당 프로젝트의 교환/반품/AS 정책은 다음과 같습니다.
-펀딩 기간에는 자유롭게 마이페이지에서 펀딩 취소 가능하지만,
펀딩 기간 이후, 단순 변심으로 인한 교환이나 환불은 불가합니다.
-리워드 수령 **일 이내 제품 하자로 인한 교환/반품/AS는 §메이커 이메일주소§으로 신청 가능합니다.
								
							</textarea>
						</div>
					</td>
					<td>&nbsp;</td>
				</tr>
			</table>
		</div>

		<!-- 메이커 정보 입력 -->
		<div id="primary-info4" class="input-form">
			<p style="font-size: 0.7em;">* 아래에 입력한 모든 정보는 프로젝트 페이지에 노출되는
				정보이니, 서포터와의 소통과 응대가 가능한 정확한 정보를 입력해주세요.</p>
			<br> <br>
			<table style="width: 900px;">
				<tr>
					<td style="width: 200px; font-size: 0.7em;">프로젝트 메이커 이름(법인명)</td>
					<td style="width: 500px;">
						<div
							style="border: 1px solid #ddd; background: #f8f8f8; padding: 10px; margin-left: 10px; width: 440px; height: 50px;">
							<input type="text" size="43" name="cname">
						</div>
					</td>
					<td style="width: 200px;">&nbsp;</td>
				</tr>
				<tr>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td style="font-size: 0.7em;">프로젝트 메이커의 프로필 사진<br>참여자들에게
						프로젝트의 진정성을 표현하기 위해서 프로젝트 메이커의 사진을 공개합니다.
					</td>
					<td>
						<div
							style="border: 1px solid #ddd; background: #f8f8f8; padding: 10px; margin-left: 10px; width: 440px; height: 180px; padding-left: 160px;">
							 <img
								id="makerprofileimage" class="img-circle"
								src="images/myinfo/basic.png"
								style="min-width: 120px; min-height: 120px; width: 120px; heigh: 120px; cursor: pointer"
								onclick="document.all.uploadFile2.click();"> <br> <br>
							<ul style="font-size: 0.7em; margin-left: -70px;">
								<li>3 MB 이하의 사진만 사용할 수 있습니다.</li>
							</ul>
						</div>

					</td>
					<td>&nbsp;</td>
				</tr>
				<script>
					function LoadImg2(value) {
						if (value.files && value.files[0]) {
							var reader = new FileReader();
							reader.onload = function(e) {
								$("#makerprofileimage").attr("src",
										e.target.result);
							}
							reader.readAsDataURL(value.files[0]);
						}
					}
				</script>
				<tr>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td style="font-size: 0.7em;">메이커 이메일<br>서포터 문의 시 소통이
						가능하고, 프로젝트 페이지에 노출가능한 이메일을 입력해주세요.
					</td>
					<td>
						<div
							style="border: 1px solid #ddd; background: #f8f8f8; padding: 10px; margin-left: 10px; width: 440px; height: 50px;">
							<input type="text" size="25" name="cs_email">
						</div>
					</td>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td style="font-size: 0.7em;">메이커 전화번호<br>서포터 문의 시 실시간
						연락이 가능하고, 프로젝트 페이지에 노출가능한 대표번호를 입력해주세요.
					</td>
					<td>
						<div
							style="border: 1px solid #ddd; background: #f8f8f8; padding: 10px; margin-left: 10px; width: 440px; height: 50px;">
							<input type="text" size="25" name="cs_phone">
						</div>
					</td>
					<td>&nbsp;</td>
				</tr>
			</table>
		</div>
		</form>

		<!-- 정산 입력 화면 -->
		<div id="primary-info5" class="input-form">
			<table style="width: 900px;">
				<tr>
					<td style="width: 200px; font-size: 0.7em;">거래 은행 / 예금주</td>
					<td style="width: 500px;">
						<div
							style="border: 1px solid #ddd; background: #f8f8f8; padding: 10px; margin-left: 10px; width: 440px; height: 50px;">
							은행명 &nbsp; <select name="bankcode" id="bankcode">
								<option value=''>선택하세요
								<option value='003'>기업은행
								<option value='004'>국민은행
								<option value='011'>농협중앙회
								<option value='012'>단위농협
								<option value='020'>우리은행
								<option value='031'>대구은행
								<option value='005'>외환은행
								<option value='023'>SC제일은행
								<option value='032'>부산은행
								<option value='045'>새마을금고
								<option value='027'>한국씨티은행
								<option value='034'>광주은행
								<option value='039'>경남은행
								<option value='007'>수협
								<option value='048'>신협
								<option value='037'>전북은행
								<option value='035'>제주은행
								<option value='064'>산림조합
								<option value='071'>우체국
								<option value='081'>하나은행
								<option value='088'>신한은행
								<option value='209'>동양종금증권
								<option value='243'>한국투자증권
								<option value='240'>삼성증권
								<option value='230'>미래에셋
								<option value='247'>우리투자증권
								<option value='218'>현대증권
								<option value='266'>SK증권
								<option value='278'>신한금융투자
								<option value='262'>하이증권
								<option value='263'>HMC증권
								<option value='267'>대신증권
								<option value='270'>하나대투증권
								<option value='279'>동부증권
								<option value='280'>유진증권
								<option value='287'>메리츠증권
								<option value='291'>신영증권
								<option value='238'>대우증권
							</select> &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 예금주 &nbsp; <input type="text"
								size="10" name="accpnm" id="accpnm">
						</div>
					</td>
					<td style="width: 200px;">&nbsp;</td>
				</tr>
				<tr>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td style="font-size: 0.7em;">계좌번호<input type="hidden"></td>
					<td>
						<div
							style="border: 1px solid #ddd; background: #f8f8f8; padding: 10px; margin-left: 10px; width: 440px; height: 50px;">
							계좌번호 &nbsp;<input type="text" size="25"
								placeholder="'-'를 제외하고 입력하세요." name="accnum" id="accnum">
							&nbsp;
							<input type="checkbox" id="sbm-flag" name="checkacc" style="display:none">
							<label id="sbm-no" style="background:red;color:white;border-radius:3px;padding:3px;">미인증</label>
							<label id="sbm-ok" style="background:green;color:white;border-radius:3px;padding:3px;display:none">인증됨</label>
						</div>
						<div align="center">
						<br>
							<button class="btn btn-primary btn-xs" id="confirmacc"
								onclick="fnSearchAccessToken()">확인하기</button>
							<button class="btn btn-primary btn-xs" style="display:none" id="changeacc"
								onclick="">변경하기</button>
						</div>
						
					</td>
					<td>&nbsp;</td>
				</tr>
				<tr>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
					<td>&nbsp;</td>
				</tr>
			</table>
		</div>

	
	<br>
	<br>
	<div align="center">
		<button class="btn btn-warning" onclick="tempsave();">임시저장하기</button>
		
		<script>

			function tempsave() {
				var url = 'updateajax.it?pro_no=' + ${ pro_no } +"&flag='false'";
				
				var pname = $('[name=pname]').val();
				var pcontent = $('[name=pcontent]').val();
				var category = $('[name=category]').val();
				var s_psdate = $('[name=s_psdate]').val();
				var s_pedate = $('[name=s_pedate]').val();
				var pshort = $('[name=pshort]').val();
				var ecost = $('[name=ecost]').val();
				var refund = $('[name=refund]').val();
				var pvideo = $('[name=pvideo]').val();
				var cname = $('[name=cname]').val();
				var cs_email = $('[name=cs_email]').val();
				var cs_phone = $('[name=cs_phone]').val();
				console.log('오니?')
				console.log(refund);
				
				$.ajax({
					url : url,
					data: {"pname":pname, "pcontent":pcontent, "category":category, "s_psdate":s_psdate, "s_pedate":s_pedate, "pshort":pshort, "ecost":ecost, "refund":refund,
						"pvideo":pvideo, "cname":cname, "cs_email":cs_email, "cs_phone":cs_phone},
					success:function(){
						
						saveImg();
					}
				});
					
				
				
				function saveImg(){
					var url2 = 'updateimgajax.at?pro_no=' + ${ pro_no } +"&flag=false";
					var form = $('#ajaxfileform')[0];
	                var formData = new FormData(form); 
					/* formData.append("uploadFile", $("input[name=uploadFile]")[0].files[0]);
					formData.append("uploadFile", $("input[name=uploadFile]")[1].files[0]); */
					
					console.log($("[name=uploadFile]")[0].files[0]);
					
					$.ajax({
						url : url2,
						type : 'post',
						data : formData,
						processData : false,
			            contentType : false,
						success:function(){
							alert("임시저장 성공!!");
						}
					});	
				}
			}
		</script>
		&nbsp; &nbsp;
		<button id="nextorsave" class="btn btn-warning" value="1">다음단계로</button>
		<button id="saveall" class="btn btn-warning sendadmin">검토 요청하기</button>
	</div>
	<form id="fileForm" method="post" enctype="multipart/form-data"
		onsubmit="return false;">
		<input type="file" size="20" multiple="multiple" name="slidefile[]"
			id="slidefile" style="display: none;" onchange="LoadSlideImg(this);">
		<input type="hidden" name="pro_no" value="${ pro_no }">
	</form>
	<form id="ajaxfileform" method="post" enctype="multipart/form-data"
		onsubmit="return false;" name="ajaxfileform">
		<input id="titleimagefile" type="file" name="uploadFile"
								style="display: none;" onchange="LoadImg(this);">
		<input id="makerprofileimagefile" type="file" name="uploadFile2"
								style="display: none;" onchange="LoadImg2(this);">						
		<input type="hidden" name="pro_no" value="${ pro_no }">
	</form>

	<!-- 계좌본인인증 API -->
	

	<div>
		<table>

			<colgroup>
				<col style="width: 180px" />
				<col style="width: *" />
			</colgroup>
			<tbody>
				<form name="authCodeFrm" id="authCodeFrm" method="GET"
					action="https://testapi.open-platform.or.kr/oauth/2.0/authorize">
					<input type="hidden" id="response_type" name="response_type"
						value="code" /> <input type="hidden" id="scope" name="scope"
						value="inquiry" /> <input type="hidden" id="redirect_uri"
						name="redirect_uri"
						value="http://localhost:8090/openapi/test/callback.html" />
					<tr>
						<th>
							<!-- <span class="ess">Client ID</span> -->
						</th>
						<td><span><input type="hidden" id="client_id"
								name="client_id" style="width: 200px"
								value="l7xx6712d9c9cd524d3b9c3f0f60b2dea3ee"></span>
					</tr>
				</form>
				<tr>
					<th>
						<!-- <span>Client Secret</span> -->
					</th>
					<td><span><input type="hidden" id="client_secret"
							name="client_secret" style="width: 200px"
							value="10e3bd27aa5e4287ae709bca09c34ea7"></span></td>
				</tr>
				<tr>
					<th>
						<!-- <span>Access Token</span> -->
					</th>
					<td><span><input type="hidden" id="access_token"
							name="access_token" style="background: #e0e0e0"></span> <!-- <button type="button" onclick="fnSearchAccessToken()">토큰발급</button> --></td>
				</tr>
				<tr>
					<th>
						<!-- <span>은행코드</span> -->
					</th>
					<td><span><input type="hidden" class="txt"
							id="bank_code_std" name="bank_code_std"></span></td>
				</tr>
				<tr>
					<th>
						<!-- <span>계좌번호</span> -->
					</th>
					<td><span><input type="hidden" class="txt"
							id="account_num" name="account_num"></span></td>
				</tr>
				<tr>
					<th>
						<!-- <span>예금주 생년월일</span> -->
					</th>
					<td><span><input type="hidden" class="txt"
							id="account_holder_info" name="account_holder_info"
							value="850206" /></span>
				</tr>
				<tr>
					<th>
						<!-- <span>요청일시</span> -->
					</th>
					<td><span style="width: 200px"><input type="hidden"
							class="txt" id="tran_dtime" title="요청일시 입력" name="tran_dtime" /></span>
						<!-- <button type="button" onclick="fnSearchRealName()">계좌실명조회</button> --></td>
				</tr>
				<!-- <tr> 		
					<th><span>계좌실명조회결과</span></th>
					<td> 				
						<textarea style="height:220px;width:250px" id="real_name" name="real_name"></textarea>
					</td>
				</tr> -->
			</tbody>
		</table>

	</div>
	<!-- <script type="text/javascript" src='/funfund/lib/js/jquery-2.2.2.min.js'></script> -->
	<script type="text/javascript" src='/funfund/lib/js/system.js'></script>
	<script type="text/javascript" src='/funfund/lib/js/util.js'></script>
	<script type="text/javascript">
		$.support.cors = true;
		var currentTime = new Date().format("yyyyMMddHHmmss");
		$("#tran_dtime").val(currentTime);

		/* 사용자인증 Access Token 획득 */
		function fnSearchAccessToken() {
			$("#bank_code_std").val($("#bankcode").val());
			$("#account_num").val($("#accnum").val());
			var client_id = $("#client_id").val();
			var client_secret = $("#client_secret").val();
			var grant_type = "client_credentials";
			var scope = "oob";
			$.ajax({
				//url: "/tpt/test/getOauthToken",
				url : "https://testapi.open-platform.or.kr/oauth/2.0/token",
				type : "POST",
				//cache: false,
				contenType : "application/json",
				data : {
					"client_id" : client_id,
					"client_secret" : client_secret,
					"grant_type" : grant_type,
					"scope" : scope
				},
				dataType : "json",
				success : function(data, data2, data3) {
					var list = JSON.parse(data3.responseText);
					$("#access_token").val(list.access_token);
					$("#user_seq_no").val(list.user_seq_no);
					fnSearchRealName();
				},
				error : function(data, data2, data3) {
					alert('error!!!');
				}
			});

		}

		/* 계좌실명조회API */
		function fnSearchRealName() {
			var bank_code_std = $("#bank_code_std").val();
			var account_num = $("#account_num").val();
			var account_holder_info = $("#account_holder_info").val();
			var tran_dtime = $("#tran_dtime").val();

			var access_token = "Bearer " + $("#access_token").val();

			var resData = {
				"bank_code_std" : bank_code_std,
				"account_num" : account_num,
				"account_holder_info" : account_holder_info,
				"tran_dtime" : tran_dtime
			};

			$
					.ajax({
						url : "https://testapi.open-platform.or.kr/v1.0/inquiry/real_name",
						beforeSend : function(request) {
							request.setRequestHeader("Authorization",
									access_token);
						},
						type : "POST",
						data : JSON.stringify(resData),
						dataType : "json",
						success : function(data, data2, data3) {
							if (data.account_holder_name == $("#accpnm").val()) {
								
								$("#sbm-flag").attr("checked", true);
								$("#sbm-ok").show();
								$("#sbm-no").hide();
								var checkacc = "인증됨";
								var pro_no = ${pro_no};
								var bankcode = $('[name=bankcode]').val();
								var accpnm = $('[name=accpnm]').val();
								var accnum = $('[name=accnum]').val();
								
								$.ajax({
									url:"checkaccount.it",
									data:{"pro_no":pro_no, "checkacc":checkacc, "bankcode":bankcode, "accpnm":accpnm, "accnum":accnum},
									success:function(){
										alert('인증 성공!!!');
										$("#confirmacc").hide();
										$("#changeacc").show();
										$("#sbm-flag").attr("checked", true);
										$("#sbm-ok").show();
										$("#sbm-no").hide();
										$("[name=accpnm]").attr("readonly", "readonly");
										$("[name=accnum]").attr("readonly", "readonly");
										$("[name=bankcode]").not(":selected").attr("disabled", "disabled");
									}
								});
								
							} else {
								alert('인증 실패');
								$("#sbm-flag").attr("checked", false);
								$("#sbm-ok").hide();
								$("#sbm-no").show();
							}
						},
						error : function(data, data2, data3) {
							alert('error!!!');
						}
					});
		}
	</script>
	<jsp:include page="/WEB-INF/views/common/footer.jsp" flush="true"/>
</body>
</html>