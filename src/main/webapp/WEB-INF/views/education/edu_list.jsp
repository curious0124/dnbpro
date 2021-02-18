<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>


    <!-- 부트스트랩 경로 지정 폴더에 넣어놨음-->
    <!--<link rel="stylesheet" href="${contextPath}/resources/bootstrap/bootstrap.css">-->
    <!-- <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-BmbxuPwQa2lc/FVzBcNJ7UAyJxM6wuqIj61tLrc4wSX0szH/Ev+nYRRuWlolflfl" crossorigin="anonymous"> -->
         <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
         <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>
    

<!-- 부트스트랩 경로 지정 폴더에 넣어놨음-->
<link rel="stylesheet"
	href="${contextPath}/resources/bootstrap/bootstrap.css">


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

					<div id='edu_cate_name'>
						<select name="edu_cate" class="edu_cate" id="edu_cate"
							onchange="if(this.value) location.href=(this.value)">
								<option >카테고리</option>
							<option value="http://localhost:8090/pro/education/edu_list.do">전 체</option>
							<c:forEach items="${eduCateNameList }" var="list">
								<option
									value="${contextPath}/education/edu_cate_list.do?cate_name=${list.cate_name}">${list.cate_name}
								</option>
							</c:forEach>
						</select>
					</div>

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
								<c:forEach items="${educationList}" var="list"
									varStatus="educationNum">
									<tr>
										<td><a href="${contextPath}/education/edu_detail.do?educationNO=${list.edu_num}">${educationNum.count}</a></td>
										<td><a
											href="${contextPath}/education/edu_detail.do?educationNO=${list.edu_num}">${list.edu_thuming}&nbsp;</a></td>
										<td><a
											href="${contextPath}/education/edu_detail.do?educationNO=${list.edu_num}">${list.edu_title}</a></td>
										<td>${list.cate_name}</td>
										           <td> <c:choose> 
			  <c:when test="${not empty list.edu_thuming && list.edu_thuming!='null' }">
			   	
				     <input  type= "hidden"   name="originalFileName" value="${list.edu_thuming }" />
				    <img src="${contextPath}/edu_download.do?edu_num=${list.edu_thuming}&edu_thuming=${list.edu_thuming}" id="preview"  /><br>
				   
			 </c:when>
	 </c:choose>
	 </td>
									</tr>
								</c:forEach>

							</tbody>									

							</tbody>



						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>