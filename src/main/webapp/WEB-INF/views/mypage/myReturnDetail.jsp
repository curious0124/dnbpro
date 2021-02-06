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
<c:set var="returnlist" value="${myRentList.ret}" />
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
					<c:when test="${returnlist !=null }">
						<c:forEach var="ret" items="${returnlist}"
							varStatus="retNum">
							<tr>
								<td>${retNum.count}</td>
								<td>${ret.eq_serial}</td>
								<td>${ret.eq_name}</td>
								<td><fmt:formatDate pattern="yyyy-MM-dd"
										value="${ret.resq_date}" /></td>
								<td><fmt:formatDate pattern="yyyy-MM-dd"
										value="${ret.res_start}" /></td>
								<td><fmt:formatDate pattern="yyyy-MM-dd"
										value="${ret.res_end}" /></td>
								<td>${ret.res_Status}</td>

							</tr>
						</c:forEach>
					</c:when>
				</c:choose>

			</table>
		</fieldset>

	</div>
</body>
</html>