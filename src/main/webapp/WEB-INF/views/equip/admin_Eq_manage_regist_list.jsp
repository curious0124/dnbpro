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

<head>
    <meta charset="UTF-8">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>
    <title>모델명 리스트</title>
    <style>
        #board_content {
            margin: 0 auto;
            width: 1050px;
        }

        a {
            color: black;
            text-decoration: none;
        }

        .board_container {
            margin: 0 auto;
            float: left;
            width: 825px;

        }

        .listrow {
            width: 825px;
            clear: both;
            text-align: center;



        }

        .col_top {
            float: left;
            background: #FA8072;
            color: white;
            font-weight: bold;

        }

        .col_list {
            float: left;
            background: #FFF5EE;
            padding: 0px 0px 0px 0px;

        }


        .checkBox {
            float: left;
        }

        #brd_div1 {
            width: 100px;
        }

        #brd_div2 {
            width: 100px;
        }

        #brd_div3 {
            width: 150px;
        }

        #brd_div4 {
            width: 150px;
        }

        #brd_div5 {
            width: 300px;
        }



        #top_buttonbox {
            min-width: 800px;
            text-align: right;
            padding-right: 50px;
            margin-bottom: 8px;
        }

        #brd_btn {
            font-size: 0.5em;
            width: 50px;
            height: 10px;
            padding: 2px;
            line-height: 5px;

        }

    </style>
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>


   

</head>

<body>
    <div>
  </div>
        <div>
            <strong>모델명 목록</strong>
        </div>

      
            <!--board_container -->
            <div class="board_container">
                <div id='top_buttonbox'>

                    <button type="button" class="btn btn-light " id="addcatename" onclick="location.href='${contextPath}/equip/admin_Eq_manage_regist.do?cate_name'">등록</button>
                     <div  class="delBtn"><button type="button" class="selectDelete_btn" >삭제</button>
                     
                      <script>
   
    $(".selectDelete_btn").click(function(){
    	  var confirm_val = confirm("정말 삭제하시겠습니까?");
    	  
    	  if(confirm_val) {
    	   var checkArr = new Array();
    	   
    	   $("input[class='chBox']:checked").each(function(){
    	    checkArr.push($(this).attr("value"));
    	   });
    	    
    	   $.ajax({
    	    url : "${contextPath}/equip/deleteEqname.do",
    	    type : "post",
    	    data : { chbox : checkArr },
    	    success : function(){
    	     location.href = "${contextPath}/equip/admin_Eq_manage_regist_list.do";
    	    }
    	   });
    	  } 
    	 });

    </script>
                </div>
                <div class="listrow">
                    <div class="col_top allCheck" id="brd_div1">
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
                   
                    <div class="col_top" id='brd_div3'>
                        모델명
                    </div>
                    <div class="col_top" id='brd_div4'>
                        제조사
                    </div>
                    <div class="col_top" id='brd_div5'>
                        스펙
                    </div>


                </div>

                <c:choose>

                    <c:when test="${eqnameList !=null }">

                        <c:forEach var="model" items="${eqnameList }" varStatus="cateNum">
                            <div class="listrow">
                                <div class="col_list checkBox" id='brd_div1'>
                                    <input type="checkbox" name="RowCheck" class="chBox" value="${model.eq_name}">
 
                                         <script>
 $(".chBox").click(function(){
  $("#allCheck").prop("checked", false);
 });
</script>

                                </div>
                               
                                <div class="col_list" id='brd_div3'>
                                    ${model.eq_name}
                                </div>
                                <div class="col_list" id='brd_div4'>
                                    ${model.eq_ma}
                                </div>
                                <div class="col_list" id='brd_div5'>
                                    ${model.eq_spec}
                                </div>


                            </div>
                        </c:forEach>
                    </c:when>






                    <c:when test="${eqnameList == null }">
                        <div class="listrow">


                        </div>


                    </c:when>
                </c:choose>


            </div>
        

    </div>

</body>

</html>
