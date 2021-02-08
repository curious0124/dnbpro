<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath"  value="${pageContext.request.contextPath}"  />

<%
  request.setCharacterEncoding("UTF-8");
%>  
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>
    <title>admin_board_articleForm</title>
    <style>
    #board_content{
            margin: 0 auto;
            width: 1050px;
            
        }
       
       .board_container{
            margin:0 auto;
            float: left;
            
            margin-top: 50px;
            margin-left: 20px;
        }
        .badge{
            float: left;
            height: 2em;
            line-height: 18px;
            font-size: 15px;
            background: #FA8072;
            
            margin-right: 3px;
        }
        .form-select{
            width: 120px;
            float: left;
            margin-right: 10px;
        }
        .input-group{
            width: 700px;
            float: left;
        }
        .brd_writer{
            width: 150px;
            margin-right: 10px;
        }
        .brd_date{
            width: 230px;
        }
        #articlefrom1{
            clear: both;
        }
        
    </style>
      <script src="${contextPath}/resources/js/jquery-3.5.1.min.js"> </script>
      <script src="\\DIGITAL20\dnb\텍스트에디터\naver-smarteditor2-ca95d21\demo\js\service\HuskyEZCreator.js" charset="utf-8"></script>
<script>
    
    $(function(){           
            $('#menucontent').load("${contextPath}/resources/subjsp/admin_menubar.jsp")
    });
    var url = ${article.brd_num };
    function backToList(obj){
    	console.log(url);
	    obj.action="${contextPath}/board/admin_board_list.do?brd_num="+url;
	    obj.submit();
     }
    
    var oEditors=[];
    //Editor Setting
    nhn.husky.EZCreator.creareInIFrame({ oAppRef : oEditors,
    	elPlaceHolder : "floatingTextarea2",	//에디터를 적용할 textarea ID에 맞게 변경
    	sSkinURI : "\\DIGITAL20\dnb\텍스트에디터\naver-smarteditor2-ca95d21\demo\SmartEditor2Skin_ko_KR.html",//Editor HTML파일 위치로 변경
    	fCreator : "createEditor2", //SE2BasicCreator2Skin.html메소드명으로 변경불가
    	htParams : {//툴바 사용여부
    		nUseToolbar : true,//입력창 크기 조절바 사용여부
    		nUseVerticalResizer : true,// 모드 탭(Editor|HTML|TEXT) 사용여부 
    		bUseModeChanger : true //전송버튼 클릭이벤트
    		
    		}
    	});
    function submitContents(){
    	//에디터 내용이 textarea에 적용
    	oEditors.getById["class_tutorIntroduce"].exec("UPDATE_CONTENTS_FIELD",[]);
    }
    
    function readURL(input) {
        if (input.files && input.files[0]) {
  	      var reader = new FileReader();
  	      reader.onload = function (e) {
  	        $('#preview').attr('src', e.target.result);
            }
           reader.readAsDataURL(input.files[0]);
        }
    } 
    

</script>
    
</head>
<body>
   <div id='board_content'>
   <!--menu bar -->
   <div id='menucontent'>
   
   </div>
    
    
    
    <!--board_container -->
    <form name="articleForm" method="post"   action="${contextPath}/board/addNewArticle.do"   enctype="multipart/form-data">
    <div class="board_container">
        <div id="articlefrom1">
            <div class="badge text-wrap" style="width: 6rem;">
                  분류 
            </div>
            <select class="form-select form-select-sm" aria-label=".form-select-sm example" name="brd_num">
                  <option value="${article.brd_num }" selected>${article.brd_name }</option>
                  <option value="1">공지사항</option>
                  <option value="2">FAQ</option>
                  <option value="3">배너</option>
                  <option value="4">사업소개</option>
                  <option value="5">홍보영상</option>
                  <option value="6">지원서비스</option>
            </select>
       
        </div>
        
        <br>
        <br>
        <div id="articlefrom1">   
            <div class="badge text-wrap" style="width: 6rem;">
                  제목
            </div>
            <div class="input-group input-group-sm mb-3">
              <input type="text" id="board_titleinput" name="board_title" class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm">
            </div>
         </div>
         <div id="articlefrom1"> 
             <div class="form-floating">
              <textarea class="form-control" id="floatingTextarea2" name="board_content"style="height: 500px"></textarea>
              
             </div>
        </div><br>
        
         <div id="articlefrom1"> 
             <div class="input-group">
              <input type="file" class="form-control" id="inputGroupFile04" aria-describedby="inputGroupFileAddon04" name="board_img" aria-label="Upload">
              <img  id="preview" src="#"   width=200 height=200/>
            </div><br><br>
            
            
        </div>
        
            
            
        </div><br><br>
        <div id="articlefrom1"> 
        <input type="submit" value="글쓰기" />
	       <input type=button value="목록보기"onClick="backToList(this.form)" />
        </div>  
  
    </div>
       </form>

</div>
</body>
</html>