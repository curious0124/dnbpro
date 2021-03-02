<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<script src="${contextPath}/resources/js/jquery-3.5.1.min.js"></script>
<meta charset="UTF-8">
<script>
	$(function() {

		$(".Return").click(
				function() {
					var result = prompt("운송장 번호를 입력하세요", "0000-0000-0000");
					
					if (result != null && result.length != 0 && result != "0000-0000-0000") {
						var cate_name = $(this).parent().find(
								"input:nth-child(2)").val();
						var res_num = $(this).parent().find(
								"input:nth-child(3)").val();
						
					console.log(cate_name);
					console.log(res_num);
					console.log(result);
					$("#ReturnCate").val(cate_name);
					$("#Returnnum").val(res_num);
					$("#Expressnum").val(result);
					
					$("#ReturnForm").submit();
						alert("배송반납신청이 완료되었습니다.");
					} else {
						alert("배송반납신청이 취소되었습니다.");
					}
				});
		
	});
</script>
<title>Insert title here</title>

<c:set var="retList" value="${myRentList.ret}" />
<style>
		.rent_table {
			width: 100%;
		}
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
								<li><a href="${contextPath}/mypage/mypage.do">MyPage</a></li>
								<li><a
									href="${contextPath}/mypage/myReturnDetail.do">Log</a></li>
							</ul>
						</div>
						<!-- Bread Title -->
						<div class="bread-title">
							<h2>Log</h2>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- 상단 배너 -->
	<section class="features-area section-bg">
		<div class="bor container" id="">
			<div class="table_top row">
				<div class="col">
					<h4>반납/취소 내역</h4>
				</div>
			</div>
			<table class="table table-light table-hover align-middle">
				<thead class="table-light text-center">
					<tr>
							<td>대여번호</td>
							<td>장비시리얼번호</td>
							<td>모델명</td>
							<td>신청일</td>
							<td>시작일</td>
							<td>반납일</td>
							<td>상태</td>
							<td>취소반/납 신청</td>
					</tr>
				</thead>
				<tbody>
								<c:forEach var="myReturnList" items="${retList}"
									varStatus="myReturnListNum">
									<tr>
										<td>${myReturnListNum.count}</td>
										<td>${myReturnList.eq_serial}</td>
										<td>${myReturnList.eq_name}</td>
										<td><fmt:formatDate pattern="yyyy-MM-dd"
												value="${myReturnList.resq_date}" /></td>
										<td><fmt:formatDate pattern="yyyy-MM-dd"
												value="${myReturnList.res_start}" /></td>
										<td><fmt:formatDate pattern="yyyy-MM-dd"
												value="${myReturnList.res_end}" /></td>

										<td>${myReturnList.res_Status}</td>
										<td>
											<button class="Return btn-outline-success" value="배송반납신청" >배송반납 신청</button>
											<input type="hidden" value="${myReturnList.cate_name}"> 
											<input type="hidden" value="${myReturnList.res_num}">
										</td>
									</tr>
								</c:forEach>
				</tbody>
			</table>
		</div>
	</section>
	
	
	
	
	
	
	
	
	
<%-- 	<div class=my_rent>
				<fieldset>
					<legend>대여중</legend>
					
					<table class=rent_table border=1px>
						<tr bgcolor=#ccc>
							<td>대여번호</td>
							<td>장비시리얼번호</td>
							<td>모델명</td>
							<td>신청일</td>
							<td>시작일</td>
							<td>반납일</td>
							<td>상태</td>
							<td>취소반납신청</td>
						</tr>
						<c:choose>
							<c:when test="${retList !=null }">
								<c:forEach var="myReturnList" items="${retList}"
									varStatus="myReturnListNum">
									<tr>
										<td>${myReturnListNum.count}</td>
										<td>${myReturnList.eq_serial}</td>
										<td>${myReturnList.eq_name}</td>
										<td><fmt:formatDate pattern="yyyy-MM-dd"
												value="${myReturnList.resq_date}" /></td>
										<td><fmt:formatDate pattern="yyyy-MM-dd"
												value="${myReturnList.res_start}" /></td>
										<td><fmt:formatDate pattern="yyyy-MM-dd"
												value="${myReturnList.res_end}" /></td>

										<td>${myReturnList.res_Status}</td>
										<td>
											<input type="button" class="Return" value="배송반납신청" />
											<input type="hidden" value="${myReturnList.cate_name}"> 
											<input type="hidden" value="${myReturnList.res_num}">
										</td>
									</tr>
								</c:forEach>
							</c:when>
						</c:choose>
					</table>

				</fieldset>
		</div> --%>
	<form action="${contextPath}/mypage/cancelReturn.do" id="ReturnForm" method="post">
		<input type="hidden" id="ReturnCate" name="ReturnCate" value="" /> 
		<input type="hidden" id="Returnnum" name="Returnnum" value="" />
		<input type="hidden" id="Expressnum" name="Expressnum" value="" />
	</form>
</body>
</html>