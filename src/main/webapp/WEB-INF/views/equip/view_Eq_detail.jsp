<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>view_Eq_detail</title>
<!--제이쿼리 스크립트 !-->
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css" />
<script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="http://code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
<!-- datepicker 한국어로 -->
<script
	src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/i18n/datepicker-ko.js"></script>
<script>
	$(document).ready(function() {

		var today1 = new Date();
		//datepicker 한국어로 사용하기 위한 언어설정
		$.datepicker.setDefaults($.datepicker.regional['ko']);

		// Datepicker            
		$(".datepicker").datepicker({
			showButtonPanel : true,
			dateFormat : "yy-mm-dd",
			minDate : today1,
			onClose : function(selectedDate) {

				var eleId = $(this).attr("id");
				var optionName = "";

				if (eleId.indexOf("StartDate") > 0) {
					eleId = eleId.replace("StartDate", "EndDate");
					optionName = "minDate";
				} else {
					eleId = eleId.replace("EndDate", "StartDate");
					optionName = "maxDate";
				}

				$("#" + eleId).datepicker("option", optionName, selectedDate);
				$(".searchDate").find(".chkbox2").removeClass("on");
			}
		});

		$(".dateclick").dateclick(); // DateClick
		$(".searchDate").schDate(); // searchDate

	});

	// Search Date
	jQuery.fn.schDate = function() {
		var $obj = $(this);
		var $chk = $obj.find("input[type=radio]");
		$chk.click(function() {
			$('input:not(:checked)').parent(".chkbox2").removeClass("on");
			$('input:checked').parent(".chkbox2").addClass("on");
		});
	};

	// DateClick
	jQuery.fn.dateclick = function() {
		var $obj = $(this);
		$obj.click(function() {
			$(this).parent().find("input").focus();
		});
	}

	function setSearchDate(end) {

		var num = end.substring(0, 1);
		var str = end.substring(1, 2);

		var today = new Date();

		//var year = today.getFullYear();
		//var month = today.getMonth() + 1;
		//var day = today.getDate();

		var startDate = $.datepicker.formatDate('yy-mm-dd', today);
		$('#searchStartDate').val(startDate);

		if (str == 'd') {
			today.setDate(today.getDate() + (num * 1));
		} else if (str == 'w') {
			today.setDate(today.getDate() + (num * 7));
		} else if (str == 'm') {
			today.setMonth(today.getMonth() + (num * 1));
			today.setDate(today.getDate() - 1);
		}

		var endDate = $.datepicker.formatDate('yy-mm-dd', today);
		$('#searchEndDate').val(endDate);

		// 종료일은 시작일 이전 날짜 선택하지 못하도록 비활성화
		$("#searchEndDate").datepicker("option", "minDate", startDate);

		// 시작일은 종료일 이후 날짜 선택하지 못하도록 비활성화
		$("#searchStartDate").datepicker("option", "maxDate", endDate);

		select_EQList();

	}

	function select_EQList() {
		var fromDate = document.getElementById("searchStartDate").value;
		var toDate = document.getElementById("searchEndDate").value;

		if (fromDate != '') {
			if (toDate != '') {
				var reurl = '${equipVO.eq_name}';
				var inputData = {
					"eq_name" : reurl,
					"fromDate" : fromDate,
					"toDate" : toDate
				};

				$
						.ajax({
							type : 'GET',
							data : inputData,
							url : "${contextPath}/equip/view_Eq_detail.do?",
							success : function() {
								location.href = "${contextPath}/equip/view_Eq_detail.do?eq_name="
										+ reurl
										+ "&fromDate="
										+ fromDate
										+ "&toDate=" + toDate;
							},
							error : function() {
								console.log('실패? ');
							}
						});
			} else {
				alert('종료일을 입력하세요~');
			}
		} else {
			alert('시작일을 입력하세요~');
		}
	}

	function reservation() {
		var resq_start = document.getElementById("searchStartDate").value;
		var resq_end = document.getElementById("searchEndDate").value;
		var ableListCount = document.getElementById("ableListCount").value;
		var eq_name = '${equipVO.eq_name}';
		var cate_name = '${equipVO.cate_name}';
		console.log('수량 ' + ableListCount);
		console.log('모델명 ' + eq_name);
		console.log('시작일 ' + resq_start);
		console.log('종료일 ' + resq_end);
		var sendingData = {
			"eq_name" : eq_name,
			"resq_start" : resq_start,
			"resq_end" : resq_end,
			"ableListCount" : ableListCount,
			"cate_name" : cate_name
		};

		if (resq_start != "" && resq_end != "") {
			if (ableListCount != "") {
				alert('예약시스템으로 정보를 전송~');
				$.ajax({
					type : 'GET',
					data : sendingData,
					url : "${contextPath}/rent/reservationRequest.do?",
					success : function() {
						//location.href = "${contextPath}/equip/view_Eq_detail.do?eq_name="+reurl+"&fromDate="+fromDate+"&toDate="+toDate;
					},
					error : function() {
						console.log('실패? ');
					}
				});

			} else {
				alert('수량을 입력하세요');
			}
		} else {
			alert('날짜를 입력하세요');
		}

	}
</script>
<style>
/* *{border: 1px solid;}  */
body {background-color: #F4F9FC;}
.preview_img{width:300px;}
.detail_text{height:100px; line-height: 100px; border-bottom: 1px solid; border-right: 1px dashed #bcbcbc;}
.eq_top_view{border: 2px dashed #bcbcbc;}
.detail_text_bottom{height: 100%;}
.datepicker{width:150px; height: 40px;}
.select_btn_group{float: right; align-items: flex-end;}
.btn_select{width:300px;}
.select_btn{line-height: 100px;}
</style>

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
								<li><a href="${contextPath}/equip/view_Eq_list.do">Equipment list</a></li>
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
		<div class="container">
			<div class="container eq_top_view">
				<div class="row">
					<div class="col preview_img">
						<input type="hidden" name="originalFileName" value="${equipVO.eq_thumimg}" /> 
						<img src="${contextPath}/equipthumimg_download.do?eq_name=${equipVO.eq_name}&eq_thumimg=${equipVO.eq_thumimg}" id="preview2" width="100%" height="100%" />
					</div>
					<div class="col">
						<div class="row">
						<div class="col-3 text-center align-middle detail_text">
						<b>모델명</b>
						</div>
						<div class="col detail_text">${equipVO.eq_name}</div>
						</div>
						<div class="row">
						<div class="col-3 text-center detail_text">
						<b>제조사</b>
						</div>
						<div class="col detail_text">${equipVO.eq_ma}</div>
						</div>
						<div class="row">
						<div class="col-3 text-center detail_text">
						<b>분류명</b>
						</div>
						<div class="col detail_text">${equipVO.cate_name}</div>
						</div>
						<div class="row">
						<div class="col-3 text-center detail_text">
						<b>모델스펙</b>
						</div>
						<div class="col detail_text">${equipVO.eq_spec}</div>
						</div>
					
<div class="row">
<div class="col-3 text-center detail_text">
						<b>기간 조회</b>
						</div>
						<div class="col detail_text">
						<form>
										<div class="clearfix">
											<!-- 시작일 -->
											<span class="dset"> 
											<input type="text" class="datepicker inpType" name="searchStartDate" id="searchStartDate" onchange="select_EQList();" value="${fromDate }"> 
											<a href="#none" class="btncalendar dateclick"></a>
											</span> <span class="demi">~</span>
											<!-- 종료일 -->
											<span class="dset"> 
											<input type="text" class="datepicker inpType" name="searchEndDate" id="searchEndDate" onchange="select_EQList();" value="${toDate }"> 
											<a href="#none" class="btncalendar dateclick"></a>
											</span>
										</div>
										</form>
						</div>
						</div>
						<div class="row pull-right select_btn">
						<div class="col">
						<div class="btn-group btn_select" role="group" aria-label="Basic example">
						<select id="ableListCount" class="form-select " aria-label="Default select example">
					<option selected disabled value="">수량</option>
					<c:choose>
						<c:when test="${ableEquipmentsList !=null }">
							<c:forEach var="ableList" items="${ableEquipmentsList }"
								varStatus="ableListNum">
								<option value="${ableListNum.count}">${ableListNum.count}</option>
							</c:forEach>
						</c:when>
						<c:when test="${ableEquipmentsList==null}">
						</c:when>
					</c:choose>
				</select>
				<button id="reservation" onclick="reservation()" class="btn btn-outline-success">예약하기</button>
				</div>
					</div>
					</div>
				</div>
			</div>
		</div>
		</div>
		<div class="container">
	<!-- 상단 배너 -->
	<div class="breadcrumbs overlay"
		style="background-image:url('${contextPath}/resources/image/sagsepage.png')">
		<div class="container">
			<div class="row">
				<div class="col-12">
					<div class="bread-inner">
						<!-- Bread Menu -->
						<center>
						<div class="bread-title">
							<h2>제품 상세 설명</h2>
						</div>
						</center>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 상단 배너 -->
		</div>
		<div class="container">
		<center>
		<input type="hidden" name="originalFileName" value="${equipVO.eq_img}" />
		<img src="${contextPath}/equipimg_download.do?eq_name=${equipVO.eq_name}&eq_img=${equipVO.eq_img}" id="preview" />
		</center>
		</div>
	</section>











<%-- 	<div>


		<div class="row">
			<div class="col">
				<input type="hidden" name="originalFileName" value="${equipVO.eq_thumimg}" /> 
				<img src="${contextPath}/equipthumimg_download.do?eq_name=${equipVO.eq_name}&eq_thumimg=${equipVO.eq_thumimg}" id="preview2" width="200px" height="200px" />
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
											<li><span class="chkbox2"> <input type="radio"
													name="dateType" id="dateType1"
													onclick="setSearchDate('0d')" /> <label for="dateType1">당일</label>
											</span></li>
											<li><span class="chkbox2"> <input type="radio"
													name="dateType" id="dateType2"
													onclick="setSearchDate('3d')" /> <label for="dateType2">3일</label>
											</span></li>
											<li><span class="chkbox2"> <input type="radio"
													name="dateType" id="dateType3"
													onclick="setSearchDate('1w')" /> <label for="dateType3">1주</label>
											</span></li>
											<li><span class="chkbox2"> <input type="radio"
													name="dateType" id="dateType4"
													onclick="setSearchDate('2w')" /> <label for="dateType4">2주</label>
											</span></li>
											<li><span class="chkbox2"> <input type="radio"
													name="dateType" id="dateType5"
													onclick="setSearchDate('1m')" /> <label for="dateType5">1개월</label>
											</span></li>
											<li><span class="chkbox2"> <input type="radio"
													name="dateType" id="dateType6"
													onclick="setSearchDate('3m')" /> <label for="dateType6">3개월</label>
											</span></li>
											<li><span class="chkbox2"> <input type="radio"
													name="dateType" id="dateType7"
													onclick="setSearchDate('6m')" /> <label for="dateType7">6개월</label>
											</span></li>
										</ul>

										<div class="clearfix">
											<!-- 시작일 -->
											<span class="dset"> <input type="text"
												class="datepicker inpType" name="searchStartDate"
												id="searchStartDate" onchange="select_EQList();"
												value="${fromDate }"> <a href="#none"
												class="btncalendar dateclick">달력</a>
											</span> <span class="demi">~</span>
											<!-- 종료일 -->
											<span class="dset"> <input type="text"
												class="datepicker inpType" name="searchEndDate"
												id="searchEndDate" onchange="select_EQList();"
												value="${toDate }"> <a href="#none"
												class="btncalendar dateclick">달력</a>
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
				<select id="ableListCount">
					<option selected disabled value="">수량</option>

					<c:choose>

						<c:when test="${ableEquipmentsList !=null }">
							<c:forEach var="ableList" items="${ableEquipmentsList }"
								varStatus="ableListNum">

								<option value="${ableListNum.count}">${ableListNum.count}</option>
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


		<input type="hidden" name="originalFileName" value="${equipVO.eq_img}" />
		<img src="${contextPath}/equipimg_download.do?eq_name=${equipVO.eq_name}&eq_img=${equipVO.eq_img}" id="preview" />

	</div> --%>


</body>
</html>












