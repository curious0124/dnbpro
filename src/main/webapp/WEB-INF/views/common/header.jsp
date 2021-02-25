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
<!-- 헤더 템플릿 -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="copyright" content="pavilan">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- 헤더 템플릿 -->

<title>헤더</title>

<!-- Web Font -->
<link
	href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap"
	rel="stylesheet">

<!-- Bizwheel Plugins CSS -->
<link rel="stylesheet"
	href="${contextPath}/resources/css/animate.min.css">
<link rel="stylesheet"
	href="${contextPath}/resources/css/bootstrap.min.css">
<link rel="stylesheet"
	href="${contextPath}/resources/css/cubeportfolio.min.css">
<link rel="stylesheet"
	href="${contextPath}/resources/css/font-awesome.css">
<link rel="stylesheet"
	href="${contextPath}/resources/css/jquery.fancybox.min.css">
<link rel="stylesheet"
	href="${contextPath}/resources/css/magnific-popup.min.css">
<link rel="stylesheet"
	href="${contextPath}/resources/css/owl-carousel.min.css">
<link rel="stylesheet"
	href="${contextPath}/resources/css/slicknav.min.css">

<!-- Bizwheel Stylesheet -->
<link rel="stylesheet" href="${contextPath}/resources/css/reset.css">
<link rel="stylesheet"
	href="${contextPath}/resources/css/skins/style.css">
<link rel="stylesheet"
	href="${contextPath}/resources/css/responsive.css">

<!-- Bizwheel Colors -->
<link rel="stylesheet"
	href="${contextPath}/resources/css/skins/skin-2.css">
<!-- 헤더 템플릿 -->



<!-- Jquery JS -->
<script src="${contextPath}/resources/js/jquery.min.js"></script>
<script src="${contextPath}/resources/js/jquery-migrate-3.0.0.js"></script>
<!-- Popper JS -->
<script src="${contextPath}/resources/js/popper.min.js"></script>
<!-- Bootstrap JS -->
<script src="${contextPath}/resources/js/bootstrap.min.js"></script>
<!-- Modernizr JS -->
<script src="${contextPath}/resources/js/modernizr.min.js"></script>
<!-- ScrollUp JS -->
<script src="${contextPath}/resources/js/scrollup.js"></script>
<!-- FacnyBox JS -->
<script src="${contextPath}/resources/js/jquery-fancybox.min.js"></script>
<!-- Cube Portfolio JS -->
<script src="${contextPath}/resources/js/cubeportfolio.min.js"></script>
<!-- Slick Nav JS -->
<script src="${contextPath}/resources/js/slicknav.min.js"></script>
<!-- Slick Nav JS -->
<script src="${contextPath}/resources/js/slicknav.min.js"></script>
<!-- Slick Slider JS -->
<script src="${contextPath}/resources/js/owl-carousel.min.js"></script>
<!-- Easing JS -->
<script src="${contextPath}/resources/js/easing.js"></script>
<!-- Magnipic Popup JS -->
<script src="${contextPath}/resources/js/magnific-popup.min.js"></script>
<!-- Active JS -->
<script src="${contextPath}/resources/js/active.js"></script>

<style>
/* *{
border: 1px solid red;
} */
 #test1{
	line-height: 240%;
} 
.sub-menu>li>a{text-decoration: none;}
#nav>li>a{text-decoration: none;}
.headerfs{
font-family: 'SDSamliphopangche_Basic';}
</style>

</head>
<body>
	<!-- Header -->
	<header class="header">
		<!-- Topbar -->
		<div class="topbar">
			<div class="container">
				<div class="row">
				
				<c:choose>
					<c:when test="${isLogOn == true  && member!= null}">
					<div class="col" id="test1">
						<!-- Top Contact -->
							<div class="single-contact">
											<span class="headerfs">${member.user_name}님&nbsp;로그인 되었습니다</span>
									
							</div>
						<!-- End Top Contact -->
					</div>
					<div class="col">
						<div class="topbar-right">
							<!-- Social Icons -->
							<c:if test="${member.user_auth eq '관리자'}">
								<button type="button" class="btn btn-outline-danger headerfs" onclick="location.href='${contextPath}/member/logout.do' ">Logout</button>
								<button type="button" class="btn btn-outline-danger headerfs" onclick="location.href='${contextPath}/mypage/mypage.do'">MyPage</button>
								<button type="button" class="btn btn-outline-danger headerfs" onclick="location.href='${contextPath}/rent/admin_Eq_reserv_apply.do'">Admin</button>
							</c:if>
							<c:if test="${member.user_auth eq '일반'}">
								<button type="button" class="btn btn-outline-danger headerfs" onclick="location.href='${contextPath}/member/logout.do' ">Logout</button>
								<button type="button" class="btn btn-outline-danger headerfs" onclick="location.href='${contextPath}/mypage/mypage.do'">MyPage</button>
							</c:if>
						</div>
					</div>
					</c:when>
					<c:otherwise>
						<div class="col">
						<!-- Top Contact -->
							<div class="single-contact">
										
									
							</div>
						<!-- End Top Contact -->
					</div>
					<div class="col">
						<div class="topbar-right">
							<!-- Social Icons -->
							<button type="button" class="btn btn-outline-danger headerfs" onclick="location.href='${contextPath}/member/loginForm.do' ">Login</button>
							<button type="button" class="btn btn-outline-danger headerfs" onclick="location.href='${contextPath}/member/addmember.do' ">&nbspJoin&nbsp</button>
						</div>
					</div>
					</c:otherwise>
					</c:choose>
					
					
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
											<a href="${contextPath}/main/main.do"> <img src="${contextPath}/resources/image/logo_dnb.png" id="logo_dnb" alt="#">
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
															<li><a href="${contextPath}/main/main.do">Home</a></li>
															<li class="icon-active"><a href="${contextPath}/center/center.do">center</a>
															<ul class="sub-menu">
																<li><a href="${contextPath}/center/center.do#center_intro">Info</a></li>
																<li><a href="${contextPath}/center/center.do#center_video">Video</a></li>
																<li><a href="${contextPath}/center/center.do#center_service">Service</a></li>
																<li><a href="${contextPath}/center/center.do#center_come">Come on</a></li>
															</ul></li>
															<li><a href="${contextPath}/equip/view_Eq_list.do">Equipment</a>
															<li><a href="${contextPath}/education/edu_list.do">Education</a></li>
															<li class="icon-active"><a href="${contextPath}/cust/cust_notice.do">Support</a>
															<ul class="sub-menu">
																<li><a href="${contextPath}/cust/cust_notice.do">Notice</a></li>
																<li><a href="${contextPath}/cust/cust_faq.do">FAQ</a></li>
															</ul></li>
														</ul>
														<!--/ End Naviagiton -->
													</div>
												</div>
											</div>
										</nav>
										<!--/ End Main Menu -->
										<!-- Right Bar -->
										<div class="right-bar">
											<ul class="right-nav">
											</ul>
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
	</header>
	<!--/ End Header -->
</body>

</html>
