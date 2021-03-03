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
<style>body {
            background: #f4f9fc;
        }
		.fs{
            color: black;
            font-family: 'RIDIBatang';
            text-decoration: none;
        }
		#board_content{
            margin: 0 auto;
            width: 1200px;
            margin-top:20px;
        }
        #menucontent{padding:50px 0px 0px 0px;
		}
        .board_container{
            margin-left:20px;
            margin-top:-50px;
            float: left;
            width: 890px;
        }
        #top_buttonbox{
            min-width: 890px;
            text-align: right;
            padding-right: 20px;
            margin-bottom: 10px;
        }
        .listrow{
            width: 890px;
            clear:both;
            text-align: center;
        }
		.col1 {margin-top: 10px;
	        width: 100px;
	        float: right;text-align:center;
	    }
		.col2 {
	        width: 50px;
	        float: left;text-align:center;
	    }
	    .col3 {
	        width: 160px;
	        float: left;
	        text-align:center;
	    }
	    .col4 {
	        width: 100px;
	        float: left;text-align:center;
	    }
	    .col_top{
            color: #2e2751;
            font-weight: bold;
            border-bottom:2px solid #2e2751;
            border-top:2px solid #2e2751;
            margin-top:10px;
            
        }
        .col_list{
            float: left;
            border-bottom:1px solid #f0f0f0;
            padding: 0px 0px 0px 0px;
           
        }
        .modfiybt{height:15px;font-size:0.5em;padding: 2px;line-height:5px;}
	    
    
        #listPaging{  clear:both; text-align:center; margin:0 auto;}
        #listPaging > ul{margin:0 auto;width:500px;}
        #listPaging > ul > li{
        	list-style: none; float: left; padding: 6px;
        	}
   	
</style>
<script src="${contextPath}/resources/js/jquery-3.5.1.min.js"> </script>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4/jquery.min.js"></script>
 <script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
$(function() {
		$('#menucontent').load("${contextPath}/resources/subjsp/admin_menubar.jsp");
		
		$("#allCheck").click(function(){
			 var chk = $("#allCheck").prop("checked");
			 if(chk) {
			  $(".chBox").prop("checked", true);
			 } else {
			  $(".chBox").prop("checked", false);
			 }
			});
		
		
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
		
		 $(".chBox").click(function(){
			  $("#allCheck").prop("checked", false);
			});
		
		 $('#searchBtn').click(function() {
	          self.location = "admin_Eq_manage_list.do" + '${pageMaker.makeQuery(1)}' + "&searchType=" + $("select option:selected").val() + "&keyword=" + encodeURIComponent($('#keywordInput').val());
	        });
		
});
</script>
<body>
<div id='board_content'>
  	<div id='menucontent'></div>
  	<div class="board_container">
  		<div id='top_buttonbox'>
		<form role="form" method="get">
		    <div class="search">
		    	<select name="searchType">
			      	<option value="no"<c:out value="${cri.searchType == null ? 'selected' : ''}"/>>-----</option>
			       	<option value="tc"<c:out value="${cri.searchType eq 'tc' ? 'selected' : ''}"/>selected>모델명+시리얼명</option>
			      	<option value="i"<c:out value="${cri.searchType eq 'i' ? 'selected' : ''}"/>>모델명</option>
			      	<option value="n"<c:out value="${cri.searchType eq 'n' ? 'selected' : ''}"/>>시리얼명</option>
		    	</select>
		        <input type="text" name="keyword" id="keywordInput" value="${cri.keyword}"/>
		    	<button id="searchBtn" class="btn btn-light fs"  type="button">검색</button>
		     </div>
         </form>
        

        <div class="col1" >
            <input type="button" class="btn btn-light fs" value="분류등록" onclick="location.href='admin_Eq_manage_classify_list.do'">
        </div>
        <div class="col1" >
            <input type="button" class="btn btn-light fs" value="모델등록" onclick="location.href='admin_Eq_manage_regist_list.do'">
        </div>
        <div class="col1" >
            <input type="button" class="btn btn-light fs" value="시리얼등록" onclick="location.href='${contextPath}/equip/admin_Eq_manage_serial.do?eq_name'">
        </div>
        <div class="col1" >
            <input type="button" class="btn btn-light fs selectDelete_btn" value="선택삭제"  >
             <script>
				 
			</script>
        </div>
		</div>
 
        <div class="listrow toplow">
                <div class="col2 col_top"><input type="checkbox" name="allCheck" id="allCheck"  onclick="checkAll(this)"></div>
                <div class="col3 col_top">분류</div>
                <div class="col3 col_top">모델명</div>
                <div class="col3 col_top">시리얼번호</div>
                <div class="col3 col_top"> 등록일</div>
                <div class="col4 col_top">상태</div>
                <div class="col4 col_top">비고</div>
          </div>

            <c:choose>
                <c:when test="${adminequipList !=null }">
                    <c:forEach var="adminequip" items="${adminequipList }">
                        <div class="listrow">
                            <div class="col2 col_list"><input type="checkbox" name="RowCheck" class="chBox" value="${adminequip.eq_serial }" ></div>
                            <div class="col3 col_list">${adminequip.cate_name}</div>
                            <div class="col3 col_list">${adminequip.eq_name}</div>
                            <div class="col3 col_list">${adminequip.eq_serial}</div>
                            <div class="col3 col_list"><fmt:formatDate pattern="yyyy-MM-dd" value="${adminequip.eq_regist}" /></div>
                          	<div class="col4 col_list">${adminequip.eq_state}</div>
                            <div class="col4 col_list"><input type="button" class="btn btn-light fs modfiybt" value="상태변경" onclick="location.href='admin_Eq_manage_serialmod.do?eq_serial=${adminequip.eq_serial}'"></div>    
                        </div>
                    </c:forEach>
                </c:when>
                <c:when test="${adminequipList ==null }">
                    <div class="listrow">
                        <div class="col"></div>
                    </div>
                </c:when>
            </c:choose>
        
        
        <div id="listPaging" >
			<ul>
				<c:if test="${pageMaker.prev}">
				<li><a  class="fs" href="admin_Eq_manage_list.do${pageMaker.makeSearch(pageMaker.startPage - 1)}">이전</a></li>
				</c:if>
				<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">		
				<li><a  class="fs" href="admin_Eq_manage_list.do${pageMaker.makeSearch(idx)}">${idx}</a></li>
				</c:forEach>
				<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
				<li><a  class="fs" href="admin_Eq_manage_list.do${pageMaker.makeSearch(pageMaker.endPage + 1)}">다음</a></li>
				</c:if>
			</ul>
		</div>	      
    </div>
   </div>
       
</body></html>
