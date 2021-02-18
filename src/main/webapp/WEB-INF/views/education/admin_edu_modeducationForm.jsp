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
        
    </style>
      <script src="${contextPath}/resources/js/jquery-3.5.1.min.js"> </script>
      
<script>
    
    $(function(){           
            $('#menucontent').load("${contextPath}/resources/subjsp/admin_menubar.jsp")
    });
   
    function backToList(obj){
    	console.log(url);
	    obj.action="${contextPath}/education/edu_admin_list.do";
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
    <form name="articleForm" method="post"   action="${contextPath}/education/edu_admin_modForm.do"   enctype="multipart/form-data">
    <div class="board_container">
 
        <input type="text" name="edu_writer" value="${educationVO.edu_writer }" hidden>
        <input type="text" name="edu_num" value="${educationVO.edu_num }" hidden>
        
        <br>
        <br>
        <div id="articlefrom1">   
            <div class="badge text-wrap" style="width: 6rem;">
                  제목
            </div>
            <div class="input-group input-group-sm mb-3">
              <input type="text" id="board_titleinput" name="edu_title" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm"value="${educationVO.edu_title }">
            </div>
            <div class="input-group input-group-sm mb-3">
              <input type="text" id="board_titleinput" name="cate_name" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm"value="${educationVO.cate_name }">
            </div>
            <div class="input-group input-group-sm mb-3">
              <input type="text" id="board_titleinput" name="eq_name" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm"value="${educationVO.eq_name }">
            </div>
         </div>
         <div id="articlefrom1"> 
             <div class="form-floating">
              <textarea class="form-control" id="floatingTextarea2" name="edu_content"style="height: 500px" >
              <c:choose>
              <c:when test="${not empty educationVO.edu_content && educationVO.edu_content!='null' }">${educationVO.edu_content }
              </c:when>
              <c:otherwise>
              </c:otherwise>
              </c:choose>
              </textarea>
              
             </div>
        </div><br>
        
         <div id="articlefrom1"> 
         	<c:choose> 
			  <c:when test="${not empty educationVO.edu_thuming && educationVO.edu_thuming!='null' }">
			    <input  type= "hidden"   name="originalFileName" value="${educationVO.edu_thuming }" />
			    <img src="${contextPath}/edu_download.do?edu_num=${educationVO.edu_num}&edu_thuming=${educationVO.edu_thuming}" id="preview"  /><br>
				   
			 </c:when>
			<c:otherwise>
				    
			</c:otherwise>
	 </c:choose>
	 
             <div class="input-group">
              <input type="file" class="form-control" id="inputGroupFile04" aria-describedby="inputGroupFileAddon04" name="edu_thuming" aria-label="Upload"onchange="readURL(this);"  >
              <img  id="preview2" src="#"   width=200 height=200/>
            </div><br><br>
            
            
        </div>
        
            
            
        </div><br><br>
        <div id="articlefrom1"> 
        <input type="submit" value="수정하기" />
	       <input type=button value="목록보기" onClick="location.href=' ${contextPath}/education/edu_admin_list.do'" />
        </div>  
  
    
       </form>

</div>
</body>
</html>