<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"
   isELIgnored="false"  %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
  
<%
  request.setCharacterEncoding("UTF-8");
%>

<!DOCTYPE html>
<html lang="en">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
<head>
    <meta charset="UTF-8">
       
    <title>장비리스트</title>
</head>
<style>
    .d {
        float: left
    }

    .d1 {
        width: 150px;

    }

    .d2 {
        width: 200px;
    }

    .d3 {
        width: 550px;
    }
    .d4{
        width: 32px;
    }

    .td1 {
        width: 100px;
        text-align: center;
        border: "1";
    }
     #listPaging{  clear:both; text-align:center;}
        #listPaging > ul{margin:0 auto;}
        #listPaging > ul > li{
        	list-style: none; float: left; padding: 6px;
        	}

</style>
<script src="${contextPath}/resources/js/jquery-3.5.1.min.js"> </script>
   <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4/jquery.min.js"></script>
<body>
<form role="form" method="get">
 
    <div class="searchviewlist"> <select name="searchType">
      <option value="no"<c:out value="${cri.searchType == null ? 'selected' : ''}"/>>-----</option>
       <option value="qw"<c:out value="${cri.searchType eq 'qw' ? 'selected' : ''}"/>selected>모델명+제조사</option>
      <option value="q"<c:out value="${cri.searchType eq 'q' ? 'selected' : ''}"/>>모델명</option>
      <option value="w"<c:out value="${cri.searchType eq 'w' ? 'selected' : ''}"/>>제조사</option>
    </select>
                        
                        <input type="text" name="keyword" id="keywordInput" value="${cri.keyword}"/>

    <button id="searchBtn" type="button">검색</button>
    <script>
      $(function(){
        $('#searchBtn').click(function() {
          self.location = "view_Eq_list.do" + '${pageMaker.makeQuery(1)}' + "&searchType=" + $("select option:selected").val() + "&keyword=" + encodeURIComponent($('#keywordInput').val());
        });
      });   
    </script>
                    </div>
                    </form>



    <table align="center" border="1">
        <tr>
            <td class="td1">전체</td>
            <td class="td1">서버</td>
            <td class="td1">스위치</td>
            <td class="td1">PC</td>
        </tr>
        <tr>
            <td class="td1">노트북</td>
            <td class="td1">스마트폰</td>
            <td class="td1">태블릿</td>
            <td class="td1">키오스크</td>
        </tr>
    </table>

<div class="container">
  <div class="row align-items-start">
    <div class="col">
     모델명
    </div>
    <div class="col">
     썸네일
    </div>
    <div class="col">
 모델스펙
    </div>
    <div class="col">
   제조사
    </div>
  </div>
    <hr width="100%">
 
    <c:choose>
        <c:when test="${listequips !=null }">
            <c:forEach var="equip" items="${listequips }">
 
  <div class="row align-items-center">
    <div class="col">
      <a href="${contextPath}/equip/view_Eq_detail.do?eq_name=${equip.eq_name}">${equip.eq_name}&nbsp;</a>
    </div>
    <div class="col">
    <input  type= "hidden"   name="originalFileName" value="${equip.eq_thumimg}" /> 
	<img src="${contextPath}/equipthumimg_download.do?eq_name=${equip.eq_name}&eq_thumimg=${equip.eq_thumimg}" id="preview"  />
    </div>
    <div class="col">
    ${equip.eq_spec}
    </div>
    <div class="col">
    ${equip.eq_ma}
    </div>
  </div>
  
            </c:forEach>
              
        </c:when>
        <c:when test="${listequips ==null }">
 <div class="row align-items-end">
    <div class="col">
    등록된장비가없습니다
    </div>
      </c:when>
    </c:choose>
    <hr width="100%">
    
    <div id="listPaging" >
				<ul>
					<c:if test="${pageMaker.prev}">
						<li><a href="view_Eq_list.do${pageMaker.makeSearch(pageMaker.startPage - 1)}">이전</a></li>
					</c:if>
					<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
						
						<li><a href="view_Eq_list.do${pageMaker.makeSearch(idx)}">${idx}</a></li>
					</c:forEach>
					<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
						<li><a href="view_Eq_list.do${pageMaker.makeSearch(pageMaker.endPage + 1)}">다음</a></li>
					</c:if>
				</ul>
			</div>	
    
    
</div>

   
</body>

</html>
