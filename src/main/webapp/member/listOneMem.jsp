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

<style>
  table#table-1 {
	background-color: #CCCCFF;
    border: 2px solid black;
    text-align: center;
  }
  table#table-1 h4 {
    color: red;
    display: block;
    margin-bottom: 1px;
  }
  h4 {
    color: blue;
    display: inline;
  }
</style>

<style>
  table {
	width: 600px;
	background-color: white;
	margin-top: 5px;
	margin-bottom: 5px;
  }
  table, th, td {
    border: 1px solid #CCCCFF;
  }
  th, td {
    padding: 5px;
    text-align: center;
  }
</style>

</head>
<body bgcolor='white'>

<h4>此頁暫練習採用 Script 的寫法取值:</h4>
<table id="table-1">
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
		<td><%=memVO.getMemEmailAuth()%></td>
		<td><%= memVO.getPoint() %></td>
	</tr>
</table>

</body>
</html>