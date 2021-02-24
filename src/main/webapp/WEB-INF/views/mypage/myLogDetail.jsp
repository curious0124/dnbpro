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
<c:set var="loglist" value="${myRentList.log}" />
<style>
	#listPaging{  clear:both; text-align:center;}
        #listPaging > ul{margin:0 auto;}
        #listPaging > ul > li{
        	list-style: none; float: left; padding: 6px;
        	
        	
        	
        }
        
	.rent_table {
		width: 100%;
	}
</style>
</head>
<body>
	<div class=my_reserv_apply>

		<fieldset>
			<legend>반납/취소 내역</legend>
			<div class=rent_area></div>
			<table class=rent_table border=1px>
				<tr bgcolor=#ccc>
					<td>장비시리얼번호</td>
					<td>모델명</td>
					<td>신청일</td>
					<td>시작일</td>
					<td>반납일</td>
					<td>상태</td>
				</tr>
				<c:choose>
					<c:when test="${loglist !=null }">
						<c:forEach var="log" items="${loglist}" varStatus="logNum">
							<tr>
								<td>${log.eq_serial}</td>
								<td>${log.eq_name}</td>
								<td><fmt:formatDate pattern="yyyy-MM-dd"
										value="${log.log_date}" /></td>
								<td><fmt:formatDate pattern="yyyy-MM-dd"
										value="${log.res_start}" /></td>
								<td><fmt:formatDate pattern="yyyy-MM-dd"
										value="${log.res_end}" /></td>
								<td>${log.status}</td>

							</tr>
						</c:forEach>
					</c:when>
				</c:choose>

			</table>

		</fieldset>
		<div id="listPaging">
			<ul>
				<c:if test="${pageMaker.prev}">
					<li><a
						href="myLogDetail.do${pageMaker.makeQuery(pageMaker.startPage - 1)}">이전</a></li>
				</c:if>

				<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}"
					var="idx">
					<!-- <li><a href="list${pageMaker.makeQuery(idx)}">${idx}</a></li> -->
					<li><a href="myLogDetail.do${pageMaker.makeQuery(idx)}">${idx}</a></li>

				</c:forEach>

				<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
					<li><a
						href="myLogDetail.do${pageMaker.makeQuery(pageMaker.endPage + 1)}">다음</a></li>
				</c:if>
			</ul>
		</div>

	</div>
</body>
</html>