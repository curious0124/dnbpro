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
    <meta charset="UTF-8">
    <style>
    @font-face {
    font-family: 'YiSunShinDotumM';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_two@1.0/YiSunShinDotumM.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
@font-face {
    font-family: 'YES24';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_13@1.0/YES24.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
@font-face {
    font-family: 'Binggrae';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_one@1.0/Binggrae.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
@import url(//fonts.googleapis.com/earlyaccess/jejumyeongjo.css);
.jejumyeongjo * { 
 font-family: 'Jeju Myeongjo', serif;
}
@font-face {
    font-family: 'SDSamliphopangche_Basic';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts-20-12@1.0/SDSamliphopangche_Basic.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
@font-face {
    font-family: 'RIDIBatang';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_twelve@1.0/RIDIBatang.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}
	
	*{font-family: 'RIDIBatang';
	
	}

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
        margin-bottom:100px;
        
        
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
        width: 100%;
        /* padding: 5px; */
        /* margin-right: 5px; */ 
        /* text-align: center; */
        margin : 0 auto;
        border: 0px solid #bcbcbc;
         background-color: #F4F9FC;
      }
      

      
      #footer{ /*수정 */
      	width:100%;
       position: relative;
      /*  margin-top:100px;  */
      	z-index: -1;

      }
/*       #banner_img_size{
      	width:100%;
      } */
      
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