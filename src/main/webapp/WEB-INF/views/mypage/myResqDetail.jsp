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
<c:set var="resqList" value="${myRentList.resq}" />
</head>
<body>
	<div class=my_reserv_apply>
				<fieldset>
					<legend>예약신청</legend>
					<c:choose>
						<c:when test="${resqList !=null }">
							
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
									console.log("${resqApplyList.eq_serial }");
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
		</div>
</body>
</html>