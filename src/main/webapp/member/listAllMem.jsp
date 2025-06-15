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
		/* 全站字型與底色統一 - 藍色 + Tiffany 綠配色 */
		body {
			font-family: "Microsoft JhengHei", sans-serif;
			background: linear-gradient(135deg, #e0f7fa 0%, #b3e5fc 50%, #81d4fa 100%);
			color: #1a237e;
			margin: 0;
			padding: 0;
			text-align: center;
			min-height: 100vh;
		}

		h1, h2, h3, h4 {
			color: #0d47a1;
			margin: 1em 0;
			text-shadow: 0 1px 2px rgba(0,0,0,0.1);
		}

		/* 去除 ul/li 小黑點 */
		ul, li {
			list-style: none !important;
			list-style-type: none !important;
			margin: 0;
			padding: 0;
		}

		/* 會員資料卡片容器 */
		table.ta {
			display: flex;
			flex-wrap: wrap;
			justify-content: center;
			gap: 20px;
			padding: 2em;
			border-collapse: unset;
			background: none;
		}

		/* 會員資料卡片 */
		table.ta tr {
			display: flex;
			flex-direction: row;
			align-items: flex-start;
			justify-content: flex-start;
			width: 600px;
			background: linear-gradient(145deg, #ffffff 0%, #f1f8e9 100%);
			border: 2px solid #4dd0e1;
			border-radius: 15px;
			padding: 1.5em;
			box-shadow: 0 8px 20px rgba(77, 208, 225, 0.2);
			transition: all 0.3s ease;
			text-align: left;
			flex-wrap: wrap;
			position: relative;
			overflow: hidden;
		}

		/* 卡片懸停效果 */
		table.ta tr:hover {
			transform: translateY(-5px) scale(1.02);
			box-shadow: 0 12px 30px rgba(77, 208, 225, 0.35);
			border-color: #00bcd4;
		}

		/* 隱藏表頭 */
		table.ta thead {
			display: none;
		}

		/* 資料欄位樣式 */
		table.ta td {
			flex: 1 1 100%;
			padding: 6px 0;
			border: none;
			font-size: 14px;
			color: #1a237e;
			font-weight: 500;
		}

		/* 頭像欄位 */
		table.ta td:first-child {
			flex: 0 0 80px;
			text-align: center;
		}

		/* 頭像圖片樣式 */
		table.ta td img {
			border-radius: 50%;
			width: 60px;
			height: 60px;
			object-fit: cover;
			border: 3px solid #00bcd4;
			display: block;
			margin-bottom: 10px;
			box-shadow: 0 4px 12px rgba(0, 188, 212, 0.3);
			transition: all 0.3s ease;
		}

		table.ta td img:hover {
			transform: scale(1.1);
			border-color: #4dd0e1;
		}

		/* 按鈕容器 */
		table.ta td:last-child,
		table.ta td:nth-last-child(2) {
			display: inline-block;
			margin-top: 10px;
			margin-right: 10px;
		}

		table.ta form {
			display: inline-block;
			margin-right: 8px;
		}

		/* 所有按鈕統一風格 - 藍色 + Tiffany 綠配色 */
		input[type="submit"], .btn, button {
			background: linear-gradient(135deg, #0d47a1 0%, #1976d2 50%, #42a5f5 100%);
			color: white;
			border: none;
			padding: 10px 18px;
			font-size: 13px;
			border-radius: 25px;
			cursor: pointer;
			transition: all 0.3s ease;
			box-shadow: 0 4px 12px rgba(13, 71, 161, 0.3);
			font-weight: 600;
			text-transform: uppercase;
			letter-spacing: 0.5px;
		}

		input[type="submit"]:hover,
		.btn:hover,
		button:hover {
			background: linear-gradient(135deg, #1976d2 0%, #42a5f5 50%, #4dd0e1 100%);
			transform: translateY(-2px);
			box-shadow: 0 6px 18px rgba(13, 71, 161, 0.4);
		}

		/* 修改按鈕特殊配色 */
		input[value="修改"] {
			background: linear-gradient(135deg, #00bcd4 0%, #4dd0e1 50%, #80deea 100%);
		}

		input[value="修改"]:hover {
			background: linear-gradient(135deg, #4dd0e1 0%, #80deea 50%, #b2ebf2 100%);
		}

		/* 刪除按鈕保持原藍色系 */
		input[value="刪除"] {
			background: linear-gradient(135deg, #1565c0 0%, #0d47a1 50%, #0277bd 100%);
		}

		input[value="刪除"]:hover {
			background: linear-gradient(135deg, #0d47a1 0%, #01579b 50%, #1565c0 100%);
		}

		/* 表單欄位一致配色 */
		input[type="text"],
		input[type="email"],
		input[type="password"],
		select,
		textarea {
			border: 2px solid #4dd0e1;
			border-radius: 8px;
			padding: 10px;
			font-size: 14px;
			width: 100%;
			box-sizing: border-box;
			background: rgba(255, 255, 255, 0.9);
			transition: all 0.3s ease;
		}

		input:focus, select:focus, textarea:focus {
			border-color: #00bcd4;
			box-shadow: 0 0 8px rgba(77, 208, 225, 0.4);
			outline: none;
			background: white;
		}

		/* 常見功能句子式超連結 */
		.inline-link, a {
			color: #0d47a1;
			font-weight: bold;
			text-decoration: none;
			border-bottom: 2px solid #4dd0e1;
			transition: all 0.3s ease;
			padding: 2px 4px;
		}

		.inline-link:hover, a:hover {
			color: #00bcd4;
			border-color: #00bcd4;
			background: rgba(77, 208, 225, 0.1);
			border-radius: 4px;
		}

		/* 標題區域美化 */
		#table-1 {
			background: linear-gradient(135deg, rgba(255,255,255,0.9) 0%, rgba(241,248,233,0.9) 100%);
			border: 2px solid #4dd0e1;
			border-radius: 15px;
			margin: 20px auto;
			padding: 20px;
			box-shadow: 0 6px 15px rgba(77, 208, 225, 0.2);
			width: auto;
			display: inline-block;
		}

		#table-1 td {
			border: none;
			padding: 10px;
		}

		/* 頁面標題美化 */
		h4:first-of-type {
			background: linear-gradient(135deg, #4dd0e1 0%, #80deea 100%);
			color: white;
			padding: 15px 30px;
			border-radius: 25px;
			display: inline-block;
			margin: 20px auto;
			box-shadow: 0 6px 15px rgba(77, 208, 225, 0.3);
			font-size: 16px;
			font-weight: 600;
		}

		/* 響應式設計 */
		@media (max-width: 768px) {
			table.ta tr {
				width: 95%;
				margin: 10px auto;
			}

			table.ta {
				padding: 1em;
				gap: 15px;
			}
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
<%--	<tr>--%>
<%--		<th>會員頭貼</th>--%>
<%--		<th>會員編號</th>--%>
<%--		<th>會員姓名</th>--%>
<%--        <th>會員暱稱</th>--%>
<%--        <th>會員帳號</th>--%>
<%--        <th>會員密碼</th>--%>
<%--        <th>會員Email</th>--%>
<%--        <th>會員電話</th>--%>
<%--        <th>會員生日日期</th>--%>
<%--        <th>會員狀態</th>--%>
<%--        <th>會員Token</th>--%>
<%--        <th>會員Email認證代碼</th>--%>
<%--        <th>可否發文</th>--%>
<%--        <th>可否留言</th>--%>
<%--        <th>可否買二手物品</th>--%>
<%--        <th>會員認證狀態</th>--%>
<%--        <th>會員積分</th>--%>
<%--		<th>修改</th>--%>
<%--		<th>刪除</th>--%>
<%--	</tr>--%>
	<%@ include file="page1.file" %>
	<c:forEach var="memVO" items="${list}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">

		<tr>
			<td>
			會員頭貼:
			<c:choose>
			<c:when test="${empty memVO.memIconData}">
			<img src="images/defaultAnya.png" width="50" height="50"/>
			</c:when>
			<c:otherwise>

			<img src="${pageContext.request.contextPath}/memIconReader?memNo=${memVO.memNo}" width="50" height="50"/>
			</c:otherwise>
			</c:choose>
			</td>>
			<td>會員編號: ${memVO.memNo}</td>
			<td>會員姓名: ${memVO.memName}</td>
			<td>會員暱稱: ${memVO.memNickName}</td>
			<td>會員帳號: ${memVO.memAccount}</td>
			<td>會員密碼: ${memVO.memPassword}</td>
			<td>會員Email: ${memVO.memEmail}</td>
			<td>會員電話: ${memVO.memPhone}</td>
			<td>會員生日日期: ${memVO.memBirthday}</td>
			<td>會員狀態: ${memVO.memStatus}</td>
			<td>會員Token: ${memVO.memToken}</td>
			<td>會員Email認證代碼: ${memVO.memEmailAuth}</td>
			<td>可否發文: ${memVO.canPost}</td>
			<td>可否留言: ${memVO.canComment}</td>
			<td>可否買二手物品: ${memVO.canUsedPro}</td>
			<td>會員認證狀態: ${memVO.authenticated}</td>
			<td>會員積分: ${memVO.point}</td>

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