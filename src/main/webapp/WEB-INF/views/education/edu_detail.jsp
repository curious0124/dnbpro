<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">


    <!-- 부트스트랩 경로 지정 폴더에 넣어놨음-->
    <link rel="stylesheet" href="${contextPath}/resources/bootstrap/bootstrap.css">
    
    
<title>boardList</title>
<style>
	body {
            background: #f4f9fc;
        }
        .notice_detail{
        	max-width: 800px;
        }
		.fs{font-family: 'RIDIBatang';padding-left:10px;
		}
		.badge {
            float: left;
            height: 2em;
            line-height: 18px;
            font-size: 15px;
            color: #2e2751;
            margin-right: 3px;
        }

        .brd_title {
            background: #a4a4a4;
            color: white;
            font-size: 20px;
            font-weight: 600;
            height: 60px;
            width:100%;
            line-height: 60px;
            padding-left: 20px;
        }
		.brd_date{
			text-align:right;padding-left: 20px;
		}
        
        .form-floating {
        	text-align: justify;
            margin: 0 auto;
            padding-left: 20px;
        }

        .brd_btn_group {
            width: 260px;
            margin: 0 auto;
        }

        #brd_btn {
             margin-top: 10px;
            width : 70px;
            font-family: "굴림";
            font-size: 20px;
        }

        .board_img {
            width: 750px;
        }
        .iframeBox{
        	position: relative;
        	width: 100%;
        	height: 510px;
        	
        }
        .iframeBox iframe{
        	position: absolute;
        	width: 95%;
        	height: 90%;
        }
        .wrapIframe{
        	height: 100%;
        	border-bottom: solid 1px;
        }
         .articlefrom001{
    		text-align: center;
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
								<li><a href="${contextPath}/education/edu_list.do">Education</a></li>
							</ul>
						</div>
						<!-- Bread Title -->
						<div class="bread-title">
							<h2>Education_lecture</h2>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 상단 배너 -->

<section class="features-area section-bg">
		<div class="container notice_detail" id="edu_table">
		 <h1 class="fs">${educationVO.cate_name}</h1>
			<div class="input-group input-group-sm mb-3 brd_title">
                    ${educationVO.edu_title}
             </div>
             <div class="input-group input-group-sm mb-3 brd_date">
                    ${educationVO.edu_pub_date }
               </div>
			<hr> 
				<div class="wrapIframe"> 
                <div class="iframeBox form-floating">${educationVO.edu_content} </div>
                <div>&nbsp</div>
                <div>&nbsp</div>
                <div>&nbsp</div>
                </div> 
            <br>
            
        <div id="articlefrom1" class="articlefrom001"> 
        	<button type="button" class="btn btn-light" id='brd_btn'onClick="location.href=' ${contextPath}/education/edu_list.do'" >목록보기</button>
        </div>  
		

</div>
</section>
</body>
</html>