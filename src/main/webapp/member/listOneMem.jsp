<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.member.model.*"%>
<%-- 此頁暫練習採用 Script 的寫法取值 --%>

<%
  MemberVO memVO = (MemberVO) request.getAttribute("memberVO"); //EmpServlet.java(Concroller), 存入req的empVO物件
%>
<%= memVO==null %>
<html>
<head>
<title>會員資料 - listOneMem.jsp</title>

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
<%--	width: 600px;--%>
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
			background: linear-gradient(135deg, #e0f7fa 0%, #f0f8ff 100%);
			color: #2a2a2a;
			margin: 0;
			padding: 0;
			min-height: 100vh;
		}

		h1, h2, h3, h4 {
			text-align: center;
			color: #1565c0;
		}

		/* 去除 ul/li 小黑點 */
		ul {
			list-style: none;
			padding-left: 0;
			margin: 1em 0;
		}

		ul li {
			background: #ffebee;
			border-left: 4px solid #26a69a;
			padding: 8px 12px;
			margin-bottom: 5px;
			border-radius: 4px;
			color: #d32f2f;
			font-weight: 500;
		}

		/* 表格樣式 */
		table {
			border-collapse: collapse;
			width: 95%;
			margin: 2em auto;
			background: linear-gradient(145deg, #ffffff 0%, #f8fdff 100%);
			box-shadow: 0 8px 25px rgba(21, 101, 192, 0.15);
			border-radius: 12px;
			overflow: hidden;
		}

		table#table-1 {
			background: linear-gradient(135deg, #1565c0 0%, #26a69a 100%);
			color: white;
			width: 85%;
		}

		table#table-1 td {
			padding: 15px 20px;
			vertical-align: middle;
		}

		table#table-1 h3 {
			color: white;
			margin: 0;
			font-size: 1.3em;
		}

		table#table-1 h4 {
			color: white;
			margin: 0;
		}

		table#table-1 h4 a {
			color: white;
			text-decoration: none;
		}

		table#table-1 h4 a:hover {
			color: #e0f7fa;
		}

		/* 主資料表格 */
		table:not(#table-1) {
			font-size: 14px;
		}

		th {
			background: linear-gradient(135deg, #1565c0 0%, #26a69a 100%);
			color: white;
			padding: 12px 8px;
			font-size: 14px;
			font-weight: 600;
			text-align: center;
			border-right: 1px solid rgba(255,255,255,0.2);
		}

		th:last-child {
			border-right: none;
		}

		td {
			padding: 10px 8px;
			text-align: center;
			border-bottom: 1px solid #e0f7fa;
			border-right: 1px solid #e0f7fa;
			background-color: #fafffe;
			transition: background-color 0.2s ease;
		}

		td:last-child {
			border-right: none;
		}

		tr:hover td {
			background-color: #e0f7fa;
		}

		/* 表單樣式 */
		form {
			width: 70%;
			margin: 3em auto;
			background: linear-gradient(145deg, #ffffff 0%, #f0f8ff 100%);
			padding: 2.5em;
			border-radius: 15px;
			box-shadow: 0 10px 30px rgba(38, 166, 154, 0.1);
			border: 1px solid #e0f7fa;
		}

		form label {
			font-weight: bold;
			margin-top: 1em;
			display: block;
			color: #1565c0;
		}

		form input, form select, form textarea {
			width: 100%;
			padding: 12px 15px;
			margin-top: 8px;
			border: 2px solid #e0f7fa;
			border-radius: 8px;
			font-size: 14px;
			transition: all 0.3s ease;
			background-color: #fafffe;
		}

		form input:focus, form select:focus, form textarea:focus {
			outline: none;
			border-color: #26a69a;
			box-shadow: 0 0 10px rgba(38, 166, 154, 0.2);
			background-color: white;
		}

		/* 按鈕樣式 */
		.btn {
			background: linear-gradient(135deg, #1565c0 0%, #26a69a 100%);
			color: white;
			padding: 12px 25px;
			margin-top: 1.5em;
			margin-right: 1em;
			border: none;
			border-radius: 8px;
			font-size: 15px;
			font-weight: 600;
			cursor: pointer;
			transition: all 0.3s ease;
			text-transform: uppercase;
			letter-spacing: 0.5px;
		}

		.btn:hover {
			background: linear-gradient(135deg, #0d47a1 0%, #00695c 100%);
			transform: translateY(-2px);
			box-shadow: 0 6px 20px rgba(21, 101, 192, 0.3);
		}

		/* 按鈕群組右靠 */
		.button-group {
			text-align: right;
			margin-top: 1em;
			margin-right: 10%;
		}

		/* 提示訊息 */
		.message {
			color: #d32f2f;
			font-weight: bold;
			text-align: center;
			margin-top: 1em;
		}

		.error {
			color: #d32f2f;
			font-size: 14px;
			background: #ffebee;
			padding: 10px;
			border-radius: 6px;
			border-left: 4px solid #26a69a;
		}

		.success {
			color: #00695c;
			font-size: 14px;
			background: #e0f2f1;
			padding: 10px;
			border-radius: 6px;
			border-left: 4px solid #26a69a;
		}

		/* 主標題樣式 */
		h4:first-of-type {
			background: linear-gradient(135deg, #1565c0, #26a69a);
			-webkit-background-clip: text;
			-webkit-text-fill-color: transparent;
			background-clip: text;
			font-size: 1.2em;
			margin: 1em 0;
		}

		/* 響應式設計 */
		@media (max-width: 1200px) {
			table:not(#table-1) {
				font-size: 12px;
			}

			th, td {
				padding: 8px 6px;
			}
		}

		@media (max-width: 768px) {
			table:not(#table-1) {
				font-size: 11px;
			}

			th, td {
				padding: 6px 4px;
			}

			table {
				width: 98%;
			}
		}
	</style>

</head>
<body bgcolor='white'>

<h4>此頁暫練習採用 Script 的寫法取值:</h4>
<table id="table-1" class="card">
	<tr><td>
		 <h3>會員工資料 - listOneMem.jsp</h3>
		 <h4><a href="select_page.jsp"><img src="images/back1.gif" width="100" height="32" border="0">回首頁</a></h4>
	</td></tr>
</table>

<table>
		<tr>
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
		</tr>
	<tr>
		<td><%=memVO.getMemNo()%></td>
		<td><%=memVO.getMemName()%></td>
		<td><%=memVO.getMemNickName()%></td>
		<td><%=memVO.getMemAccount()%></td>
		<td><%=memVO.getMemPassword()%></td>
		<td><%=memVO.getMemEmail()%></td>
		<td><%=memVO.getMemPhone()%></td>
		<td><%=memVO.getMemBirthday()%></td>
		<td><%=memVO.getMemStatus()%></td>
		<td><%=memVO.getMemToken()%></td>
		<td><%=memVO.getMemEmailAuth()%></td>
		<td><%=memVO.getCanPost()%></td>
		<td><%=memVO.getCanComment()%></td>
		<td><%=memVO.getCanUsedPro()%></td>>
		<td><%=memVO.getAuthenticated()%></td>
		<td><%= memVO.getPoint() %></td>
	</tr>
</table>

</body>
</html>