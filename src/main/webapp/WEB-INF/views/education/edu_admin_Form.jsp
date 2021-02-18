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
 <title>새글 쓰기 창</title>
</head>
<body>
<h1 style="text-align:center">새글 쓰기</h1>
  <form name="eduForm" method="post"   action="${contextPath}/education/addNeweducation.do"    enctype="multipart/form-data">
    <table border="0" align="center">
    <tr>
		<td align="right"> 작성자</td>
		<td colspan=2  align="left"><input type="text" size="20" maxlength="100"  name="edu_writer"  value="${educationVO.edu_writer}"  readonly/> </td>
	</tr>
     <tr>
	   <td align="right">글제목: </td>
	   <td colspan="2"><input type="text" size="67"  maxlength="500" name="edu_title" /></td>
	 </tr>
	 <tr>
		<td align="right" valign="top"><br>글내용: </td>
		<td colspan=2><textarea rows="10" cols="65" maxlength="4000" name="edu_content"></textarea> </td>
     </tr>
     <tr>            
       <td>
         <div id="articlefrom1"> 
             <div class="input-group">
              <input type="file" class="form-control" id="inputGroupFile04" aria-describedby="inputGroupFileAddon04" name="edu_thuming" aria-label="Upload" onchange="readURL(this);" >
              <img  id="preview" src="#"   width=200 height=200/>
            </div><br><br>
            
            
        </div>
         </td>       
	 </tr>
	 <tr>
	   <td align="right">분류명: </td>
	   <td colspan="2"><input type="text" size="67"  maxlength="500" name="cate_name" /></td>
	 </tr>
	      <tr>
	   <td align="right">장비이름: </td>
	   <td colspan="2"><input type="text" size="67"  maxlength="500" name="eq_name" /></td>
	 </tr>
	 <tr>
	    <td align="right"> </td>
	    <td colspan="2">
	       <input type="submit" value="글쓰기" />
	       <input type=button value="목록보기"onClick="location.href=' ${contextPath}/education/edu_admin_list.do'" />
	    </td>
     </tr>

    </table>
  </form>
</body>
</html>
