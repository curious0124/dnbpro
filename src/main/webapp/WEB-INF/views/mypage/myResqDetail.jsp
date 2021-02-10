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

</head>
<body>

	<div class=my_reserv_apply>
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
	</div>
	<form action="${contextPath}/mypage/cancelResq.do" id="ResqForm"
		method="post">
		<input type="hidden" id="ResqCate" name="ResqCate" value="" /> <input
			type="hidden" id="Resqnum" name="Resqnum" value="" />
	</form>

</body>
</html>