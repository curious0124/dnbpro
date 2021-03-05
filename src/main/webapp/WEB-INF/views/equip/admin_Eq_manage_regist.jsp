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

<head>
    <meta charset="UTF-8">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>
    <title>모델명 등록</title>
        <style>
       body {
            background: #f4f9fc;
        }
    #board_content{
            margin: 0 auto;
            margin-top: 20px;
            width: 850px;
        }
        
        a{
            color: black;
            text-decoration: none;
        }
        .board_container{
            margin:0 auto;
            float: left;
            width: 650px;  
            margin-top: 60px;          
        }
        .listrow{
            width: 500px;
            clear:both;
            text-align: center;
            margin:0 auto;
            
            
            
        }
        .col_top{
            float: left;
            color: #2e2751;
            font-weight: bold;
            border-bottom:2px solid #2e2751;
            border-top:2px solid #2e2751;
            margin-bottom: 10px;
            
        }
        .col_list{
            float: left;
            border-bottom:1px solid #f0f0f0;
            padding: 0px 0px 0px 0px;
           
        }
        
       
        .checkBox { 
        float:left; 
        }
        
        #brd_div1{
            width: 100px;
        }
        #brd_div2{
            width: 200px;
            text-align: left;
        }
        
        #brd_div3{
            width: 290px;
            text-align: left;
        }
        #brd_div4{
            width: 100px;
            text-align: right;
        }
       
        #top_buttonbox{
            max-width: 400px;
            text-align: right;
            padding-right: 20px;
            margin:0 auto;
            margin-top: 20px;
            margin-bottom: 10px;
            
        }
        .text_box01{
           width: 201px;
           height: 20px;
           padding: 0;
        }
        .text_box02{
        	width: 500px;
        	height: 200px;
        	padding: 0;
        }
        .img_box01{
           width: 201px;
           height: 30px;
           vertical-align: top;
           font-size: 16px;
           padding: 0;
        }
        
        #articlefrom1{
           width: 400px;
        }
        .articlefrom001{
           text-align: center;
        }
        .btn_box001{
           width: 400px;
           text-align: center;
         margin-left: 50px;
        }
        .model_title{
           text-align: left;
           font-size: 25px;
           margin-top: -53px;
        }
      
        

    </style>
    <script src="${contextPath}/resources/js/jquery-3.5.1.min.js"> </script>
   
<script>
    
    $(function(){           
            $('#menucontent').load("${contextPath}/resources/subjsp/admin_menubar.jsp")
    });
   
   
    
    function readURL(input) {
        if (input.files && input.files[0]) {
           var reader = new FileReader();
           reader.onload = function (e) {
            
             $('#preview').attr('src', e.target.result);
            }
           reader.readAsDataURL(input.files[0]);
        }
    }
        
    function readURL1(input) {
        if(input.files && input.files[0]){ // 두번째 선택 파일이 있을경우
            var reader = new FileReader();
            reader.onload = function(e){
         
          $('#preview2').attr('src', e.target.result);
            }
            reader.readAsDataURL(input.files[0]);
          }
    }

</script>
</head>

<body>
   <div id='board_content'>
      <!--menu bar -->
      <div id='menucontent'></div>
      
   
   <form action="${contextPath}/equip/addeqname.do" method="post" enctype="multipart/form-data">

            <!--board_container -->
            <div class="board_container">
            <div class="listrow">
                <p class="model_title">모델 등록</p>
            </div>
                <div class="listrow">
                    <div class="col_top" id='brd_div1'>
                           분류코드
                    </div>
                     <div class="col_top" id='brd_div1'>
                        <select name="cate_name" >
                            <option selected>분류코드</option>
                             <c:forEach  var="cate" items="${cateList }" varStatus="cateNum" >
                                        <option value="${cate.cate_name}">${cate.cate_name}</option>
                                       
                              </c:forEach>
                        </select>
                    </div>

                    <div class="col_top" id='brd_div1'>
                           모델명
                    </div>
                     <div class="col_top" id='brd_div2'>
                       <input type="text" name="eq_name" class="text_box01">
                    </div>
                    
                  </div>
                <div class="listrow">
                    <div class="col_top" id='brd_div1'>
                           &nbsp;
                    </div>
                     <div class="col_top" id='brd_div1'>
                       &nbsp;
                    </div>

                    <div class="col_top" id='brd_div1'>
                           제조사
                    </div>
                     <div class="col_top" id='brd_div2'>
                       <input type="text" name="eq_ma" class="text_box01">
                    </div>
                    
                  </div>
                <div class="listrow">
                    <div class="col_top" id='brd_div1'>
							스펙 입력
                           &nbsp;
                    </div>
                     <div class="col_top" id='brd_div1'>
                       &nbsp;
                    </div>

                    <div class="col_top" id='brd_div1'>
                       	 &nbsp;
                    </div>
                     <div class="col_top" id='brd_div2'>
                     	&nbsp;
                    </div>
                    
                  </div>
                  <div class="listrow">
                  <textarea rows="" cols="" name="eq_spec" class="text_box02"></textarea>
                  
                  </div>
                <div class="listrow">
                    <div class="col_top" id='brd_div1'>
                          상세이미지
                    </div>
                     <div class="col_top" id='brd_div1'>
                      &nbsp;
                    </div>
                     <div class="col_top" id='brd_div1'>
                      &nbsp;
                    </div>
                     <div class="col_top" id='brd_div2'>
                      &nbsp;
                    </div>
                 </div>
                 <div class="listrow">
                           <input type="file" class="img_box01" id="img" aria-describedby="inputGroupFileAddon03" name="eq_img" aria-label="Upload" onchange="readURL(this);"  multiple >
                           &nbsp; &nbsp;
                         <img  id="preview" src="#"   width=200 height=200/>
                  </div>
                <div class="listrow">
                    <div class="col_top" id='brd_div1'>
                          썸네일
                    </div>
                     <div class="col_top" id='brd_div1'>
                      &nbsp;
                    </div>
                     <div class="col_top" id='brd_div1'>
                      &nbsp;
                    </div>
                     <div class="col_top" id='brd_div2'>
                      &nbsp;
                    </div>
                 </div>
                 <div class="listrow">
                          <input type="file" class="img_box01" id="thum" aria-describedby="inputGroupFileAddon04" name="eq_thumimg" aria-label="Upload2" onchange="readURL1(this);" multiple >
                          &nbsp; &nbsp;
                         <img  id="preview2" src="#"   width=200 height=200/>
                  </div>

       

           <div class="listrow">
                    <input type="submit" class="btn btn-light " value="분류명등록" /> &nbsp;
                    <input type="reset" class="btn btn-light " value="다시입력" /> &nbsp;
               <input type="button" class="btn btn-light fs" id='brd_btn' value="이전페이지" onClick="history.back()" />      
            </div>
            &nbsp;&nbsp;
    </form>
 
 </div>
</body>

</html>