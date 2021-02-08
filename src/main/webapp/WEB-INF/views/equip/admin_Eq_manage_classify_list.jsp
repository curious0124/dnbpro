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
<head>
    <meta charset="UTF-8">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>
    <title>admin_board_list</title>
    <style>
    #board_content{
            margin: 0 auto;
            width: 1050px;
        }
        
        a{
            color: black;
            text-decoration: none;
        }
        .board_container{
            margin:0 auto;
            float: left;
            width: 825px;
            
        }
        .listrow{
            width: 825px;
            clear:both;
            text-align: center;
            
            
            
        }
        .col_top{
            float: left;
            background: #FA8072;
            color: white;
            font-weight: bold;
            
        }
        .col_list{
            float: left;
            background: #FFF5EE;
            padding: 0px 0px 0px 0px;
           
        }
        
       
        .checkBox { 
        float:left; 
        }
        #brd_div1{
            width: 100px;
        }
        #brd_div2{
            width: 250px;
        }
        #brd_div3{
            width: 400px;
        }
        #brd_div4{
            width: 100px;
        }
        #brd_div5{
            width: 120px;
        }
        #brd_div6{
            width: 80px;
        }
        #top_buttonbox{
            min-width: 800px;
            text-align: right;
            padding-right: 50px;
            margin-bottom: 8px;
        }
        #brd_btn{
            font-size:0.5em;
            width:50px;
            height:10px;
            padding: 2px;
            line-height:5px;
            
        }
    </style>
     <script  src="http://code.jquery.com/jquery-latest.min.js"></script>


          <script>
          function checkAll(){
              if( $(".allCheck").is(':checked') ){
                $("input[name=chBox]").prop("checked", true);
              }else{
                $("input[name=chBox]").prop("checked", false);
              }
       
          
            
          
          }
          
       </script>
    
</head>
<body>
   <div>
   
   <div >
   <strong>분류 목록</strong>
   </div>
       
   <form action="${contextPath}"  method="post">
    <!--board_container -->
    <div class="board_container">
  <div id='top_buttonbox'>
  		
       <button  type="button" class="btn btn-light " id="addcatename" onclick="location.href='${contextPath}/equip/admin_Eq_manage_classify.do?cate_name=${equip.cate_name}'">등록</button>
       <input type="button" class="btn btn-light" id='delete_btn' value="삭제하기" onClick="fn_removecatename('${contextPath}/equip/removecatename.do',${cate.cate_name })" >
   </div>
  <div class="listrow">
    <div class="col_top allCheck" id="brd_div1">
       <input type="checkbox" name="allCheck" id="allCheck" class="allCheck" onclick="checkAll()"> 모두 선택


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
      <input type="checkbox" name="chBox" class="chBox" value="${cate.cate_name }" >
      


    </div>
    <div class="col_list" id='brd_div2'>
     ${cate.cate_name}
    </div>
  
    
  </div>
    </c:forEach>
     </c:when>
  
  
  
  
  
  
  <c:when test="${cateList == null }" >
   <div class="listrow">
    
    
  </div>
   
    
  </c:when>
    </c:choose>
  
  
</div>
</form>

</div>

</body>
</html>