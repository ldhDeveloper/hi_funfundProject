<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
body {
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
	background: white; margin-left : auto;
	margin-right: auto;
	border: 1px solid gray;
	margin-top: 100px;
	padding: 20px;
	margin-left: auto;
}
</style>
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="/WEB-INF/views/common/menubar.jsp" />
	<br>
	<div class="middle-submenu">
		<ul class="nav nav-pills middle-submenu"
			style="width: 900px; align: center;">
			<li class="active-active"><a href="#">기본정보</a></li>
			<li><a href="#">리워드</a></li>
			<li><a href="#">스토리</a></li>
			<li><a href="#">메이커정보</a></li>
			<li><a href="#">정산</a></li>
			<li style="margin-left: 20px;"><a href="#">미리보기</a></li>
			<li style="margin-left: 20px;"><a href="#">검토 요청하기</a></li>
		</ul>
	</div>

	<div class="input-form">
		<table>
			<tr style="width: 900px;">
				<td rowspan="2" style="width: 200px; font-size: 0.7em">펀펀드 안내
					가능 연락처<br>프로젝트와 관련된 중요 안내사항은 메이커님의 계정으로 등록된 인증된 이메일과 휴대폰번호로
					전달됩니다.<br>이메일 변경이나 인증이 필요하시면 회원정보설정에서 수정해주세요.
				</td>
				<td style="width: 500px;">
					<div
						style="width: 450px; border: 1px solid #ddd; height: 40px; background: #f8f8f8; margin-left: 10px;">
						curryfavour9@gmail.com</div>
				</td>
				<td style="width: 200px;"></td>
			</tr>
			<tr>

				<td>
					<div
						style="width: 450px; border: 1px solid #ddd; height: 40px; background: #f8f8f8; margin-left: 10px;">
						010-7660-7771</div>
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
						style="width: 450px; border: 1px solid #ddd; height: 40px; background: #f8f8f8; margin-left: 10px;">
						<input type="text">
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
						style="width: 450px; border: 1px solid #ddd; height: 40px; background: #f8f8f8; margin-left: 10px;">
						<input type="text">원
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
						style="width: 450px; border: 1px solid #ddd; height: 350px; background: #f8f8f8; margin-left: 10px;">

					</div>
				</td>
				<td></td>
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
			</tr>
			<tr>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td style="width: 200px; font-size: 0.7em">메인해시태그<br>필수
					해시태그 검색어를 입력해주세요. 펀펀드 내 또는 검색엔진에서 검색이 용이하도록 하나의 단어로 등록 해주세요. 한글 9자
					또는 영어 18자로 제한되며, 빈칸이 포함되면 안됩니다.
				</td>
				<td>
					<div
						style="width: 450px; border: 1px solid #ddd; height: 100px; background: #f8f8f8; margin-left: 10px;">
						#<input type="text" placeholder="메인해시태그"><br>
						예시:숙면코창슬립닥, 빅이슈홈리스월드컵, 톤도JUMPUP,30km프로젝트, QueenBeeR
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
				<td style="width: 200px; font-size: 0.7em">
					프로젝트의 키워드<br>서포터에게 프로젝트 추천시 기준이 되는 관심사 키워드입니다. 개설하시는 프로젝트에 해당하는 키워드를 선택해주세요.( 최소 1개 이상 선택 )
				</td>
				<td>
					<div
						style="width: 450px; border: 1px solid #ddd; height: 200px; background: #f8f8f8; margin-left: 10px;">
						<select>
							<option value="">필수입력입니다</option>
							<option value="I000000001">얼리어답터</option>
							<option value="I000000002">IT</option>
							<option value="I000000003">재테크</option>
							<option value="I000000004">자동차</option>
							<option value="I000000005">여행/아웃도어</option>
							<option value="I000000006">건강/헬스케어</option>
							<option value="I000000007">스포츠</option>
							<option value="I000000008">게임/엔터테인먼트</option>
							<option value="I000000009">하이테크</option>
							<option value="I000000010">창업</option>
							<option value="I000000011">비상장주식</option>
							<option value="I000000012">소득공제</option>
							<option value="I000000013">라이프스타일</option>
							<option value="I000000014">패션</option>
							<option value="I000000015">디자인</option>
							<option value="I000000016">음악</option>
							<option value="I000000017">공연/전시</option>
							<option value="I000000018">책</option>
							<option value="I000000019">사회문제해결</option>
							<option value="I000000020">기부/나눔</option>
							<option value="I000000021">친환경</option>
							<option value="I000000022">공유경제</option>
							<option value="I000000023">교육/육아</option>
						</select>
						<select>
							<option value="">필수입력입니다</option>
							<option value="I000000001">얼리어답터</option>
							<option value="I000000002">IT</option>
							<option value="I000000003">재테크</option>
							<option value="I000000004">자동차</option>
							<option value="I000000005">여행/아웃도어</option>
							<option value="I000000006">건강/헬스케어</option>
							<option value="I000000007">스포츠</option>
							<option value="I000000008">게임/엔터테인먼트</option>
							<option value="I000000009">하이테크</option>
							<option value="I000000010">창업</option>
							<option value="I000000011">비상장주식</option>
							<option value="I000000012">소득공제</option>
							<option value="I000000013">라이프스타일</option>
							<option value="I000000014">패션</option>
							<option value="I000000015">디자인</option>
							<option value="I000000016">음악</option>
							<option value="I000000017">공연/전시</option>
							<option value="I000000018">책</option>
							<option value="I000000019">사회문제해결</option>
							<option value="I000000020">기부/나눔</option>
							<option value="I000000021">친환경</option>
							<option value="I000000022">공유경제</option>
							<option value="I000000023">교육/육아</option>
						</select>
						<select>
							<option value="">필수입력입니다</option>
							<option value="I000000001">얼리어답터</option>
							<option value="I000000002">IT</option>
							<option value="I000000003">재테크</option>
							<option value="I000000004">자동차</option>
							<option value="I000000005">여행/아웃도어</option>
							<option value="I000000006">건강/헬스케어</option>
							<option value="I000000007">스포츠</option>
							<option value="I000000008">게임/엔터테인먼트</option>
							<option value="I000000009">하이테크</option>
							<option value="I000000010">창업</option>
							<option value="I000000011">비상장주식</option>
							<option value="I000000012">소득공제</option>
							<option value="I000000013">라이프스타일</option>
							<option value="I000000014">패션</option>
							<option value="I000000015">디자인</option>
							<option value="I000000016">음악</option>
							<option value="I000000017">공연/전시</option>
							<option value="I000000018">책</option>
							<option value="I000000019">사회문제해결</option>
							<option value="I000000020">기부/나눔</option>
							<option value="I000000021">친환경</option>
							<option value="I000000022">공유경제</option>
							<option value="I000000023">교육/육아</option>
						</select>
					</div>
				</td>
				<td></td>
			</tr>
		</table>
	</div>
	<br>
	<br>
	<div align="center">
		<button class="btn btn-warning">임시저장하기</button>
		&nbsp; &nbsp;
		<button class="btn btn-warning">다음단계로</button>
	</div>


</body>
</html>