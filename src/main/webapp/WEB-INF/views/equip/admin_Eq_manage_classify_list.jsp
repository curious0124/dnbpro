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
    <title>분류명 리스트 페이지</title>
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
            width: 600px;  
            margin-top:-20px;          
        }
        .listrow{
            width: 400px;
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
            width: 300px;
        }
       
        #top_buttonbox{
            max-width: 400px;
            text-align: right;
            padding-right: 20px;
            margin:0 auto;
            margin-top: 20px;
            margin-bottom: 10px;
            
        }
        
    </style>
    <script src="${contextPath}/resources/js/jquery-3.5.1.min.js"> </script>
    <script>
    	$(function(){
    		$('#menucontent').load("${contextPath}/resources/subjsp/admin_menubar.jsp");
    		
    		$("#allCheck").click(function(){
    			 var chk = $("#allCheck").prop("checked");
    			 if(chk) {
    			  $(".chBox").prop("checked", true);
    			 } else {
    			  $(".chBox").prop("checked", false);
    			 }
    			});
    		
    		 $(".selectDelete_btn").click(function(){
    			  var confirm_val = confirm("정말 삭제하시겠습니까?");
    			  
    			  if(confirm_val) {
    			   var checkArr = new Array();
    			   
    			   $("input[class='chBox']:checked").each(function(){
    			    checkArr.push($(this).attr("value"));
    			   });   
    			    
    			   $.ajax({
    			    url : "${contextPath}/equip/deleteCatename.do",
    			    type : "post",
    			    data : { chbox : checkArr },
    			    success : function(){
    			     location.href = "${contextPath}/equip/admin_Eq_manage_classify_list.do";
    			    }
    			   });
    			  } 
    			 });
    		
    		
    	 });
	</script>
    
</head>
<body>
	<div id='board_content'>
		<!--menu bar -->
		<div id='menucontent'></div>
		
		<!--board_container -->
		<div class="board_container">
  			<div id='top_buttonbox'>
				<input  type="button" class="btn btn-light " value="새 등록" onclick="location.href='${contextPath}/equip/admin_Eq_manage_classify.do?cate_name=${equip.cate_name}'">
				<input type="button" class="btn btn-light selectDelete_btn " value="삭제" >
			</div>
			<div class="listrow">
				<div class="col_top allCheck" id="brd_div1">
					<input type="checkbox" name="allCheck" id="allCheck"  onclick="checkAll(this)">
				</div>
				<div class="col_top" id='brd_div2'>
					분류명
				</div>
			</div>
  <c:choose>
	<c:when test="${cateList !=null }" >
		<c:forEach  var="cate" items="${cateList }" varStatus="cateNum" >
			<div class="listrow">
				<div class="col_list checkBox" id='brd_div1'>
					<input type="checkbox" name="RowCheck" class="chBox" value="${cate.cate_name }" >
				</div>
    			<div class="col_list" id='brd_div2'>
					${cate.cate_name}
				</div>
			</div>
		</c:forEach>
	</c:when>
	<c:when test="${cateList == null }" >
   			<div class="listrow">
   				<div class="col_list checkBox" id='brd_div1'>
					&nbsp;
				</div>
    			<div class="col_list" id='brd_div2'>
    				등록된 카테고리가 없습니다.
				</div>
   			</div>
	</c:when>
  </c:choose>
  			<div id='top_buttonbox'>
				<input type="button"   class="btn btn-light fs" value="이전페이지" onClick="history.back()" />
			</div>
  
  
		</div>
   

</div>

</body>
</html>