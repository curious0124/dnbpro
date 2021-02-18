<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  isELIgnored="false"
 %>
 <%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
  <head>
	<!--   jQuery -->
  	 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
      <!-- 부트스트랩 경로 지정 폴더에 넣어놨음-->
    <%-- <link rel="stylesheet" href="${contextPath}/resources/bootstrap/bootstrap.css"> --%>
    <meta charset="UTF-8">
    <style>
      html,body{/*수정 */
      	height: 100%;
      }
      body{ /*수정 */
      	margin: 0;
      }
      #container {
      	min-height:100%; /*수정 */
        width: 100%;
        margin: 0px auto;
        text-align:center;
        border: 0px solid #bcbcbc;
      }
      #header {
        padding: 5px;
        margin-bottom: 5px;
        border: 0px solid #bcbcbc;
         background-color: lightgreen;
      }
      #sidebar-left {
        width: 15%;
        height:700px;
        padding: 5px;
        margin-right: 5px;
        margin-bottom: 5px;
        float: left;
         background-color: yellow;
        border: 0px solid #bcbcbc;
        font-size:10px;
      }
      #content {
        width: 75%;
        padding: 5px;
        margin: 0 auto;

        margin-right: 5px;
        
        margin : 0 auto;
        border: 0px solid #bcbcbc;
      }
      #footer{ /*수정 */
      	width:100%;
      	position: relative;
      	margin-top:100px;
      	z-index: -1;
      }
      
    </style>
    <title><tiles:insertAttribute name="title" /></title>
  </head>
    <body>
    <div id="container">
      <div id="header">
         <tiles:insertAttribute name="header"/>
      </div>
      <div id="quickmenu">
          <tiles:insertAttribute name="quickMenu"/> 
      </div>
      <div id="content">
          <tiles:insertAttribute name="body"/>
          
      </div>
    </div>
    
     <div id="footer">
       <tiles:insertAttribute name="footer"/>
    </div> 
    
   
  </body>
</html>