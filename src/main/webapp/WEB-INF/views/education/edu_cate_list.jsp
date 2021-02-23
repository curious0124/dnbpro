<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>


<!-- 부트스트랩 페이징 -->
	
	<!-- <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" crossorigin="anonymous"></script>  -->
	<script src="${contextPath}/resources/js/jquery-3.5.1.min.js"></script> 
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
	<script src="${contextPath}/resources/js/scripts.js"></script>
	<script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js" crossorigin="anonymous"></script>
	<script src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js" crossorigin="anonymous"></script>
	<script src="${contextPath}/resources/assets/demo/datatables-demo.js"></script>
<!-- 부트스트랩 페이징 -->

<!-- 부트스트랩 경로 지정 폴더에 넣어놨음-->
<link rel="stylesheet"
	href="${contextPath}/resources/bootstrap/bootstrap.css">


<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>boardList</title>
<style>
#dataTable_length{
width:5090px;
}
</style>
</head>
<body>
		<div id="layoutSidenav_content">
      <main>
        <div class="container-fluid">
          <h1 class="mt-4">장비 교육</h1>
           <div class="card mb-4">
             <div class="card-body">
               <div class="table">
                 <table class="table table-bordered" id="" width="100%" cellspacing="0">
                   <thead>
                     <div id='edu_cate_name'>
						<select name="edu_cate" class="edu_cate" id="edu_cate" onchange="if(this.value) location.href=(this.value)">
							<option >카테고리</option>
							<option value="${contextPath}/education/edu_list.do">전 체</option>
							<c:forEach items="${eduCateNameList }" var="list">
								<option value="${contextPath}/education/edu_cate_list.do?cate_name=${list.cate_name}">${list.cate_name}
								</option>
							</c:forEach>
						</select>
					</div>
                     <tr>
                      <th>글 번호</th>
                      <th>썸네일</th>
                      <th>제목</th>
                      <th>대분류</th>
                      <th>소분류</th>
                      <th>등록날짜</th>
                      <th>작성자</th>
                     </tr>
                   </thead>
                   <tbody>
					<c:forEach items="${educationList}" var="list" varStatus="educationNum">
						<tr align="center">						
							<td>${educationNum.count}</td>
							<td>
							  <c:choose>  									
			  					<c:when test="${not empty list.edu_thuming && list.edu_thuming!='null' }">
				     				<input  type= "hidden"   name="originalFileName" value="${list.edu_thuming}" /> 
				    					 <img src="${contextPath}/edu_download.do?edu_num=${list.edu_num}&edu_thuming=${list.edu_thuming}" id="preview"  /><br>
			 							</c:when>
			 							<c:otherwise>	
			 										<b>이미지가 없습니다.</b>
										</c:otherwise>								
									</c:choose>
							
							</td>
							<td><a href="${contextPath}/education/edu_detail.do?educationNO=${list.edu_num}">${list.edu_title}</a></td>
							<td>${list.cate_name}</td>
							<td>${list.eq_name}</td>
							<td>${list.edu_pub_date}</td>
							<td>${list.edu_writer}</td>
						</tr>
					</c:forEach>
				</tbody>
                   </table>
                  </div>
                </div>
               </div>
              </div>
		</main>
	</div>	
</body>
</html>

<%-- 	<div class="page-wrapper">
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
								<c:forEach items="${educationList}" var="list" varStatus="educationNum">
									<tr>
										<td><a href="${contextPath}/education/edu_detail.do?educationNO=${list.edu_num}">${educationNum.count}</a></td>
										<td><a
											href="${contextPath}/education/edu_detail.do?educationNO=${list.edu_num}">									<td>
  									<c:choose>  									
			  							<c:when test="${not empty list.edu_thuming && list.edu_thuming!='null' }">
				     					 <input  type= "hidden"   name="originalFileName" value="${list.edu_thuming}" /> 
				    					 <img src="${contextPath}/edu_download.do?edu_num=${list.edu_num}&edu_thuming=${list.edu_thuming}" id="preview"  /><br>
			 							</c:when>
			 							<c:otherwise>	
			 										<b>이미지가 없습니다.</b>
										</c:otherwise>								
									</c:choose>
	 								</td></a></td>
										<td><a
											href="${contextPath}/education/edu_detail.do?educationNO=${list.edu_num}">${list.edu_title}</a></td>
										<td>${list.cate_name}</td>

									</tr>
								</c:forEach>

							</tbody>									

							</tbody>



						</table>
					</div>
				</div>
			</div>
		</div>
	</div> --%>