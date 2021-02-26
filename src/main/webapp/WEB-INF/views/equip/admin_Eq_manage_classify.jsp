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
<html>

<head>
    <meta charset="UTF-8">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>
    <title>분류명 등록</title>
    <style>
        #board_content {
            margin: 0 auto;
            width: 1050px;
        }

        a {
            color: black;
            text-decoration: none;
        }

        .board_container {
            margin: 0 auto;
            float: left;
            width: 825px;

        }

        .listrow {
            width: 825px;
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
            width: 30px;
        }

        #brd_div2 {
            width: 250px;
        }

        #brd_div3 {
            width: 400px;
        }

        #brd_div4 {
            width: 100px;
        }

        #brd_div5 {
            width: 120px;
        }

        #brd_div6 {
            width: 80px;
        }

        #top_buttonbox {
            min-width: 800px;
            text-align: right;
            padding-right: 50px;
            margin-bottom: 8px;
        }

        #brd_btn {
            font-size: 0.5em;
            width: 50px;
            height: 30px;
            padding: 2px;
            line-height: 5px;

        }

    </style>
    <script src="${contextPath}/resources/js/jquery-3.5.1.min.js"> </script>
    <script>


    </script>

</head>

<body>
    <form  action="${contextPath}/equip/addcatename.do" method="post">

        <div>

            <div>
                <strong>분류 등록</strong>
            </div>


            <!--board_container -->
            <div class="board_container">
                <div id='top_buttonbox'>

                    <input type="submit" value="분류명등록" /> <input type="reset" value="다시입력" />

                </div>
                <div class="listrow">
                    <div class="col_top" id="brd_div1">
                        &nbsp;
                    </div>
                    <div class="col_top" id='brd_div2'>
                        분류명
                    </div>


                </div>

                <div class="listrow">

                    <div class="col_list" id='brd_div2'>
                        <input type="text" name="cate_name">
                    </div>

                </div>


            </div>

        </div>
    </form>
     <input type="button"   class="btn btn-light fs" id='brd_btn' value="목록보기" onClick="history.back()" />
</body>

</html>
