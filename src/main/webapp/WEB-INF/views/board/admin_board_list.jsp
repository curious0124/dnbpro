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
    <title>admin_board_list</title>
    <style>
    #board_content{
            margin: 0 auto;
            width: 1050px;
            border:1px solid red;
        }
        #admin_menu{
            margin: 0;
            font-size: 0.9em;
            padding: 0;
            width:200px;
            margin-top: 45px;
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
            background: #FA8072;
            cursor: pointer;
            font-size:1.1em;
            color: white;
            font-weight: bold;
            text-align: left;
        }
        .admin_menusub{
            margin: 0;
            padding: 0;
        }
        .admin_menusub li{
            margin-bottom: 2px;
            height: 35px;
            line-height: 35px;
            background: #a4a4a4;
            text-align: left;
/*            margin-left: -32px;*/
        }
        .admin_menusub li a{
            text-decoration: none;
            display: block;
            width:100%;
            height:100%;
            color: white;
            text-indent: 40px;
        }
        .admin_menusub li a:hover{
            background: #FFF5EE;
            color: black;
            font-weight: bold;
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
            font-size:0.5em;
            width:50px;
            height:10px;
            padding: 2px;
            line-height:5px;
            
        }
    </style>
     <script src="${contextPath}/resources/js/jquery-3.5.1.min.js"> </script>
<script>
    var path;
    $(function(){
        
        
            $('.admin_menusub').hide();

            $('.main_menu').click(function(){
                $('.admin_menusub').hide();
                $(this).find('ul').show();
            });
        
//       
//        $("#addarticle").click(function(){
//               path="admin_board_articleForm.html";
//                evn();
//                 
        
        
       
         
        
    });
//     function evn(){
//           $.ajax({
//                    type: "get",
//                    url: path,
//                    success: function(data){
//                       $("#content_section_view").html(data); 
//                    },
//                    error: function(){
//                        alert('에러');
//                    }
//                })   
//        }
       
</script>
    
</head>
<body>
   <div id='board_content'>
   <!--menu bar -->
   <div id='admin_menu'>
    <ul id="admin_menugroup">
       <li class="main_menu">
            <div class="admin_menutitle">장비관리</div>
            <ul class="admin_menusub">
                <li class="admin_menusubli"><a href="#">보유장비 등록/관리</a></li>
                <li class="admin_menusubli"><a href="#">예약신청 관리</a></li>
                <li class="admin_menusubli"><a href="#">예약/대여/반납 관리</a></li>
                <li class="admin_menusubli"><a href="#">배송반납 신청 리스트</a></li>
                <li class="admin_menusubli"><a href="#">교육 등록/관리</a></li>
            </ul>
        </li>
        <li class="main_menu">
            <div class="admin_menutitle">회원관리</div>
            <ul class="admin_menusub">
                <li class="admin_menusubli"><a href="#">회원목록</a></li>
                
            </ul>
        </li>
        <li class="main_menu">
            <div class="admin_menutitle">사이트관리</div>
            <ul class="admin_menusub">
                <li class="admin_menusubli"id="notice"><a href="#">공지사항 관리</a></li>
                <li class="admin_menusubli"id="FAQ"><a href="#">FAQ 관리</a></li>
                <li class="admin_menusubli"id="notice"><a href="#">배너 관리</a></li>
                <li class="admin_menusubli"id="notice"><a href="#">사업소개 관리</a></li>
                <li class="admin_menusubli"id="notice"><a href="#">홍보영상 관리</a></li>
                <li class="admin_menusubli"id="notice"><a href="#">지원서비스 관리</a></li>
            </ul>
        </li>
        
    </ul>
    </div>
    
    
    
    <!--board_container -->
    <div class="board_container">
  <div id='top_buttonbox'>
  		"${articlesList[0].brd_name}"
       <button type="button" class="btn btn-light " id="addarticle">글쓰기</button>
       <button type="button" class="btn btn-light" id='delete'>삭제</button>
   </div>
  <div class="listrow">
    <div class="col_top" id="brd_div1">
      &nbsp;
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
      &nbsp;
    </div>
  </div>
  
  <c:choose>
  
  <c:when test="${articlesList !=null }" >
  
    <c:forEach  var="article" items="${articlesList }" varStatus="articleNum" >
     <div class="listrow">
    <div class="col_list" id='brd_div1'>
      <input type="checkbox">
    </div>
    <div class="col_list" id='brd_div2'>
      ${articleNum.count}
    </div>
    <div class="col_list" id='brd_div3'>
        <a href="#">${article.board_title }</a>${article.brd_name}
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
   <div class="listrow">
    <div class="col_list" id='brd_div1'>
      &nbsp;
    </div>
    <div class="col_list" id='brd_div2'>
      &nbsp;
    </div>
    <div class="col_list" id='brd_div3'>
        <b>등록된 글이 없습니다.</b>
    </div>
    <div class="col_list" id='brd_div4'>
      &nbsp;
    </div>
    <div class="col_list" id='brd_div5'>
      &nbsp;
    </div>
    <div class="col_list" id='brd_div6'>
      &nbsp;
    </div>
    
  </div>
   
    
  </c:when>
    </c:choose>
  
  
</div>


</div>
</body>
</html>