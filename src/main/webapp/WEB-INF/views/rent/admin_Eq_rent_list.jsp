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
    <title>대여리스트</title>
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
   
<script>
	$(function() {
		$(".ReturnRenting").click(
				function() {
					var answer = confirm("반납을 승인하시겠습니까?");
					if (answer == true) {

						
						var res_num = $(this).parent().find(
								"input:nth-child(2)").val();

				
						console.log(res_num);
						$("#Resreturnnum").val(res_num);
						

					$("#ReturnauthForm").submit();
					}
				});

	});
</script>
<script>
$(function() {
	$('#menucontent').load("${contextPath}/resources/subjsp/admin_menubar.jsp");
	});

</script>
</head>
<div id='menucontent'></div>
<body>
<div class="tit"><strong>대여 현황</strong></div><br>
    <div id='board_content'>
       

        <!--board_container -->
        <div class="board_container">

            <div class="listrow">

                <div class="col_top" id='brd_div1'>
                    예약번호
                </div>
                <div class="col_top" id='brd_div2'>
                    아이디
                </div>
                <div class="col_top" id='brd_div3'>
                    시리얼번호
                </div>
                <div class="col_top" id='brd_div4'>
                    예약시작일
                </div>
                <div class="col_top" id='brd_div5'>
                    예약반납일
                </div>
                <div class="col_top" id='brd_div6'>
                    현황
                </div>
                <div class="col_top" id='brd_div7'>
                    비고
                </div>
            </div>

            <c:choose>

                <c:when test="${listrent !=null }">
                    <c:set var="List" value="${listrent }" />
                    <c:forEach var="List" items="${listrent }" varStatus="Rent_Num">
                        <div class="listrow">
                            <div class="col_list" id='brd_div1'>
                                ${List.res_num}
                            </div>
                            <div class="col_list" id="brd_div2">
                                ${List.user_id}
                            </div>
                            <div class="col_list" id='brd_div3'>
                                ${List.eq_serial}
                            </div>
                            <div class=" col_list" id='brd_div4'>
                                <fmt:formatDate pattern="yyyy-MM-dd" value="${List.res_start}" />
                            </div>
                            <div class="col_list" id='brd_div5'>
                                <fmt:formatDate pattern="yyyy-MM-dd" value="${List.res_end}" />
                            </div>
                            <div class="col_list" id='brd_div6'>
                               ${List.res_Status}
                            </div>
                            <div class="col_list" id='brd_div7'>
                                <button type="button" class="btn btn-light ReturnRenting" id='brd_btn'>반납승인</button>
                                 <input type="hidden" value="${List.res_num}"/>
                            </div>

                        </div>
                    </c:forEach>
                </c:when>

                <c:when test="${listrent ==null}">
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
    <form action="${contextPath}/rent/ReturnRenting.do" id="ReturnauthForm" method="post">
		<input type="hidden" id="Resreturnnum" name="Resnum" value="" />
	</form>
</body>

</html>
