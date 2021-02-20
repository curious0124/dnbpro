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
            width: 130px;
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
            width: 200px;
        }
        #articlefrom1{
            clear: both;
        }
        .form-floating{
        width: 800px;
        
        text-align:justify;
        
        }
        
    </style>
      <script src="${contextPath}/resources/js/jquery-3.5.1.min.js"> </script>
<script>
	/* var url = ${article.brd_num }; */
    $(function(){           
            $('#menucontent').load("${contextPath}/resources/subjsp/admin_menubar.jsp")
    	
            $("#delbtn").click(function(){
            	var confirm_val = confirm("정말 이 글을 삭제하시겠습니까?");
            	var reqEdu_num = ${educationVO.edu_num  };
            	
            	console.log(reqEdu_num);
            	
            	
            	if(confirm_val) {
            		var checkArr = new Array();
            		checkArr.push(reqEdu_num);
            		
               	 	console.log(checkArr);
               	 $.ajax({
               	    
               	    type : "post",
               	    data : { chbox : checkArr },
               	  	url : "${contextPath}/education/edu_admin_del.do",
               	    success : function(){
               	     location.href = "${contextPath}/education/edu_admin_list.do";
               	    }
               	   });
               	  } 
            });
    });
    
/*     function backToList(obj){
    	console.log(url);
	    obj.action="${contextPath}/education/edu_admin_list.do";
	    obj.submit();
     } */
    

</script>
    
</head>
<body>
   <div id='board_content'>
   <!--menu bar -->
   <div id='menucontent'>
   
   </div>
    
    
    
    <!--board_container -->
    <form name="eduForm" method="post"   action="${contextPath}"   enctype="multipart/form-data">
    <div class="board_container">
        <div id="articlefrom1">            
             <div class="badge text-wrap" style="width: 6rem;">
                  글 작성자
            </div>
            <div class="input-group input-group-sm mb-3 brd_writer">
              <input type="text" id="" name="edu_writer"class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm" value="${educationVO.edu_writer }"disabled>
            </div>
            <div class="badge text-wrap" style="width: 6rem;">
                  글 작성일
            </div>
            <div class="input-group input-group-sm mb-3 brd_date">
              <input type="text" id="" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm" value="${educationVO.edu_pub_date }"disabled>
            </div>
            
            
            
            
            <div class="badge text-wrap" style="width: 6rem;">
                  분류명
            </div>
            <div class="input-group input-group-sm mb-3 brd_date">
              <input type="text" id="" name="cate_name" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm" value="${educationVO.cate_name }">
            </div>
            <div class="badge text-wrap" style="width: 6rem;">
                  장비이름
            </div>
            <div class="input-group input-group-sm mb-3 brd_date">
              <input type="text" id="" name="eq_name" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm" value="${educationVO.eq_name }">
            </div>     
            
        </div>
        
        
        <div id="articlefrom1">   
            <div class="badge text-wrap" style="width: 6rem;">
                  제목
            </div>
            <div class="input-group input-group-sm mb-3">
              <input type="text" id="" name="edu_title" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm" value="${educationVO.edu_title }"disabled>
            </div>
         </div>
         <div id="articlefrom1"> 
             <div class="form-floating">
              ${educationVO.edu_content}
              
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
            
        </div>
        
            
            
        </div><br><br>
        <div id="articlefrom1"> 
        <button type="button" class="btn btn-light" id='brd_btn'onclick="location.href='${contextPath}/education/admin_edu_modeducationForm.do?educationNO=${educationVO.edu_num}'">수정</button>
        &nbsp;&nbsp;
        <button type="button" class="btn btn-light deleteArticle" id='delbtn'>삭제</button>
        &nbsp;&nbsp;
        <button type="button" class="btn btn-light" id='brd_btn'onClick="location.href=' ${contextPath}/education/edu_admin_list.do'" >목록보기</button>
	       
        </div>  
  
    </div>
       </form>

</div>
</body>
</html>