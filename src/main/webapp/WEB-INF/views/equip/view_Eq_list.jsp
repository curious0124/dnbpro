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
       
    <title>��񸮽�Ʈ</title>


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

</style>
<script src="${contextPath}/resources/js/jquery-3.5.1.min.js"> </script>
   <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4/jquery.min.js"></script>

<script>

//function fn_process(){
	
//	var item  = catenameList;  
//	    console.log('sfs');
//	$.ajax({ 
  
// type: "get", // Ÿ��
//	dataType:"json", //�޾ƿ� ���� ���� 
//	data : {}, // �Ķ���� ������
//	url: "${contextPath}/equip/selectcate.do",  //url
	
	//data : $("#form1").serialize(), //�Ķ�������·� ������ ���
//	success: function(data){       //������ data��� ������ ���ϰ��� ��Ī�� ������Ʈ������ ���Ͻ� ���� �Ľ��ؾߵ� 
//		 location.href = "${contextPath}/equip/view_Eq_list.do?cate_name="+reurl;
//	   alert("����!"); 
	  
//	},complete: function(data){
	   //���� �߾��� �Ϸᰡ �Ǿ�����..
//	},error: function (request, status, error) {
//	   alert("����"); 
//	} 
//	});
	
// }
</script>

<script>
	$(function() {

		$(".CancleResq").click(
				function() {
					var answer = confirm("�����û�� ����Ͻðڽ��ϱ�?");
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

   <div id='admin_menu'>
    
       
       
       <ul class="listrow" > 
   <!--  <li class="admin_menutitle"><a href="${contextPath}/equip/view_Eq_list.do">��ü</a></li>  -->
  <c:choose>
  <c:when test="${cateList !=null }" >
    <c:forEach  var="cate" items="${cateList }" varStatus="cateNum" >
    
    <!--  
    <li class="listrow" id='brd_div2' onClick="fn_process()" value="${cate.cate_name}"><a href="${contextPath}/equip/view_Eq_list.do?cate_name=${equip.cate_name}">${cate.cate_name}</a></li>
 -->
    </c:forEach>
     </c:when>
  <c:when test="${cateList == null }" >
   
    <li class="listrow" id='brd_div2'></li>
 
  </c:when>
    </c:choose>
             
               
 </ul>
    </div>
 

<form role="form" method="get">
 
    <div class="searchviewlist"> <select name="searchType">
      <option value="no"<c:out value="${cri.searchType == null ? 'selected' : ''}"/>>-----</option>
       <option value="qw"<c:out value="${cri.searchType eq 'qw' ? 'selected' : ''}"/>selected>�𵨸�+ī�װ�</option>
      <option value="q"<c:out value="${cri.searchType eq 'q' ? 'selected' : ''}"/>>�𵨸�</option>
      <option value="w"<c:out value="${cri.searchType eq 'w' ? 'selected' : ''}"/>>ī�װ�</option>
    </select>
                        
                        <input type="text" name="keyword" id="keywordInput" value="${cri.keyword}"/>

    <button id="searchBtn" type="button">�˻�</button>
    <script>
      $(function(){
        $('#searchBtn').click(function() {
          self.location = "view_Eq_list.do" + '${pageMaker.makeQuery(1)}' + "&searchType=" + $("select option:selected").val() + "&keyword=" + encodeURIComponent($('#keywordInput').val());
        });
      });   
    </script>
    
    
    
                    </div>
                    </form>



    

<div class="container">

  
  
  <div class="row align-items-start">
    <div class="col">
     �𵨸�
    </div>
    <div class="col">
     �����
    </div>
     <div class="col">
     �з���
    </div>
  
    <div class="col">
   ������
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
    ${equip.cate_name}
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
    ��ϵ���񰡾����ϴ�
    </div>
      </c:when>
    </c:choose>
    <hr width="100%">
    
    <div id="listPaging" >
				<ul>
					<c:if test="${pageMaker.prev}">
						<li><a href="view_Eq_list.do${pageMaker.makeSearch(pageMaker.startPage - 1)}">����</a></li>
					</c:if>
					<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="idx">
						
						<li><a href="view_Eq_list.do${pageMaker.makeSearch(idx)}">${idx}</a></li>
					</c:forEach>
					<c:if test="${pageMaker.next && pageMaker.endPage > 0}">
						<li><a href="view_Eq_list.do${pageMaker.makeSearch(pageMaker.endPage + 1)}">����</a></li>
					</c:if>
				</ul>
			</div>	
    
    
</div>

   
</body>

</html>
