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
        
      
        </div>

 
        <div class="container">
            <div class="row align-items-start">
                
          
                <div class="col">
                    시리얼번호
                </div>
            
                <div class="col">
                    상태
                </div>
                 <div class="col">
                    비고
                </div>
   
            </div>
            <hr width="100%">
 <form name="modSerialstate" method="post"   action="${contextPath}/equip/modSerialState.do?eq_serial=${adminequip.eq_serial}" >
           

                        <div class="row align-items-center">
                          
                            <div class="col">
                                ${equipVO.eq_serial}
                            </div>
                          
                           
                         
                            <div class="col">
                                 <select name="eq_state">
                                    <option selected>선택</option>
                                    <option value="정상" >정상</option>
                                    <option value="수리">수리</option>
                                    <option value="폐기">폐기</option>
                                </select>
                              
                            </div>
                            <div class="col">
                           
                               
                                 <input type="submit" value="상태변경">
                              
                            </div>
                  
                            
                               
                            
                            
                        </div>

                

              
            <hr width="100%">

        
               </form>     
    </div>
       
</body></html>
