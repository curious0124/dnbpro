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
		$('#menucontent').load("${contextPath}/resources/subjsp/admin_menubar.jsp");

		 $("#selectUpate_btn").click(function() {
			 
							var confirm_val = confirm("정말 수정 하시겠습니까?");
							if (confirm_val) {
								var checkArr = new Array();
							/* 	var memId = ""; */
								var user_auth = "";

								$("input[class='chBox']:checked").each(function() {
													checkArr.push($(this).attr("value"));
								});
								var user_auth = $(".mem_auth_option").val();
							
								$.ajax({
											type : "post",
											data : { 
												chbox : checkArr,
												memAuth : user_auth
											},
											url : "${contextPath}/mem_manage/modMemAuth.do",
											success : function() {
												location.href = "${contextPath}/mem_manage/mem_list.do" ;},
												
											error : function() {alert("오류가 발생했습니다.");}
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
			<div id='top_buttonbox'>
				회원목록 게시판
				<div>
					<form name="memAuth" method="post"  >
					<div>
						<select class="mem_auth_option" name="user_auth">
								<option value="">권한 수정</option>
								<option value="일반">일반</option>
								<option value="관리자">관리자</option>
								<option value="블랙리스트">블랙리스트</option>
						</select>
						<input type="submit" id="selectUpate_btn" class="btn btn-light" value="권한수정">
					</div>
					</form>
		
				</div>
			</form>
				
				
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
								${listMember.user_email }
							</div>
							<div class="col_list" id='brd_div4'>
								${listMember.user_name }
							</div>
							<div class="col_list" id='brd_div5'>
								${listMember.user_phone }
							</div>
							<div class="col_list" id='brd_div6'>
								${listMember.user_auth }
						
							</div>


						</div>
					</c:forEach>
				</c:otherwise>
			</c:choose>

			<div id="listPaging">
				<ul>
					<c:if test="${pageMaker.prev}">
						<li><a
							href="mem_list.do${pageMaker.makeSearch(pageMaker.startPage - 1)}">이전</a></li>
					</c:if>

					<c:forEach begin="${pageMaker.startPage}"
						end="${pageMaker.endPage}" var="idx">
						<li><a href="mem_list.do${pageMaker.makeSearch(idx)}">${idx}</a></li>

					</c:forEach>

					<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
						<li><a
							href="mem_list.do${pageMaker.makeSearch(pageMaker.endPage + 1)}">다음</a></li>
					</c:if>
				</ul>
			</div>
<div>
	<form role="form" method="get">
		
  <div class="search">
    <select name="searchType">
      <option value="no"<c:out value="${scri.searchType == null ? 'selected' : ''}"/>>-----</option>
       <option value="tc"<c:out value="${scri.searchType eq 'tc' ? 'selected' : ''}"/>selected>아이디+이름</option>
      <option value="i"<c:out value="${scri.searchType eq 'i' ? 'selected' : ''}"/>>아이디</option>
      <option value="n"<c:out value="${scri.searchType eq 'n' ? 'selected' : ''}"/>>이름</option>
    </select>

    <input type="text" name="keyword" id="keywordInput" value="${scri.keyword}"/>

    <button id="searchBtn" type="button">검색</button>
    <script>
      $(function(){
        $('#searchBtn').click(function() {
          self.location = "mem_list.do" + '${pageMaker.makeQuery(1)}' + "&searchType=" + $("select option:selected").val() + "&keyword=" + encodeURIComponent($('#keywordInput').val());
        });
      });   
    </script>
  </div>
		</form>
</div>

		</div>


	</div>
</body>
</html>