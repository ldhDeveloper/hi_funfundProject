<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.titlebar {
	background: orange;
	text-align: center;
	align: center;
	padding: 20px;
	width: 100%;
	height: 450px;
}

.titlebar2 {
	background: #F9F7F5;
	padding: 20px;
	text-align: center;
	align:center;
	width: 100%;
}

.margin {
	margin: 10px;
	padding: 10px;
}

ul {
	list-style: none;
	align: center;
}

li {
	display: inline-block;
	align: center;
	float: left;
}

img {
	vertical-align: middle;
}

.background{
 background-color: #F9F7F5;
}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/menubar.jsp" flush="true" />
	<div class="titlebar">
		<div class="container">
			<div class="row">
				<!-- <div class="col-lg-12 col-md-12 col-sm-12 col-sm-12 titlebar">
				<h3>리워드</h3>
				<h5>펀펀의 리워드 상품들을 만나보세요!</h5>
				<br>
				<table align="center" border="1px" width="60%" padding="5px">
			    <tr><td rowspan="3" colspan="2"><img src="images/funding/1.PNG" style="width:100%; height:100%"></td>
			           <td><img src="images/funding/2.PNG" style="width:100%; height:100%;"></td></tr>
			    <tr><td><img src="images/funding/3.PNG" style="width:100%; height:100%;"></td></tr>
			    <tr><td><img src="images/funding/4.PNG" style="width:100%; height:100%;"></td></tr>
			    <tr><td height="30px" class="bar">HOT 프로젝트</td><td class="bar">더위야와라</td><td class="bar">가정의 달</td></tr>
			</table>
	    </div> -->

				<!-- 자동슬라이드로 만들어야함 -->
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
					<ul>
						<li><img src="/funfund/images/funding/1.PNG" class="img-responsive"></li>
						<li><img src="/funfund/images/funding/2.PNG" class="img-responsive"></li>
						<li><img src="/funfund/images/funding/3.PNG" class="img-responsive"></li>
						<li><img src="/funfund/images/funding/4.PNG" class="img-responsive"></li>
					</ul>
				</div>
			</div>
		</div>
	</div>

	<!-- 카테고리바 -->
	<div class="titlebar2">
		<div class="container"></div>
	</div>
	<div class="row"
		style="align: center; padding: 10px; background: white;">
		<div class="container">
			<div>
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
					<button class="btn btn-default">전체</button>
					<button class="btn btn-default">아이디어</button>
					<button class="btn btn-default">디자인</button>
					<button class="btn btn-default">패션/뷰티</button>
					<button class="btn btn-default">테크</button>
				</div>
			</div>
		</div>
	</div>


	<div class="background">
		<div class="container" style="clear: both">
			<div class="row">
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 margin"
					align="center">
					<img src="images/funding/" class="img-responsive"><br>
					<h2>idea</h2>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
					<div class="thumbnail" align="center">
						<a href="detail.do" target="_blank"> <img src="images/funding/"
							alt="사진1" style="width: 100%">
							<p>
								<span></span> % &nbsp;&nbsp; <span></span>원 달성 &nbsp;&nbsp; <span></span>
								일 남음
							</p>
							<div class="caption">
								<p>내용을쓰시오</p>
							</div>
						</a>
					</div>
				</div>
				<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
					<div class="thumbnail" align="center">
						<a href="" target="_blank"> <img src="images/funding/"
							alt="사진1" style="width: 100%">
							<p>
								<span></span> % &nbsp;&nbsp; <span></span>원 달성 &nbsp;&nbsp; <span></span>
								일 남음
							</p>
							<div class="caption">
								<p>내용쓰시오</p>
							</div>
						</a>
					</div>
				</div>
				<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
					<div class="thumbnail" align="center">
						<a href="" target="_blank"> <img src="images/funding/"
							alt="사진1" style="width: 100%">
							<p>
								<span></span> % &nbsp;&nbsp; <span></span>원 달성 &nbsp;&nbsp; <span></span>
								일 남음
							</p>
							<div class="caption">
								<p>내용쓰시오</p>
							</div>
						</a>
					</div>
				</div>
			</div>
		</div>

		<div class="container">
			<div class="row">
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 margin"
					align="center">
					<img src="images/funding/" class="img-responsive"><br>
					<h2>design</h2>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
					<div class="thumbnail" align="center">
						<a href="" target="_blank"> <img src="images/funding/"
							alt="사진1" style="width: 100%">
							<p>
								<span></span> % &nbsp;&nbsp; <span></span>원 달성 &nbsp;&nbsp; <span></span>
								일 남음
							</p>
							<div class="caption">
								<p>내용쓰시오</p>
							</div>
						</a>
					</div>
				</div>
				<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
					<div class="thumbnail" align="center">
						<a href="" target="_blank"> <img src="images/funding/"
							alt="사진1" style="width: 100%">
							<p>
								<span></span> % &nbsp;&nbsp; <span></span>원 달성 &nbsp;&nbsp; <span></span>
								일 남음
							</p>
							<div class="caption">
								<p>내용쓰시오</p>
							</div>
						</a>
					</div>
				</div>
				<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
					<div class="thumbnail" align="center">
						<a href="" target="_blank"> <img src="images/funding/"
							alt="사진1" style="width: 100%">
							<p>
								<span></span> % &nbsp;&nbsp; <span></span>원 달성 &nbsp;&nbsp; <span></span>
								일 남음
							</p>
							<div class="caption">
								<p>내용쓰시오</p>
							</div>
						</a>
					</div>
				</div>
			</div>
		</div>
		<div class="container">
			<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 margin"
				align="center">
				<img src="images/funding/" class="img-responsive"><br>
				<h2>fashion/beauty</h2>
			</div>
			<div class="row">
				<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
					<div class="thumbnail" align="center">
						<a href="" target="_blank"> <img src="images/funding/"
							alt="사진1" style="width: 100%">
							<p>
								<span></span> % &nbsp;&nbsp; <span></span>원 달성 &nbsp;&nbsp; <span></span>
								일 남음
							</p>
							<div class="caption">
								<p>내용쓰시오</p>
							</div>
						</a>
					</div>
				</div>
				<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
					<div class="thumbnail" align="center">
						<a href="" target="_blank"> <img src="images/funding/"
							alt="사진1" style="width: 100%">
							<p>
								<span></span> % &nbsp;&nbsp; <span></span>원 달성 &nbsp;&nbsp; <span></span>
								일 남음
							</p>
							<div class="caption">
								<p>내용쓰시오</p>
							</div>
						</a>
					</div>
				</div>
				<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
					<div class="thumbnail" align="center">
						<a href="" target="_blank"> <img src="images/funding/"
							alt="사진1" style="width: 100%">
							<p>
								<span></span> % &nbsp;&nbsp; <span></span>원 달성 &nbsp;&nbsp; <span></span>
								일 남음
							</p>
							<div class="caption">
								<p>내용쓰시오</p>
							</div>
						</a>
					</div>
				</div>
			</div>
		</div>

		<div class="container">
			<div class="row">
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 margin"
					align="center">
					<img src="images/funding/" class="img-responsive"><br>
					<h2>tech</h2>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
					<div class="thumbnail" align="center">
						<a href="" target="_blank"> <img src="images/funding/"
							alt="사진1" style="width: 100%">
							<p>
								<span></span> % &nbsp;&nbsp; <span></span>원 달성 &nbsp;&nbsp; <span></span>
								일 남음
							</p>
							<div class="caption">
								<p>내용쓰시오</p>
							</div>
						</a>
					</div>
				</div>
				<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
					<div class="thumbnail" align="center">
						<a href="" target="_blank"> <img src="images/funding/"
							alt="사진1" style="width: 100%">
							<p>
								<span></span> % &nbsp;&nbsp; <span></span>원 달성 &nbsp;&nbsp; <span></span>
								일 남음
							</p>
							<div class="caption">
								<p>내용쓰시오</p>
							</div>
						</a>
					</div>
				</div>
				<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
					<div class="thumbnail" align="center">
						<a href="" target="_blank"> <img src="images/funding/"
							alt="사진1" style="width: 100%">
							<p>
								<span></span> % &nbsp;&nbsp; <span></span>원 달성 &nbsp;&nbsp; <span></span>
								일 남음
							</p>
							<div class="caption">
								<p>내용쓰시오</p>
							</div>
						</a>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>