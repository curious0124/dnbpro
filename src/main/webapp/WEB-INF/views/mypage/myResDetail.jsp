<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<script src="${contextPath}/resources/js/jquery-3.5.1.min.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:set var="resList" value="${myRentList.res}" />
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
<style>
body{background-color: #F4F9FC;}
.table_top{margin-top: 30px; margin-bottom: 30px;}
td{text-align: center;}
</style>
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
								<li><a
									href="${contextPath}/mypage/myResDetail.do">Log</a></li>
							</ul>
						</div>
						<!-- Bread Title -->
						<div class="bread-title">
							<h2>Log</h2>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 상단 배너 -->
	<section class="features-area section-bg">
		<div class="bor container" id="">
			<div class="table_top row">
				<div class="col">
					<h4>반납/취소 내역</h4>
				</div>
			</div>
			<table class="table table-light table-hover align-middle">
				<thead class="table-light text-center">
					<tr>
						<td>예약번호</td>
						<td>장비시리얼번호</td>
						<td>모델명</td>
						<td>신청일</td>
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
									value="${myResList.resq_date}" /></td>
							<td><fmt:formatDate pattern="yyyy-MM-dd"
									value="${myResList.res_start}" /></td>
							<td><fmt:formatDate pattern="yyyy-MM-dd"
									value="${myResList.res_end}" /></td>
							<td>${myResList.res_Status}</td>
							<td><button class="Res btn-outline-success" value="예약취소" >예약취소</button><input
								type="hidden" value="${myResList.cate_name}"> <input
								type="hidden" value="${myResList.res_num}"></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</section>











	<%-- 	<div class=my_reserv_appling>

			<fieldset>
				<legend>예약중</legend>
				
				<table class=rent_table border=1px>
					<tr bgcolor=#ccc>
						<td>예약번호</td>
						<td>장비시리얼번호</td>
						<td>모델명</td>
						<td>신청일</td>
						<td>시작일</td>
						<td>반납일</td>
						<td>상태</td>
						<td>취소반납신청</td>

					</tr>
					<c:choose>
						<c:when test="${resList !=null }">
							<c:forEach var="myResList" items="${resList}"
								varStatus="myResListNum">

								<tr>
									<td>${myResListNum.count}</td>
									<td>${myResList.eq_serial}</td>
									<td>${myResList.eq_name}</td>
									<td><fmt:formatDate pattern="yyyy-MM-dd"
											value="${myResList.resq_date}" /></td>
									<td><fmt:formatDate pattern="yyyy-MM-dd"
											value="${myResList.res_start}" /></td>
									<td><fmt:formatDate pattern="yyyy-MM-dd"
											value="${myResList.res_end}" /></td>

									<td>${myResList.res_Status}</td>

									<td><input type="button" class="Res" value="예약취소" />
										<input type="hidden" value="${myResList.cate_name}"> 
										<input type="hidden" value="${myResList.res_num}"></td>

								</tr>

							</c:forEach>
						</c:when>
					</c:choose>
				</table>
			</fieldset>

		</div> --%>
	<form action="${contextPath}/mypage/cancelRes.do" id="ResForm"
		method="post">
		<input type="hidden" id="ResCate" name="ResCate" value="" /> <input
			type="hidden" id="Resnum" name="Resnum" value="" />
	</form>
</body>
</html>