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
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW"
	crossorigin="anonymous"></script>
<title>member_manage</title>
<style>
#board_content {
	margin: 0 auto;
	width: 1150px;
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
	padding: 0px 0px 0px 0px;
}

#brd_div1 {
	width: 30px;
}

#brd_div2 {
	width: 95px;
}

#brd_div3 {
	width: 300px;
}

#brd_div4 {
	width: 95px;
}

#brd_div5 {
	width: 155px;
}

#brd_div6 {
	width: 150px;
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

#listPaging {
	clear: both;
	text-align: center;
}

#listPaging>ul {
	margin: 0 auto;
}

#listPaging>ul>li {
	list-style: none;
	float: left;
	padding: 6px;
}
.mem_auth_option{
	width: 120px;}
</style>
<script src="${contextPath}/resources/js/jquery-3.5.1.min.js">
	
</script>
<script>
	$(function() {
		$('#menucontent').load(
				"${contextPath}/resources/subjsp/admin_menubar.jsp");

		/* $("#selectDelete_btn")
				.click(
						function() {

							var confirm_val = confirm("정말 삭제하시겠습니까?");
							var reurl = $
							{
								articlesList[0].brd_num
							}
							;

							if (confirm_val) {
								var checkArr = new Array();

								$("input[class='chBox']:checked")
										.each(
												function() {
													checkArr.push($(this).attr(
															"value"));
												});

								$
										.ajax({

											type : "post",
											data : {
												chbox : checkArr
											},
											url : "${contextPath}/board/deleteSelectArticle.do",
											success : function() {
												location.href = "${contextPath}/board/admin_board_list.do?brd_num="
														+ reurl;
											}
										});

							}
						}); */

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
			<div id='top_buttonbox'>
				회원목록 게시판
			<!-- 	<form action="">
					<input name="text">
				</form> -->
				<select class="mem_auth_option">
									<option value="">권한 수정</option>
									<option value="">일반</option>
									<option value="">관리자</option>
									<option value="">블랙리스트</option>
								</select>
			
				<button type="button" class="btn btn-light" id="selectDelete_btn" >
								권환 수정</button>
				<div>
				
				</div>
				
				
			</div>
			
			<c:choose>
				<c:when test="${listMembers == null }">

					<div class="listrow">
						<div class="col_top" id="brd_div1">
							<input type="checkbox" id="allCheck" onclick="allChk(this);" />
						</div>
						<div class="col_top" id='brd_div2'>아이디</div>
						<div class="col_top" id='brd_div3'>이메일</div>
						<div class="col_top" id='brd_div4'>이름</div>
						<div class="col_top" id='brd_div5'>전화</div>
						<div class="col_top" id='brd_div6'>
							
						</div>
					</div>

					<div class="listrow">
						<div class="col_list" id='brd_div1'></div>
						<div class="col_list" id='brd_div2'></div>
						<div class="col_list" id='brd_div3'>등록된 회원이 없습니다.</div>
						<div class="col_list" id='brd_div4'></div>
						<div class="col_list" id='brd_div5'></div>
						<div class="col_list" id='brd_div6'></div>


					</div>

				</c:when>
				<%-- <c:when test="${listMembers != null } "> --%>
				<c:otherwise>
					<div class="listrow">
						<div class="col_top" id="brd_div1">
							<input type="checkbox" id="allCheck" onclick="allChk(this);" />
						</div>
						<div class="col_top" id='brd_div2'>아이디</div>
						<div class="col_top" id='brd_div3'>이메일</div>
						<div class="col_top" id='brd_div4'>이름</div>
						<div class="col_top" id='brd_div5'>전화</div>
						<div class="col_top" id='brd_div6'>회원권한</div>
					</div>
					<c:forEach var="listMember" items="${listMembers }" varStatus="membersNum" >
						<div class="listrow">
							<div class="col_list" id='brd_div1'>
								<input type="checkbox" name="RowCheck" class="chBox" value="${listMember.user_id}" />
							</div>
							<div class="col_list" id='brd_div2'>
								${listMember.user_id}
							</div>
							<div class="col_list" id='brd_div3'>
								<a href=#>${listMember.user_email }</a>
							</div>
							<div class="col_list" id='brd_div4'>
								${listMember.user_name }
							</div>
							<div class="col_list" id='brd_div5'>
								${listMember.user_phone }
							</div>
							<div class="col_list" id='brd_div6'>
								${listMember.user_auth }
							<%-- 	<c:if test="${listMember.user_auth eq '관리자'}">
								<select class="mem_auth_option">
									<option value="">${listMember.user_auth }</option>
									<option value="">일반</option>
									<option value="">블랙리스트</option>
								</select>
								</c:if>
								<c:if test="${listMember.user_auth eq '일반'}">
								<select class="mem_auth_option">
									<option value="">${listMember.user_auth }</option>
									<option value="">블랙리스트</option>
									<option value="">일반</option>
								</select>
								</c:if>
								<c:if test="${listMember.user_auth eq '블랙리스트'}">
								<select class="mem_auth_option">
									<option value="">${listMember.user_auth }</option>
									<option value="">일반</option>
									<option value="">관리자</option>
								</select>
								</c:if> --%>
						
							</div>


						</div>
					</c:forEach>
				</c:otherwise>
				<%-- </c:when>
 --%>
			</c:choose>

			<div id="listPaging">
				<ul>
					<c:if test="${pageMaker.prev}">
						<li><a
							href="list${pageMaker.makeQuery(pageMaker.startPage - 1)}">이전</a></li>
					</c:if>

					<c:forEach begin="${pageMaker.startPage}"
						end="${pageMaker.endPage}" var="idx">
						<!-- <li><a href="list${pageMaker.makeQuery(idx)}">${idx}</a></li> -->
						<li><a href="mem_list.do${pageMaker.makeQuery(idx)}">${idx}</a></li>

					</c:forEach>

					<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
						<li><a
							href="list${pageMaker.makeQuery(pageMaker.endPage + 1)}">다음</a></li>
					</c:if>
				</ul>
			</div>
<div>
	<form action="">
		<input type="text">
		<input type="button">
		</form>
</div>

		</div>


	</div>
</body>
</html>