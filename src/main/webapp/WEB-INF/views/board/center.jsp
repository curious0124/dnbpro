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
   margin-top: 50px;
   text-align: center;
   background-color: #f7f7f7;
}

.title_H4 {
   font-family: 'RIDIBatang';
}
</style>
</head>

<body>
   <!-- 상단 배너 -->
   <div class="breadcrumbs overlay"
      style="background-image:url('${contextPath}/resources/image/page_banner.jpg')">
      <div class="container">
         <div class="row">
            <div class="col-12">
               <div class="bread-inner">
                  <!-- Bread Menu -->
                  <div class="bread-menu">
                     <ul>
                        <li><a href="${contextPath}/main/main.do">Home</a></li>
                        <li><a href="${contextPath}/center/center.do">Center</a></li>
                     </ul>
                  </div>
                  <!-- Bread Title -->
                  <div class="bread-title">
                     <h2>Center Info</h2>
                  </div>
               </div>
            </div>
         </div>
      </div>
   </div>
   <!-- 상단 배너 -->
   <!-- Blog Single -->
   <section class="news-area archive blog-single section-padding">
      <div class="container">
         <div class="row">
            <div class="col-lg-10 offset-lg-1 col-md-10 offset-md-1 col-12">
               <div class="row">
                  <div class="col-12">
                     <div class="blog-single-main">
                        <div class="main-image">
                           <%--                         <c:forEach var="intro" items="${intro}">
                           
                        </c:forEach> --%>
                        </div>
                        <div class="blog-detail">
                           <!-- News meta -->
<div id="center_intro">
                           <c:forEach var="intro" items="${intro}">
                              <img style="width: 100%; height: 500px;"
                                 src="${contextPath}/download.do?board_num=${intro.board_num}&board_img=${intro.board_img}"
                                 alt="#">
                              <h2 class="blog-title">DNB 사업 소개</h2>
                              <p>${intro.board_content}</p>
                           </c:forEach>
</div>
<div id="center_video">
                           <div class="row blog-space">
                              <div class="col-lg-6">
                                 <c:forEach var="video" items="${video }">
                                    <p>${video.board_content}</p>
                                 </c:forEach>
                              </div>
                              <div class="col-lg-6">
                                 <h2 class="blog-title">DNB 홍보영상</h2>
                                 <h5>DNB는 이렇게 대단합니다.</h5>
                                 <ul>
                                    <li>모든 제품이 무료입니다.</li>
                                    <li>모든 제품이 진짜 무료 입니다.</li>
                                    <li>모든 제품이 진짜로 무료 입니다.</li>
                                    <li>개발자를 위해 무상으로 했습니다.</li>
                                    <li>모든 제품이 진짜로 무료 입니다.</li>
                                    <li>모든 제품이 진짜 무료 입니다.</li>
                                    <li>모든 제품이 무료입니다.</li>
                                    <li>This is DNB(DEATH NO PPAGGU )</li>
                                 </ul>
                              </div>
                           </div>
                           </div>
                           <!-- Blockquote -->
                           <div id="center_service">
                           <blockquote class="wp-block-quote">
                              <c:forEach var="service" items="${service }">
                                 <p>${service.board_content}</p>
                              </c:forEach>
                              <cite>– REAL FREE</cite>
                           </blockquote>
                           </div>
                           <!-- Post Nav -->
                        </div>
                     </div>
                  </div>
               </div>
               <div class="row">
                  <div class="col-12">
                     <div class="blog-comments-form">
                        <div class="bottom-title">
                           <h2>오시는 길</h2>
                        </div>
                        <div class="main-image">
                           <p>
                              <iframe
                                 src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d1221.9972436804728!2d127.10792702593666!3d37.4023946535925!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0x8bd4531be8ce5df4!2z7Lm07Lm07JikIO2MkOq1kOyYpO2UvOyKpA!5e0!3m2!1sko!2skr!4v1612599034737!5m2!1sko!2skr"
                                 width="100%" height="470" frameborder="0" style="border: 0;"
                                 allowfullscreen="" aria-hidden="false" tabindex="0"></iframe>
                           </p>
                        </div>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </div>
   </section>
   <!--/ End Services -->




























   <%--    <div class="center_container">

      <div data-spy="scroll" data-target="#navbar-example" data-offset="0"
         class="center_content">

         <div>
            <br> <br> <br>
            <h4 id="center_intro" class="title_H4">사업소개</h4>
            <c:forEach var="intro" items="${intro}">
               <p>${intro.board_content}</p>
            </c:forEach>

         </div>
         <br> <br>
         <div>
            <h4 id="center_video" class="title_H4">홍보영상</h4>
            <c:forEach var="video" items="${video }">
               <p>${video.board_content}</p>
            </c:forEach>

         </div>
         <br> <br>

         <div>
            <h4 id="center_service" class="title_H4">지원서비스</h4>
            <c:forEach var="service" items="${service }">
               <p>${service.board_content}</p>
            </c:forEach>

         </div>
         <br> <br>
         <div>
            <h4 id="center_come" class="title_H4">오시는길</h4>
            <p>
               <iframe
                  src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d1221.9972436804728!2d127.10792702593666!3d37.4023946535925!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0x8bd4531be8ce5df4!2z7Lm07Lm07JikIO2MkOq1kOyYpO2UvOyKpA!5e0!3m2!1sko!2skr!4v1612599034737!5m2!1sko!2skr"
                  width="600" height="450" frameborder="0" style="border: 0;"
                  allowfullscreen="" aria-hidden="false" tabindex="0"></iframe>
            </p>
         </div>
      </div>
   </div> --%>
</body>


</html>