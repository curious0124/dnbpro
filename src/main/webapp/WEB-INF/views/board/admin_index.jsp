<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
  request.setCharacterEncoding("UTF-8");
%> 
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>admin_index</title>
 
 <script src="${contextPath}/resources/js/jquery-3.5.1.min.js"> </script>
    
</head>

    
<style>
    
    #container{
        width: 100%;
        margin: 0 auto;
        padding: 0;
        
    }
        #side_menu_bar{
/*            border: 1px solid red;*/
           
            float: left;
          
        }
        #content_section_view{
/*            border: 1px solid black;*/
            float: left;
        }
        
        
    </style>
<body>


   <div id='container'>
   <div id='menuANDcontents'>
    <div id="side_menu_bar">
    </div>
    <div id="content_section_view">
        
    </div>
    </div>
    
    </div>
    <script src="${contextPath}/resources/js/jquery-3.5.1.min.js"> </script>
    <script>
        $.ajax({
        	type:"POST",
        	url:"${contextPath}/resources/js/admin_menubar.jsp",
        	success: function(data){
        		$('#side_menu_bar').html(data);
        	},
        	error: function(){
        		alert('aaaaa')
        		$('#side_menu_bar').html('Error!!!');
        	}
        });
       
       // $('#side_menu_bar').load('${contextPath}/WEB-INF/views/board/admin_menubar.jsp'); 
        
        $('#content_section_view').load('${contextPath}/resources/js/NewFile.html'); 
   

       
</script>
   
</body>
</html>