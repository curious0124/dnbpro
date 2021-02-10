<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">


    <!-- 부트스트랩 경로 지정 폴더에 넣어놨음-->
    <link rel="stylesheet" href="${contextPath}/resources/bootstrap/bootstrap.css">
    
    
<title>boardList</title>
<style>

</style>
</head>
<body>

<div>
<div>
제목
<div>
${educationVO.edu_title}
</div>
</div>
<div>
내용
${educationVO.edu_content}
</div>
</div>

</body>
</html>