<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>FAQ</title>

<style>
.accordion {
  background-color: #eee;
  color: #444;
  cursor: pointer;
  padding: 18px;
  width: 100%;
  border: none;
  text-align: left;
  outline: none;
  font-size: 15px;
  transition: 0.4s;
}

.active, .accordion:hover {
  background-color: #ccc;
}

.accordion:after {
  content: '\002B';
  color: #777;
  font-weight: bold;
  float: right;
  margin-left: 5px;
}

.active:after {
  content: "\2212";
}

.panel {
  padding: 0 18px;
  background-color: white;
  max-height: 0;
  overflow: hidden;
  transition: max-height 0.2s ease-out;
  text-align:justify;
}
</style>

</head>
<body>

	
	
	<c:forEach  var="article" items="${articlesList }" varStatus="articleNum" >
<button class="accordion"><div class="cust_faq_title">${article.board_title }</div></button>
<div class="panel">
  <p><div class="cust_faq_content">${article.board_content} </div></p>
  
              <c:choose> 
           <c:when test="${not empty article.board_img && article.board_img!='null' }"> 
                 <input  type= "hidden"   name="originalFileName" value="${article.board_img }" />
                <img src="${contextPath}/download.do?board_num=${article.board_num}&board_img=${article.board_img}" id="preview"  /><br>
          </c:when>
         <c:otherwise>    
         </c:otherwise>
    </c:choose>
    
</div>
</c:forEach>
	
	
            
            

            
        
	
	
	
	
	<script>
var acc = document.getElementsByClassName("accordion");
var i;

for (i = 0; i < acc.length; i++) {
  acc[i].addEventListener("click", function() {
    this.classList.toggle("active");
    var panel = this.nextElementSibling;
    if (panel.style.maxHeight) {
      panel.style.maxHeight = null;
    } else {
      panel.style.maxHeight = panel.scrollHeight + "px";
    } 
  });
}
</script>







<%-- 	  <c:choose>
	  <c:when test="${articlesList ==null }" >
	  	<div class="cust_faq">
		<div class="cust_faq_title">등록된 글이 없습니다.</div>
		<div class="cust_faq_content"></div>
		<div class="cust_faq_br">
			<br>
		</div>
	</div>
	  </c:when>
	  <c:when test="${articlesList !=null }" >
	   <c:forEach  var="article" items="${articlesList }" varStatus="articleNum" >
	<div class="cust_faq">
		<div class="cust_faq_title">${article.board_title }</div>
		<div class="cust_faq_content">${article.board_content }</div>
		<div class="cust_faq_br">
			<br>
		</div>
	</div>
	</c:forEach>
	</c:when>
	</c:choose>	 --%>
</body>
</html>