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
                    <a href="${contextPath}/mypage/mypage.do">마이페이지</a>
                    <span>/</span>
                    <a href="${contextPath}/board/admin_board_list.do?brd_num=1">관리자</a>
                </c:if>
                <c:if test="${member.user_auth eq '일반'}">
                    <a href="${contextPath}/mypage/mypage.do">마이페이지</a>
                </c:if>
                <c:if test="${member.user_auth eq '블랙리스트'}">
                    <h3>블랙리스트ㅇ</h3>
                </c:if>
            </div>
        </div>

        <div class="row">
            <div class="col-6 col-md-1">
                <a href="${contextPath}/main/main.do"> <img id="logo" src="${contextPath}/resources/image/logo.png">
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
                                    <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
                                        <span id="search_concept">통합검색</span>
                                    </button>
                                    <ul class="dropdown-menu" role="menu">
                                        <li><a href="#contains">작성자</a></li>
                                        <li><a href="#its_equal">제목</a></li>
                                    </ul>
                                </div>
                                <input type="hidden" name="search_param" value="all" id="search_param"> <input type="text" class="form-control" name="x" placeholder="Search term...">
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
                <div class="dropdown">
                    <button class="dropbtn" onclick="location.href=' ${contextPath}/center/center.do'">센터 소개</button>
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
                    <button class="dropbtn" onclick="location.href=' ${contextPath}/equip/view_Eq_list.do'">장비예약</button>
                    <div class="dropdown-content">
                        <a href="${contextPath}/equip/view_Eq_list.do">장비리스트</a>
                    </div>
                </div>
            </div>
            <div class="col">
                <div class="dropdown">
                    <button class="dropbtn" onclick="location.href=' ${contextPath}/education/edu_list.do'">장비교육</button>
                    
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
            </div>
        </div>
    </div>
    
    
    
    
    
    
    
	<!-- Header -->
		<header class="header">
			<!-- Topbar -->
			<div class="topbar">
				<div class="container">
					<div class="row">
						<div class="col-lg-8 col-12">
							<!-- Top Contact -->
							<div class="top-contact">
								<div class="single-contact"><i class="fa fa-phone"></i>Phone: +(600) 125-4985-214</div> 
								<div class="single-contact"><i class="fa fa-envelope-open"></i>Email: info@yoursite.com</div>	
								<div class="single-contact"><i class="fa fa-clock-o"></i>Opening: 08AM - 09PM</div> 
							</div>
							<!-- End Top Contact -->
						</div>	
						<div class="col-lg-4 col-12">
							<div class="topbar-right">
								<!-- Social Icons -->
								<ul class="social-icons">
									<li><a href="#"><i class="fa fa-facebook"></i></a></li>
									<li><a href="#"><i class="fa fa-twitter"></i></a></li>
									<li><a href="#"><i class="fa fa-linkedin"></i></a></li>
									<li><a href="#"><i class="fa fa-dribbble"></i></a></li>
								</ul>															
								<div class="button">
									<a href="contact.html" class="bizwheel-btn">Get a Quote</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!--/ End Topbar -->
			<!-- Middle Header -->
			<div class="middle-header">
				<div class="container">
					<div class="row">
						<div class="col-12">
							<div class="middle-inner">
								<div class="row">
									<div class="col-lg-2 col-md-3 col-12">
										<!-- Logo -->
										<div class="logo">
											<!-- Image Logo -->
											<div class="img-logo">
												<a href="index.html">
													<img src="img/logo.png" alt="#">
												</a>
											</div>
										</div>								
										<div class="mobile-nav"></div>
									</div>
									<div class="col-lg-10 col-md-9 col-12">
										<div class="menu-area">
											<!-- Main Menu -->
											<nav class="navbar navbar-expand-lg">
												<div class="navbar-collapse">	
													<div class="nav-inner">	
														<div class="menu-home-menu-container">
															<!-- Naviagiton -->
															<ul id="nav" class="nav main-menu menu navbar-nav">
																<li><a href="index.html">Home</a></li>
																<li><a href="services.html">Our Services</a></li>
																<li><a href="portfolio.html">Our Portfolio</a></li>
																<li class="icon-active"><a href="#">Blog</a>
																	<ul class="sub-menu">
																		<li><a href="blog.html">Blog Grid</a></li>
																		<li><a href="blog-single.html">Blog Single</a></li>
																	</ul>
																</li>
																<li class="icon-active"><a href="#">Pages</a>
																	<ul class="sub-menu">
																		<li><a href="about.html">About Us</a></li>
																		<li><a href="404.html">404</a></li>
																	</ul>
																</li>
																<li><a href="contact.html">Contact Us</a></li>
															</ul>
															<!--/ End Naviagiton -->
														</div>
													</div>
												</div>
											</nav>
											<!--/ End Main Menu -->	
											<!-- Right Bar -->
											<div class="right-bar">
												<!-- Search Bar -->
												<ul class="right-nav">
													<li class="top-search"><a href="#0"><i class="fa fa-search"></i></a></li>
													<li class="bar"><a class="fa fa-bars"></a></li>
												</ul>
												<!--/ End Search Bar -->
												<!-- Search Form -->
												<div class="search-top">
													<form action="#" class="search-form" method="get">
														<input type="text" name="s" value="" placeholder="Search here"/>
														<button type="submit" id="searchsubmit"><i class="fa fa-search"></i></button>
													</form>
												</div>
												<!--/ End Search Form -->
											</div>	
											<!--/ End Right Bar -->
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!--/ End Middle Header -->
			<!-- Sidebar Popup -->
			<div class="sidebar-popup">
				<div class="cross">
					<a class="btn"><i class="fa fa-close"></i></a>
				</div>
				<div class="single-content">
					<h4>About Bizwheel</h4>
					<p>The main component of a healthy environment for self esteem is that it needs be nurturing. It should provide unconditional warmth.</p>
					<!-- Social Icons -->
					<ul class="social">
						<li><a href="#"><i class="fa fa-facebook"></i></a></li>
						<li><a href="#"><i class="fa fa-twitter"></i></a></li>
						<li><a href="#"><i class="fa fa-linkedin"></i></a></li>
						<li><a href="#"><i class="fa fa-dribbble"></i></a></li>
					</ul>
				</div>
				<div class="single-content">
					<h4>Important Links</h4>   
					<ul class="links">
						<li><a href="#">About Us</a></li>
						<li><a href="#">Our Services</a></li>
						<li><a href="#">Portfolio</a></li>
						<li><a href="#">Pricing Plan</a></li>
						<li><a href="#">Blog & News</a></li>
						<li><a href="#">Contact us</a></li>
					</ul>
				</div>	
			</div>
			<!--/ Sidebar Popup -->	
		</header>
		<!--/ End Header -->
 
</body>

</html>
