<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<c:set var="resqlist" value="${myRentList.resq}" />
</head>
<body>
	<div class=my_reserv_apply>

		<fieldset>
			<legend>예약신청</legend>
			<div class=rent_area>
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
				<c:choose>
					<c:when test="${resqlist !=null }">
						<c:forEach var="resq" items="${resqlist}"
							varStatus="resqNum">
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

							</tr>
						</c:forEach>
					</c:when>
				</c:choose>

			</table>
		</fieldset>

	</div>
</body>
</html>