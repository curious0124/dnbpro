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
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>view_Eq_detail</title>

    <!--부트 스트랩css !-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">

    <!--제이쿼리 스크립트 !-->
  <link rel="stylesheet" href="http://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css"/>
  <script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
		<script src="http://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
		<!-- datepicker 한국어로 -->
		<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/i18n/datepicker-ko.js"></script>
  

    <script>
    $(document).ready(function() {
    	
            var today1 = new Date();
            //datepicker 한국어로 사용하기 위한 언어설정
            $.datepicker.setDefaults($.datepicker.regional['ko']);     
        
            // Datepicker            
            $(".datepicker").datepicker({
                showButtonPanel: true,
                dateFormat: "yy-mm-dd",
                minDate: today1 ,
                onClose : function ( selectedDate ) {
                
                    var eleId = $(this).attr("id");
                    var optionName = "";

                    if(eleId.indexOf("StartDate") > 0) {
                        eleId = eleId.replace("StartDate", "EndDate");
                        optionName = "minDate";
                    } else {
                        eleId = eleId.replace("EndDate", "StartDate");
                        optionName = "maxDate";
                    }

                    $("#"+eleId).datepicker( "option", optionName, selectedDate );        
                    $(".searchDate").find(".chkbox2").removeClass("on"); 
                }
            }); 

            //시작일.
            /*$('#searchStartDate').datepicker("option","onClose", function( selectedDate ) {    
                // 시작일 datepicker가 닫힐때
                // 종료일의 선택할수있는 최소 날짜(minDate)를 선택한 시작일로 지정
                $("#searchEndDate").datepicker( "option", "minDate", selectedDate );
                $(".searchDate").find(".chkbox2").removeClass("on");
            });
            */

            //종료일.
            /*$('#searchEndDate').datepicker("option","onClose", function( selectedDate ) {    
                // 종료일 datepicker가 닫힐때
                // 시작일의 선택할수있는 최대 날짜(maxDate)를 선택한 종료일로 지정 
                $("#searchStartDate").datepicker( "option", "maxDate", selectedDate );
                $(".searchDate").find(".chkbox2").removeClass("on");
            });
            */

            $(".dateclick").dateclick();    // DateClick
            $(".searchDate").schDate();        // searchDate
            
        });

        // Search Date
        jQuery.fn.schDate = function(){
            var $obj = $(this);
            var $chk = $obj.find("input[type=radio]");
            $chk.click(function(){                
                $('input:not(:checked)').parent(".chkbox2").removeClass("on");
                $('input:checked').parent(".chkbox2").addClass("on");                    
            });
        };

        // DateClick
        jQuery.fn.dateclick = function(){
            var $obj = $(this);
            $obj.click(function(){
                $(this).parent().find("input").focus();
            });
        }    

        
         function setSearchDate(end){

            var num = end.substring(0,1);
            var str = end.substring(1,2);

            var today = new Date();

            //var year = today.getFullYear();
            //var month = today.getMonth() + 1;
            //var day = today.getDate();
            
            var startDate = $.datepicker.formatDate('yy-mm-dd', today);
            $('#searchStartDate').val(startDate);
            
            if(str == 'd'){
                today.setDate(today.getDate() + (num*1));
            }else if (str == 'w'){
                today.setDate(today.getDate() + (num*7));
            }else if (str == 'm'){
                today.setMonth(today.getMonth() + (num*1));
                today.setDate(today.getDate() - 1);
            }

            var endDate = $.datepicker.formatDate('yy-mm-dd', today);
            $('#searchEndDate').val(endDate);
                    
            // 종료일은 시작일 이전 날짜 선택하지 못하도록 비활성화
            $("#searchEndDate").datepicker( "option", "minDate", startDate );
            
            // 시작일은 종료일 이후 날짜 선택하지 못하도록 비활성화
            $("#searchStartDate").datepicker( "option", "maxDate", endDate );

        }
        
    function ttest(){
    	
    }    
        
    function select_EQList(){
        var fromDate =  document.getElementById("searchStartDate").value;
    	var toDate =  document.getElementById("searchEndDate").value;
        
        if(fromDate !=''){
            if( toDate != ''){
            	var reurl = '${equipVO.eq_name}';
                var inputData = {"eq_name":reurl, "fromDate":fromDate, "toDate":toDate};
                
                console.log('메소드 돌입시작일'+fromDate);
                console.log('메소드 돌입종료일'+toDate);
                console.log('장비이름'+reurl);
                console.log(inputData);
                $.ajax({
                    type:'GET',
                    data: inputData,
                    url:"${contextPath}/equip/view_Eq_detail.do?",
                    	success : function(){
                    		location.href = "${contextPath}/equip/view_Eq_detail.do?eq_name="+reurl+"&fromDate="+fromDate+"&toDate="+toDate;
                    	},
                    	error: function(){
                    		console.log('실패? ');
                    	}
                    
                });
            
                }else{
                    alert('종료일을 입력하세요~');
                }
        }else{
            alert('시작일을 입력하세요~');
        }
    }
    
    function reservation(){
        var fromDate =  document.getElementById("searchStartDate");
    	var toDate =  document.getElementById("searchEndDate");
    	console.log('시작일'+fromDate.value);
    	console.log('종료일'+toDate.value);
    	
    	alert('예약시스템으로 정보를 전송~');
    }
    </script>
    <style>
       /* Default */
			input[type=text],input[type=password]{font-family:"Malgun Gothic","맑은 고딕",Dotum,"돋움",Arial,sans-serif}
			*{margin:0;padding:0;font-family:"Malgun Gothic","맑은 고딕",Dotum,"돋움",Arial,sans-serif}
			body{font-size:12px;color:#555;background:transparent;-webkit-user-select:none;-moz-user-select:none;-webkit-text-size-adjust:none;-moz-text-size-adjust:none;-ms-text-size-adjust:none}
			ol,ul{list-style:none} 
			table{table-layout:fixed;width:100%;border-collapse:collapse;border-spacing:0}
			caption{overflow:hidden;width:0;height:0;font-size:0;line-height:0;text-indent:-999em}
			img,fieldset{border:0}
			legend{height:0;visibility:hidden}
			em,address{font-style:normal}
			img{border:0 none;vertical-align:middle}
			a{color:#555;text-decoration:none}
			input,select{margin:0;padding:0;vertical-align:middle}
			button{margin:0;padding:0;font-family:inherit;border:0 none;background:transparent;cursor:pointer}
			button::-moz-focus-inner{border:0;padding:0}
			header,footer,aside,nav,section,article{display:block}

			.clearfix{*zoom:1}
			.clearfix:after{content:"";display:block;clear:both;overflow:hidden}

			/* Search */
			.searchBox{border:none}
			.searchBox tbody th{padding:20px 10px 20px 35px;font-size:14px;font-weight:bold;text-align:left;vertical-align:top;border:none;background:#e6e6e6 }
			.searchBox tbody td{padding:12px 10px 12px 25px;border:none;background-color:#efefef}
		
			.searchDate{overflow:hidden;margin-bottom:10px;*zoom:1}
			.searchDate:after{display:block;clear:both;content:''}
			.searchDate li{position:relative;float:left;margin:0 7px 0 0}
			.searchDate li .chkbox2{display:block;text-align:center}
			.searchDate li .chkbox2 input{position:absolute;z-index:-1}
			.searchDate li .chkbox2 label{display:block;width:72px;height:26px;font-size:14px;font-weight:bold;color:#fff;text-align:center;line-height:25px;text-decoration:none;cursor:pointer;background:#a5b0b6}
			.searchDate li .chkbox2.on label{background:#ec6a6a}
		
			.demi{display:inline-block;margin:0 1px;vertical-align:middle}
			.inpType{padding-left:6px;height:24px;line-height:24px;border:1px solid #dbdbdb}
			.btncalendar{display:inline-block;width:22px;height:22px;background:url(images/btn_calendar.gif) center center no-repeat;text-indent:-999em}
    </style>

</head>

<body>
    <div>
        <div class="row">
            <div class="col">
                ${equipVO.eq_thumimg}
            </div>
            <div class="col">
                <b class="eq_name">모델명 : ${equipVO.eq_name}</b>
                <hr class="top_hr">

                <div class="row" id="detail">
                    <b>제조사 : ${equipVO.eq_ma}</b>
                    <hr>
                    <b>분류명 : ${equipVO.cate_name}</b>
                    <hr>
                    <b>모델스펙 : ${equipVO.eq_spec}</b>
                    <hr>
                </div>
                <div class="row">
                    <form>
			
		<!-- search -->
		<table class="searchBox">
			<caption>조회</caption>
			<colgroup>
				<col width="123px">
				<col width="*">
			</colgroup>
			<tbody>
				<tr>
					<th>조회기간</th>
					<td>
						<ul class="searchDate">
							<li>
								<span class="chkbox2">
									<input type="radio" name="dateType" id="dateType1" onclick="setSearchDate('0d')"/>
									<label for="dateType1">당일</label>
								</span>
							</li>
							<li>
								<span class="chkbox2">
									<input type="radio" name="dateType" id="dateType2" onclick="setSearchDate('3d')"/>
									<label for="dateType2">3일</label>
								</span>
							</li>
							<li>
								<span class="chkbox2">
									<input type="radio" name="dateType" id="dateType3" onclick="setSearchDate('1w')"/>
									<label for="dateType3">1주</label>
								</span>
							</li>
							<li>
								<span class="chkbox2">
									<input type="radio" name="dateType" id="dateType4" onclick="setSearchDate('2w')"/>
									<label for="dateType4">2주</label>
								</span>
							</li>
							<li>
								<span class="chkbox2">
									<input type="radio" name="dateType" id="dateType5" onclick="setSearchDate('1m')"/>
									<label for="dateType5">1개월</label>
								</span>
							</li>
							<li>
								<span class="chkbox2">
									<input type="radio" name="dateType" id="dateType6" onclick="setSearchDate('3m')"/>
									<label for="dateType6">3개월</label>
								</span>
							</li>
							<li>
								<span class="chkbox2">
									<input type="radio" name="dateType" id="dateType7" onclick="setSearchDate('6m')"/>
									<label for="dateType7">6개월</label>
								</span>
							</li>
						</ul>
						
						<div class="clearfix">
							<!-- 시작일 -->
							<span class="dset">
								<input type="text" class="datepicker inpType" name="searchStartDate" id="searchStartDate" onchange="select_EQList();" value="${fromDate }">
								<a href="#none" class="btncalendar dateclick">달력</a>
							</span>
							<span class="demi">~</span>
							<!-- 종료일 -->
							<span class="dset">
								<input type="text" class="datepicker inpType" name="searchEndDate" id="searchEndDate" onchange="select_EQList();" value="${fromDate }">
								<a href="#none" class="btncalendar dateclick">달력</a>
							</span>
						</div>	
					</td>
				</tr>

			<tbody>
		</table>
		</form>
                </div>
            </div>

        </div>
        <div class="row" id="bottom_menu">
            <div class="">
                <select>
                <option selected disabled>수량</option>
                <c:choose>
  
			  		<c:when test="${ableEquipmentsList !=null }" >
					<c:forEach  var="ableList" items="${ableEquipmentsList }" varStatus="ableListNum" >
			                 
			                 <option>${ableListNum.count}</option>
			         </c:forEach>
			         </c:when>
			         
			         <c:when test="${ableEquipmentsList==null}">
			         		
			         </c:when>
         
        		 </c:choose>
               
                
                
                </select>
                <button>장바구니 담기</button>
                <button id="reservation" onclick="reservation()">예약하기</button>
            </div>
        </div>
    </div>
<div>
    <hr class="img_top">
</div>
<div class="col2">
		
		
		  
                ${equipVO.eq_img}
            </div>
          
</body>
</html>












