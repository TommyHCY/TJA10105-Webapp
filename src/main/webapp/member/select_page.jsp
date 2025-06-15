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
    font-family: "Microsoft JhengHei", "Segoe UI", Tahoma, Geneva, Verdana, sans-serif;
    background: linear-gradient(135deg, #e6f3ff 0%, #f0ffff 100%);
    color: #2c3e50;
    margin: 0;
    padding: 0;
    min-height: 100vh;
    }

    /* =================================
    標題樣式
    ================================= */

    h1, h2, h3, h4, h5, h6 {
    color: #1e3a8a; /* 深藍色 */
    margin: 1em 0;
    text-align: center;
    }

    /* =================================
    ✅ 完全去除 ul/li 小黑點
    ================================= */

    ul {
    list-style-type: none !important;
    list-style: none !important;
    margin: 0;
    padding: 0;
    }

    li {
    list-style-type: none !important;
    list-style: none !important;
    margin: 0;
    padding: 0;
    }

    /* 針對嵌套的 ul/li 也要去除 */
    ul ul, ul ol, ol ul, ol ol {
    list-style-type: none !important;
    list-style: none !important;
    }

    li::marker {
    display: none;
    }

    li::before {
    content: none !important;
    }

    /* =================================
    頁面頂部 Banner 樣式
    ================================= */

    #table-1.card {
    background: linear-gradient(135deg, #1e3a8a, #0ea5e9, #14b8a6);
    color: white;
    width: 100%;
    text-align: center;
    padding: 2em 1em;
    margin-bottom: 2em;
    border-radius: 0 0 20px 20px;
    box-shadow: 0 8px 32px rgba(0, 0, 0, 0.12);
    }

    #table-1.card h3 {
    font-size: 28px;
    margin-bottom: 0.3em;
    color: white;
    text-shadow: 0 2px 4px rgba(0, 0, 0, 0.3);
    }

    #table-1.card h4 {
    color: #a7f3d0; /* 淺 Tiffany 綠 */
    font-weight: normal;
    font-size: 16px;
    margin-top: 0;
    }

    #table-1.card h4 a {
    color: #a7f3d0;
    text-decoration: none;
    transition: color 0.3s ease;
    }

    #table-1.card h4 a:hover {
    color: #ffffff;
    }

    /* =================================
    普通 table 樣式
    ================================= */

    #table-1 {
    background: linear-gradient(135deg, #1e3a8a, #0ea5e9, #14b8a6);
    color: white;
    width: 100%;
    text-align: center;
    padding: 2em 1em;
    margin-bottom: 2em;
    border-radius: 0 0 20px 20px;
    box-shadow: 0 8px 32px rgba(0, 0, 0, 0.12);
    }

    /* =================================
    段落和文字樣式
    ================================= */

    p {
    text-align: center;
    margin: 1.5em 0;
    color: #374151;
    font-size: 16px;
    }

    /* =================================
    表單容器樣式
    ================================= */

    ul li {
    background: linear-gradient(135deg, #ffffff, #f8fafc);
    margin-bottom: 1.8em;
    padding: 2em;
    border-radius: 16px;
    box-shadow: 0 4px 20px rgba(0, 0, 0, 0.08);
    border: 1px solid #e2e8f0;
    transition: all 0.3s ease;
    display: block;
    text-align: center;
    }

    ul li:hover {
    transform: translateY(-2px);
    box-shadow: 0 8px 32px rgba(0, 0, 0, 0.12);
    border-color: #14b8a6;
    }

    ul li b {
    display: block;
    margin-bottom: 0.8em;
    color: #1e3a8a;
    font-size: 16px;
    font-weight: 600;
    }

    /* =================================
    表單欄位樣式
    ================================= */

    input[type="text"],
    input[type="email"],
    input[type="password"],
    select,
    textarea {
    width: 90%;
    max-width: 400px;
    padding: 12px 16px;
    font-size: 14px;
    border: 2px solid #bfdbfe;
    border-radius: 10px;
    margin-bottom: 0.8em;
    box-sizing: border-box;
    transition: all 0.3s ease;
    background: linear-gradient(135deg, #ffffff, #f8fafc);
    }

    input[type="text"]:focus,
    input[type="email"]:focus,
    input[type="password"]:focus,
    select:focus,
    textarea:focus {
    outline: none;
    border-color: #14b8a6;
    box-shadow: 0 0 0 3px rgba(20, 184, 166, 0.1);
    background: #ffffff;
    }

    /* =================================
    按鈕樣式
    ================================= */

    input[type="submit"],
    .btn,
    button {
    background: linear-gradient(135deg, #1e3a8a, #0ea5e9);
    color: white;
    padding: 12px 24px;
    border: none;
    border-radius: 10px;
    font-size: 14px;
    font-weight: 600;
    margin-top: 0.8em;
    cursor: pointer;
    transition: all 0.3s ease;
    box-shadow: 0 4px 12px rgba(30, 58, 138, 0.3);
    }

    input[type="submit"]:hover,
    .btn:hover,
    button:hover {
    background: linear-gradient(135deg, #14b8a6, #0d9488);
    transform: translateY(-2px);
    box-shadow: 0 6px 20px rgba(20, 184, 166, 0.4);
    }

    /* =================================
    連結樣式
    ================================= */

    .section-text {
    font-size: 16px;
    margin: 2em auto;
    text-align: center;
    }

    .inline-link,
    a {
    color: #1e3a8a;
    font-weight: bold;
    text-decoration: none;
    border-bottom: 2px solid #14b8a6;
    transition: all 0.3s ease;
    padding-bottom: 2px;
    }

    .inline-link:hover,
    a:hover {
    color: #14b8a6;
    border-color: #0d9488;
    transform: translateY(-1px);
    }

    /* =================================
    錯誤訊息樣式
    ================================= */

    .error,
    font[style*="color:red"] {
    color: #dc2626 !important;
    font-weight: bold;
    background: linear-gradient(135deg, #fef2f2, #fff);
    padding: 12px 16px;
    border-radius: 8px;
    border-left: 4px solid #dc2626;
    margin: 1em 0;
    display: block;
    }

    .error li,
    font[style*="color:red"] + ul li {
    color: #dc2626 !important;
    background: transparent;
    padding: 0.5em 0;
    margin: 0;
    box-shadow: none;
    border: none;
    }

    /* =================================
    表格樣式 (用於 update 頁面)
    ================================= */

    table.card {
    width: 100%;
    max-width: 1000px;
    margin: 20px auto;
    background: linear-gradient(135deg, #ffffff, #f8fafc);
    border-radius: 16px;
    border-collapse: separate;
    border-spacing: 0;
    box-shadow: 0 8px 32px rgba(0, 0, 0, 0.08);
    overflow: hidden;
    }

    table.card td {
    padding: 16px 20px;
    border-bottom: 1px solid #e2e8f0;
    vertical-align: middle;
    }

    table.card tr:nth-child(even) {
    background: linear-gradient(135deg, #f8fafc, #f1f5f9);
    }

    table.card tr:hover {
    background: linear-gradient(135deg, #ecfdf5, #f0fdfa);
    }

    table.card tr:last-child td {
    border-bottom: none;
    }

    table.card td:first-child {
    font-weight: 600;
    color: #1e3a8a;
    text-align: right;
    width: 200px;
    background: linear-gradient(135deg, #eff6ff, #f0f9ff);
    }

    /* =================================
    容器樣式
    ================================= */

    .container {
    max-width: 1200px;
    margin: 0 auto;
    padding: 0 20px;
    }

    /* =================================
    響應式設計
    ================================= */

    @media (max-width: 768px) {
    ul li {
    margin: 0 10px 1.5em 10px;
    padding: 1.5em;
    }

    input[type="text"],
    input[type="email"],
    input[type="password"],
    select,
    textarea {
    width: 95%;
    }

    table.card {
    margin: 10px;
    }

    table.card td {
    padding: 12px 16px;
    }

    table.card td:first-child {
    width: auto;
    text-align: left;
    }
    }

    /* =================================
    特殊效果
    ================================= */

    .container {
    animation: fadeIn 0.6s ease-in-out;
    }

    @keyframes fadeIn {
    from {
    opacity: 0;
    transform: translateY(20px);
    }
    to {
    opacity: 1;
    transform: translateY(0);
    }
    }

    /* =================================
    日期選擇器樣式
    ================================= */

    .xdsoft_datetimepicker {
    border: 2px solid #14b8a6 !important;
    border-radius: 12px !important;
    box-shadow: 0 8px 32px rgba(0, 0, 0, 0.15) !important;
    }

    .xdsoft_datetimepicker .xdsoft_datepicker {
    width: 300px;
    background: linear-gradient(135deg, #ffffff, #f8fafc) !important;
    }

    .xdsoft_datetimepicker .xdsoft_timepicker .xdsoft_time_box {
    height: 151px;
    }

    /* =================================
    圖片樣式
    ================================= */

    img {
    transition: all 0.3s ease;
    border-radius: 6px;
    }

    img:hover {
    transform: scale(1.05);
    box-shadow: 0 4px 12px rgba(0, 0, 0, 0.15);
    }
    </style>

</head>
<body bgcolor='white'>
<div class="container">
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
    <div class="section-text">
    <li><a href='listAllMem.jsp'>List</a> all Members. <br><br></li>
    </div>

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
    <div class="section-text">
    <li><a href='addMem.jsp'>Add</a> a new Member.</li>
    </div>
</ul>
</div>
</body>
</html>