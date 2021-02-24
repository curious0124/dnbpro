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
   
    <div class="center_container">
        
        <div data-spy="scroll" data-target="#navbar-example" data-offset="0"  class="center_content">

            <div><br><br><br>
                <h4 id="center_intro" class="title_H4">사업소개</h4>
                <c:forEach var="intro" items="${intro }">
                    <p>${intro.board_content}</p>
                </c:forEach>
               
            </div>
            <br><br>
            <div>
                <h4 id="center_video" class="title_H4">홍보영상</h4>
                <c:forEach var="video" items="${video }">
                    <p>${video.board_content}</p>
                </c:forEach>
            
            </div>
            <br><br>
            <div>
                <h4 id="center_service" class="title_H4">지원서비스</h4>
                 <c:forEach var="service" items="${service }">
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