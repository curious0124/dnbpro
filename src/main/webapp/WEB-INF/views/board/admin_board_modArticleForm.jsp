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
    <title>admin_board_modArticleForm</title>
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
            width: 120px;
            float: left;
            margin-right: 10px;
        }
        .input-group{
            width: 700px;
            float: left;
        }
        .brd_writer{
            width: 150px;
            margin-right: 10px;
        }
        .brd_date{
            width: 230px;
        }
        #articlefrom1{
            clear: both;
        }
        .brd_btn_group{width:200px;margin: 0 auto;
        }
        #brd_btn{
        margin-top:50px;
        }
        
    </style>
      <script src="${contextPath}/resources/js/jquery-3.5.1.min.js"> </script>
      
<script>
    
    $(function(){           
            $('#menucontent').load("${contextPath}/resources/subjsp/admin_menubar.jsp")
    });
    var url = ${article.brd_num };
    function backToList(obj){
    	console.log(url);
	    obj.action="${contextPath}/board/admin_board_list.do?brd_num="+url;
	    obj.submit();
     }
    
    
    
    function readURL(input) {
        if (input.files && input.files[0]) {
  	      var reader = new FileReader();
  	      reader.onload = function (e) {
  	        $('#preview2').attr('src', e.target.result);
            }
           reader.readAsDataURL(input.files[0]);
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
    <form name="articleForm" method="post"   action="${contextPath}/board/modArticle.do"   enctype="multipart/form-data">
    <div class="board_container">
        <div id="articlefrom1">
            <div class="badge text-wrap" style="width: 6rem;">
                  	분류 
            </div>
            <select class="form-select form-select-sm" aria-label=".form-select-sm example" name="brd_num">
                  <option value="${article.brd_num }" selected>${article.brd_name }</option>
                  <option value="1">공지사항</option>
                  <option value="2">FAQ</option>
                  <option value="3">배너</option>
                  <option value="4">사업소개</option>
                  <option value="5">홍보영상</option>
                  <option value="6">지원서비스</option>
            </select>
       		
            
        </div>
        <input type="text" name="board_writer" value="${article.board_writer }" hidden>
        <input type="text" name="board_num" value="${article.board_num }" hidden>
        
        <br>
        <br>
        <div id="articlefrom1">   
            <div class="badge text-wrap" style="width: 6rem;">
                  제목
            </div>
            <div class="input-group input-group-sm mb-3">
              <input type="text" id="board_titleinput" name="board_title" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm"value="${article.board_title }">
            </div>
         </div>
         <div id="articlefrom1"> 
             <div class="form-floating">
              <textarea class="form-control" id="floatingTextarea2" name="board_content"style="height: 500px" ><c:choose><c:when test="${not empty article.board_content && article.board_content!='null' }">${article.board_content }</c:when><c:otherwise></c:otherwise></c:choose></textarea>
              
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
	 
             <div class="input-group">
              <input type="file" class="form-control" id="inputGroupFile04" aria-describedby="inputGroupFileAddon04" name="board_img" aria-label="Upload"onchange="readURL(this);"  >
              <img  id="preview2" src="#"   width=200 height=200/>
            </div><br><br>
            
            
        </div>
        
            
            
        </div><br><br>
        <div id="articlefrom1"> 
        	<div class="brd_btn_group">
	        	<input type="submit" class="btn btn-light fs" id='brd_btn' value="수정하기" />
		        <input type=button class="btn btn-light fs" id='brd_btn' value="목록보기"onClick="backToList(this.form)" />
		    </div>     
        </div>  
  
    </div>
       </form>

</div>
</body>
</html>