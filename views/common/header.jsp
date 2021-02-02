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
<html>
<head>
  <meta charset="UTF-8">
<title>헤더</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>
<style>
    /*
    * {
        border: 1px solid red;
    }
*/

    #headerall {
        background: #f6f6f6;
        
    }

    #header_top {
        text-align: right;
        background: #fb9fa9;
    }

    #logo {
        width: 150px;
    }

    #header_ser {
        text-align: center;
        margin-top: -40px;
        margin-bottom: 50px;
    }
    #header_menu{
        background: #621920;
    }

    .dropbtn {
        background-color: #621920;
        color: white;
        padding: 16px;
        font-size: 16px;
        border: none;
    }

    .dropdown {
        position: relative;
        display: inline-block;
    }

    .dropdown-content {
        display: none;
        position: absolute;
        background-color: #f1f1f1;
        min-width: 160px;
        box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
        z-index: 1;
    }

    .dropdown-content a {
        color: black;
        padding: 12px 16px;
        text-decoration: none;
        display: block;
    }

    .dropdown-content a:hover {
        background-color: #ddd;
    }

    .dropdown:hover .dropdown-content {
        display: block;
    }

    .dropdown:hover .dropbtn {
        background-color: #3e8e41;
    }
</style>
</head>
<body>
<div id="headerall">



        <div class="row" id="header_top">
            <div class="col-md-12">
                <a href="#">로그인</a>
                <span>/</span>
                <a href="#">회원가입</a>
            </div>
        </div>


        <div class="row">
            <div class="col-6 col-md-1">
                <img id="logo" src="${contextPath}/resources/image/logo.png">
            </div>
        </div>


        <div class="row">
            <div class="col-">
                <div class="container">
                    <div class="row" id="header_ser">
                        <div class="col-xs-8 col-xs-offset-2">

                            <!-- 검색창 !-->
                            <div class="input-group">
                                <div class="input-group-btn search-panel">
                                    <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
                                        <span id="search_concept">통합검색</span>

                                    </button>
                                    <ul class="dropdown-menu" role="menu">
                                        <li><a href="#contains">작성자</a></li>
                                        <li><a href="#its_equal">제목</a></li>
                                    </ul>
                                </div>
                                <input type="hidden" name="search_param" value="all" id="search_param">
                                <input type="text" class="form-control" name="x" placeholder="Search term...">
                                <span class="input-group-btn">
                                    <button class="btn btn-default" type="button"><span class="glyphicon glyphicon-search"></span></button>
                                </span>
                            </div>
                            <!-- 검색창끝 !-->

                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="row" id="header_menu">
            <div class="col">

                <div class="dropdown">
                    <button class="dropbtn">센터 소개</button>
                    <div class="dropdown-content">
                        <a href="#">사업소개</a>
                        <a href="#">홍보영상</a>
                        <a href="#">지원소개</a>
                        <a href="#">오시는길</a>
                    </div>
                </div>
            </div>
            <div class="col">

                <div class="dropdown">
                    <button class="dropbtn">장비 예약</button>
                    <div class="dropdown-content">
                        <a href="#">사업소개</a>
                        <a href="#">홍보영상</a>
                        <a href="#">지원소개</a>
                        <a href="#">오시는길</a>
                    </div>
                </div>

            </div>
            <div class="col">

                <div class="dropdown">
                    <button class="dropbtn">장비 교육</button>
                    <div class="dropdown-content">
                        <a href="#">사업소개</a>
                        <a href="#">홍보영상</a>
                        <a href="#">지원소개</a>
                        <a href="#">오시는길</a>
                    </div>
                </div>

            </div>
            <div class="col">

                <div class="dropdown">
                    <button class="dropbtn">고객 지원</button>
                    <div class="dropdown-content">
                        <a href="#">사업소개</a>
                        <a href="#">홍보영상</a>
                        <a href="#">지원소개</a>
                        <a href="#">오시는길</a>
                    </div>
                </div>

            </div>
        </div>




    </div>

</body>
</html>