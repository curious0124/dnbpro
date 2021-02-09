<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>헤더</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW"
	crossorigin="anonymous"></script>
<style>
/*
    * {
        border: 1px solid red;
    }
*/
#headerall {
	background: #f6f6f6;
}

#header_top {
	text-align: right;
	background: #fb9fa9;
}

#logo {
	width: 150px;
}

#header_ser {
	text-align: center;
	margin-top: -40px;
	margin-bottom: 50px;
}

#header_menu {
	background: #621920;
}

.dropbtn {
	background-color: #621920;
	color: white;
	padding: 16px;
	font-size: 16px;
	border: none;
}

.dropdown {
	position: relative;
	display: inline-block;
}

.dropdown-content {
	display: none;
	position: absolute;
	background-color: #f1f1f1;
	min-width: 160px;
	box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
	z-index: 1;
}

.dropdown-content a {
	color: black;
	padding: 12px 16px;
	text-decoration: none;
	display: block;
}

.dropdown-content a:hover {
	background-color: #ddd;
}

.dropdown:hover .dropdown-content {
	display: block;
}

.dropdown:hover .dropbtn {
	background-color: #3e8e41;
}
</style>
</head>
<body>
<<<<<<< HEAD
	<div id="headerall">
		<div class="row" id="header_top">
			<div class="col-md-12">
				<c:choose>
					<c:when test="${isLogOn == true  && member!= null}">
						<p>${member.user_name} 로그인 되었습니다</p>
						<a href="${contextPath}/member/logout.do">로그아웃</a>
						<span>/</span>
					</c:when>
					<c:otherwise>
						<a href="${contextPath}/member/loginForm.do">로그인</a>
						<span>/</span>
						<a href="${contextPath}/member/addmember.do">회원가입</a>
					</c:otherwise>
				</c:choose>
				
				<!-- 사용자에 따라서 버튼 표시 -->
				<c:if test="${member.user_auth eq '관리자'}">
				<a href="http://localhost:8090/pro/mypage/mypage.do">마이페이지</a>
				<span>/</span>
				    <a href="http://localhost:8090/pro/board/admin_board_list.do?brd_num=1">관리자</a>
				</c:if>
				<c:if test="${member.user_auth eq '일반'}">
				    <a href="http://localhost:8090/pro/mypage/mypage.do">마이페이지</a>
				</c:if>
				<c:if test="${member.user_auth eq '블랙리스트'}">
				    <h3>블랙리스트</h3>
				</c:if>
			</div>
		</div>
=======
<div id="headerall">
        <div class="row" id="header_top">
            <div class="col-md-12">
            <c:choose>
          <c:when test="${isLogOn == true  && member!= null}">
            <h3>환영합니다람쥐. ${member.user_name} 님!</h3>
            <a href="${contextPath}/member/logout.do"><h3>로그아웃</h3></a>
            	
          </c:when>
          <c:otherwise>
           <a href="${contextPath}/member/loginForm.do"><h3>로그인</h3></a>
         </c:otherwise>
      </c:choose>  
                <!-- <a href="#">로그인</a> -->
                <span>/</span>
                <a href="${contextPath}/member/addmember.do">회원가입</a>
                <span>/</span>
                <a href="http://localhost:8090/pro/board/admin_board_list.do?brd_num=1">관리자</a>
                <a href="http://localhost:8090/pro/mypage/mypage.do">마이페이지</a>
            </div>
        </div>
>>>>>>> branch 'develop' of https://github.com/curious0124/dnbpro.git


		<div class="row">
			<div class="col-6 col-md-1">
				<a href="http://localhost:8090/pro/main/main.do"> <img id="logo"
					src="${contextPath}/resources/image/logo.png">
				</a>
			</div>
		</div>


		<div class="row">
			<div class="col-">
				<div class="container">
					<div class="row" id="header_ser">
						<div class="col-xs-8 col-xs-offset-2">
							<!-- 검색창 !-->
							<div class="input-group">
								<div class="input-group-btn search-panel">
									<button type="button" class="btn btn-default dropdown-toggle"
										data-toggle="dropdown">
										<span id="search_concept">통합검색</span>
									</button>
									<ul class="dropdown-menu" role="menu">
										<li><a href="#contains">작성자</a></li>
										<li><a href="#its_equal">제목</a></li>
									</ul>
								</div>
								<input type="hidden" name="search_param" value="all"
									id="search_param"> <input type="text"
									class="form-control" name="x" placeholder="Search term...">
								<span class="input-group-btn">
									<button class="btn btn-default" type="button">
										<span class="glyphicon glyphicon-search"></span>
									</button>
								</span>
							</div>
							<!-- 검색창끝 !-->
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="row" id="header_menu">
			<div class="col">

<<<<<<< HEAD
				<div class="dropdown">
					<button class="dropbtn">센터 소개</button>
					<div class="dropdown-content">
						<a href="#">사업소개</a> <a href="#">홍보영상</a> <a href="#">지원소개</a> <a
							href="#">오시는길</a>
					</div>
				</div>
			</div>
			<div class="col">
				<div class="dropdown">
=======
                <div class="dropdown">
                	<button class="dropbtn" onclick="location.href=' http://localhost:8090/pro/center/center.do'">센터 소개</button>
                    <div class="dropdown-content">
                        <a href="${contextPath}/center/center.do#center_intro">사업소개</a>
                        <a href="${contextPath}/center/center.do#center_video">홍보영상</a>
                        <a href="${contextPath}/center/center.do#center_service">지원소개</a>
                        <a href="${contextPath}/center/center.do#center_come">오시는길</a>
                    </div>
                    
                </div>
            </div>
            <div class="col">
                <div class="dropdown">
                	<button class="dropbtn" onclick="location.href=' http://localhost:8090/pro/equip/view_Eq_list.do'" >장비예약</button>
                    <div class="dropdown-content">
                        <a href="#">사업소개</a>
                        <a href="#">홍보영상</a>
                        <a href="#">지원소개</a>
                        <a href="#">오시는길</a>
                    </div>
                </div>
            </div>
            <div class="col">
>>>>>>> branch 'develop' of https://github.com/curious0124/dnbpro.git

<<<<<<< HEAD
					<button class="dropbtn"
						onclick="location.href=' http://localhost:8090/pro/equip/view_Eq_list.do'">장비예약</button>
					<div class="dropdown-content">
						<a href="#">사업소개</a> <a href="#">홍보영상</a> <a href="#">지원소개</a> <a
							href="#">오시는길</a>
					</div>
				</div>
			</div>
			<div class="col">
=======
                <div class="dropdown">
               
                    <button class="dropbtn" onclick="location.href=' http://localhost:8090/pro/education/edu_list.do'">장비교육</button>
                    <div class="dropdown-content">
                        <a href="#">사업소개</a>
                        <a href="#">홍보영상</a>
                        <a href="#">지원소개</a>
                        <a href="#">오시는길</a>
                    </div>
                </div>
            </div>
            <div class="col">
                <div class="dropdown">
                    <button class="dropbtn">고객 지원</button>
                    <div class="dropdown-content">
                        <a href="${contextPath}/cust/cust_notice.do">공지사항</a>
                        <a href="${contextPath}/cust/cust_faq.do">FAQ</a>
                    </div>
                </div>
>>>>>>> branch 'develop' of https://github.com/curious0124/dnbpro.git

				<div class="dropdown">

					<button class="dropbtn"
						onclick="location.href=' http://localhost:8090/pro/education/edu_list.do'">장비교육</button>
					<div class="dropdown-content">
						<a href="#">사업소개</a> <a href="#">홍보영상</a> <a href="#">지원소개</a> <a
							href="#">오시는길</a>
					</div>
				</div>
			</div>
			<div class="col">
				<div class="dropdown">
					<button class="dropbtn">고객 지원</button>
					<div class="dropdown-content">
						<a href="#">공지사항</a> <a href="${contextPath}/cust/cust_faq.do">FAQ</a>
					</div>
				</div>

			</div>
		</div>
	</div>
</body>
</html>