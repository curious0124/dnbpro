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
					alert("신청이 완료되었습니다.")
				});
		
	});
</script>

<style>
.my_reserv_appling {
	border: 1px solid red;
}

.rent_area {
	float: right;
}

.rent_table {
	width: 100%;
}
</style>

<title>Insert title here</title>
<c:set var="resqList" value="${myRentList.resq}" />
<c:set var="resList" value="${myRentList.res}" />
<c:set var="retList" value="${myRentList.ret}" />
<c:set var="logList" value="${myRentList.log}" />

</head>
<body>


	<div class=my_reserv_total>
		<a class='cls1'
			href="${contextPath}/mypage/modmemberForm.do?user_id=${user_id}">내
			정보수정</a>
			<a class='cls1'
			href="${contextPath}/mypage/removeMember.do?user_id=${user_id}">회원탈퇴</a>
		<div class=my_reserv_apply>
			<form action="myResqDetail.do" method="post">
				<fieldset>
					<legend>예약신청</legend>
					<c:choose>
						<c:when test="${resqList !=null }">
							<div class=rent_area>
								<input type="submit" value=자세히보기> 
								<input type="hidden" name="user_id" value="${resqList[1].user_id}">
							</div>
							
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
										<td><input type="button" class="Resq" value="예약신청취소" /> <input
											type="hidden" value="${resqApplyList.cate_name}"> <input
											type="hidden" value="${resqApplyList.resq_num}"></td>


									</tr>
								</c:forEach>


							</table>
						</c:when>
					</c:choose>
				</fieldset>
			</form>
		</div>
		<div class=my_reserv_appling>

			<fieldset>
				<legend>예약중</legend>
				<form action="myResDetail.do" method="post">
					<div class=rent_area>
						<input type="submit" value=자세히보기> <input type="hidden"
							name="user_id" value="${resList[1].user_id}">
					</div>
				</form>
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

		</div>
		<div class=my_rent>
			<form action="myReturnDetail.do" method="post">
				<fieldset>
					<legend>대여중</legend>
					<div class=rent_area>
						<input type="submit" value=자세히보기> <input type="hidden"
							name="user_id" value="${retList[1].user_id}">
					</div>
					<table class=rent_table border=1px>
						<tr bgcolor=#ccc>
							<td>대여번호</td>
							<td>장비시리얼번호</td>
							<td>모델명</td>
							<td>신청일</td>
							<td>시작일</td>
							<td>반납일</td>
							<td>상태</td>
							<td>취소반납신청</td>
						</tr>
						<c:choose>
							<c:when test="${retList !=null }">
								<c:forEach var="myReturnList" items="${retList}"
									varStatus="myReturnListNum">
									<tr>
										<td>${myReturnListNum.count}</td>
										<td>${myReturnList.eq_serial}</td>
										<td>${myReturnList.eq_name}</td>
										<td><fmt:formatDate pattern="yyyy-MM-dd"
												value="${myReturnList.resq_date}" /></td>
										<td><fmt:formatDate pattern="yyyy-MM-dd"
												value="${myReturnList.res_start}" /></td>
										<td><fmt:formatDate pattern="yyyy-MM-dd"
												value="${myReturnList.res_end}" /></td>

										<td>${myReturnList.res_Status}</td>
										<td>
											<input type="button" class="Return" value="배송반납신청" />
											<input type="hidden" value="${myReturnList.cate_name}"> 
											<input type="hidden" value="${myReturnList.res_num}">
										</td>
									</tr>
								</c:forEach>
							</c:when>
						</c:choose>
					</table>

				</fieldset>
			</form>
		</div>
		<div class=my_rent_log>
			<form action="myLogDetail.do" method="post">
				<fieldset>
					<legend>반납 및 취소내역</legend>
					<div class=rent_area>
						<input type="submit" value=자세히보기> <input type="hidden"
							name="user_id" value="${logList[1].user_id}">
					</div>
					<table class=rent_table border=1px>
						<tr bgcolor=#ccc>
							<td>반납번호</td>
							<td>장비시리얼번호</td>
							<td>모델명</td>
							<td>신청일</td>
							<td>시작일</td>
							<td>반납일</td>
							<td>상태</td>
						</tr>
						<c:choose>
							<c:when test="${logList !=null }">
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
							</c:when>
						</c:choose>

					</table>

				</fieldset>
			</form>

		</div>
	</div>

	<form action="${contextPath}/mypage/cancelResq.do" id="ResqForm" method="post">
		<input type="hidden" id="ResqCate" name="ResqCate" value="" /> 
		<input type="hidden" id="Resqnum" name="Resqnum" value="" />
	</form>
	
	<form action="${contextPath}/mypage/cancelRes.do" id="ResForm" method="post">
		<input type="hidden" id="ResCate" name="ResCate" value="" /> 
		<input type="hidden" id="Resnum" name="Resnum" value="" />
	</form>
	
	<form action="${contextPath}/mypage/cancelReturn.do" id="ReturnForm" method="post">
		<input type="hidden" id="ReturnCate" name="ReturnCate" value="" /> 
		<input type="hidden" id="Returnnum" name="Returnnum" value="" />
		<input type="hidden" id="Expressnum" name="Expressnum" value="" />
	</form>

</body>
</html>