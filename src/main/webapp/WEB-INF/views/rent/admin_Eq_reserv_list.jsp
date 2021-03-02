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
    <title>예약리스트</title>
    <style>
        #board_content{
            margin: 0 auto;
            width: 1100px;
            margin-top:50px;
        }    
       .board_container {
            margin: 0 auto;
            float: left;
            width: 850px;
            margin-left:20px;
        }

        .listrow {
            width: 850px;
            clear: both;
            text-align: center;
			margin-top:-10px;
        }

        .col_top {
            float: left;
            color: #2e2751;
            font-weight: bold;
            border-bottom:2px solid #2e2751;
            border-top:2px solid #2e2751;
        }

        .col_list {
            float: left;
            border-bottom:1px solid #f0f0f0;
            padding: 0px 0px 0px 0px;
        }
        
        .tit{
          font-size: 25px;
        }

        #brd_div1 {
            width: 100px;
        }

        #brd_div2 {
            width: 120px;
        }

        #brd_div3 {
            width: 140px;
        }

        #brd_div4 {
            width: 120px;
        }

        #brd_div5 {
            width: 120px;
        }

        #brd_div6 {
            width: 120px;
        }

        #brd_div7 {
            width: 120px;
        }
        #brd_btn {
            font-size: 0.5em;
            width: 50px;
            height: 10px;
            padding: 2px;
            line-height: 5px;
        }

    </style>
    <script src="${contextPath}/resources/js/jquery-3.5.1.min.js"> </script>
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4/jquery.min.js"></script>
 
     <script>
	$(function() {

		$(".ResStateupdate").click(
				function() {
					var answer = confirm("대여를 승인하시겠습니까?");
					if (answer == true) {

						
						var res_num = $(this).parent().find(
								"input:nth-child(2)").val();
						

				
						console.log(res_num);
						$("#AuthResnum").val(res_num);
					
						
					
						
						

						$("#ResupdateForm").submit();
					}
				});

	});
</script>
    <script>
	$(function() {

		$(".CancleRes").click(
				function() {
					var answer = confirm("예약을 취소하시겠습니까?");
					if (answer == true) {

						
						var res_num = $(this).parent().find(
								"input:nth-child(2)").val();

				
						console.log(res_num);
						$("#cancleResnum").val(res_num);
					
						
						

						$("#RescancleForm").submit();
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

<body>


    <div id='board_content'>
       <div id='menucontent'></div>

        <!--board_container -->
        <div class="board_container">
 			<div class="tit"><strong>예약 현황</strong></div><br>
            <div class="listrow">
                <div class="col_top" id='brd_div1'>예약번호</div>
                <div class="col_top" id='brd_div2'>아이디</div>
                <div class="col_top" id='brd_div3'>시리얼번호</div>
                <div class="col_top" id='brd_div4'>예약시작일</div>
                <div class="col_top" id='brd_div5'>예약반납일</div>
                <div class="col_top" id='brd_div6'>현황</div>
                <div class="col_top" id='brd_div7'>비고</div>
            </div>
  
            <c:choose>

                <c:when test="${listres !=null }">
                    <c:set var="relist" value="${listres }" />
                    <c:forEach var="relist" items="${listres }" varStatus="Res_Num">
                        <div class="listrow">
                            <div class="col_list" id='brd_div1'>
  <!--대여테이블로 넘기는 값 -->    <input type="text"  name="res_num" value="${relist.res_num}"   hidden  >
                                ${relist.res_num}
                            </div>
                            <div class="col_list" id="brd_div2">
                                ${relist.user_id}
                            </div>
                            <div class="col_list" id='brd_div3'>
                                ${relist.eq_serial}
                            </div>
                            <div class=" col_list" id='brd_div4'>
                                ${relist.res_start}
                            </div>
                            <div class="col_list" id='brd_div5'>
                               ${relist.res_end}
                            </div>
                            <div class="col_list" id='brd_div6'>
                            <input type="text"  name="res_Status" value="${relist.res_Status}"   hidden  >
                               ${relist.res_Status}
                            </div>
                            <div class="col_list" id='brd_div7' >
                                <button type="button" class="btn btn-light ResStateupdate" id='brd_btn'>대여승인</button>
                                <input type="hidden" value="${relist.res_num}" />
                               
                                <button type="button" class="btn btn-light CancleRes" id='brd_btn'>취소</button>
                                <input type="hidden" value="${relist.res_num}" />
                            </div>
                           
                        </div>
                    </c:forEach>
                </c:when>

                <c:when test="${listres ==null}">
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
    
    <form action="${contextPath}/rent/ResStateupdate.do" id="ResupdateForm" method="post" enctype="multipart/form-data">
		<input type="hidden" id="AuthResnum" name="AuthResnum" value="" />
		
		
	</form>
	

	
	<form action="${contextPath}/rent/CancleRes.do" id="RescancleForm" method="post">
		<input type="hidden" id="cancleResnum" name="Resnum" value="" />
	</form>
	
	
	
</body>

</html>
