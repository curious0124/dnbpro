<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>

    <!-- 부트스트랩 경로 지정 폴더에 넣어놨음-->
    <link rel="stylesheet" href="${contextPath}/resources/bootstrap/bootstrap.css">
    
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>boardList</title>
</head>
<body>
	<div class="page-wrapper">
		<div class="container-fluid">
			<div class="col-lg-8">
				<!--게시판 넓이 -->
				<div class="col-lg-12">
					<h1 class="page-header">교육리스트</h1>
				</div>
				<div class="panel panel-default">
					<div class="panel-heading">교육리스트</div>
					<div class="panel-body">
						<table class="table table-hover">
							<thead>
								<tr>
									<th>교육 번호</th>
									<th>사진</th>
									<th>제목</th>
									<th>카테고리</th>
								</tr>
							</thead>
							<tbody>
 								<c:forEach items="${educationList}" var="list" varStatus="educationNum">
								<tr>
									<td><a href="${contextPath}/education/edu_detail.do?educationNO=${list.edu_num}">${educationNum.count}</td>
									<td><a href="${contextPath}/education/edu_detail.do?educationNO=${list.edu_num}">${list.edu_thuming}&nbsp;</a></td>	
									<td><a href="${contextPath}/education/edu_detail.do?educationNO=${list.edu_num}">${list.edu_title}</a></td>	
									<td> ${list.cate_name}</td>	
								</tr>
								</c:forEach>
							</tbody>
							
							
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<!-- 페이징실패 -->
<%-- 	            <c:forEach   var="page" begin="1" end="10" step="1" >
		         <c:if test="${section >1 && page==1 }">
		          <a href="${contextPath}/admin/goods/adminGoodsMain.do?chapter=${section-1}&pageNum=${(section-1)*10 +1 }">&nbsp; &nbsp;</a>
		         </c:if>
		          <a href="${contextPath}/admin/goods/adminGoodsMain.do?chapter=${section}&pageNum=${page}">${(section-1)*10 +page } </a>
		         <c:if test="${page ==10 }">
		          <a href="${contextPath}/admin/goods/adminGooodsMain.do?chapter=${section+1}&pageNum=${section*10+1}">&nbsp; next</a>
		         </c:if> 
	      		</c:forEach>  --%>
</body>
</html>