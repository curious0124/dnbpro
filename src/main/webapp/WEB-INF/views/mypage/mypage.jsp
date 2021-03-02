<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>


<html>
<head>
<script src="${contextPath}/resources/js/jquery-3.5.1.min.js">
	
</script>
<meta charset="UTF-8">

<script>
	$(function() {

		$(".Resq").click(
				function() {
					var answer = confirm("예약신청을 취소하시겠습니까?");
					if (answer == true) {

						var cate_name = $(this).parent().find(
								"input:nth-child(2)").val();
						var resq_num = $(this).parent().find(
								"input:nth-child(3)").val();

						console.log(cate_name);
						console.log(resq_num);

						$("#ResqCate").val(cate_name);
						$("#Resqnum").val(resq_num);

						$("#ResqForm").submit();
					}
				});

	});
</script>

<script>
	$(function() {

		$(".Res").click(
				function() {
					var answer = confirm("예약을 취소하시겠습니까?");
					if (answer == true) {

						var cate_name = $(this).parent().find(
								"input:nth-child(2)").val();
						var res_num = $(this).parent().find(
								"input:nth-child(3)").val();

						console.log(cate_name);
						console.log(res_num);

						$("#ResCate").val(cate_name);
						$("#Resnum").val(res_num);

						$("#ResForm").submit();
					}
				});

	});
</script>
<script>
	$(function() {

		$(".Return").click(
				function() {

					var result = prompt("운송장 번호를 입력하세요", "0000-0000-0000");
					if (result != null && result.length != 0
							&& result != "0000-0000-0000") {
						var cate_name = $(this).parent().find(
								"input:nth-child(2)").val();
						var res_num = $(this).parent().find(
								"input:nth-child(3)").val();

						console.log(cate_name);
						console.log(res_num);
						console.log(result);

						$("#ReturnCate").val(cate_name);
						$("#Returnnum").val(res_num);
						$("#Expressnum").val(result);

						$("#ReturnForm").submit();
						alert("배송반납신청이 완료되었습니다.");
					} else {
						alert("배송반납신청이 취소되었습니다.");
					}
				});

	});
</script>

<style>
body {
	background-color: #F4F9FC;
}

td {
	text-align: center;
}

.table_top {
	margin-top: 30px;
	margin-bottom: 30px;
}

.bor {
	border: 2px dashed #bcbcbc;
	margin-bottom: 50px;
}
</style>

<title>Insert title here</title>
<c:set var="resqList" value="${myRentList.resq}" />
<c:set var="resList" value="${myRentList.res}" />
<c:set var="retList" value="${myRentList.ret}" />
<c:set var="logList" value="${myRentList.log}" />

</head>
<body>
	<!-- 상단 배너 -->
	<div class="breadcrumbs overlay"
		style="background-image:url('${contextPath}/resources/image/page_banner.jpg')">
		<div class="container">
			<div class="row">
				<div class="col-12">
					<div class="bread-inner">
						<!-- Bread Menu -->
						<div class="bread-menu">
							<ul>
								<li><a href="${contextPath}/main/main.do">Home</a></li>
								<li><a href="${contextPath}/mypage/mypage.do">MyPage</a></li>
							</ul>
						</div>
						<!-- Bread Title -->
						<div class="bread-title">
							<h2>Reservation</h2>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 상단 배너 -->
	<section class="features-area section-bg">
		<div class="container" id="mypage_all_container">
			<center>
				<div class="btn-group" role="group"
					aria-label="Basic mixed styles">
					<button type="button"
						onclick="location.href='${contextPath}/mypage/mypage.do' "
						class="btn btn-outline-danger">예약 내역</button>
					<button type="button"
						onclick="location.href='${contextPath}/mypage/modmemberForm.do?user_id=${user_id}' "
						class="btn btn-outline-dark">내정보 수정</button>
					<button type="button"
						onclick="location.href='${contextPath}/mypage/removeMember.do?user_id=${user_id}' "
						class="btn btn-outline-danger">회원 탈퇴</button>
				</div>
			</center>
		</div>
	</section>
	<!-- 수정 한 테이블 -->
	<section class="features-area section-bg">
		<div class="container" id="mypage_all_container">
			<div class="bor container" id="">
				<div class="table_top row">
					<div class="col">
						<h4>예약 신청</h4>
					</div>
					<div class="col">
						<form action="myResqDetail.do" method="post">
							<div class="d-grid gap-2 d-md-flex justify-content-md-end">
								<button type="submit" class="btn btn-outline-secondary"
									value=자세히보기>자세히 보기</button>
								<input type="hidden" name="user_id"
									value="${resqList[1].user_id}">
							</div>
						</form>
					</div>
				</div>
				<table class="table table-light table-hover align-middle">
					<thead class="table-light text-center">
						<tr>
							<th>예약 신청 번호</th>
							<th>장비 시리얼 번호</th>
							<th>모델명</th>
							<th>신청일</th>
							<th>시작일</th>
							<th>반납일</th>
							<th>상태</th>
							<th>취소/반납 신청</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="resqApplyList" items="${resqList}"
							varStatus="resqApplyListNum">
							<tr>
								<td>${resqApplyListNum.count}</td>
								<td>${resqApplyList.eq_serial}</td>
								<td>${resqApplyList.eq_name}</td>
								<td><fmt:formatDate pattern="yyyy-MM-dd"
										value="${resqApplyList.resq_date}" /></td>
								<td><fmt:formatDate pattern="yyyy-MM-dd"
										value="${resqApplyList.resq_start}" /></td>
								<td><fmt:formatDate pattern="yyyy-MM-dd"
										value="${resqApplyList.resq_end}" /></td>
								<td>예약신청</td>
								<td><button class="Resq btn-outline-success" value="예약신청취소">예약신청취소</button>
									<input type="hidden" value="${resqApplyList.cate_name}">
									<input type="hidden" value="${resqApplyList.resq_num}"></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>

			</div>
			<!-- 예약 신청 테이블 -->
			<!-- 예약 중 테이블 -->
			<div class="bor container" id="">
				<div class="table_top row">
					<div class="col">
						<h4>예약중</h4>
					</div>
					<div class="col">
						<form action="myResDetail.do" method="post">
							<div class="d-grid gap-2 d-md-flex justify-content-md-end">
								<button type="submit" class="btn btn-outline-secondary"
									" value=자세히보기>자세히 보기</button>
								<input type="hidden" name="user_id"
									value="${resList[1].user_id}">
							</div>
						</form>
					</div>

				</div>
				<table class="table table-light table-hover align-middle">
					<thead class="table-light text-center">
						<tr>
							<td>예약번호</td>
							<td>장비시리얼번호</td>
							<td>모델명</td>
							<td>시작일</td>
							<td>반납일</td>
							<td>상태</td>
							<td>취소/반납 신청</td>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="myResList" items="${resList}"
							varStatus="myResListNum">
							<tr>
								<td>${myResListNum.count}</td>
								<td>${myResList.eq_serial}</td>
								<td>${myResList.eq_name}</td>
								<td><fmt:formatDate pattern="yyyy-MM-dd"
										value="${myResList.res_start}" /></td>
								<td><fmt:formatDate pattern="yyyy-MM-dd"
										value="${myResList.res_end}" /></td>
								<td>${myResList.res_Status}</td>
								<td><button class="Res btn-outline-success" value="예약 취소">예약
										취소</button>
									<input type="hidden" value="${myResList.cate_name}"> <input
									type="hidden" value="${myResList.res_num}"></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>

			</div>
			<div class="bor container" id="">
				<div class="table_top row">
					<div class="col">
						<h4>대여중</h4>
					</div>
					<div class="col">
						<form action="myReturnDetail.do" method="post">
							<div class="d-grid gap-2 d-md-flex justify-content-md-end">
								<button type="submit" class="btn btn-outline-secondary"
									" value=자세히보기>자세히 보기</button>
								<input type="hidden" name="user_id"
									value="${retList[1].user_id}">
							</div>
						</form>
					</div>
				</div>
				<table class="table table-light table-hover align-middle">
					<thead class="table-light text-center">
						<tr>
							<td>대여번호</td>
							<td>장비시리얼번호</td>
							<td>모델명</td>
							<td>시작일</td>
							<td>반납일</td>
							<td>상태</td>
							<td>취소/반납 신청</td>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="myReturnList" items="${retList}"
							varStatus="myReturnListNum">
							<tr>
								<td>${myReturnListNum.count}</td>
								<td>${myReturnList.eq_serial}</td>
								<td>${myReturnList.eq_name}</td>
								<td><fmt:formatDate pattern="yyyy-MM-dd"
										value="${myReturnList.res_start}" /></td>
								<td><fmt:formatDate pattern="yyyy-MM-dd"
										value="${myReturnList.res_end}" /></td>

								<td>${myReturnList.res_Status}</td>
								<td><button class="Return btn-outline-success"
										value="배송반납 신청">배송반납 신청</button> <input type="hidden"
									value="${myReturnList.cate_name}"> <input type="hidden"
									value="${myReturnList.res_num}"></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>

			</div>
			<div class="bor container" id="">
				<div class="table_top row">
					<div class="col">
						<h4>반납/취소 내역</h4>
					</div>
					<div class="col">
						<form action="myLogDetail.do" method="post">
							<div class="d-grid gap-2 d-md-flex justify-content-md-end">
								<button type="submit" class="btn btn-outline-secondary"
									value=자세히보기>자세히 보기</button>
								<input type="hidden" name="user_id"
									value="${logList[1].user_id}">
							</div>
						</form>
					</div>
				</div>
				<table class="table table-light table-hover align-middle">
					<thead class="table-light text-center">
						<tr>
							<td>반납번호</td>
							<td>장비시리얼번호</td>
							<td>모델명</td>
							<td>신청일</td>
							<td>시작일</td>
							<td>반납일</td>
							<td>상태</td>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="myLogList" items="${logList}"
							varStatus="myLogListNum">
							<tr>
								<td>${myLogListNum.count}</td>
								<td>${myLogList.eq_serial}</td>
								<td>${myLogList.eq_name}</td>
								<td><fmt:formatDate pattern="yyyy-MM-dd"
										value="${myLogList.log_date}" /></td>
								<td><fmt:formatDate pattern="yyyy-MM-dd"
										value="${myLogList.res_start}" /></td>
								<td><fmt:formatDate pattern="yyyy-MM-dd"
										value="${myLogList.res_end}" /></td>
								<td>${myLogList.status}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>

			</div>
			<!-- 예약 중 테이블 -->
		</div>
	</section>
	<!-- 수정 한 테이블 -->




	<form action="${contextPath}/mypage/cancelResq.do" id="ResqForm"
		method="post">
		<input type="hidden" id="ResqCate" name="ResqCate" value="" /> <input
			type="hidden" id="Resqnum" name="Resqnum" value="" />
	</form>

	<form action="${contextPath}/mypage/cancelRes.do" id="ResForm"
		method="post">
		<input type="hidden" id="ResCate" name="ResCate" value="" /> <input
			type="hidden" id="Resnum" name="Resnum" value="" />
	</form>

	<form action="${contextPath}/mypage/cancelReturn.do" id="ReturnForm"
		method="post">
		<input type="hidden" id="ReturnCate" name="ReturnCate" value="" /> <input
			type="hidden" id="Returnnum" name="Returnnum" value="" /> <input
			type="hidden" id="Expressnum" name="Expressnum" value="" />
	</form>

</body>
</html>