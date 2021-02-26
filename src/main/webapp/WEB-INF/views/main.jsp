<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />

<%
  request.setCharacterEncoding("UTF-8");
%> 

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>메인 페이지</title>
  
  
  <style>
        #popupzone{
            width: 400px;
            height: 500px;
            position: absolute;
            left: 100px;
            top: 200px;
            z-index: 10;
            /* border: 1px solid red; */
        }
        #pop_img{
            width: 400px;
            height: 500px;
        }
        #pop_img>a>img{
            width: 100%;
            height: 100%;
        }
        #popch{
            text-align: right;
            margin-top: -50px;
        }
        body{
        background-color: #F4F9FC;
        }
        .developerIMG{height:410px;width:100%;
        }

    </style>
    <script>
    /* 팝업 로드 */
        $(function(){
            $("#popupclose").click(function(){
                $('#popupzone').hide();
            });
        });

    </script>
</head>
<body>

<!-- 팝업 시작 -->
   <c:choose> 
	<c:when test="${not empty articlesNoticeList[0].board_img && articlesNoticeList[0].board_img!='null' }">
    <div id="popupzone">
        <div id="pop_img">
            <a href="${contextPath}/cust/viewNoticeArticle.do?board_num=${articlesNoticeList[0].board_num}">
            <img src="${contextPath}/download.do?board_num=${articlesNoticeList[0].board_num}&board_img=${articlesNoticeList[0].board_img}"></a>
        </div>
        <div id="popch">
            <input type="checkbox" id="popupclose" >닫기
        </div>
    </div></c:when><c:otherwise></c:otherwise></c:choose>
<!-- 팝업끝! -->
    
    
    

    
		<section class="hero-slider style1" id="banner_img_size">
			<div class="home-slider">
				<!-- Single Slider -->
				<c:forEach items="${bannerList}" var="bannerList">
				<div class="single-slider" style="background-image:url('${contextPath}/download.do?board_num=${bannerList.board_num}&board_img=${bannerList.board_img}')">
					<div class="container">
						<div class="row">
							<div class="col-lg-9 col-md-8 col-12" id="banner_text">
								<div class="welcome-text"> 
									<div class="hero-text"> 
										<h4>본 상품은 모두 무료입니다.</h4>
										<h1>${bannerList.board_title}</h1>
										<div class="p-text" >
											<p id="banner_text_sub">${bannerList.board_content}</p>
										</div>
										<div class="button">
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				</c:forEach>
				<!--/ End Single Slider -->
			</div>
		</section>
				<!-- Features Area -->
		<section class="features-area section-bg">
			<div class="container">
				<div class="row">
					<div class="col-lg-3 col-md-6 col-12">
						<!-- Single Feature -->
						<div class="single-feature">
							<div class="icon-head"><i class="fa fa-podcast"></i></div>
							<h4><a href="${contextPath}/center/center.do#center_intro">Info</a></h4>
							<p>미래를 향한 비전과 철학 <br> 새로운 미래의 창조와 <br> 나은 세상을 향한 열정</p>
							<div class="button">
								<a href="${contextPath}/center/center.do#center_intro" class="bizwheel-btn"><i class="fa fa-arrow-circle-o-right"></i>Info More</a>
							</div>
						</div>
						<!--/ End Single Feature -->
					</div>
					<div class="col-lg-3 col-md-6 col-12">
						<!-- Single Feature -->
						<div class="single-feature">
							<div class="icon-head"><i class="fa fa-podcast"></i></div>
							<h4><a href="${contextPath}/center/center.do#center_video">Video</a></h4>
							<p>미래를 향한 비전과 철학 <br> 새로운 미래의 창조와 <br> 나은 세상을 향한 열정</p>
							<div class="button">
								<a href="${contextPath}/center/center.do#center_video" class="bizwheel-btn"><i class="fa fa-arrow-circle-o-right"></i>Video More</a>
							</div>
						</div>
						<!--/ End Single Feature -->
					</div>
					<div class="col-lg-3 col-md-6 col-12">
						<!-- Single Feature -->
						<div class="single-feature">
							<div class="icon-head"><i class="fa fa-podcast"></i></div>
							<h4><a href="${contextPath}/center/center.do#center_service">Service</a></h4>
							<p>미래를 향한 비전과 철학 <br> 새로운 미래의 창조와 <br> 나은 세상을 향한 열정</p>
							<div class="button">
								<a href="${contextPath}/center/center.do#center_service" class="bizwheel-btn"><i class="fa fa-arrow-circle-o-right"></i>Service More</a>
							</div>
						</div>
						<!--/ End Single Feature -->
					</div>
					<div class="col-lg-3 col-md-6 col-12">
						<!-- Single Feature -->
						<div class="single-feature">
							<div class="icon-head"><i class="fa fa-podcast"></i></div>
							<h4><a href="${contextPath}/center/center.do#center_come">Come on</a></h4>
							<p>미래를 향한 비전과 철학 <br> 새로운 미래의 창조와 <br> 나은 세상을 향한 열정</p>
							<div class="button">
								<a href="${contextPath}/center/center.do#center_come" class="bizwheel-btn"><i class="fa fa-arrow-circle-o-right"></i>Come More</a>
							</div>
						</div>
						<!--/ End Single Feature -->
					</div>
				</div>
			</div>
		</section>
		<!--/ End Features Area -->
		
				<!-- Call To Action -->
		<section class="call-action overlay" style="background-image:url('https://via.placeholder.com/1500x300')">
			<div class="container">
				<div class="row">
					<div class="col-lg-9 col-12">
						<div class="call-inner">
							<h2>기술혁신을 위한 사업 &amp; 기술혁신을 선도해 나가는 DNB</h2>
							<p>소비자 일상에 대한 배려를 제공하여 소비자 기대를 뛰어넘고, 일상을 바꾸어가는, 탁월한 가전의 혁신을 만들어 갑니다.</p>
						</div>
					</div>
					<div class="col-lg-3 col-12">
						<div class="button">
							<a href="#" class="bizwheel-btn">Donation</a>
						</div>
					</div>
				</div>
			</div>
		</section>
		<!--/ End Call to action -->
		
				<!-- Services -->
		<section class="services section-bg section-space">
			<div class="container">
				<div class="row">
					<div class="col-12">
						<div class="section-title style2 text-center">
							<div class="section-top">
								<h1><span>Creative</span><b>Developer List</b></h1><h4>개발기간 두달... 모두 고생하셨습니다.</h4>
							</div>
							<div class="section-bottom">
								<div class="text-style-two">
									<!-- <p>끝나고 모두 좋은곳으로 갈수있길..</p> -->
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-lg-4 col-md-4 col-12">
						<!-- Single Service -->
						<div class="single-service">
							<div class="service-head">
								<img class="developerIMG" src="${contextPath}/resources/image/client/KakaoTalk_20210224_144605126.gif" alt="#">
								<div class="icon-bg"><i class="fa fa-handshake-o"></i></div>
							</div>
							<div class="service-content">
								<h4><a href="#">Juan Park</a></h4>
								<p>Programmer: 그는 열심히하고 잘했지만 마지막에 탈주 했습니다... 명복을 빕니다...</p>
								<a class="btn" href="#"><i class="fa fa-arrow-circle-o-right"></i>Donation</a>
							</div>
						</div>
						<!--/ End Single Service -->
					</div>
					<div class="col-lg-4 col-md-4 col-12">
						<!-- Single Service -->
						<div class="single-service">
							<div class="service-head">
								<img class="developerIMG" src="${contextPath}/resources/image/client/KakaoTalk_20210224_144037341.gif" alt="#">
								<div class="icon-bg"><i class="fa fa-html5"></i></div>
							</div>
							<div class="service-content">
								<h4><a href="service-develop.html">Younglan Oh</a></h4>
								<p>Programmer: 그녀는 최고다... 이 모든 프로젝트는 그녀의 캐리입니다...</p>
								<a class="btn" href="#"><i class="fa fa-arrow-circle-o-right"></i>Donation</a>
							</div>
						</div>
						<!--/ End Single Service -->
					</div>
					<div class="col-lg-4 col-md-4 col-12">
						<!-- Single Service -->
						<div class="single-service">
							<div class="service-head">
								<img class="developerIMG" src="${contextPath}/resources/image/client/KakaoTalk_20210224_144632853.gif" alt="#">
								<div class="icon-bg"><i class="fa fa-cube"></i></div>
							</div>
							<div class="service-content">
								<h4><a href="service-market.html">Kyubong Lee</a></h4>
								<p>Programmer: 그가 없었다면 지금의 프로젝트는 실패로 돌아갔을 것 입니다...</p>
								<a class="btn" href="#"><i class="fa fa-arrow-circle-o-right"></i>Donation</a>
							</div>
						</div>
						<!--/ End Single Service -->
					</div>
										<div class="col-lg-4 col-md-4 col-12">
						<!-- Single Service -->
						<div class="single-service">
							<div class="service-head">
								<img class="developerIMG" src="${contextPath}/resources/image/client/KakaoTalk_20210224_145709567.gif" alt="#">
								<div class="icon-bg"><i class="fa fa-cube"></i></div>
							</div>
							<div class="service-content">
								<h4><a href="service-market.html">Chamin Lee</a></h4>
								<p>Programmer: I'm always hungry I love snack bar...  I hate insomnia</p>
								<a class="btn" href="#"><i class="fa fa-arrow-circle-o-right"></i>Donation</a>
							</div>
						</div>
						<!--/ End Single Service -->
					</div>
										<div class="col-lg-4 col-md-4 col-12">
						<!-- Single Service -->
						<div class="single-service">
							<div class="service-head">
								<img class="developerIMG" src="${contextPath}/resources/image/client/KakaoTalk_20210224_144645803.gif" alt="#">
								<div class="icon-bg"><i class="fa fa-cube"></i></div>
							</div>
							<div class="service-content">
								<h4><a href="service-market.html">Taegyu Seon</a></h4>
								<p>Programmer: 그는 장비 관리 코딩을 하다가 장비 그 자체가 되어버렸다...</p>
								<a class="btn" href="#"><i class="fa fa-arrow-circle-o-right"></i>Donation</a>
							</div>
						</div>
						<!--/ End Single Service -->
					</div>
										<div class="col-lg-4 col-md-4 col-12">
						<!-- Single Service -->
						<div class="single-service">
							<div class="service-head">
								<img class="developerIMG" src="${contextPath}/resources/image/client/KakaoTalk_20210224_144702371.gif" alt="#">
								<div class="icon-bg"><i class="fa fa-cube"></i></div>
							</div>
							<div class="service-content">
								<h4><a href="service-market.html">Sangjun Han</a></h4>
								<p>Programmer: 그는 조장이었지만 실제로 조장은 아니고 욕받이었다. 이미지 사이즈:555x410</p>
								<a class="btn" href="#"><i class="fa fa-arrow-circle-o-right"></i>Donation</a>
							</div>
						</div>
						<!--/ End Single Service -->
					</div>
				</div>
			</div>
		</section>
		<!--/ End Services -->
				<!-- Client Area -->
		<div class="clients section-bg">
			<div class="container">
				<div class="row">
					<div class="col-12">
						<div class="partner-slider">
							<!-- Single client -->
							<div class="single-slider">
								<div class="single-client">
									<a href="#" target="_blank"><img src="${contextPath}/resources/image/client/client-1.png" alt="#"></a>
								</div>
							</div>
							<!--/ End Single client -->
							<!-- Single client -->
							<div class="single-slider">
								<div class="single-client">
									<a href="#" target="_blank"><img src="${contextPath}/resources/image/client/client-2.png" alt="#"></a>
								</div>
							</div>
							<!--/ End Single client -->
							<!-- Single client -->
							<div class="single-slider">
								<div class="single-client">
									<a href="#" target="_blank"><img src="${contextPath}/resources/image/client/client-3.png" alt="#"></a>
								</div>
							</div>
							<!--/ End Single client -->
							<!-- Single client -->
							<div class="single-slider">
								<div class="single-client">
									<a href="#" target="_blank"><img src="${contextPath}/resources/image/client/client-4.png" alt="#"></a>
								</div>
							</div>
							<!--/ End Single client -->
							<!-- Single client -->
							<div class="single-slider">
								<div class="single-client">
									<a href="#" target="_blank"><img src="${contextPath}/resources/image/client/client-5.png" alt="#"></a>
								</div>
							</div>
							<!--/ End Single client -->
							<!-- Single client -->
							<div class="single-slider">
								<div class="single-client">
									<a href="#" target="_blank"><img src="${contextPath}/resources/image/client/client-6.png" alt="#"></a>
								</div>
							</div>
							<!--/ End Single client -->
						</div>
					</div>
				</div>
			</div>
		</div>
		<!--/ End Client Area -->

</body>
</html>