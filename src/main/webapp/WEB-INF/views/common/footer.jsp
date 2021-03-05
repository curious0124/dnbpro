<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"   isELIgnored="false"
 %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" /> 
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>하단 부분</title>
  <style>
	/*수정 */
     .footer{ 
      	width:100%;
      	bottom:0px;
        clear: both;
        padding: 5px;
        border: 0px solid #bcbcbc;
      }
  </style>
</head>
<body>

		<!-- Footer -->
		<footer class="footer" style="background-image:url('${contextPath}/resources/image/map.png')">
			<!-- Footer Top -->
			<div class="footer-top">
				<div class="container">
					<div class="row">
						<div class="col-lg-3 col-md-6 col-12">
							<!-- Footer About -->		
							<div class="single-widget footer-about widget">	
								<div class="logo">
									<div class="img-logo">
										<a class="logo" href="#">
											<img class="img-responsive" src="${contextPath}/resources/image/logo_dnb.png" alt="logo">
										</a>
									</div>
								</div>
								<div class="footer-widget-about-description">
									<p>기술혁신을 위한 사업 & 기술혁신을 선도해 나가는 DNB
									소비자 일상에 대한 배려를 제공하여 소비자 기대를 뛰어넘고, 일상을 바꾸어가는, 탁월한 가전의 혁신을 만들어 갑니다.</p>
								</div>	
								<div class="social">
									<!-- Social Icons -->
									<ul class="social-icons">
										<li><a class="facebook" href="#" target="_blank"><i class="fa fa-facebook"></i></a></li>
										<li><a class="twitter" href="#" target="_blank"><i class="fa fa-twitter"></i></a></li>
										<li><a class="linkedin" href="#" target="_blank"><i class="fa fa-linkedin"></i></a></li>
										<li><a class="pinterest" href="#" target="_blank"><i class="fa fa-pinterest-p"></i></a></li>
										<li><a class="instagram" href="#" target="_blank"><i class="fa fa-instagram"></i></a></li>
									</ul>
								</div>
							</div>		
							<!--/ End Footer About -->		
						</div>
						<div class="col-lg-2 col-md-6 col-12">
							<!-- Footer Links -->		
							<div class="single-widget f-link widget">
								<h3 class="widget-title">Company</h3>
								<ul>
									<li><a href="#">DNB About</a></li>
									<li><a href="#">DNB Services</a></li>
									<li><a href="#">DNB Portfolio</a></li>
									<li><a href="#">DNB Pricing Plan</a></li>
									<li><a href="#">DNB Contact us</a></li>
								</ul>
							</div>			
							<!--/ End Footer Links -->			
						</div>
						<div class="col-lg-4 col-md-6 col-12">
							<!-- Footer News -->
							<div class="single-widget footer-news widget">	
								<h3 class="widget-title">Blog Page</h3>
								<!-- Single News -->
								<div class="single-f-news">
									<div class="post-thumb"><a href="#"><img src="https://via.placeholder.com/70x70" alt="#"></a></div>
									<div class="content">
										<p class="post-meta"><time class="post-date"><i class="fa fa-clock-o"></i>April 15, 2020</time></p>
										<h4 class="title"><a href="blog-sngle.html">DNB Company &amp; DNB Service</a></h4>
									</div>
								</div>
								<!--/ End Single News -->
								<!-- Single News -->
								<div class="single-f-news">
									<div class="post-thumb"><a href="#"><img src="https://via.placeholder.com/70x70" alt="#"></a></div>
									<div class="content">
										<p class="post-meta"><time class="post-date"><i class="fa fa-clock-o"></i>April 10, 2020</time></p>
										<h4 class="title"><a href="blog-sngle.html">DNB Company &amp; DNB Service</a></h4>
									</div>
								</div>
								<!--/ End Single News -->
							</div>			
							<!--/ End Footer News -->			
						</div>
						<div class="col-lg-3 col-md-6 col-12">	
							<!-- Footer Contact -->		
							<div class="single-widget footer_contact widget">	
								<h3 class="widget-title">Contact</h3>
								<p>이곳도 바꾸길 원하시면 문의주세요</p>
								<ul class="address-widget-list">
									<li class="footer-mobile-number"><i class="fa fa-phone"></i>+(82) 125-4985-214</li>
									<li class="footer-mobile-number"><i class="fa fa-envelope"></i>명예의전당 💕손💕민💕구💕</li>
									<li class="footer-mobile-number"><i class="fa fa-map-marker"></i>명예의전당 💕김💕태💕수💕</li>
								</ul>
							</div>		
							<!--/ End Footer Contact -->						
						</div>
					</div>
				</div>
			</div>
			<!-- Copyright -->
			<div class="copyright">
				<div class="container">
					<div class="row">
						<div class="col-12">
							<div class="copyright-content">
								<!-- Copyright Text -->
								<p>© Copyright <a href="#">DNB</a>. Design &amp; Development By <a target="_blank" href="#">DNB.Theme</a></p>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!--/ End Copyright -->
		</footer>
</body>
</html>