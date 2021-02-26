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
    <title>예약신청리스트</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>
   
		<link rel="stylesheet" href="http://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css"/>
  		<script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
		<script src="http://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
		<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/i18n/datepicker-ko.js"></script>
    
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
      
<!--	    	<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4/jquery.min.js"></script>-->
   <script>
   $(document).ready(function() {
	$('#menucontent').load("${contextPath}/resources/subjsp/admin_menubar.jsp");
	
	$(".Authres").click(
			function() {
				var answer = confirm("예약신청을 승인하시겠습니까?");
				if (answer == true) {

					
					var resq_num = $(this).parent().find(
							"input:nth-child(2)").val();
					console.log(resq_num);
					var resq_start = $(this).parent().find(
					"input:nth-child(3)").val();
					    
					var resq_end = $(this).parent().find(
					"input:nth-child(4)").val();
					var eq_serial = $(this).parent().find(
					"input:nth-child(5)").val();					

					
					$("#Resqnum").val(resq_num);
					$("#Resqstart").val(resq_start);
					$("#Resqend").val(resq_end);
					$("#Eqserial").val(eq_serial);

				$("#ResauthForm").submit();
				}
			});
	
	});	
</script>
</head>


<body>
    <div id='board_content'>
      <div id='menucontent'></div>
		
        <!--board_container -->
        <div class="board_container">
			<div class="tit"><strong>예약 신청 관리</strong></div><br>
            <div class="listrow">

                <div class="col_top" id='brd_div1'>
                    예약신청번호
                </div>
                <div class="col_top" id='brd_div2'>
                    아이디
                </div>
                <div class="col_top" id='brd_div3'>
                    시리얼번호
                </div>
                <div class="col_top" id='brd_div4'>
                    신청예약일
                </div>
                <div class="col_top" id='brd_div5'>
                    신청반납일
                </div>
                <div class="col_top" id='brd_div6'>
                    예약신청일
                </div>
                <div class="col_top" id='brd_div7'>
                    확인
                </div>
                
            </div>

            <c:choose>

                <c:when test="${listresqs !=null }">
                    <c:set var="List" value="${listresqs }" />
                    <c:forEach var="List" items="${listresqs }" varStatus="Resq_Num">
                        <div class="listrow">
                            <div class="col_list " id='brd_div1'>
                                ${List.resq_num}
                            </div>
                            <div class="col_list" id="brd_div2">
                                ${List.user_id}
                            </div>
                            <div class="col_list" id='brd_div3'>
                                ${List.eq_serial}
                            </div>
                            <div class=" col_list " id='brd_div4'>
                                ${List.resq_start}
                            </div>
                            <div class="col_list " id='brd_div5'>
                                ${List.resq_end}
                            </div>
                            <div class="col_list" id='brd_div6'>
                               ${List.resq_date}
                            </div>
                            <div class="col_list" id='brd_div7'>
                                <button type="button" class="btn btn-light Authres" id='brd_btn'>승인</button>
                                <input type="hidden" id="resq_num" value="${List.resq_num}"/>
                                <input type="hidden" id="resq_start" value="${List.resq_start}"/>
                                <input type="hidden" id="resq_end" value="${List.resq_end}"/>
                                <input type="hidden" id="eq_serial" value="${List.eq_serial}"/>
                               
                                 <button type="button" class="btn btn-light CancleResq" id='brd_btn'>취소</button>
                                 <input type="hidden" id="resq_num" value="${List.resq_num}"/>
                                  
                            </div>
                            
                        </div>
                    </c:forEach>
                </c:when>

                <c:when test="${listresqs ==null}">
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
    
    <form action="${contextPath}/rent/AuthRes.do" id="ResauthForm" method="post">
		<input type="hidden" id="Resqnum" name="Resqnum" value="" />
		<input type="hidden"  id="Resqstart" name="Resqstart"  value="" />
        <input type="hidden"   id="Resqend" name="Resqend"  value="" />
        <input type="hidden"   id="Eqserial" name="Eqserial"  value="" />
	</form>
	 
	 <form action="${contextPath}/rent/CancleResq.do" id="ResqcancleForm" method="post">
		<input type="hidden" id="cancleResqnum" name="Resqnum" value="" />
	</form>
	
	<div>
	
	</div>
    
</body>

</html>
