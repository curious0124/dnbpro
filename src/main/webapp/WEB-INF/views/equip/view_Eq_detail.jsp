<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html lang="en">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>view_Eq_detail</title>

    <!--부트 스트랩css !-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1" crossorigin="anonymous">




    <!--제이쿼리 스크립트 !-->
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <link rel="stylesheet" href="/resources/demos/style.css">
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script>
        $(function() {
            $("#datepicker").datepicker();
            $("#anim").on("change", function() {
                $("#datepicker").datepicker("option", "showAnim", $(this).val());
            });
        });
    </script>

    <script>
        $(function() {
        	
            var dateFormat = "mm/dd/yy",
                from = $("#from")
                .datepicker({
                    defaultDate: "+1w",
                    changeMonth: true,
                    numberOfMonths: 1
                })
                .on("change", function() {
                    to.datepicker("option", "minDate", getDate(this));
                }),
                to = $("#to").datepicker({
                    defaultDate: "+1w",
                    changeMonth: true,
                    numberOfMonths: 1
                })
                .on("change", function() {
                    from.datepicker("option", "maxDate", getDate(this));
                });

            function getDate(element) {
                var date;
                try {
                    date = $.datepicker.parseDate(dateFormat, element.value);
                } catch (error) {
                    date = null;
                }

                return date;
            }
        });
    </script>
    <style>
       


     
        .col {
         top:0; left: 0;
       width: 100%;
       height: 100%;
           
        }
        .col2{
            text-align: center;
        }

        .top_hr {
            border: 3px solid black;
        }

        .eq_name {
            font-size: 1.7rem;
        }

        #detail {
            margin-top: 50px;
        }

        .xma{
            margin: 20px;
        }
        #bottom_menu{
            margin-top: 30px;
            text-align: right;
        }

        .img_top{
            border: 5px solid red;
        }
       

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
                    <div class="col" id="date1">
                        <label for="from">언제부터</label>
                        <input type="text" id="from" name="from">
                        <div class="xma"></div>
                        <label for="to">언제까지</label>
                        <input type="text" id="to" name="to">
                    </div>
                </div>
            </div>

        </div>
        <div class="row" id="bottom_menu">
            <div class="">
                <select>
                <option>수량</option>
                <option>1</option>
                <option>2</option>
                <option>3</option>
                <option>4</option>
                <option>5</option>
                </select>
                <button>장바구니 담기</button>
                <button>예약하기</button>
            </div>
        </div>
    </div>
<div>
    <hr class="img_top">
</div>
<div class="col2">
                ${equipVO.eq_img}
            </div>
</body></html>












