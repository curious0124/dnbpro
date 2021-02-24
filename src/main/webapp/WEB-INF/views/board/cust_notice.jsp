<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <!-- <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script> -->
    
    <!-- 부트스트랩 페이징 -->	
	<!-- <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" crossorigin="anonymous"></script>  -->
	<script src="${contextPath}/resources/js/jquery-3.5.1.min.js"></script> 
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
	<script src="${contextPath}/resources/js/scripts.js"></script>
	<script src="https://cdn.datatables.net/1.10.23/js/jquery.dataTables.min.js" crossorigin="anonymous"></script>
	<script src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js" crossorigin="anonymous"></script>
	<script src="${contextPath}/resources/assets/demo/datatables-demo.js"></script>
<!-- 부트스트랩 페이징 -->
    
    
    <title>공지사항</title>
</head>
<style>
    .cust_notice_container{
            margin:0 auto;
            width: 90%;   
        }
    .cust_notice_listrow{
        width: 100%;
        clear:both;
        text-align: center;
    }
    #top_buttonbox{
            text-align: right;
            padding-right: 50px;
            margin-bottom: 8px;
        }
    .cust_notice_col_top{
            float: left;
            background: #FA8072;
            color: white;
            font-weight: bold;
            
        }
        .cust_notice_col_list{
            float: left;
            background: #FFF5EE;
            padding: 0px 0px 0px 0px;
           
        }
         #cust_notice_div0{
            width: 5%;
        }
        #cust_notice_div1{
            width: 5%;
        }
        #cust_notice_div2{
            width: 50%;
        }
        #cust_notice_div3{
            width: 15%;
        }
        #cust_notice_div4{
            width: 20%;
        }
        
    
</style>
<script>
$(document).ready(function() {
    $('#example').DataTable( {
        "paging":   false,
        "ordering": false,
        "info":     false
    } );
} );
</script>

<body>
<c:choose>
		<c:when test="${articlesNoticeList ==null }">
			<div class="cust_notice_container">
        <div id='top_buttonbox'>
  		공지사항 게시판
   </div>
   <div class="cust_notice_listrow">
       <div class="cust_notice_col_top" id="cust_notice_div0"> &nbsp;</div>
       <div class="cust_notice_col_top" id="cust_notice_div1">글번호</div>
       <div class="cust_notice_col_top" id="cust_notice_div2">제목</div>
       <div class="cust_notice_col_top" id="cust_notice_div3">작성자</div>
       <div class="cust_notice_col_top" id="cust_notice_div4">작성일자</div>
       <div class="cust_notice_col_top" id="cust_notice_div0"> &nbsp;</div>
       
   </div>
   <div class="cust_notice_listrow">
      <div class="cust_notice_col_list" id="cust_notice_div0"> &nbsp;</div>
       <div class="cust_notice_col_list" id="cust_notice_div1"></div>
       <div class="cust_notice_col_list" id="cust_notice_div2">등록된 글이 없습니다.</div>
       <div class="cust_notice_col_list" id="cust_notice_div3"></div>
       <div class="cust_notice_col_list" id="cust_notice_div4"></div>
       <div class="cust_notice_col_list" id="cust_notice_div0"> &nbsp;</div>    
   </div>
    </div>
		</c:when>
		<c:when test="${articlesNoticeList !=null }">
			 <div class="cust_notice_container">
        <div id='top_buttonbox'>
  		공지사항 게시판
   </div>
   <div class="cust_notice_listrow">
       <div class="cust_notice_col_top" id="cust_notice_div0"> &nbsp;</div>
       <div class="cust_notice_col_top" id="cust_notice_div1">글번호</div>
       <div class="cust_notice_col_top" id="cust_notice_div2">제목</div>
       <div class="cust_notice_col_top" id="cust_notice_div3">작성자</div>
       <div class="cust_notice_col_top" id="cust_notice_div4">작성일자</div>
       <div class="cust_notice_col_top" id="cust_notice_div0"> &nbsp;</div>
       
   </div>
   <c:forEach var="article" items="${articlesNoticeList }" varStatus="articleNum" >
   	 <div class="cust_notice_listrow">
      <div class="cust_notice_col_list" id="cust_notice_div0"> &nbsp;</div>
       <div class="cust_notice_col_list" id="cust_notice_div1">${articleNum.count}</div>
       <div class="cust_notice_col_list" id="cust_notice_div2"><a href="${contextPath}/cust/viewNoticeArticle.do?board_num=${article.board_num}">${article.board_title }</a></div>
       <div class="cust_notice_col_list" id="cust_notice_div3">${article.board_writer }</div>
       <div class="cust_notice_col_list" id="cust_notice_div4">${article.board_date }</div>
       <div class="cust_notice_col_list" id="cust_notice_div0"> &nbsp;</div>    
   </div>
   </c:forEach>
  
    </div>
		</c:when>
	</c:choose> 
	
	
	
	
<%--    	<div id="layoutSidenav_content">
      <main>
        <div class="container-fluid">
          <h1 class="mt-4">공지사항</h1>
           <div class="card mb-4">
             <div class="card-body">
               <div class="table">
                 <table class="table table-bordered dataTable" id="dataTable" width="100%" cellspacing="0">
                   <thead>
                     <tr>
                      <th>글 번호</th>
                      <th>제목</th>
                      <th>작성자</th>
                      <th>작성일자</th>
                     </tr>
                   </thead>
                   <tbody>
					<c:forEach var="article" items="${articlesNoticeList }" varStatus="articleNum" >
						<tr align="center">
							<td>${articleNum.count}</td>
							<td><a href="${contextPath}/cust/viewNoticeArticle.do?board_num=${article.board_num}">${article.board_title }</a></td>
							<td>${article.board_writer }</td>
							<td>${article.board_date }</td>
						</tr>
					</c:forEach>
				</tbody>
                   </table>
                  </div>
                </div>
               </div>
              </div>
		</main>
	</div> --%>
</body>
</html>