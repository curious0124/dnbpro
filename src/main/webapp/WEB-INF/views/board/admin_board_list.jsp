<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />

<%
  request.setCharacterEncoding("UTF-8");
%>  
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>
    <title>admin_board_list</title>
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
<<<<<<< HEAD
           list-style: none; float: left; padding: 6px;
           
           
           
=======
           list-style: none; float: left; padding: 6px;
>>>>>>> branch 'develop' of https://github.com/curious0124/dnbpro.git
        }
    </style>
     <script src="${contextPath}/resources/js/jquery-3.5.1.min.js"> </script>
<script>
    
    $(function(){           
            $('#menucontent').load("${contextPath}/resources/subjsp/admin_menubar.jsp");
            
            $("#selectDelete_btn").click(function(){
               
                var confirm_val = confirm("정말 삭제하시겠습니까?");
                var reurl = ${articlesList[0].brd_num };
                
               if(confirm_val) {
                var checkArr = new Array();
                
                $("input[class='chBox']:checked").each(function(){
                 checkArr.push($(this).attr("value"));
                });
                 
               
                
              $.ajax({
                 
                 type : "post",
                 data : { chbox : checkArr },
                  url : "${contextPath}/board/deleteSelectArticle.do",
                 success : function(){
                  location.href = "${contextPath}/board/admin_board_list.do?brd_num="+reurl;
                 }
                });
             
               } 
              });

    });
    function allChk(obj){
        var chkObj = document.getElementsByName("RowCheck");
        var rowCnt = chkObj.length - 1;
        var check = obj.checked;
        if (check) { 
            for (var i=0; i<=rowCnt; i++){
             if(chkObj[i].type == "checkbox")
                 chkObj[i].checked = true;
            }
        } else {
            for (var i=0; i<=rowCnt; i++) {
             if(chkObj[i].type == "checkbox"){
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
   <div id='menucontent'>
   
   </div>
       
    
    <!--board_container -->
    <div class="board_container">
  <div id='top_buttonbox'>
        ${articlesList[0].brd_name} 게시판
       <button type="button" class="btn btn-light fs" id="addarticle" onclick="location.href='${contextPath}/board/admin_board_articleForm.do?brd_num=${articlesList[0].brd_num}'">글쓰기</button>
       <button type="button" class="btn btn-light fs" id="selectDelete_btn">선택삭제</button>
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
      작성자
    </div>
    <div class="col_top fs" id='brd_div5'>
      작성일자
    </div>
    <!-- <div class="col_top" id='brd_div6'>
      &nbsp;
    </div> -->
  </div>
  
  <c:choose>
  
  <c:when test="${articlesList !=null }" >
  
    <c:forEach  var="article" items="${articlesList }" varStatus="articleNum" >
     <div class="listrow">
    <div class="col_list fs" id='brd_div1'>
    
      <input type="checkbox" name="RowCheck" class="chBox" value="${article.board_num}" />
      
    </div>
    <div class="col_list fs" id='brd_div2'>
      <!-- ${articleNum.count} -->
      ${article.board_num }
    </div>
    <div class="col_list fs" id='brd_div3'>
        <a class="fs" href="${contextPath}/board/viewArticle.do?board_num=${article.board_num}">${article.board_title }</a>
    </div>
    <div class="col_list fs" id='brd_div4'>
      ${article.board_writer }
    </div>
    <div class="col_list fs" id='brd_div5'>
      ${article.board_date}
    </div>
    <!-- 
    <div class="col_list" id='brd_div6'> -->
   <!-- <button type="button" class="btn btn-light" id='brd_btn'onclick="location.href='${contextPath}/board/admin_board_deleteArticle.do?board_num=${article.board_num}'">삭제</button>-->
      <!-- <button type="button" class="btn btn-light" id='brd_btn'onclick="location.href='${contextPath}/board/admin_board_modArticleForm.do?board_num=${article.board_num}'">수정</button>-->
   <!--  </div> -->
    
  </div>
    </c:forEach>
     </c:when>
  
  
  
  
  
  
  <c:when test="${articlesList==null}">
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
       <li><a class="fs" href="admin_board_list.do${pageMaker.makeQuery(pageMaker.startPage - 1)}">이전</a></li>
    </c:if> 

    <c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
       <!-- <li><a href="list${pageMaker.makeQuery(idx)}">${idx}</a></li> -->
       <li><a class="fs" href="admin_board_list.do${pageMaker.makeQuery(idx)}">${idx}</a></li>
       
    </c:forEach>

    <c:if test="${pageMaker.next && pageMaker.endPage > 0}">
       <li><a class="fs" href="admin_board_list.do${pageMaker.makeQuery(pageMaker.endPage + 1)}">다음</a></li>
    </c:if> 
  </ul>
</div>

  
</div>


</div>
</body>
</html>