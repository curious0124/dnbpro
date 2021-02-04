<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <title>Document</title>
    <style>

    </style>
</head>
<script src="js/jquery-3.5.1.min.js"></script>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4/jquery.min.js"></script>
<script>


</script>

<body>
    <form action="#" method="post">
        <fieldset>
            <legend>예약 신청 리스트</legend>

            <div>
                <table align="center" border="1">
                    <tr colspan="9">
                        <td>CB</td>
                        <td>이름</td>
                        <td>시리얼번호</td>
                        <td>모델명</td>
                        <td>아이디</td>
                        <td>예약신청번호</td>
                        <td>예약승인</td>
                    </tr>
                    <c:when>
                        <tr>
                            <td><input type="checkbox"></td>
                            <td>${User_name}</td>
                            <td>${Eq_serial}</td>
                            <td>${Eq_name}</td>
                            <td>${User_id}</td>
                            <td>${Resq_num}</td>
                            <td><input type="button" value="승인"><input type="button" value="거부"></td>

                        </tr>
                    </c:when>
                </table>
            </div>
        </fieldset>
        <table align="center" border="1">
            <tr>
                <td>이전</td>
                <td>1</td>
                <td>2</td>
                <td>3</td>
                <td>4</td>
                <td>5</td>
                <td>6</td>
                <td>7</td>
                <td>8</td>
                <td>9</td>
                <td>10</td>
                <td>다음</td>
            </tr>
        </table>
    </form>

</body></html>