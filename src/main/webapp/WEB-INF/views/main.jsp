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
            z-index: 10;
            board: 5px solid red;
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
        #banner_text{
        	margin-left: 100px;
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
    
    
    

    
		<section class="hero-slider style1">
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
										<div class="p-text">
											<p>${bannerList.board_content}</p>
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

</body>
</html>