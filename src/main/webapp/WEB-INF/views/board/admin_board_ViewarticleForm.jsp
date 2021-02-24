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
    <title>admin_board_articleForm</title>
    <style>
    #board_content{
            margin: 0 auto;
            width: 1050px;
            margin-top:50px;
        }
       
       .board_container{
            margin:0 auto;
            float: left;
            
            margin-top: 50px;
            margin-left: 20px;
        }
        .badge{
            float: left;
            height: 2em;
            line-height: 18px;
            font-size: 15px;
            background: #2e2751;
            
            margin-right: 3px;
        }
        .form-select{
            width: 130px;
            float: left;
            margin-right: 10px;
        }
        .input-group{
            width: 650px;
            float: left;
        }
        .brd_writer{
            width: 130px;
            margin-right: 10px;
        }
        .brd_date{
            width: 170px;
        }
        #articlefrom1{
            clear: both;
        }
        .form-floating{
        width: 650px;margin:0 auto;
        text-align:justify;
        }
        .brd_btn_group{width:260px;margin: 0 auto;
        }
        #brd_btn{
        margin-top:50px;
        }
        #preview{
        	width:750px;margin: 0 auto;
        }
        
    </style>
      <script src="${contextPath}/resources/js/jquery-3.5.1.min.js"> </script>
<script>
	var url1 = ${article.brd_num };
    $(function(){           
            $('#menucontent').load("${contextPath}/resources/subjsp/admin_menubar.jsp")
    	
            $(".deleteArticle").click(function(){
            	var confirm_val = confirm("정말 이 글을 삭제하시겠습니까?");
            	var reqBoard_num = ${article.board_num  };
            	
            	console.log(reqBoard_num);
            	console.log(url1);
            	
            	if(confirm_val) {
            		var checkArr = new Array();
            		checkArr.push(reqBoard_num);
            		
               	 	console.log(checkArr);
               	 $.ajax({
               	    
               	    type : "post",
               	    data : { chbox : checkArr },
               	  	url : "${contextPath}/board/deleteSelectArticle.do",
               	    success : function(){
               	     location.href = "${contextPath}/board/admin_board_list.do?brd_num="+url1;
               	    }
               	   });
               	  } 
            });
    });
    
    function backToList(obj){
    	console.log(url1);
	    obj.action="${contextPath}/board/admin_board_list.do?brd_num="+url1;
	    obj.submit();
     }
    

</script>
    
</head>
<body>
   <div id='board_content'>
   <!--menu bar -->
   <div id='menucontent'>
   
   </div>
    
    
    
    <!--board_container -->
    <form name="articleForm" method="post"   action="${contextPath}"   enctype="multipart/form-data">
    <div class="board_container">
        <div id="articlefrom1">
            <div class="badge text-wrap" style="width: 6rem;">
                  분류
            </div>
            <select class="form-select form-select-sm" aria-label=".form-select-sm example"name="brd_num" disabled>
                  <option value="${article.brd_num }">${article.brd_name }</option>
                  
                  
            </select>
            
             <div class="badge text-wrap" style="width: 6rem;">
                  글 작성자
            </div>
            <div class="input-group input-group-sm mb-3 brd_writer">
              <input type="text" id="board_titleinput" name="brd_writer"class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm" value="${article.board_writer }"disabled>
            </div>
            <div class="badge text-wrap" style="width: 6rem;">
                  글 작성일
            </div>
            <div class="input-group input-group-sm mb-3 brd_date">
              <input type="text" id="board_titleinput" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm" value="${article.board_date }"disabled>
            </div>
            
            
        </div>
        
        
        <div id="articlefrom1">   
            <div class="badge text-wrap" style="width: 6rem;">
                  제목
            </div>
            <div class="input-group input-group-sm mb-3">
              <input type="text" id="board_titleinput" name="board_title" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm" value="${article.board_title }"disabled>
            </div>
         </div>
         <div id="articlefrom1"> 
             <div class="form-floating">
              ${article.board_content }
              
             </div>
        </div><br>
        
         <div id="articlefrom1"> 
            
            
            <c:choose> 
			  <c:when test="${not empty article.board_img && article.board_img!='null' }">
			   	
				     <input  type= "hidden"   name="originalFileName" value="${article.board_img }" />
				    <img src="${contextPath}/download.do?board_num=${article.board_num}&board_img=${article.board_img}" id="preview"  /><br>
				   
			 </c:when>
			<c:otherwise>	 
			</c:otherwise>
	 </c:choose>
            
        </div>
        
            
            
        </div><br><br>
        <div id="articlefrom1"> 
        	<div class="brd_btn_group">
		        <button type="button" class="btn btn-light" id='brd_btn'onclick="location.href='${contextPath}/board/admin_board_modArticleForm.do?board_num=${article.board_num}'">수정</button>
		        &nbsp;&nbsp;
		        <button type="button" class="btn btn-light deleteArticle" id='brd_btn'>삭제</button>
		        &nbsp;&nbsp;
		        <button type="button" class="btn btn-light" id='brd_btn'onClick="backToList(this.form)">목록보기</button>
	       </div>
        </div>  
  
    </div>
       </form>

</div>
</body>
</html>