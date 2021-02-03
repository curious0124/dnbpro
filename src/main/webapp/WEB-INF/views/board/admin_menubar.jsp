<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"   isELIgnored="false"  %>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>


<%
  request.setCharacterEncoding("UTF-8");
%>    

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>admin_menubar</title>
    <style>
       

        #admin_menu{
            margin: 0;
            font-size: 0.9em;
            padding: 0;
            width:200px;
            margin-top: 95px;
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
        
        
/*
        #admin_contents{
            border: 1px solid red;
            float: left;
        }
*/
    </style>
    <script src="js/jquery-3.5.1.min.js"></script>
    <script>
        $(function(){
            $('.admin_menusub').hide();

            $('.main_menu').click(function(){
                $('.admin_menusub').hide();
                $(this).find('ul').show();
            });
            
        $("#notice").click(function(){
               path="admin_board_list.html";
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
                <li class="admin_menusubli"id="notice"><a href="#">홍보영상 관리</a></li>
                <li class="admin_menusubli"id="notice"><a href="#">사업소개 관리</a></li>
                <li class="admin_menusubli"id="notice"><a href="#">지원서비스 관리</a></li>
            </ul>
        </li>
        
    </ul>
    </div>
<!--
    <div id='admin_contents'>
        
    </div>
-->
</body>
</html>