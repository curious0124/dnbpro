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
<!-- 부트스트랩 페이징 -->	
	<!-- <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" crossorigin="anonymous"></script>  -->
	<script src="${contextPath}/resources/js/jquery-3.5.1.min.js"></script> 
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
	<script src="${contextPath}/resources/js/scripts.js"></script>
	<script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js" crossorigin="anonymous"></script>
	<script src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js" crossorigin="anonymous"></script>
	<script src="${contextPath}/resources/assets/demo/datatables-demo.js"></script>
<!-- 부트스트랩 페이징 -->

<title>edu_admin_list</title>
    <style>
    #board_content{
            margin: 0 auto;
            width: 1050px;
            margin-top:50px;
            
        }
       
        .fs{
            color: black;
            font-family: 'RIDIBatang';
            text-decoration: none;
        }
        
        .board_container{
            margin-left:20px;
            float: left;
            width: 750px;
        }
        .listrow{
            width: 750px;
            clear:both;
            text-align: center;
            
        }
        .col_top{
            float: left;
            color: #2e2751;
            font-weight: bold;
            border-bottom:2px solid #2e2751;
            border-top:2px solid #2e2751;
            
        }
        .col_list{
            float: left;
            border-bottom:1px solid #f0f0f0;
            padding: 0px 0px 0px 0px;
           
        }
        
        #brd_div1{
            width: 10px;
        }
        #brd_div2{
            width: 90px;
        }
        #brd_div3{
            width: 250px;
        }
        #brd_div4{
            width: 80px;
        }
        #brd_div5{
            width: 120px;
        }
        #brd_div6{
            width: 100px;
        }
        #brd_div7{
            width: 80px;
        }
        #top_buttonbox{
            min-width: 750px;
            text-align: right;
            padding-right: 20px;
            margin-bottom: 8px;
        }
        #brd_btn{
            font-size:0.5em;
            width:50px;
            height:10px;
            padding: 2px;
            line-height:5px;
        }
        #listPaging{  clear:both; text-align:center; margin:0 auto;}
        #listPaging > ul{margin:0 auto;width:500px;}
        #listPaging > ul > li{
           list-style: none; float: left; padding: 6px;
        }
    </style>
 
<script>
	$(function() {
		$('#menucontent').load("${contextPath}/resources/subjsp/admin_menubar.jsp");
		$("#selectDelete_btn2").click(function() {
							var confirm_val = confirm("정말 삭제하시겠습니까?");
							if (confirm_val) {var checkArr = new Array();

								$("input[class='chBox']:checked")
										.each(function() {checkArr.push($(this).attr("value"));});
								$.ajax({
											type : "post",
											data : {chbox : checkArr},
											url : "${contextPath}/education/edu_admin_del.do",
											success : function() {
											location.href = "${contextPath}/education/edu_admin_list.do";
											}
										});
							}
						});
	});
	function allChk(obj) {
		var chkObj = document.getElementsByName("RowCheck");
		var rowCnt = chkObj.length - 1;
		var check = obj.checked;
		if (check) {
			for (var i = 0; i <= rowCnt; i++) {
				if (chkObj[i].type == "checkbox")
					chkObj[i].checked = true;
			}
		} else {
			for (var i = 0; i <= rowCnt; i++) {
				if (chkObj[i].type == "checkbox") {
					chkObj[i].checked = false;
				}
			}
		}
	}
</script>

</head>
<body>
	<div id='board_content'>
		<!--menu bar -->
		<div id='menucontent'></div>
		</div>
		
		
		
		
		    <div class="board_container">
  <div id='top_buttonbox'>
        ${articlesList[0].brd_name} 게시판
       <button type="button" class="btn btn-light fs" id="addarticle" onclick="location.href='${contextPath}/education/edu_admin_Form.do'">글쓰기</button>
       <button type="button" class="btn btn-light fs" id="selectDelete_btn2">선택삭제</button>
   </div>
  <div class="listrow toplow">
    <div class="col_top" id="brd_div1">
      <input type="checkbox"  id="allCheck" onclick="allChk(this);"/>
    </div>
    <div class="col_top fs" id='brd_div2'>
      글 번호
    </div>
    <div class="col_top fs" id='brd_div3'>
      제목
    </div>
    <div class="col_top fs" id='brd_div4'>
      대분류
    </div>
    <div class="col_top fs" id='brd_div5'>
      소분류
    </div>
        <div class="col_top fs" id='brd_div6'>
      등록날짜
    </div>
        <div class="col_top fs" id='brd_div7'>
      작성자
    </div>
  </div>
  
  <c:choose>
  
  <c:when test="${educationList !=null }" >
  
    <c:forEach items="${educationList}" var="list" varStatus="educationNum">
     <div class="listrow">
    <div class="col_list fs" id='brd_div1'>
    
      <input type="checkbox" name="RowCheck" class="chBox" value="${list.edu_num}" />
      
    </div>
    <div class="col_list fs" id='brd_div2'>
      <!-- ${articleNum.count} -->
      ${educationNum.count}
    </div>
    <div class="col_list fs" id='brd_div3'>
        <a class="fs" href="${contextPath}/education/edu_admin_detail.do?educationNO=${list.edu_num}">${list.edu_title}</a>
    </div>
    <div class="col_list fs" id='brd_div4'>
     ${list.cate_name}
    </div>
    <div class="col_list fs" id='brd_div5'>
      ${list.eq_name}
    </div>
        <div class="col_list fs" id='brd_div6'>
      ${list.edu_pub_date}
    </div>
        <div class="col_list fs" id='brd_div7'>
     ${list.edu_writer}
    </div>
    <!-- 
    <div class="col_list" id='brd_div6'> -->
   <!-- <button type="button" class="btn btn-light" id='brd_btn'onclick="location.href='${contextPath}/board/admin_board_deleteArticle.do?board_num=${article.board_num}'">삭제</button>-->
      <!-- <button type="button" class="btn btn-light" id='brd_btn'onclick="location.href='${contextPath}/board/admin_board_modArticleForm.do?board_num=${article.board_num}'">수정</button>-->
   <!--  </div> -->
    
  </div>
    </c:forEach>
     </c:when>
  
  
  
  
  
  
  <c:when test="${educationList==null}">
   <div class="listrow">
    <div class="col_list" id='brd_div1'>
      &nbsp;
    </div>
    <div class="col_list" id='brd_div2'>
      &nbsp;
    </div>
    <div class="col_list" id='brd_div3'>
        <b>등록된 글이 없습니다.</b>
    </div>
    <div class="col_list" id='brd_div4'>
      &nbsp;
    </div>
    <div class="col_list" id='brd_div5'>
      &nbsp;
    </div>
    <!-- 
    <div class="col_list" id='brd_div6'>
      &nbsp;
    </div>
     -->
  </div>
  </c:when>
    </c:choose>
  
  
    <div id="listPaging">
  <ul>
    <c:if test="${pageMaker.prev}">
       <li><a href="edu_admin_list.do${pageMaker.makeSearch(pageMaker.startPage - 1)}">이전</a></li>
    </c:if> 
    <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
		<li><a class="fs" href="edu_admin_list.do${pageMaker.makeSearch(idx)}">${idx}</a></li>
	</c:forEach>

    <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
       <li><a href="edu_admin_list.do${pageMaker.makeSearch(pageMaker.endPage + 1)}">다음</a></li>
    </c:if> 
  </ul>
</div>

  
</div>








<%-- 		<!--board_container -->
		<div class="board_container">
				<button type="button" class="btn btn-light " id="addarticle" onclick="location.href=' ${contextPath}/education/edu_admin_Form.do'" >글쓰기</button>					
				<button type="button" class="btn btn-light" id="selectDelete_btn2">선택삭제</button>		
		<!-- 부트스트랩 -->
	<div id="layoutSidenav_content">
      <main>
        <div class="container-fluid">
          <h1 class="mt-4">장비 교육 관리</h1>
           <div class="card mb-4">
             <div class="card-body">
               <div class="table">
                 <table class="table table-bordered" id="" width="100%" cellspacing="0">
                   <thead>
                     <tr>
                     <th><input type="checkbox" id="allCheck" onclick="allChk(this);" /></th>
                      <th>글 번호</th>
                      <th>제목</th>
                      <th>대분류</th>
                      <th>소분류</th>
                      <th>등록날짜</th>
                      <th>작성자</th>
                     </tr>
                   </thead>
                   <tbody>
					<c:forEach items="${educationList}" var="list" varStatus="educationNum">
						<tr align="center">
						<td><input type="checkbox" name="RowCheck" class="chBox" value="${list.edu_num}" /></td>
							<td>${educationNum.count}</td>
							<td><a href="${contextPath}/education/edu_admin_detail.do?educationNO=${list.edu_num}">${list.edu_title}</a></td>
							<td>${list.cate_name}</td>
							<td>${list.eq_name}</td>
							<td>${list.edu_pub_date}</td>
							<td>${list.edu_writer}</td>
						</tr>
					</c:forEach>
				</tbody>
                   </table>
                  </div>
                </div>
               </div>
              </div>
		</main>
	</div>
				<div id="listPaging">
				<ul>
					<c:if test="${pageMaker.prev}">
						<li><a href="edu_admin_list.do${pageMaker.makeSearch(pageMaker.startPage - 1)}">이전</a></li>
					</c:if>
					<c:forEach begin="${pageMaker.startPage}"
						end="${pageMaker.endPage}" var="idx">
						<li><a href="edu_admin_list.do${pageMaker.makeSearch(idx)}">${idx}</a></li>
					</c:forEach>
					<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
						<li><a href="edu_admin_list.do${pageMaker.makeSearch(pageMaker.endPage + 1)}">다음</a></li>
					</c:if>
				</ul>
			</div>	
			<div class="search">
    <select name="searchType">
       <option value="ctn"<c:out value="${scri.searchType eq 'ctn' ? 'selected' : ''}"/>selected>카테고리+타이틀+장비이름</option>
       <option value="c"<c:out value="${scri.searchType eq 'c' ? 'selected' : ''}"/>>카테고리</option>
      <option value="t"<c:out value="${scri.searchType eq 't' ? 'selected' : ''}"/>>타이틀</option>
      <option value="n"<c:out value="${scri.searchType eq 'n' ? 'selected' : ''}"/>>장비이름</option>
    </select>

    <input type="text" name="keyword" id="keywordInput" value="${scri.keyword}"/>

    <button id="searchBtn" type="button">검색</button>
    <script>
      $(function(){
        $('#searchBtn').click(function() {
        	/* self.location 부분 처음 (edu_admin.do)주소불러오기 오류 있음
        	   현재는 간제로 주소 지정해주었음*/
          self.location = "edu_admin_list.do" + '${pageMaker.makeQuery(1)}' + "&searchType=" + $("select option:selected").val() + "&keyword=" + encodeURIComponent($('#keywordInput').val());
        });
      });   
    </script>
  </div>
</div>
</div> --%>

	

</body>
</html>