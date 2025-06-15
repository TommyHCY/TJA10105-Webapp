<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.member.model.*"%>

<% //見com.emp.controller.EmpServlet.java第163行存入req的empVO物件 (此為從資料庫取出的empVO, 也可以是輸入格式有錯誤時的empVO物件)
   MemberVO memberVO = (MemberVO) request.getAttribute("memberVO");
%>

<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
<title>會員資料修改 - update_mem_input.jsp</title>

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
<%--	width: 450px;--%>
<%--	background-color: white;--%>
<%--	margin-top: 1px;--%>
<%--	margin-bottom: 1px;--%>
<%--  }--%>
<%--  table, th, td {--%>
<%--    border: 0px solid #CCCCFF;--%>
<%--  }--%>
<%--  th, td {--%>
<%--    padding: 1px;--%>
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

<table id="table-1" >
	<tr><td>
		 <h3>會員資料修改 - update_mem_input.jsp</h3>
		 <h4><a href="select_page.jsp"><img src="images/back1.gif" width="100" height="32" border="0">回首頁</a></h4>
	</td></tr>
</table>

<h3>資料修改:</h3>

<%-- 錯誤表列 --%>
<c:if test="${not empty errMsgs}">
	<font style="color:red">請修正以下錯誤:</font>
	<ul>
		<c:forEach var="message" items="${errMsgs}">
			<li class="error">${message}</li>
		</c:forEach>
	</ul>
</c:if>

<FORM METHOD="post" ACTION="mem.do" name="form1" >
<table class="card">
	<tr>
		<td>會員編號:<font color=red><b>*</b></font></td>
		<td><%=memberVO.getMemNo()%></td>
	</tr>
	<tr>
		<td>會員姓名:</td>
		<td><input type="TEXT" name="memName" value="<%=memberVO.getMemName()%>" size="45"/></td>
	</tr>
	<tr>
		<td>會員暱稱:</td>
		<td><input type="TEXT" name="memNickName"   value="<%=memberVO.getMemNickName()%>" size="45"/></td>
	</tr>
	<tr>
		<td>會員帳號:</td>
		<td><input type="TEXT" name="memAccount"   value="<%=memberVO.getMemAccount()%>" size="45"/></td>
	</tr>
	<tr>
		<td>會員密碼:</td>
		<td><input type="TEXT" name="memPassword"   value="<%=memberVO.getMemPassword()%>" size="45"/></td>
	</tr>
	<tr>
		<td>會員Email:</td>
		<td><input type="TEXT" name="memEmail"   value="<%=memberVO.getMemEmail()%>" size="45"/></td>
	</tr>
	<tr>
		<td>會員地址:</td>
		<td><input type="TEXT" name="memAddress"   value="<%=memberVO.getMemAdrs()%>" size="45"/></td>
	</tr>
	<tr>
		<td>會員電話:</td>
		<td><input type="TEXT" name="memPhone"   value="<%=memberVO.getMemPhone()%>" size="45"/></td>
	</tr>
	<tr>
		<td>會員生日日期:</td>
		<td><input name="memBirthday" id="f_date1" type="text" ></td>
	</tr>
	<tr>
		<td>會員狀態:</td>
		<td><input type="TEXT" name="memStatus"   value="<%=memberVO.getMemStatus()%>" size="45"/></td>
	</tr>
	<tr>
		<td>會員Token:</td>
		<td><input type="TEXT" name="memToken"   value="<%=memberVO.getMemToken()%>" size="45"/></td>
	</tr>
	<tr>
		<td>會員Email認證代碼:</td>
		<td><input type="TEXT" name="memEmailAuth"   value="<%=memberVO.getMemEmailAuth()%>" size="45"/></td>
	</tr>
	<tr>
		<td>可否發文:</td>
		<td><input type="TEXT" name="memPost"   value="<%=memberVO.getCanPost()%>" size="45"/></td>
	</tr>
	<tr>
		<td>可否留言:</td>
		<td><input type="TEXT" name="memComment"   value="<%=memberVO.getCanComment()%>" size="45"/></td>
	</tr>
	<tr>
		<td>可否買二手物品:</td>
		<td><input type="TEXT" name="memUsedProd"   value="<%=memberVO.getCanUsedPro()%>" size="45"/></td>
	</tr>
	<tr>
		<td>會員認證狀態:</td>
		<td><input type="TEXT" name="memAuth"   value="<%=memberVO.getAuthenticated()%>" size="45"/></td>
	</tr>
	<tr>
		<td>會員積分:</td>
		<td><input type="TEXT" name="point"   value="<%=memberVO.getPoint()%>" size="45"/></td>
	</tr>


<%--	<jsp:useBean id="deptSvc" scope="page" class="com.dept.model.DeptService" />--%>
<%--	<tr>--%>
<%--		<td>部門:<font color=red><b>*</b></font></td>--%>
<%--		<td><select size="1" name="deptno">--%>
<%--			<c:forEach var="deptVO" items="${deptSvc.all}">--%>
<%--				<option value="${deptVO.deptno}" ${(empVO.deptno==deptVO.deptno)?'selected':'' } >${deptVO.dname}--%>
<%--			</c:forEach>--%>
<%--		</select></td>--%>
<%--	</tr>--%>

</table>
<br>
<input type="hidden" name="action" value="update">
<input type="hidden" name="memberNo" value="<%=memberVO.getMemNo()%>">
<input type="submit" value="送出修改" class="btn"></FORM>
</body>



<!-- =========================================以下為 datetimepicker 之相關設定========================================== -->

<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/datetimepicker/jquery.datetimepicker.css" />
<script src="<%=request.getContextPath()%>/datetimepicker/jquery.js"></script>
<script src="<%=request.getContextPath()%>/datetimepicker/jquery.datetimepicker.full.js"></script>

<style>
  .xdsoft_datetimepicker .xdsoft_datepicker {
           width:  300px;   /* width:  300px; */
  }
  .xdsoft_datetimepicker .xdsoft_timepicker .xdsoft_time_box {
           height: 151px;   /* height:  151px; */
  }
</style>

<script>
        $.datetimepicker.setLocale('zh');
        $('#f_date1').datetimepicker({
           theme: '',              //theme: 'dark',
 	       timepicker:false,       //timepicker:true,
 	       step: 1,                //step: 60 (這是timepicker的預設間隔60分鐘)
 	       format:'Y-m-d',         //format:'Y-m-d H:i:s',
 		   value: '<%=memberVO.getMemBirthday()%>', // value:   new Date(),
           //disabledDates:        ['2017/06/08','2017/06/09','2017/06/10'], // 去除特定不含
           //startDate:	            '2017/07/10',  // 起始日
           //minDate:               '-1970-01-01', // 去除今日(不含)之前
           //maxDate:               '+1970-01-01'  // 去除今日(不含)之後
        });
        
        
   
        // ----------------------------------------------------------以下用來排定無法選擇的日期-----------------------------------------------------------

        //      1.以下為某一天之前的日期無法選擇
        //      var somedate1 = new Date('2017-06-15');
        //      $('#f_date1').datetimepicker({
        //          beforeShowDay: function(date) {
        //        	  if (  date.getYear() <  somedate1.getYear() || 
        //		           (date.getYear() == somedate1.getYear() && date.getMonth() <  somedate1.getMonth()) || 
        //		           (date.getYear() == somedate1.getYear() && date.getMonth() == somedate1.getMonth() && date.getDate() < somedate1.getDate())
        //              ) {
        //                   return [false, ""]
        //              }
        //              return [true, ""];
        //      }});

        
        //      2.以下為某一天之後的日期無法選擇
        //      var somedate2 = new Date('2017-06-15');
        //      $('#f_date1').datetimepicker({
        //          beforeShowDay: function(date) {
        //        	  if (  date.getYear() >  somedate2.getYear() || 
        //		           (date.getYear() == somedate2.getYear() && date.getMonth() >  somedate2.getMonth()) || 
        //		           (date.getYear() == somedate2.getYear() && date.getMonth() == somedate2.getMonth() && date.getDate() > somedate2.getDate())
        //              ) {
        //                   return [false, ""]
        //              }
        //              return [true, ""];
        //      }});


        //      3.以下為兩個日期之外的日期無法選擇 (也可按需要換成其他日期)
        //      var somedate1 = new Date('2017-06-15');
        //      var somedate2 = new Date('2017-06-25');
        //      $('#f_date1').datetimepicker({
        //          beforeShowDay: function(date) {
        //        	  if (  date.getYear() <  somedate1.getYear() || 
        //		           (date.getYear() == somedate1.getYear() && date.getMonth() <  somedate1.getMonth()) || 
        //		           (date.getYear() == somedate1.getYear() && date.getMonth() == somedate1.getMonth() && date.getDate() < somedate1.getDate())
        //		             ||
        //		            date.getYear() >  somedate2.getYear() || 
        //		           (date.getYear() == somedate2.getYear() && date.getMonth() >  somedate2.getMonth()) || 
        //		           (date.getYear() == somedate2.getYear() && date.getMonth() == somedate2.getMonth() && date.getDate() > somedate2.getDate())
        //              ) {
        //                   return [false, ""]
        //              }
        //              return [true, ""];
        //      }});
        
</script>
</html>