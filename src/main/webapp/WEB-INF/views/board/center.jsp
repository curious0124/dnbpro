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
    <title>Document</title>
    <c:set var="intro" value="${centerList.intro}" />
     <c:set var="video" value="${centerList.video}" />
      <c:set var="service" value="${centerList.service}" />
    <style>
         .center_container {
            margin: 0 auto;
			text-align: center;
            background-color: #f7f7f7;
        } 
		.title_H4{
			font-family: 'RIDIBatang';
		}

    </style>
</head>

<body>

		<!-- 상단 배너 -->
		<div class="breadcrumbs overlay" style="background-image:url('${contextPath}/resources/image/page_banner.jpg')">
			<div class="container">
				<div class="row">
					<div class="col-12">
						<div class="bread-inner">
							<!-- Bread Menu -->
							<div class="bread-menu">
								<ul>
									<li><a href="${contextPath}/main/main.do">Home</a></li>
									<li><a href="${contextPath}/center/center.do#center_intro">Center</a></li>
								</ul>
							</div>
							<!-- Bread Title -->
							<div class="bread-title"><h2>Center Info</h2></div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- 상단 배너 -->
   
    <div class="center_container">
<!--         <div class="center_navi">
            <ul class="nav navbar-nav">
                <li class="active"><a href="#center_intro">사업소개</a></li>
                <li class="active"><a href="#center_video">홍보영상</a></li>
                <li class="active"><a href="#center_service">지원서비스</a></li>
                <li class="active"><a href="#center_come">오시는길</a></li>
            </ul>
        </div> -->
        <div data-spy="scroll" data-target="#navbar-example" data-offset="0"  class="center_content">
            <div>
<<<<<<< HEAD
                <h4 id="center_intro">사업소개</h4>
                <c:forEach var="intro" items="${intro}">
=======
                <h4 id="center_intro" class="title_H4">사업소개</h4>
                <c:forEach var="intro" items="${intro }">
>>>>>>> branch 'develop' of https://github.com/curious0124/dnbpro.git
                	 <p>${intro.board_content}</p>
                </c:forEach>
               
            </div>
            <br><br>
            <div>
<<<<<<< HEAD
                <h4 id="center_video">홍보영상</h4>
                <c:forEach var="video" items="${video}">
=======
                <h4 id="center_video" class="title_H4">홍보영상</h4>
                <c:forEach var="video" items="${video }">
>>>>>>> branch 'develop' of https://github.com/curious0124/dnbpro.git
                	 <p>${video.board_content}</p>
                </c:forEach>
            
            </div>
            <br><br>
            <div>
<<<<<<< HEAD
                <h4 id="center_service">지원서비스</h4>
                 <c:forEach var="service" items="${service}">
=======
                <h4 id="center_service" class="title_H4">지원서비스</h4>
                 <c:forEach var="service" items="${service }">
>>>>>>> branch 'develop' of https://github.com/curious0124/dnbpro.git
                	 <p>${service.board_content}</p>
                </c:forEach>
            
            </div>
            <br><br>
            <div>
                <h4 id="center_come" class="title_H4">오시는길</h4>
                <p><iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d1221.9972436804728!2d127.10792702593666!3d37.4023946535925!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0x8bd4531be8ce5df4!2z7Lm07Lm07JikIO2MkOq1kOyYpO2UvOyKpA!5e0!3m2!1sko!2skr!4v1612599034737!5m2!1sko!2skr" width="600" height="450" frameborder="0" style="border:0;" allowfullscreen="" aria-hidden="false" tabindex="0"></iframe></p>
            </div>
        </div>
    </div>
</body>

</html>
