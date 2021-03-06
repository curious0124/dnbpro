<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
  request.setCharacterEncoding("UTF-8");
%> 
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />

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
            background: #2e2751;
            cursor: pointer;
            font-size:1.1em;
            color: white;
            font-weight: bold;
            text-align: left;font-family: 'YiSunShinDotumM';
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
            text-indent: 40px;font-family: 'YiSunShinDotumM';
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
    <script src="${contextPath}/resources/js/jquery-3.5.1.min.js"> </script>
    <script>
        $(function(){
            $('.admin_menusub').hide();

            $('.main_menu').click(function(){
                $('.admin_menusub').hide();
                $(this).find('ul').show();
            });
            
       
            
        });
        
        
    </script>
</head>
<body>
   <div id='admin_menu'>
    <ul id="admin_menugroup">
       <li class="main_menu">
            <div class="admin_menutitle">장비관리</div>
            <ul class="admin_menusub">
                <li class="admin_menusubli"><a href="${contextPath}/equip/admin_Eq_manage_list.do">보유장비 등록/관리</a></li>
                <li class="admin_menusubli"><a href="${contextPath}/rent/admin_Eq_reserv_apply.do">예약신청 관리</a></li>
                <li class="admin_menusubli"><a href="${contextPath}/rent/admin_Eq_reserv_list.do">예약 관리</a></li>
                <li class="admin_menusubli"><a href="${contextPath}/rent/admin_Eq_rent_list.do">대여/반납 관리</a></li>
                <li class="admin_menusubli"><a href="${contextPath}/rent/admin_Eq_return_list.do">배송반납 신청 리스트</a></li>
                 <li class="admin_menusubli"><a href="${contextPath}/rent/listlogs.do">사용자 로그조회</a></li>
                <li class="admin_menusubli"><a href="${contextPath}/education/edu_admin_list.do">교육 등록/관리</a></li>

            </ul>
        </li>
        
        
        
        <li class="main_menu">
            <div class="admin_menutitle">회원관리</div>
            <ul class="admin_menusub">
                <li class="admin_menusubli"><a href="${contextPath}/mem_manage/mem_list.do">회원목록</a></li>
            </ul>
        </li>
        <li class="main_menu">
            <div class="admin_menutitle">사이트관리</div>
            <ul class="admin_menusub">
                <li class="admin_menusubli"id="notice"><a href="${contextPath}/board/admin_board_list.do?brd_num=1">공지사항 관리</a></li>
                <li class="admin_menusubli"id="FAQ"><a href="${contextPath}/board/admin_board_list.do?brd_num=2">FAQ 관리</a></li>
                <li class="admin_menusubli"id="banner"><a href="${contextPath}/board/admin_board_list.do?brd_num=3">배너 관리</a></li>
                <li class="admin_menusubli"id="notice"><a href="${contextPath}/board/admin_board_list.do?brd_num=4">사업소개 관리</a></li>
                <li class="admin_menusubli"id="notice"><a href="${contextPath}/board/admin_board_list.do?brd_num=5">홍보영상 관리</a></li>
                <li class="admin_menusubli"id="notice"><a href="${contextPath}/board/admin_board_list.do?brd_num=6">지원서비스 관리</a></li>
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