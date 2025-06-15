<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Pixel Tribe : Home</title>

    <%--<style>--%>
    <%--  table#table-1 {--%>
    <%--	width: 450px;--%>
    <%--	background-color: #CCCCFF;--%>
    <%--	margin-top: 5px;--%>
    <%--	margin-bottom: 10px;--%>
    <%--    border: 3px ridge Gray;--%>
    <%--    height: 80px;--%>
    <%--    text-align: center;--%>
    <%--  }--%>
    <%--  table#table-1 h4 {--%>
    <%--    color: red;--%>
    <%--    display: block;--%>
    <%--    margin-bottom: 1px;--%>
    <%--  }--%>
    <%--  h4 {--%>
    <%--    color: blue;--%>
    <%--    display: inline;--%>
    <%--  }--%>
    <%--</style>--%>

    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f8f9fa;
            color: #333;
            margin: 20px;
        }
        table.card {
            width: 100%;
            max-width: 800px;
            margin: 20px auto;
            background-color: #fff;
            border-radius: 8px;
            border-collapse: collapse;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.05);
            text-align: center;
        }
        h3, h4 {
            margin: 0;
            padding: 10px;
        }
        a {
            color: #007bff;
            text-decoration: none;
        }
        a:hover {
            text-decoration: underline;
        }
        .btn {
            background-color: #007bff;
            color: white;
            padding: 6px 12px;
            border: none;
            border-radius: 4px;
            margin-top: 5px;
            cursor: pointer;
        }
        .btn:hover {
            background-color: #0056b3;
        }
    </style>

</head>
<body bgcolor='white'>

<table id="table-1" class="card">
    <tr>
        <td><h3>Pixel_Tribe Member : Home</h3><h4>( MVC )</h4></td>
    </tr>
</table>

<p>This is the Home page for Pixel_Tribe Member : Home</p>

<h3>資料查詢:</h3>

<%-- 錯誤表列 --%>
<c:if test="${not empty errMsgs}">
    <font style="color:red">請修正以下錯誤:</font>
    <ul>
        <c:forEach var="message" items="${errMsgs}">
            <li style="color:red">${message}</li>
        </c:forEach>
    </ul>
</c:if>

<ul>
    <li><a href='listAllMem.jsp'>List</a> all Members. <br><br></li>


    <li>
        <FORM METHOD="post" ACTION="mem.do">
            <b>輸入會員編號 :</b>
            <input type="text" name="memberNo">
            <input type="hidden" name="action" value="getOne_For_Display">
            <input type="submit" value="送出" class="btn">
        </FORM>
    </li>

    <jsp:useBean id="memSrv" scope="page" class="com.member.model.MemberService"/>

    <li>
        <FORM METHOD="post" ACTION="mem.do">
            <b>選擇會員編號:</b>
            <select size="1" name="memberNo">
                <c:forEach var="memberVO" items="${memSrv.all}">
                <option value="${memberVO.memNo}">${memberVO.memNo}
                    </c:forEach>
            </select>
            <input type="hidden" name="action" value="getOne_For_Display">
            <input type="submit" value="送出" class="btn">
        </FORM>
    </li>

    <li>
        <FORM METHOD="post" ACTION="mem.do">
            <b>選擇會員姓名:</b>
            <select size="1" name="memberNo">
                <c:forEach var="memberVO" items="${memSrv.all}">
                <option value="${memberVO.memNo}">${memberVO.memName}
                    </c:forEach>
            </select>
            <input type="hidden" name="action" value="getOne_For_Display">
            <input type="submit" value="送出" class="btn">
        </FORM>
    </li>

    <li>
        <FORM METHOD="post" ACTION="mem.do">
            <b>選擇會員暱稱:</b>
            <select size="1" name="memberNo">
                <c:forEach var="memberVO" items="${memSrv.all}">
                <option value="${memberVO.memNo}">${memberVO.memNickName}
                    </c:forEach>
            </select>
            <input type="hidden" name="action" value="getOne_For_Display">
            <input type="submit" value="送出" class="btn">
        </FORM>
    </li>
</ul>


<h3>會員管理</h3>

<ul>
    <li><a href='addMem.jsp'>Add</a> a new Member.</li>
</ul>

</body>
</html>