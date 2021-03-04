<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<%
  request.setCharacterEncoding("UTF-8");
%>


<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>
    <title>시리얼명 등록</title>
    <!--제이쿼리 스크립트 !-->
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css" />
<script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
<!-- <script src="http://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script> -->
<script src="${contextPath}/resources/js/jquery-ui.js"> </script>
<!-- datepicker 한국어로 -->
<script
	src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/i18n/datepicker-ko.js"></script>
    
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
            margin-top: 60px;          
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
            width: 174px;
            text-align: left;
        }
        
        #brd_div3{
            width: 290px;
            text-align: left;
        }
        #brd_div4{
            width: 126px;
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
        	width: 175px;
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
  <script>
  $( function() {
    $( "#testDatepicker" ).datepicker({
    	changeMonth: true,
        changeYear: true,
    	dateFormat : "yy-mm-dd"		
    });
    	
  });
  </script>     
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
    <form action="${contextPath}/equip/addserialname.do" method="post">
		
            <div class="listrow">
                <p class="model_title">시리얼 등록</p>
            </div>
              <div class="listrow">
                    <div class="col_top" id='brd_div1'>
                       	 모델명
                    </div>
                     <div class="col_top" id='brd_div4'>
                     	<select name="eq_name" >
                            <option selected>모델명</option>
                             <c:forEach  var="equip" items="${eqnameonlyList }" varStatus="eqNum" >
                                        <option value="${equip.eq_name}">${equip.eq_name }</option>
                                       
                              </c:forEach>
                        </select>
                    </div>
                    
                    <div class="col_top" id='brd_div1'>
                       	 시리얼번호
                    </div>
                     <div class="col_top" id='brd_div2'>
                     	 <input type="text" name="eq_serial" class="text_box01">
                    </div>    
                  </div>
              <div class="listrow">
                    <div class="col_top" id='brd_div1'>
                       	  제조일
                    </div>
                     <div class="col_top" id='brd_div2'>
                     	<input type="text" name="eq_produc" class="text_box01" id="testDatepicker" autocomplete='off'>
                    </div>
                    
                    <div class="col_top" id='brd_div1'>
                       	  &nbsp;
                    </div>
                     <div class="col_top" id='brd_div1'>
                     	 &nbsp;
                    </div>    
                </div>
                 
                 <div class="listrow">
                    <input type="submit" class="btn btn-light " value="등록" /> &nbsp;
                    <input type="reset" class="btn btn-light " value="다시입력" /> &nbsp;
					<input type="button" class="btn btn-light fs" id='brd_btn' value="이전페이지" onClick="history.back()" />		
            </div>
            <div> &nbsp;</div>
            <div> &nbsp;</div>
            <div> &nbsp;</div>
            <div> &nbsp;</div>
    </form>
	</div>
</body>

</html>

