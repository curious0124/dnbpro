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

</style>
<script src="${contextPath}/resources/js/jquery-3.5.1.min.js"> </script>
   <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4/jquery.min.js"></script>
<body>



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
     ${equip.eq_name}
    </div>
    <div class="col">
    <a href="${contextPath}/equip/view_Eq_detail.do?eq_name=${equip.eq_name}">${equip.eq_thumimg}&nbsp;</a>
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
</div>

    <table align="center">
        <tr>
            <td>이전</td>
            <td>1</td>
            <td>2</td>
            <td>3</td>
            <td>4</td>
            <td>5</td>
            <td>6</td>
            <td>7</td>
            <td>8</td>
            <td>9</td>
            <td>10</td>
            <td>다음</td>
        </tr>
    </table>
</body>

</html>
