<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
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
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:set var="resqList" value="${myRentList.resq}" />
<c:set var="resList" value="${myRentList.res}" />
<c:set var="retList" value="${myRentList.ret}" />
<c:set var="logList" value="${myRentList.log}" />

</head>
<body>

	
		<div class=my_reserv_total>

			<div class=my_reserv_apply>
				<form action="myResqDetail.do" method="post">
				<fieldset>
					<legend>예약신청</legend>
					<c:choose>
						<c:when test="${resqList !=null }">
							<div class=rent_area>
								<input type="submit" value=자세히보기>
								<input type="hidden" name="user_id" value="${resqList[0].user_id}">
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

									</tr>
								</c:forEach>


							</table>
						</c:when>
					</c:choose>
				</fieldset>
				</form>
			</div>

			<div></div>
			<div class=my_reserv_appling>
			<form action="myResDetail.do" method="post">
				<fieldset>
					<legend>예약중</legend>
					<div class=rent_area>
						<input type="submit" value=자세히보기>
						<input type="hidden" name="user_id" value="${resList[0].user_id}">
					</div>
					<table class=rent_table border=1px>
						<tr bgcolor=#ccc>
							<td>예약번호</td>
							<td>장비시리얼번호</td>
							<td>모델명</td>
							<td>신청일</td>
							<td>시작일</td>
							<td>반납일</td>
							<td>상태</td>
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

									</tr>
								</c:forEach>
							</c:when>
						</c:choose>
					</table>

				</fieldset>
				</form>
			</div>
			<div class=my_rent>
			<form action="myReturnDetail.do" method="post">
				<fieldset>
					<legend>대여중</legend>
					<div class=rent_area>
						<input type="submit" value=자세히보기>
						<input type="hidden" name="user_id" value="${retList[0].user_id}">
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
						<input type="submit" value=자세히보기>
						<input type="hidden" name="user_id" value="${logList[0].user_id}">
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
												value="${myLogList.return_date}" /></td>
										<td><fmt:formatDate pattern="yyyy-MM-dd"
												value="${myLogList.res_start}" /></td>
										<td><fmt:formatDate pattern="yyyy-MM-dd"
												value="${myLogList.res_end}" /></td>

										<td>${myLogList.return_Status}</td>

									</tr>
								</c:forEach>
							</c:when>
						</c:choose>

					</table>

				</fieldset>
				</form>

			</div>
		</div>
	
</body>
</html>