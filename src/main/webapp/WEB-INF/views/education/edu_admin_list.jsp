<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<%
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">	
<!-- 부트스트랩 페이징 -->	
	<!-- <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" crossorigin="anonymous"></script>  -->
	<script src="${contextPath}/resources/js/jquery-3.5.1.min.js"></script> 
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
	<script src="${contextPath}/resources/js/scripts.js"></script>
	<script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js" crossorigin="anonymous"></script>
	<script src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js" crossorigin="anonymous"></script>
	<script src="${contextPath}/resources/assets/demo/datatables-demo.js"></script>
<!-- 부트스트랩 페이징 -->

<title>edu_admin_list</title>
<style>
#board_content {
	margin: 0 auto;
	/* width: 1050px; */
}

a {
	color: black;
	text-decoration: none;
}

.board_container {
	margin: 0 auto;
	float: left;
	width: 825px;
}

.listrow {
	width: 825px;
	clear: both;
	text-align: center;
}

.col_top {
	float: left;
	background: #FA8072;
	color: white;
	font-weight: bold;
}

.col_list {
	float: left;
	background: #FFF5EE;
	padding: 0px 0px 0px 0px 0px 0px 0px 0px;
}

#top_buttonbox {
	min-width: 800px;
	text-align: right;
	padding-right: 50px;
	margin-bottom: 8px;
}

#brd_btn {
	font-size: 0.5em;
	width: 50px;
	height: 10px;
	padding: 2px;
	line-height: 5px;
}
.dataTables_length{

}
#listPaging{  clear:both; text-align:center;}
        #listPaging > ul{margin:0 auto;}
        #listPaging > ul > li{
        	list-style: none; float: left; padding: 6px;
        	
        	
        	
        }
</style>
 
<script>
	$(function() {
		$('#menucontent').load("${contextPath}/resources/subjsp/admin_menubar.jsp");
		$("#selectDelete_btn2").click(function() {
							var confirm_val = confirm("정말 삭제하시겠습니까?");
							if (confirm_val) {var checkArr = new Array();

								$("input[class='chBox']:checked")
										.each(function() {checkArr.push($(this).attr("value"));});
								$.ajax({
											type : "post",
											data : {chbox : checkArr},
											url : "${contextPath}/education/edu_admin_del.do",
											success : function() {
											location.href = "${contextPath}/education/edu_admin_list.do";
											}
										});
							}
						});
	});
	function allChk(obj) {
		var chkObj = document.getElementsByName("RowCheck");
		var rowCnt = chkObj.length - 1;
		var check = obj.checked;
		if (check) {
			for (var i = 0; i <= rowCnt; i++) {
				if (chkObj[i].type == "checkbox")
					chkObj[i].checked = true;
			}
		} else {
			for (var i = 0; i <= rowCnt; i++) {
				if (chkObj[i].type == "checkbox") {
					chkObj[i].checked = false;
				}
			}
		}
	}
</script>

</head>
<body>
	<div id='board_content'>
		<!--menu bar -->
		<div id='menucontent'></div>


		<!--board_container -->
		<div class="board_container">
				<button type="button" class="btn btn-light " id="addarticle" onclick="location.href=' ${contextPath}/education/edu_admin_Form.do'" >글쓰기</button>					
				<button type="button" class="btn btn-light" id="selectDelete_btn2">선택삭제</button>		
		<!-- 부트스트랩 -->
	<div id="layoutSidenav_content">
      <main>
        <div class="container-fluid">
          <h1 class="mt-4">장비 교육 관리</h1>
           <div class="card mb-4">
             <div class="card-body">
               <div class="table">
                 <table class="table table-bordered" id="" width="100%" cellspacing="0">
                   <thead>
                     <tr>
                     <th><input type="checkbox" id="allCheck" onclick="allChk(this);" /></th>
                      <th>글 번호</th>
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
						<td><input type="checkbox" name="RowCheck" class="chBox" value="${list.edu_num}" /></td>
							<td>${educationNum.count}</td>
							<td><a href="${contextPath}/education/edu_admin_detail.do?educationNO=${list.edu_num}">${list.edu_title}</a></td>
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
				<div id="listPaging">
				<ul>
					<c:if test="${pageMaker.prev}">
						<li><a
							href="list${pageMaker.makeQuery(pageMaker.startPage - 1)}">이전</a></li>
					</c:if>
					<c:forEach begin="${pageMaker.startPage}"
						end="${pageMaker.endPage}" var="idx">
						<!-- <li><a href="list${pageMaker.makeQuery(idx)}">${idx}</a></li> -->
						<li><a href="edu_admin_list.do${pageMaker.makeQuery(idx)}">${idx}</a></li>
					</c:forEach>
					<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
						<li><a
							href="list${pageMaker.makeQuery(pageMaker.endPage + 1)}">다음</a></li>
					</c:if>
				</ul>
			</div>	
</div>
</div>

	

</body>
</html>