<%@ page language="java" contentType="text/html; charset=UTF-8"
     pageEncoding="UTF-8"
    isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
  request.setCharacterEncoding("UTF-8");
%> 
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  /> 
<head>
<meta charset="UTF-8">
<title>글쓰기창</title>
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript"></script>
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
  	        $('#preview').attr('src', e.target.result);
            }
           reader.readAsDataURL(input.files[0]);
        }
    } 
    

</script>
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
        .form-control01{
        	width: 200px;
        }
        .articlefrom001{
        	text-align: center;
        }
        

        #brd_btn {
            margin-top: 10px;
            width : 85px;
            font-family: "굴림";
            font-size: 20px;
        }
 
 </style>
 <title>새글 쓰기 창</title>
</head>
<body>
 <div id='board_content'>
   <!--menu bar -->
   <div id='menucontent'>
   
   </div>
   
   <!--board_container -->
  <form name="eduForm" method="post"   action="${contextPath}/education/addNeweducation.do"    enctype="multipart/form-data">
    <div class="board_container">
    	<div id="articlefrom1">   
            <div class="badge text-wrap" style="width: 6rem;">
                  	작성자
            </div>
            <div class="input-group input-group-sm mb-3">
				<input type="text" id="board_titleinput" name="edu_writer" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm" value="${educationVO.edu_writer}"  readonly>
            </div>
         </div>
         
         <div id="articlefrom1">   
            <div class="badge text-wrap" style="width: 6rem;">
                  	글제목
            </div>
            <div class="input-group input-group-sm mb-3">
              <input type="text" id="board_titleinput" name="edu_title" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm"">
            </div>
         </div>
         
          <div id="articlefrom1">   
            <div class="badge text-wrap" style="width: 6rem;">
                  	분류명
            </div>
            <div class="input-group input-group-sm mb-3" style="width: 280px;">
              <input type="text" id="board_titleinput" name="cate_name" class="form-control01" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm">
            </div>
            <div class="badge text-wrap" style="width: 6rem;">
                  	장비명
            </div>
            <div class="input-group input-group-sm mb-3" style="width: 280px;">
              <input type="text" id="board_titleinput" name="eq_name" class="form-control01" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm">
            </div>
            </div>
            
            <div id="articlefrom1"> 
             <div class="form-floating">
             	<div class="badge text-wrap" style="width: 6rem;">
                  	글내용
           		</div>
              	<textarea class="form-control" id="floatingTextarea2" name="edu_content"style="height: 500px"></textarea>
             </div>
        	</div>
        	
        	<div id="articlefrom1"> 
             <div class="input-group">
              <input type="file" class="form-control" id="inputGroupFile04" aria-describedby="inputGroupFileAddon04" name="edu_thuming" aria-label="Upload" onchange="readURL(this);" >
              <img  id="preview" src="#"   width=200 height=200/>
            </div><br><br>
        
        </div>
          
        <div id="articlefrom1" class="articlefrom001"> 
        	<input type="submit" value="글쓰기" id='brd_btn'/>
        	  &nbsp;&nbsp;
	       	<input type=button value="목록보기" onClick="location.href=' ${contextPath}/education/edu_admin_list.do'" id='brd_btn'/>
        </div>  

    </div>
    
  </form>
  </div>
</body>
</html>
