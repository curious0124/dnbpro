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
<html>

<head>
    <meta charset="UTF-8">
     <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>
    <title>Document</title>
    <style>
    #content{
     background-color: white;
    }
     #board_content{
            margin: 0 auto;
            width: 1650px;
            margin-top:50px;
           
           
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

        }
        .admin_menusub li a{
            text-decoration: none;
            display: block;
            width:100%;
            height:100%;
            color: white;
            text-indent: 40px;
        }
      
        a{
            color: black;
            text-decoration: none;
        }
        .board_container{
            margin:0 auto;
            float: left;
            width: 825px;
             margin-left:20px;
        }
        .listrow{
            width: 825px;
            clear:both;
            text-align: center;
            
        }
      
      
        
         #brd_div1 {
            width: 80px;
            height:27px;
        }
         #brd_div2 {
            width: 100px;
            height:27px;
        }
         #brd_div3 {
            width: 80px;
            height:27px;
        }
         #brd_div4 {
            width: 100px;
            height:27px;
        }
         #brd_div5 {
            width: 100px;
            height:27px;
        }
         #brd_div6 {
            width: 100px;
            height:27px;
        }
         #brd_div7 {
            width: 100px;
            height:27px;
        }
         #brd_div8 {
            width: 100px;
            height:27px;
        }
         #brd_div9 {
            width: 100px;
            height:27px;
        }
      
       #brd_div10 {
            width: 150px;
            height:27px;
        }
         #brd_div11 {
            width: 100px;
            height:27px;
        }
         #brd_div12 {
            width: 180px;
            height:27px;
        }
         #brd_div13 {
            width: 100px;
            height:27px;
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
        
    
        .search {
            float: right;
        }

        .form1 {
            margin: 0 auto;

        }

        .tr1 {
       
           
        }
        .ta1 {
        width: 1550px;
           
        }
        .tit{
          font-size: 25px;
        }
          
      
      

  #listPaging{  clear:both; text-align:center; margin:0 auto;}
        #listPaging > ul{margin:0 auto; width:800px; display:center;  }
        #listPaging > ul > li{
        	list-style: none; display:inline-block; padding: 6px;
    </style>
</head>
<script src="${contextPath}/resources/js/jquery-3.5.1.min.js"> </script>

<script>
    var path;
    $(function(){
        
        
            $('.admin_menusub').hide();

            $('.main_menu').click(function(){
                $('.admin_menusub').hide();
                $(this).find('ul').show();
            });
   
    });

       
</script>
<script>
$(function() {
	$('#menucontent').load("${contextPath}/resources/subjsp/admin_menubar.jsp");
	});

</script>
<body>

 <div id='board_content'>
  <div id='menucontent'></div>
   <!--menu bar -->
 
    <form role="form" method="get">
 
    <div class="search" > <select name="searchType">
	      <option value="no"<c:out value="${cri.searchType == null ? 'selected' : ''}"/>>-----</option>
	       <option value="tc"<c:out value="${cri.searchType eq 'tc' ? 'selected' : ''}"/>selected>아이디+현황</option>
	      <option value="i"<c:out value="${cri.searchType eq 'i' ? 'selected' : ''}"/>>아이디</option>
	      <option value="n"<c:out value="${cri.searchType eq 'n' ? 'selected' : ''}"/>>현황</option>
	    </select>
	                        
	                        <input type="text" name="keyword" id="keywordInput" value="${cri.keyword}"/>
	
	    <button id="searchBtn" type="button">검색</button>
	    <script>
	      $(function(){
	        $('#searchBtn').click(function() {
	          self.location = "listlogs.do" + '${pageMaker.makeQuery(1)}' + "&searchType=" + $("select option:selected").val() + "&keyword=" + encodeURIComponent($('#keywordInput').val());
	        });
	      });   
	    </script>
	   </div>
                    </form>
      <!--board_container -->
        <div class="board_container">
   
    
        <form action="#" method="post">

            <fieldset>
               <div class="tit"><strong>사용자 이력 보기</strong></div>
                    
             


                <div class="tt1">
                    <table align="center"  class="ta1">
                        <tr class="tr1">
                            <td class="col_top" id="brd_div1">로그번호</td>
                            <td class="col_top" id="brd_div2">예약신청번호</td>
                            <td class="col_top" id="brd_div3">예약번호</td>
                            <td class="col_top" id="brd_div4">반납배송번호</td>
                            <td class="col_top" id="brd_div5">회원아이디</td>
                            <td class="col_top" id="brd_div6">로그발생자</td>
                            <td class="col_top" id="brd_div7">예약시작일</td>
                            <td class="col_top" id="brd_div8">예약반납일</td>
                            <td class="col_top" id="brd_div9">로그발생일</td>
                            <td class="col_top" id="brd_div10">모델명</td>
                            <td class="col_top" id="brd_div11">분류명</td>
                            <td class="col_top" id="brd_div12">시리얼번호</td>
                            <td class="col_top" id="brd_div13">현황</td>
                        </tr>


                        <c:choose>
                            <c:when test="${logList !=null }">
                                <c:set var="List" value="${logList }" />
                                <c:forEach var="List" items="${logList }" varStatus="Log_num">
                                    <tr>
	                                        <td class="col_list" id="brd_div1">${List.log_num}</td>
	                                        <td class="col_list" id="brd_div2">${List.resq_num}</td>
	                                        <td class="col_list" id="brd_div3">${List.res_num}</td>
	                                        <td class="col_list" id="brd_div4">${List.return_num}</td>
	                                        <td class="col_list" id="brd_div5">${List.user_id}</td>
	                                        <td class="col_list" id="brd_div6">${List.log_maker}</td>
	                                        <td class="col_list" id="brd_div7">${List.res_start}</td>
	                                        <td class="col_list" id="brd_div8">${List.res_end}</td >
	                                        <td class="col_list" id="brd_div9">${List.log_date}</td>
	                                        <td class="col_list" id="brd_div10">${List.eq_name}</td>
	                                        <td class="col_list" id="brd_div11">${List.cate_name}</td>
	                                        <td class="col_list" id="brd_div12">${List.eq_serial}</td>
	                                        <td class="col_list" id="brd_div13">${List.status}</td>
                                    </tr>
                                </c:forEach>
                            </c:when>

                            <c:when test="${logList ==null }">
                                <tr>
                                    <td colspan="13">등록된 로그가 없습니다</td>

                                </tr>
                            </c:when>

                        </c:choose>
                    </table>
                </div>
            </fieldset>

            
        </form>
    
    </div>
     
     
			
      </div>
	           <div id="listPaging">
					<ul class="pageclass">
						<c:if test="${pageMaker.prev}">
						<li><a href="listlogs.do${pageMaker.makeSearch(pageMaker.startPage - 1)}">이전</a></li>
						</c:if>
						<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
							
							<li><a href="listlogs.do${pageMaker.makeSearch(idx)}">${idx}</a></li>
						</c:forEach>
						<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
							<li><a href="listlogs.do${pageMaker.makeSearch(pageMaker.endPage + 1)}">다음</a></li>
						</c:if>
					</ul>
				</div>	
</body>

</html>
