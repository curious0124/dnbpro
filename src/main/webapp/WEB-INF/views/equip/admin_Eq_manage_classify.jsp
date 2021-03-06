<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"
   isELIgnored="false"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<%
  request.setCharacterEncoding("UTF-8");
%>


<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>
    <title>분류명 등록</title>
    
   <style>
    	body {
            background: #f4f9fc;
        }
    	#board_content{
            margin: 0 auto;
            margin-top: 20px;
            width: 850px;
        }
        
        a{
            color: black;
            text-decoration: none;
        }
        .board_container{
            margin:0 auto;
            float: left;
            width: 650px;  
            margin-top: 45px;          
        }
        .listrow{
            width: 500px;
            clear:both;
            text-align: center;
            margin:0 auto;
            
            
            
        }
        .col_top{
            float: left;
            color: #2e2751;
            font-weight: bold;
            border-bottom:2px solid #2e2751;
            border-top:2px solid #2e2751;
            margin-bottom: 10px;
            
        }
        .col_list{
            float: left;
            border-bottom:1px solid #f0f0f0;
            padding: 0px 0px 0px 0px;
           
        }
        
       
        .checkBox { 
        float:left; 
        }
        
        #brd_div1{
            width: 100px;
        }
        #brd_div2{
            width: 400px;
            text-align: left;
        }
        
        #brd_div3{
            width: 290px;
            text-align: left;
        }
        #brd_div4{
            width: 100px;
            text-align: right;
        }
       
        #top_buttonbox{
            max-width: 400px;
            text-align: right;
            padding-right: 20px;
            margin:0 auto;
            margin-top: 20px;
            margin-bottom: 10px;
            
        }
        .text_box01{
        	width: 201px;
        	height: 20px;
        	padding: 0;
        }
        .img_box01{
        	width: 201px;
        	height: 30px;
        	vertical-align: top;
        	font-size: 16px;
        	padding: 0;
        }
        
        #articlefrom1{
        	width: 400px;
        }
        .articlefrom001{
        	text-align: center;
        }
        .btn_box001{
        	width: 400px;
        	text-align: center;
			margin-left: 50px;
        }
        .model_title{
        	text-align: left;
        	font-size: 25px;
        	margin-top: -53px;
        }
    </style>
    
    <script src="${contextPath}/resources/js/jquery-3.5.1.min.js"> </script>
    <script>
    $(function(){
		$('#menucontent').load("${contextPath}/resources/subjsp/admin_menubar.jsp");
    
		
    });

    </script>

</head>

<body>
	<div id='board_content'>
		<!--menu bar -->
		<div id='menucontent'></div>
		
		<!--board_container -->
		<div class="board_container">
    <form  action="${contextPath}/equip/addcatename.do" method="post">
               
                <div class="listrow">
                   
                    <div class="col_top" id='brd_div2'>
                       		분류명 등록
                    </div>

                </div>
                
				
                <div class="listrow">

                    <span class="col_list" id='brd_div3'>
                        <input type="text" class="text_box01" name="cate_name" placeholder="분류명을 입력해 주세요.">
                    </span>
                    <span class="col_list" id='brd_div4'>
						<input type="submit" class="btn btn-light " value="분류명등록" /> 
                    </span>
                    

                </div>
                    
    </form>
    
    <div class="btn_box001 board_container">
     <input type="reset"  " class="btn btn-light " value="다시입력" />
     &nbsp;&nbsp;
     <input type="button" " class="btn btn-light " value="목록보기" onClick="history.back()" />
	</div>
	</div>
	</div>
</body>

</html>
