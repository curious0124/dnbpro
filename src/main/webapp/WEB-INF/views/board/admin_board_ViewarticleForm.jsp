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
            background: #FA8072;
            
            margin-right: 3px;
        }
        .form-select{
            width: 100px;
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
              <textarea class="form-control" id="floatingTextarea2" name="board_content"style="height: 500px"disabled>${article.board_content }</textarea>
              
             </div>
        </div><br>
        
         <div id="articlefrom1"> 
             <div class="input-group">
              <input type="file" class="form-control" id="inputGroupFile04" aria-describedby="inputGroupFileAddon04" name="board_img"aria-label="Upload">
              
            </div><br><br>
            
            
        </div>
        
            
            
        </div><br><br>
        <div id="articlefrom1"> 
        <input type="submit" value="글쓰기" disabled/>
	       <input type=button value="목록보기"onClick="backToList(this.form)" />
        </div>  
  
    </div>
       </form>

</div>
</body>
</html>