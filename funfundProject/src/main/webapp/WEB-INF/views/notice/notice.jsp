<jsp:directive.page  language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"/>
<!DOCTYPE html >
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.4.js"></script> <!-- 아임포트 본인 인증 -->
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
background-repeat-y: ;
background-size: auto;
border-bottom-color:rgb(0, 204, 163);
border-bottom-style:solid;
border-bottom-width:1.11111px;
border-image-outset:0px;
border-image-repeat:stretch;
border-image-slice:100%;
border-image-source:none;
border-image-width:1;
border-left-color:rgb(0, 204, 163);
border-left-style:solid;
border-left-width:1.11111px;
border-right-color:rgb(0, 204, 163);
border-right-style:solid;
border-right-width:1.11111px;
border-top-color:rgb(0, 204, 163);
border-top-style:solid;
border-top-width:1.11111px;
background-color:rgb(0, 204, 163);
font-size:15px;
}
</style>

 <script>function pay(){
		IMP.init("imp79484327");
    IMP.request_pay({
        pg : 'inicis',
        pay_method : 'card',
        merchant_uid : 'merchant_' + new Date().getTime(),
        name : '주문명:결제테스트',
        amount : 14000,
        buyer_email : 'iamport@siot.do',
        buyer_name : '구매자이름',
        buyer_tel : '010-1234-5678',
        buyer_addr : '서울특별시 강남구 삼성동',
        buyer_postcode : '123-456'
        
    }, function(rsp) {
        if ( rsp.success ) {
        	//[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
        	jQuery.ajax({
        		url: "/payments/complete", //cross-domain error가 발생하지 않도록 동일한 도메인으로 전송
        		type: 'POST',
        		dataType: 'json',
        		data: {
    	    		imp_uid : rsp.imp_uid
    	    		//기타 필요한 데이터가 있으면 추가 전달
        		}
        	}).done(function(data) {
        		//[2] 서버에서 REST API로 결제정보확인 및 서비스루틴이 정상적인 경우
        		if ( everythings_fine ) {
        			var msg = '결제가 완료되었습니다.';
        			msg += '\n고유ID : ' + rsp.imp_uid;
        			msg += '\n상점 거래ID : ' + rsp.merchant_uid;
        			msg += '\결제 금액 : ' + rsp.paid_amount;
        			msg += '카드 승인번호 : ' + rsp.apply_num;
        			
        			alert(msg);
        		} else {
        			//[3] 아직 제대로 결제가 되지 않았습니다.
        			//[4] 결제된 금액이 요청한 금액과 달라 결제를 자동취소처리하였습니다.
        		}
        	});
        } else {
            var msg = '결제에 실패하였습니다.';
            msg += '에러내용 : ' + rsp.error_msg;
            
            alert(msg);
        }
    });}</script>
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
 <button onclick="pay();">결제</button>
</div>
</div>
</div>
</div>
</body>
</html>