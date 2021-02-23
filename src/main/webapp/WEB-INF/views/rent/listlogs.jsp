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
     #board_content{
            margin: 0 auto;
            width: 1650px;
           
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
    
        .search {
            float: right;
        }

        .form1 {
            margin: 0 auto;

        }

        .tr1 {
            background: #FA8072;
        }

 #listPaging{  clear:both; text-align:center;}
        #listPaging > ul{margin:0 auto;}
        #listPaging > ul > li{
        	list-style: none; float: left; padding: 6px;
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
   <!--menu bar -->
  <div id='menucontent'></div>
    
      <form role="form" method="get">
 
    <div class="search"> <select name="searchType">
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
    
        <form action="#" method="post">

            <fieldset>
               <strong>사용자 이력 보기</strong>
                    
             


                <div>
                    <table align="center" border="1">
                        <tr class="tr1">
                            <td>로그번호</td>
                            <td>예약신청번호</td>
                            <td>예약번호</td>
                            <td>반납배송번호</td>
                            <td>회원아이디</td>
                            <td>로그발생자</td>
                            <td>예약시작일</td>
                            <td>예약반납일</td>
                            <td>로그발생일</td>
                            <td>모델명</td>
                            <td>분류명</td>
                            <td>시리얼번호</td>
                            <td>현황</td>
                        </tr>


                        <c:choose>
                            <c:when test="${logList !=null }">
                                <c:set var="List" value="${logList }" />
                                <c:forEach var="List" items="${logList }" varStatus="Log_num">
                                    <tr>
                                        <td>${List.log_num}</td>
                                        <td>${List.resq_num}</td>
                                        <td>${List.res_num}</td>
                                        <td>${List.return_num}</td>
                                        <td>${List.user_id}</td>
                                        <td>${List.log_maker}</td>
                                        <td>
                                            <fmt:formatDate pattern="yyyy-MM-dd" value="${List.res_start}" />
                                        </td>
                                        <td>
                                            <fmt:formatDate pattern="yyyy-MM-dd" value="${List.res_end}" />
                                        </td>
                                        <td>
                                            <fmt:formatDate pattern="yyyy-MM-dd" value="${List.log_date}" />
                                        </td>
                                        <td>${List.eq_name}</td>
                                        <td>${List.cate_name}</td>
                                        <td>${List.eq_serial}</td>
                                        <td>${List.status}</td>
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
    
     <!--  -->
     <div id="listPaging">
				<ul>
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
      </div>
    
</body>

</html>
