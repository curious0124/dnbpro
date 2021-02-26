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

<title>admin_board_articleForm</title>
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
            margin-top: 50px;
        }

        .board_img {
            width: 750px;
        }

    </style>
<script src="${contextPath}/resources/js/jquery-3.5.1.min.js">
	
</script>
<script>
	
</script>

</head>
<body>
<section class="features-area section-bg">
		<div class="container notice_detail" id="edu_table">
          
                <h1 class="fs">${article.brd_name }</h1>
                <div class="input-group input-group-sm mb-3 brd_title">
                    ${article.board_title }
                </div>
	            <div class="input-group input-group-sm mb-3 brd_date">
                    ${article.board_date }
                </div>
            <hr>   
                <div class="form-floating">${article.board_content } </div>
            <br>
               <c:choose>
                    <c:when test="${not empty article.board_img && article.board_img!='null' }">
				
                        <input type="hidden" name="originalFileName" value="${article.board_img }" />
                        <img src="${contextPath}/download.do?board_num=${article.board_num}&board_img=${article.board_img}" class="board_img" id="preview" /><br>
				 
                    </c:when>
                    <c:otherwise>
                    </c:otherwise>
                </c:choose>

            <br><br>
            
                <div class="brd_btn_group">
                    <input type=button value="목록보기" onclick="history.back(-1);" />
                </div>
         
    </div>
	</section>

</body>
</html>