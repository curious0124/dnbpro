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
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>
    <title>글목록창</title>
    <style>
        a{
            color: black;
            text-decoration: none;
        }
        .container{
            position: fixed;
            width: 825px;
        }
        .row{
            width: 825px;
            
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
            padding: 5px 0px 5px 0px;
           
        }
        
        #brd_div1{
            width: 30px;
        }
        #brd_div2{
            width: 90px;
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
            font-size:0.8em;
            
        }
    </style>
    <script src="js/jquery-3.5.1.min.js"></script>
<script>
    var path;
    $(function(){
        $("#addarticle").click(function(){
               path="admin_board_articleForm.html";
                evn();
            });      
    });
    
     function evn(){
           $.ajax({
                    type: "get",
                    url: path,
                    success: function(data){
                       $("#content_section_view").html(data); 
                    },
                    error: function(){
                        alert('에러');
                    }
                })   
        }
       
</script>
    
</head>
<body>
   
    <div class="container">
  <div id='top_buttonbox'>
       <button type="button" class="btn btn-light " id="addarticle">글쓰기</button>
       <button type="button" class="btn btn-light" id='delete'>삭제</button>
   </div>
  <div class="row">
    <div class="col_top" id="brd_div1">
      
    </div>
    <div class="col_top" id='brd_div2'>
      글 번호
    </div>
    <div class="col_top" id='brd_div3'>
      제목
    </div>
    <div class="col_top" id='brd_div4'>
      작성자
    </div>
    <div class="col_top" id='brd_div5'>
      작성일자
    </div>
    <div class="col_top" id='brd_div6'>
      
    </div>
  </div>
  
  <c:choose>
  
  <c:when test="${articlesList !=null }" >
    <c:forEach  var="article" items="${articlesList }" varStatus="articleNum" >
     <div class="row">
    <div class="col_list" id='brd_div1'>
      <input type="checkbox">
    </div>
    <div class="col_list" id='brd_div2'>
      ${articleNum.count}
    </div>
    <div class="col_list" id='brd_div3'>
        <a href="#">${article.board_title }</a>
    </div>
    <div class="col_list" id='brd_div4'>
      ${article.board_writer }
    </div>
    <div class="col_list" id='brd_div5'>
      ${article.board_date}
    </div>
    <div class="col_list" id='brd_div6'>
      <button type="button" class="btn btn-light" id='brd_btn'>수정</button>
    </div>
    
  </div>
    </c:forEach>
     </c:when>
  
  
  
  
  
  
  <c:when test="${articlesList ==null }" >
   <div class="row">
    <div class="col_list" id='brd_div1'>
      <input type="checkbox">
    </div>
    <div class="col_list" id='brd_div2'>
      
    </div>
    <div class="col_list" id='brd_div3'>
        <b>등록된 글이 없습니다.</b>
    </div>
    <div class="col_list" id='brd_div4'>
      
    </div>
    <div class="col_list" id='brd_div5'>
      
    </div>
    <div class="col_list" id='brd_div6'>
      
    </div>
    
  </div>
   
    
  </c:when>
    </c:choose>
  
  
</div>



</body>
</html>