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
            <legend>���� ��û ����Ʈ</legend>

            <div>
                <table align="center" border="1">
                    <tr colspan="9">
                        <td>CB</td>
                        <td>�̸�</td>
                        <td>�ø����ȣ</td>
                        <td>�𵨸�</td>
                        <td>���̵�</td>
                        <td>�����û��ȣ</td>
                        <td>�������</td>
                    </tr>
                    <c:when>
                        <tr>
                            <td><input type="checkbox"></td>
                            <td>${User_name}</td>
                            <td>${Eq_serial}</td>
                            <td>${Eq_name}</td>
                            <td>${User_id}</td>
                            <td>${Resq_num}</td>
                            <td><input type="button" value="����"><input type="button" value="�ź�"></td>

                        </tr>
                    </c:when>
                </table>
            </div>
        </fieldset>
        <table align="center" border="1">
            <tr>
                <td>����</td>
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
                <td>����</td>
            </tr>
        </table>
    </form>

</body></html>