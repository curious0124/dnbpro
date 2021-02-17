<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" %>
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

    <title>보유장비리스트</title>
</head>
<style>
    .td1 {
        width: 100px;
        text-align: center;
        border: "1";
    }

    .col1 {
        display: inline-block;
        width: 150px;
        float: left;
    }
   	
</style>
<script src="${contextPath}/resources/js/jquery-3.5.1.min.js"> </script>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4/jquery.min.js"></script>
 <script  src="http://code.jquery.com/jquery-latest.min.js"></script>

<body>

    <div class="row align-items-start">
        <div class="col1" >
            <input type="search" placeholder="검색어를 입력해주세요.">
        </div>
        <div class="col1" >
            <button>검색</button>
        </div>

        <div class="col1" >
            <input type="button" value="분류등록" onclick="location.href='admin_Eq_manage_classify_list.do'">
        </div>
        <div class="col1" >
            <input type="button" value="모델등록" onclick="location.href='admin_Eq_manage_regist_list.do'">
        </div>
        <div class="col1" >
            <input type="button" value="시리얼등록" onclick="location.href='${contextPath}/equip/admin_Eq_manage_serial.do?eq_name'">
        </div>
        <div class="col1" >
            <button type="button" class="selectDelete_btn " >삭제</button>
             <script>
 $(".selectDelete_btn").click(function(){
  var confirm_val = confirm("정말 삭제하시겠습니까?");
  
  if(confirm_val) {
   var checkArr = new Array();
   
   $("input[class='chBox']:checked").each(function(){
    checkArr.push($(this).attr("value"));
   });	
    
   $.ajax({
    url : "${contextPath}/equip/deleteSerial.do",
    type : "post",
    data : { chbox : checkArr },
    success : function(){
     location.href = "${contextPath}/equip/admin_Eq_manage_list.do";
    }
   });
  } 
 });
</script>
        </div>

 
        <div class="container">
            <div class="row align-items-start">
                <div class="col">
                    <input type="checkbox" name="allCheck" id="allCheck"  onclick="checkAll(this)"> 
                        <script>
$("#allCheck").click(function(){
 var chk = $("#allCheck").prop("checked");
 if(chk) {
  $(".chBox").prop("checked", true);
 } else {
  $(".chBox").prop("checked", false);
 }
});
</script>
                </div>
                <div class="col">
                    분류
                </div>
                <div class="col">
                    모델명
                </div>
                <div class="col">
                    시리얼번호
                </div>
                <div class="col">
                    등록일
                </div>
                <div class="col">
                    상태
                </div>
                 <div class="col">
                    비고
                </div>
   
            </div>
            <hr width="100%">

            <c:choose>
                <c:when test="${adminequipList !=null }">
                    <c:forEach var="adminequip" items="${adminequipList }">

                        <div class="row align-items-center">
                            <div class="col">
                                <input type="checkbox" name="RowCheck" class="chBox" value="${adminequip.eq_serial }" >
                                     <script>
 $(".chBox").click(function(){
  $("#allCheck").prop("checked", false);
 });
</script>
                            </div>
                            <div class="col">
                                ${adminequip.cate_name}
                            </div>
                            <div class="col">
                                ${adminequip.eq_name}
                            </div>
                            <div class="col">
                                ${adminequip.eq_serial}
                            </div>
                            <div class="col">
                                 <fmt:formatDate pattern="yyyy-MM-dd" value="${adminequip.eq_regist}" />
                            </div>
                          
                            <div class="col">
                                ${adminequip.eq_state}
                            </div>
                            <div class="col">
                                   <input type="button" value="상태변경" onclick="location.href='admin_Eq_manage_serialmod.do?eq_serial=${adminequip.eq_serial}'">
                            </div>
                  
                            
                               
                            
                            
                        </div>

                    </c:forEach>
                </c:when>

                <c:when test="${adminequipList ==null }">
                    <div class="row align-items-end">
                        <div class="col">

                        </div>
                    </div>
                </c:when>
            </c:choose>
            <hr width="100%">

        </div>
                 
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
</body></html>
