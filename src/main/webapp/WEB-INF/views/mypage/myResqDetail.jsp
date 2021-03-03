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
<c:set var="resqlist" value="${myRentList.resq}" />
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
<title>Insert title here</title>
<style>
		.rent_table {
			width: 100%;
		}
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
					<td>예약신청번호</td>
					<td>장비시리얼번호</td>
					<td>모델명</td>
					<td>신청일</td>
					<td>시작일</td>
					<td>반납일</td>
					<td>상태</td>
					<td>취소반납신청</td>
					</tr>
				</thead>
				<tbody>
						<c:forEach var="resq" items="${resqlist}" varStatus="resqNum">
							<tr>
								<td>${resqNum.count}</td>
								<td>${resq.eq_serial}</td>
								<td>${resq.eq_name}</td>
								<td><fmt:formatDate pattern="yyyy-MM-dd"
										value="${resq.resq_date}" /></td>
								<td><fmt:formatDate pattern="yyyy-MM-dd"
										value="${resq.resq_start}" /></td>
								<td><fmt:formatDate pattern="yyyy-MM-dd"
										value="${resq.resq_end}" /></td>
								<td>예약신청</td>
								<td>
									<button class="Resq btn-outline-success" value="예약신청취소" >예약신청 취소</button>
									<input type="hidden" value="${resq.cate_name}"> 
									<input type="hidden" value="${resq.resq_num}">
								</td>
							</tr>
						</c:forEach>
				</tbody>
			</table>
		</div>
	</section>
	
	
	

<%-- 	<div class=my_reserv_apply>
		<fieldset>
			<legend>예약신청</legend>

			<table class=rent_table border=1px>
				<tr bgcolor=#ccc>
					<td>예약신청번호</td>
					<td>장비시리얼번호</td>
					<td>모델명</td>
					<td>신청일</td>
					<td>시작일</td>
					<td>반납일</td>
					<td>상태</td>
					<td>취소반납신청</td>

				</tr>

				<c:choose>
					<c:when test="${resqlist !=null }">
						<c:forEach var="resq" items="${resqlist}" varStatus="resqNum">
							<tr>
								<td>${resqNum.count}</td>
								<td>${resq.eq_serial}</td>
								<td>${resq.eq_name}</td>
								<td><fmt:formatDate pattern="yyyy-MM-dd"
										value="${resq.resq_date}" /></td>
								<td><fmt:formatDate pattern="yyyy-MM-dd"
										value="${resq.resq_start}" /></td>
								<td><fmt:formatDate pattern="yyyy-MM-dd"
										value="${resq.resq_end}" /></td>
								<td>예약신청</td>
								<td>
									<input type="button" class="Resq" value="예약신청취소" /> 
									<input type="hidden" value="${resq.cate_name}"> 
									<input type="hidden" value="${resq.resq_num}">
								</td>
							</tr>
						</c:forEach>
					</c:when>
				</c:choose>
			</table>

		</fieldset>
	</div> --%>
	<form action="${contextPath}/mypage/cancelResq.do" id="ResqForm"
		method="post">
		<input type="hidden" id="ResqCate" name="ResqCate" value="" /> <input
			type="hidden" id="Resqnum" name="Resqnum" value="" />
	</form>

</body>
</html>