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
<html lang="en">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
<head>
    <meta charset="UTF-8">
       
    <title>장비리스트</title>


<style>
    .d {
        float: left
    }

    .d1 {
        width: 150px;

    }

    .d2 {
        width: 200px;
    }

    .d3 {
        width: 550px;
    }
    .d4{
        width: 32px;
    }

    .td1 {
        width: 100px;
        text-align: center;
        border: "1";
    }
     #listPaging{  clear:both; text-align:center;}
        #listPaging > ul{margin:0 auto;}
        #listPaging > ul > li{
        	list-style: none; float: left; padding: 6px;
        	}
        	 #admin_menu{
            margin: 0;
            font-size: 0.9em;
            padding: 0;
            width:200px;
            margin-top: 46px;
            float: left;
        }
        #admin_menugroup{
            width:200px;
            text-indent: 10px;
            margin: 0;
            padding: 0;
        }
        #main_menu{
            margin-bottom:  5px;
        }
        #admin_menugroup li{
            list-style: none;
        }
        .admin_menutitle{
            height: 35px;
            line-height: 35px;	
            
           
            font-size:1.1em;
            color: white;
            font-weight: bold;
            text-align: left;
            background: #FA8072;
             cursor: pointer;
        }
        .admin_menusub{
            margin: 0;
            padding: 0;
        }
        .listrow li{
            margin-bottom: 2px;
            height: 35px;
            line-height: 35px;
            background: #a4a4a4;
            text-align: left;
/*            margin-left: -32px;*/
        }
        .listrow li a{
            text-decoration: none;
            display: block;
            width:100%;
            height:100%;
            color: white;
            text-indent: 40px;
        }
        .listrow li a:hover{
            background: #FFF5EE;
            color: black;
            font-weight: bold;
        }
        .listrow li{
            margin-bottom: 2px;
            height: 35px;
            line-height: 35px;
            background: #a4a4a4;
            text-align: left;
/*            margin-left: -32px;*/
        }
        .listrow li a{
            text-decoration: none;
            display: block;
            width:100%;
            height:100%;
            color: white;
            text-indent: 40px;
        }

</style>
<script src="${contextPath}/resources/js/jquery-3.5.1.min.js"> </script>
   <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4/jquery.min.js"></script>



</head>

<body>

  
    
       
       
   
 





    

<div class="container">

  
  
  <div class="row align-items-start">
    <div class="col">
     모델명
    </div>
    <div class="col">
     썸네일
    </div>
     <div class="col">
     분류명
    </div>
  
    <div class="col">
   제조사
    </div>
  </div>
    <hr width="100%">
 
    <c:choose>
        <c:when test="${listequips !=null }">
            <c:forEach var="equip" items="${listequips }">
 
  <div class="row align-items-center">
    <div class="col">
      <a href="${contextPath}/equip/view_Eq_detail.do?eq_name=${equip.eq_name}">${equip.eq_name}&nbsp;</a>
    </div>
    <div class="col">
    <input  type= "hidden"   name="originalFileName" value="${equip.eq_thumimg}" /> 
	<img src="${contextPath}/equipthumimg_download.do?eq_name=${equip.eq_name}&eq_thumimg=${equip.eq_thumimg}" id="preview"  />
    </div>
     <div class="col">
    ${equip.cate_name}
    </div>
    <div class="col">
    ${equip.eq_ma}
    </div>
  </div>
  
            </c:forEach>
              
        </c:when>
        <c:when test="${listequips ==null }">

    <div class="col">
    등록된장비가없습니다
    </div>
      </c:when>
    </c:choose>
    <hr width="100%">

    
    
</div>

   
</body>

</html>
