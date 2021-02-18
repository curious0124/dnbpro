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
    <title>반납리스트</title>
    <style>
        #board_content {
            margin: 0 auto;
            width: 1950px;
            border: 1px solid red;
         
        }

        #admin_menu {
            margin: 0;
            font-size: 0.9em;
            padding: 0;
            width: 200px;
            margin-top: 45px;
            float: left;
        }

        #admin_menugroup {
            width: 200px;
            text-indent: 10px;
            margin: 0;
            padding: 0;
            
        }

        #main_menu {
            margin-bottom: 5px;
        }

        #admin_menugroup li {
            list-style: none;
        }

        .admin_menutitle {
            height: 35px;
            line-height: 35px;
            background: #FA8072;
            cursor: pointer;
            font-size: 1.1em;
            color: white;
            font-weight: bold;
            text-align: left;
        }

        .admin_menusub {
            margin: 0;
            padding: 0;
        }

        .admin_menusub li {
            margin-bottom: 2px;
            height: 35px;
            line-height: 35px;
            background: #a4a4a4;
            text-align: left;
            /*            margin-left: -32px;*/
        }

        .admin_menusub li a {
            text-decoration: none;
            display: block;
            width: 100%;
            height: 100%;
            color: white;
            text-indent: 40px;
        }

        .admin_menusub li a:hover {
            background: #FFF5EE;
            color: black;
            font-weight: bold;
        }

        a {
            color: black;
            text-decoration: none;
        }

        .board_container {
            margin: 0 auto;
            float: left;
            width: 1600px;
        }

        .listrow {
            width: 900px;
            clear: both;
            text-align: center;



        }

        .col_top {
            float: left;
            background: #FA8072;
            color: white;
            font-weight: bold;

        }

        .col_list {
            float: left;
            background: #FFF5EE;
            padding: 0px 0px 0px 0px;

        }

        #brd_div1 {
            width: 100px;
        }

        #brd_div2 {
            width: 120px;
            height: 24px;
        }

        #brd_div3 {
            width: 140px;
        }

        #brd_div4 {
            width: 120px;
             height: 24px;
        }

        #brd_div5 {
            width: 120px;
             height: 24px;
        }

        #brd_div6 {
            width: 120px;
             height: 24px;
        }

        #brd_div7 {
            width: 120px;
        }

        #top_buttonbox {
            min-width: 1200px;
            text-align: right;
            padding-right: 50px;
            margin-bottom: 8px;
        }

        #brd_btn {
            font-size: 0.5em;
            width: 50px;
            height: 10px;
            padding: 2px;
            line-height: 5px;

        }
        .tit{
          
          font-size: 25px;
        }
        

    </style>
    <script src="${contextPath}/resources/js/jquery-3.5.1.min.js"> </script>
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4/jquery.min.js"></script>
   

</head>

<body>
 <div class="tit"><strong>배송반납 현황</strong></div><br>
    <div id='board_content'>
       

        <!--board_container -->
        <div class="board_container">

            <div class="listrow">

                <div class="col_top" id='brd_div1'>
                    반납번호
                </div>
                <div class="col_top" id='brd_div2'>
                    예약번호
                </div>
                <div class="col_top" id='brd_div3'>
                    운송장번호
                </div>
                <div class="col_top" id='brd_div4'>
                   반납날짜
                </div>
                <div class="col_top" id='brd_div5'>
                    반납상태
                </div>
                <div class="col_top" id='brd_div6'>
                    아이디
                </div>
                <div class="col_top" id='brd_div7'>
                    비고
                </div>
            </div>

            <c:choose>

                <c:when test="${listreturn !=null }">
                    <c:set var="returnlist" value="${listreturn }" />
                    <c:forEach var="returnlist" items="${listreturn }" varStatus="Return_Num">
                        <div class="listrow">
                            <div class="col_list" id='brd_div1'>
                                ${returnlist.return_num}
                            </div>
                            <div class="col_list" id="brd_div2">
                                ${returnlist.res_num}
                            </div>
                            <div class="col_list" id='brd_div3'>
                                ${returnlist.express_num}
                            </div>
                            <div class=" col_list" id='brd_div4'>
                               ${returnlist.return_date}
                            </div>
                            <div class="col_list" id='brd_div5'>
                              ${returnlist.return_Status}
                            </div>
                            <div class="col_list" id='brd_div6'>
                               ${returnlist.user_id}
                            </div>
                            <div class="col_list" id='brd_div7'>
                                <button type="button" class="btn btn-light" id='brd_btn'>승인</button>
                                <button type="button" class="btn btn-light" id='brd_btn'>취소</button>
                            </div>

                        </div>
                    </c:forEach>
                </c:when>

                <c:when test="${listreturn ==null}">
                    <div class="listrow">
                        <div class="col_list" id='brd_div1'>
                            &nbsp;
                        </div>
                        <div class="col_list" id='brd_div2'>
                            &nbsp;
                        </div>
                        <div class="col_list" id='brd_div3'>
                            &nbsp;
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
                        <div class="col_list" id='brd_div7'>
                            &nbsp;
                        </div>
                    </div>
                </c:when>
            </c:choose>
        </div>
    </div>
</body>

</html>
