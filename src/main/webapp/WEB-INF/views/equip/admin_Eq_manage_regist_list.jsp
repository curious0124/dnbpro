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
<title>모델명 리스트</title>
<style>
body {
	background: #f4f9fc;
}

#board_content {
	margin: 0 auto;
	margin-top: 70px;
	width: 1100px;
}

.board_container {
	margin: 0 auto;
	float: left;
	width: 800px;
	margin-top: -35px;
}

.listrow {
	clear: both;
	text-align: center;
	width: 710px;
	margin: 0 auto;
	margin-top: -10px;
}

.col_top {
	float: left;
	color: #2e2751;
	font-weight: bold;
	border-bottom: 2px solid #2e2751;
	border-top: 2px solid #2e2751;
}

.col_list {
	float: left;
	border-bottom: 1px solid #f0f0f0;
	padding: 0px 0px 0px 0px;
}

.checkBox {
	float: left;
}

.col1 {
	display: inline-block;
	float: right;
}

#brd_div1 {
	width: 100px;
}

#brd_div2 {
	width: 150px;
}

#brd_div3 {
	width: 150px;
}

#brd_div4 {
	width: 300px;
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
}

.tit {
	width: 700px;
	margin: 0 auto;
}

#top_buttonbox {
	width: 700px;
	text-align: right;
	padding-right: 20px;
	margin: 0 auto;
	margin-bottom: 15px;
}

#listPaging {
	clear: both;
	text-align: center;
	margin: 0 auto;
}

#listPaging>ul {
	margin: 0 auto;
	width: 500px;
}

#listPaging>ul>li {
	list-style: none;
	float: left;
	padding: 6px;
}

.mem_auth_option {
	width: 120px;
}
</style>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
	$(function() {
		$('#menucontent').load(
				"${contextPath}/resources/subjsp/admin_menubar.jsp");

		$(".selectDelete_btn")
				.click(
						function() {
							var confirm_val = confirm("정말 삭제하시겠습니까?");

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
											url : "${contextPath}/equip/deleteEqname.do",
											type : "post",
											data : {
												chbox : checkArr
											},
											success : function() {
												location.href = "${contextPath}/equip/admin_Eq_manage_regist_list.do";
											}
										});
							}
						});

		$("#allCheck").click(function() {
			var chk = $("#allCheck").prop("checked");
			if (chk) {
				$(".chBox").prop("checked", true);
			} else {
				$(".chBox").prop("checked", false);
			}
		});

		$(".chBox").click(function() {
			$("#allCheck").prop("checked", false);
		});
	});
</script>
</head>

<body>
	<div id='board_content'>
		<div id='menucontent'></div>

		<!--board_container -->
		<div class="board_container">
			<div class="tit">
				<strong>모델명 목록</strong>
			</div>
			<br>
			<div id='top_buttonbox'>
				<input type="button" class="btn btn-light" id='brd_btn'
					onclick="location.href='${contextPath}/equip/admin_Eq_manage_regist.do?cate_name'"
					value="새모델등록"> <input type="button"
					class="btn btn-light selectDelete_btn" id='brd_btn' value="선택삭제">
				<input type="button" class="btn btn-light fs" id='brd_btn'
					value="이전페이지" onClick="history.back()" />
			</div>
			<div class="listrow">
				<div class="col_top" id="brd_div1">
					<input type="checkbox" name="allCheck" id="allCheck"
						onclick="checkAll(this)">
				</div>
				<div class="col_top" id='brd_div2'>모델명</div>
				<div class="col_top" id='brd_div3'>제조사</div>
				<div class="col_top" id='brd_div4'>스펙</div>
			</div>

			<c:choose>
				<c:when test="${eqnameList !=null }">
					<c:forEach var="model" items="${eqnameList }" varStatus="cateNum">
						<div class="listrow">
							<div class="col_list checkBox" id='brd_div1'>
								<input type="checkbox" name="RowCheck" class="chBox"
									value="${model.eq_name}">
							</div>
							<div class="col_list" id='brd_div2'>${model.eq_name}</div>
							<div class="col_list" id='brd_div3'>${model.eq_ma}</div>
							<div class="col_list" id='brd_div4' style="white-space: pre;">
								${model.eq_spec}</div>
						</div>
					</c:forEach>
				</c:when>






				<c:when test="${eqnameList == null }">
					<div class="listrow">
						<div class="col_list checkBox" id='brd_div1'></div>
						<div class="col_list" id='brd_div2'></div>
						<div class="col_list" id='brd_div3'></div>
						<div class="col_list" id='brd_div4'></div>
					</div>


				</c:when>
			</c:choose>

			<div id="listPaging">
				<ul>
					<c:if test="${pageMaker.prev}">
						<li><a
							href="admin_Eq_manage_regist_list.do${pageMaker.makeSearch(pageMaker.startPage - 1)}">이전</a></li>
					</c:if>

					<c:forEach begin="${pageMaker.startPage}"
						end="${pageMaker.endPage}" var="idx">
						<li><a
							href="admin_Eq_manage_regist_list.do${pageMaker.makeSearch(idx)}">${idx}</a></li>

					</c:forEach>

					<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
						<li><a
							href="admin_Eq_manage_regist_list.do${pageMaker.makeSearch(pageMaker.endPage + 1)}">다음</a></li>
					</c:if>
				</ul>
			</div>
			<div>
				<form role="form" method="get">

					<div class="search">
						<select name="searchType">
							<option value="no"
								<c:out value="${scri.searchType == null ? 'selected' : ''}"/>>-----</option>
							<option value="nm"
								<c:out value="${scri.searchType eq 'nm' ? 'selected' : ''}"/>
								selected>모델명+제조사</option>
							<option value="n"
								<c:out value="${scri.searchType eq 'n' ? 'selected' : ''}"/>>모델명</option>
							<option value="m"
								<c:out value="${scri.searchType eq 'm' ? 'selected' : ''}"/>>제조사</option>
						</select> <input type="text" name="keyword" id="keywordInput"
							value="${scri.keyword}" />

						<button id="searchBtn" type="button">검색</button>
						<script>
							$(function() {
								$('#searchBtn')
										.click(
												function() {
													self.location = "admin_Eq_manage_regist_list.do"
															+ '${pageMaker.makeQuery(1)}'
															+ "&searchType="
															+ $(
																	"select option:selected")
																	.val()
															+ "&keyword="
															+ encodeURIComponent($(
																	'#keywordInput')
																	.val());
												});
							});
						</script>
					</div>
			</div>
</body>

</html>
