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


<style>
/*     .d {
        float: left
    }

 */   

/*     .td1 {
        width: 100px;
        text-align: center;
        border: "1";
    } */
   
            #admin_menu{
            margin: 0;
            font-size: 0.9em;
            padding: 0;
            width:200px;
            margin-top: 46px;
            float: left;
        }
        #admin_menugroup{
            width:200px;
            text-indent: 10px;
            margin: 0;
            padding: 0;
        }
        #main_menu{
            margin-bottom:  5px;
        }
        #admin_menugroup li{
            list-style: none;
        }
        
        #co1{
            width: 300px;
             float: right;
            color: #2e2751;
            font-weight: bold;
           
        }
        
         #co2{
          width: 250px;
          
           float: right;
            color: #2e2751;
            font-weight: bold;
          
            
        }
        
         #co3{
          width: 300px;
           float: right;
            color: #2e2751;
            font-weight: bold;
          
            
        }
        
         #co4{
          width: 100px;
           float: left;
            color: #2e2751;
            font-weight: bold;
          
            
        }
/*         #co4.col{
           width: 200px;
        } */
        .admin_menutitle{
            height: 35px;
            line-height: 35px;   
            
           
            font-size:1.1em;
            color: white;
            font-weight: bold;
            text-align: left;
            background: #FA8072;
             cursor: pointer;
        }
        .admin_menusub{
            margin: 0;
            padding: 0;
        }
        .listrow li{
            margin-bottom: 2px;
            height: 35px;
            line-height: 35px;
            background: #a4a4a4;
            text-align: left;
/*            margin-left: -32px;*/
        }
        .listrow li a{
            text-decoration: none;
            display: block;
            width:100%;
            height:100%;
            color: white;
            text-indent: 40px;
        }
        .listrow li a:hover{
            background: #FFF5EE;
            color: black;
            font-weight: bold;
        }
        .listrow li{
            margin-bottom: 2px;
            height: 35px;
            line-height: 35px;
            background: #a4a4a4;
            text-align: left;
/*            margin-left: -32px;*/
        }
        .listrow li a{
            text-decoration: none;
            display: block;
            width:100%;
            height:100%;
            color: white;
            text-indent: 40px;
        }
/*         .col{
        color: #2e2751;
        width: 200px;
        
        
        }
        */
        .eq_list_view{
        width: 1000px;
        } 
        
        #preview{
           width: 100px;
          height: 100px;
           
            color: #2e2751;
            font-weight: bold;
          	
        }
        
        .namec1{
          font-weight: bold;
          width: 250px;
        }
       
       .namec2{
          font-weight: bold;
           width: 300px;
        }
        
        .namec3{
          font-weight: bold;
           width: 300px;
        }
        
        .namec4{
          font-weight: bold;
           width: 100px;
        }
        
        .searchviewlist{
        
        }
        
#eq_namelink{
font-family: RIDIBatang;
font-weight: bold;
} 
 
       

#eq_namelink{color: black; text-decoration: none;}
#eq_namelink:hover{color: red;}

 #listPaging{  clear:both; text-align:center; margin:0 auto;}
        #listPaging > ul{margin:0 auto; width:800px; display:center;  }
        #listPaging > ul > li{
        	list-style: none; display:inline-block; padding: 6px;
</style>
<script src="${contextPath}/resources/js/jquery-3.5.1.min.js"> </script>
   <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4/jquery.min.js"></script>



<script>
   $(function() {

      $(".CancleResq").click(
            function() {
               var answer = confirm("예약신청을 취소하시겠습니까?");
               if (answer == true) {

                  
                  var resq_num = $(this).parent().find(
                        "input:nth-child(2)").val();

            
                  
                  $("#cancleResqnum").val(resq_num);
                  var test = $('#cancleResqnum').val();
                  
                  

                  $("#ResqcancleForm").submit();
               }
            });

   });
</script>

</head>

<body>

   <!-- 상단 배너 -->
   <div class="breadcrumbs overlay"
      style="background-image:url('${contextPath}/resources/image/page_banner.jpg')">
   
      <div class="container">
         <div class="row">
            <div class="col-12">
               <div class="bread-inner">
                  <!-- Bread Menu -->
                  <div class="bread-menu">
                     <ul>
                        <li><a href="${contextPath}/main/main.do">Home</a></li>
                        <li><a href="${contextPath}/equip/view_Eq_list.do">Equipment</a></li>
                     </ul>
                  </div>
                  <!-- Bread Title -->
                  <div class="bread-title">
                     <h2>Equipment</h2>
                  </div>
               </div>
            </div>
         </div>
      </div>
   </div>
   <!-- 상단 배너 -->
   
   <section class="features-area section-bg">
      <div class="container" id="edu_table">
 <div class="container eq_list_view">
<form role="form" method="get">
 
    <div class="searchviewlist"> <select name="searchType">
      <option value="no" <c:out value="${cri.searchType == null ? 'selected' : ''}"/>>-----</option>
       <option value="qw"<c:out value="${cri.searchType eq 'qw' ? 'selected' : ''}"/>selected>모델명+카테고리</option>
      <option value="q"<c:out value="${cri.searchType eq 'q' ? 'selected' : ''}"/>>모델명</option>
      <option value="w"<c:out value="${cri.searchType eq 'w' ? 'selected' : ''}"/>>카테고리</option>
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
  
   <hr width="100%"  >
  <div class="row align-items-start">
     <div class="namec1">
     썸네일
    </div>
    <div class="namec2"  >
     모델명
    </div>
     <div class="namec3" >
     분류명
    </div>
  
    <div class="namec4" >
   제조사
    </div>
  </div>
    <hr width="100%" color="black" >
 
    <c:choose>
        <c:when test="${listequips !=null }">
            <c:forEach var="equip" items="${listequips }">
 
  <div class="row align-items-center">
  
    
    <div  id="co2">
    <input  type= "hidden"   name="originalFileName" value="${equip.eq_thumimg}" /> 
   <img src="${contextPath}/equipthumimg_download.do?eq_name=${equip.eq_name}&eq_thumimg=${equip.eq_thumimg}" id="preview"  />
    </div>
    <div id="co1">
      <a id="eq_namelink" href="${contextPath}/equip/view_Eq_detail.do?eq_name=${equip.eq_name}">${equip.eq_name}&nbsp;</a>
    </div>
     <div  id="co3">
    ${equip.cate_name}
    </div>
    <div  id="co4">
    ${equip.eq_ma}
    </div>
  </div>
   <hr width="100%" >
            </c:forEach>
              
        </c:when>
        <c:when test="${listequips ==null }">
 <div class="row align-items-end">
    <div class="col">
    등록된장비가없습니다
    </div></div>
      </c:when>
    </c:choose>
 
    
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

 
</div>
	</section>

</body>

</html>