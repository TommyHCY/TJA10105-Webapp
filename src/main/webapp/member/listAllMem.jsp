<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="com.member.model.*"%>
<%-- 此頁練習採用 EL 的寫法取值 --%>

<%
    MemberService memberService = new MemberService();
    List<MemberVO> list = memberService.getAll();
    pageContext.setAttribute("list",list);
%>


<html>
<head>
<title>所有會員資料 - listAllMem.jsp</title>

<%--<style>--%>
<%--  table#table-1 {--%>
<%--	background-color: #CCCCFF;--%>
<%--    border: 2px solid black;--%>
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

<%--<style>--%>
<%--  table {--%>
<%--	width: 800px;--%>
<%--	background-color: white;--%>
<%--	margin-top: 5px;--%>
<%--	margin-bottom: 5px;--%>
<%--  }--%>
<%--  table, th, td {--%>
<%--    border: 1px solid #CCCCFF;--%>
<%--  }--%>
<%--  th, td {--%>
<%--    padding: 5px;--%>
<%--    text-align: center;--%>
<%--  }--%>
<%--</style>--%>
	<style>
		/* 全站基礎設定 */
		body {
			font-family: "Microsoft JhengHei", sans-serif;
			background-color: #f0f4fb;
			color: #2a2a2a;
			margin: 0;
			padding: 0;
		}

		h1, h2, h3, h4 {
			text-align: center;
			color: #1d3557;
		}

		/* 表格樣式 */
		table {
			border-collapse: collapse;
			width: 85%;
			margin: 2em auto;
			background-color: #ffffff;
			box-shadow: 0 0 12px rgba(0, 0, 0, 0.08);
		}

		thead {
			background-color: #457b9d;
			color: white;
		}

		thead th {
			padding: 12px 15px;
			font-size: 16px;
		}

		tbody td {
			padding: 10px 15px;
			border-bottom: 1px solid #dee2e6;
			text-align: center;
		}

		/* 表單樣式 */
		form {
			width: 70%;
			margin: 3em auto;
			background-color: #e8f0fe;
			padding: 2em;
			border-radius: 8px;
			box-shadow: 0 0 10px rgba(0,0,0,0.06);
		}

		form label {
			font-weight: bold;
			margin-top: 1em;
			display: block;
			color: #1d3557;
		}

		form input, form select, form textarea {
			width: 100%;
			padding: 10px;
			margin-top: 5px;
			border: 1px solid #aac4e0;
			border-radius: 5px;
			font-size: 14px;
		}

		/* 按鈕樣式 */
		.btn {
			background-color: #1d3557;
			color: white;
			padding: 10px 20px;
			margin-top: 1.5em;
			margin-right: 1em;
			border: none;
			border-radius: 5px;
			font-size: 14px;
			cursor: pointer;
			transition: background-color 0.2s ease-in-out;
		}

		.btn:hover {
			background-color: #27496d;
		}

		/* 按鈕群組右靠 */
		.button-group {
			text-align: right;
			margin-top: 1em;
			margin-right: 10%;
		}

		/* 提示訊息 */
		.message {
			color: #e63946;
			font-weight: bold;
			text-align: center;
			margin-top: 1em;
		}

		.error {
			color: #d62828;
			font-size: 14px;
		}

		.success {
			color: #2a9d8f;
			font-size: 14px;
		}
	</style>




</head>
<body bgcolor='white'>

<h4>此頁練習採用 EL 的寫法取值:</h4>
<table id="table-1">
	<tr><td>
		 <h3>所有會員資料 - listAllMem.jsp</h3>
		 <h4><a href="select_page.jsp"><img src="images/back1.gif" width="100" height="32" border="0">回首頁</a></h4>
	</td></tr>
</table>

<table class="ta">
	<tr>
		<th>會員頭貼</th>
		<th>會員編號</th>
		<th>會員姓名</th>
        <th>會員暱稱</th>
        <th>會員帳號</th>
        <th>會員密碼</th>
        <th>會員Email</th>
        <th>會員電話</th>
        <th>會員生日日期</th>
        <th>會員狀態</th>
        <th>會員Token</th>
        <th>會員Email認證代碼</th>
        <th>可否發文</th>
        <th>可否留言</th>
        <th>可否買二手物品</th>
        <th>會員認證狀態</th>
        <th>會員積分</th>
		<th>修改</th>
		<th>刪除</th>
	</tr>
	<%@ include file="page1.file" %>
	<c:forEach var="memVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">

		<tr>
			<td>
			<c:choose>
			<c:when test="${empty memVO.memIconData}">
			<img src="images/defaultAnya.png" width="50" height="50"/>
			</c:when>
			<c:otherwise>
			<img src="${pageContext.request.contextPath}/memIconReader?memNo=${memVO.memNo}" width="50" height="50"/>
			</c:otherwise>
			</c:choose>
			</td>>
			<td>${memVO.memNo}</td>
			<td>${memVO.memName}</td>
			<td>${memVO.memNickName}</td>
			<td>${memVO.memAccount}</td>
			<td>${memVO.memPassword}</td>
			<td>${memVO.memEmail}</td>
			<td>${memVO.memPhone}</td>
			<td>${memVO.memBirthday}</td>
			<td>${memVO.memStatus}</td>
			<td>${memVO.memToken}</td>
			<td>${memVO.memEmailAuth}</td>
			<td>${memVO.canPost}</td>
			<td>${memVO.canComment}</td>
			<td>${memVO.canUsedPro}</td>
			<td>${memVO.authenticated}</td>
			<td>${memVO.point}</td>

			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/member/mem.do" style="margin-bottom: 0px;">
			     <input type="submit" value="修改">
			     <input type="hidden" name="memberNo"  value="${memVO.memNo}">
			     <input type="hidden" name="action"	value="getOne_For_Update"></FORM>
			</td>
			<td>
			  <FORM METHOD="post" ACTION="<%=request.getContextPath()%>/member/mem.do" style="margin-bottom: 0px;">
			     <input type="submit" value="刪除">
			     <input type="hidden" name="memberNo"  value="${memVO.memNo}">
			     <input type="hidden" name="action" value="delete"></FORM>
			</td>
		</tr>
	</c:forEach>
</table>
<%@ include file="page2.file" %>

</body>
</html>