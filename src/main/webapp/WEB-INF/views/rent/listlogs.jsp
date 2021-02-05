<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    isELIgnored="false" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<%
  request.setCharacterEncoding("UTF-8");
%>

<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <title>Document</title>
    <style>
        .s1 {
            float: right;
        }

        .form1 {
            margin: 0 auto;

        }

        .tr1 {
            background: #FA8072;
        }

    </style>
</head>
<script src="js/jquery-3.5.1.min.js"></script>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4/jquery.min.js"></script>

<body>

    <div class="form1">
        <form action="#" method="post">

            <fieldset>
                <legend><strong>사용자 이력 보기</strong>
                    <div class="s1"><input placeholder="사용자 아이디 검색" type="text" value=""><input type="button" value="검색"><select name='fruits'>
                            <option value='' selected>-- 선택 --</option>
                            <option value='예약신청'>예약신청</option>
                            <option value='예약중'>예약중</option>
                            <option value='대여중'>대여중</option>
                            <option value='반납완료'>반납완료</option>
                            <option value='예약취소'>예약취소</option>
                            <option value='예약신청취소'>예약신청취소</option>
                        </select>
                    </div>
                </legend>


                <div>
                    <table align="center" border="1">
                        <tr class="tr1">
                            <td>로그번호</td>
                            <td>예약신청번호</td>
                            <td>예약번호</td>
                            <td>반납배송번호</td>
                            <td>회원아이디</td>
                            <td>로그발생자</td>
                            <td>예약시작일</td>
                            <td>예약반납일</td>
                            <td>로그발생일</td>
                            <td>모델명</td>
                            <td>분류명</td>
                            <td>시리얼번호</td>
                            <td>현황</td>
                        </tr>


                        <c:choose>
                            <c:when test="${logList !=null }">
                                <c:set var="List" value="${logList }" />
                                <c:forEach var="List" items="${logList }" varStatus="Log_num">
                                    <tr>
                                        <td>${Log_num.count}</td>
                                        <td>${List.resq_num}</td>
                                        <td>${List.res_num}</td>
                                        <td>${List.return_num}</td>
                                        <td>${List.user_id}</td>
                                        <td>${List.log_maker}</td>
                                        <td>
                                            <fmt:formatDate pattern="yyyy-MM-dd" value="${List.res_start}" />
                                        </td>
                                        <td>
                                            <fmt:formatDate pattern="yyyy-MM-dd" value="${List.res_end}" />
                                        </td>
                                        <td>
                                            <fmt:formatDate pattern="yyyy-MM-dd" value="${List.log_date}" />
                                        </td>
                                        <td>${List.eq_name}</td>
                                        <td>${List.cate_name}</td>
                                        <td>${List.eq_serial}</td>
                                        <td>${List.status}</td>
                                    </tr>
                                </c:forEach>
                            </c:when>

                            <c:when test="${logList ==null }">
                                <tr>
                                    <td colspan="13">등록된 로그가 없습니다</td>

                                </tr>
                            </c:when>

                        </c:choose>
                    </table>
                </div>
            </fieldset>

            <table align="center">
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
    </div>
</body>

</html>
