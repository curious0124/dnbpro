<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
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
</body>
</html>