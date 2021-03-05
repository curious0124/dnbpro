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

        #brd_div1 {
            width: 100px;
        }

        #brd_div2 {
            width: 200px;
        }

        #brd_div3 {
            width: 200px;
        }

        #brd_div4 {
            width: 200px;
            height: 100px;
        }

        #brd_div5 {
            width: 300px;
            height: 200px
        }


        #brd_div6 {
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
            height: 30px;
            padding: 2px;
            line-height: 5px;

        }

        #im1 {
            height: 200px;
            width: 300px;
        }

    </style>
    <script src="${contextPath}/resources/js/jquery-3.5.1.min.js"> </script>
    <script>


    </script>

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
   <form action="${contextPath}/equip/addeqname.do" method="post" enctype="multipart/form-data">

        <div>

            <div>
                <strong>모델 등록</strong>
            </div>


            <!--board_container -->
            <div class="board_container">
                <div id='top_buttonbox'>

                    <input type="submit" value="분류명등록" /> <input type="reset" value="다시입력" />

                </div>
                <div class="listrow">
                    <div class="col_top" id='brd_div1'>
                        분류코드
                    </div>
                    <div class="col_top" id='brd_div2'>
                        모델명
                    </div>
                    <div class="col_top" id='brd_div3'>
                        제조사
                    </div>
                    <div class="col_top" id='brd_div6'>
                        스펙
                    </div>

                </div>

                <div class="listrow">
                    <div class="col_list" id='brd_div1'>
                        <select name="cate_name" >
                            <option selected>분류코드</option>
                             <c:forEach  var="cate" items="${cateList }" varStatus="cateNum" >
                                        <option value="${cate.cate_name}">${cate.cate_name}</option>
                                       
                              </c:forEach>
                        </select>
                    </div>
                    <div class="col_list" id='brd_div2'>
                        <input type="text" name="eq_name">
                    </div>
                    <div class="col_list" id='brd_div3'>
                        <input type="text" name="eq_ma">
                    </div>
                    <div class="col_list" id='brd_div6'>
                        <textarea name="eq_spec"></textarea>
                    </div>

                </div><br><br><br>

                <div class="listrow">
                    <div class="col_top" id='brd_div6'>
                        상세이미지
                    </div>
                    <div class="col_top" id='brd_div6'>
                        썸네일
                    </div>


                </div>

                <div class="listrow">
                    <div class="col_list" id='brd_div5'>
                        <input type="file" class="form-control" id="img" aria-describedby="inputGroupFileAddon03" name="eq_img" aria-label="Upload" onchange="readURL(this);"  multiple >
                   <img  id="preview" src="#"   width=200 height=200/>
                    </div>
                   
                    <div class="col_list" id='brd_div5'>
                  <input type="file" class="form-control" id="thum" aria-describedby="inputGroupFileAddon04" name="eq_thumimg" aria-label="Upload2" onchange="readURL1(this);" multiple >
                   <img  id="preview2" src="#"   width=200 height=200/>

   
                    </div>


                </div>


            </div>

        </div>
    </form>
 <input type="button"   class="btn btn-light fs" id='brd_btn' value="이전페이지" onClick="history.back()" />
</body>

</html>
