<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.member.model.*"%>

<% //見com.emp.controller.EmpServlet.java第238行存入req的empVO物件 (此為輸入格式有錯誤時的empVO物件)
   MemberVO memberVO = (MemberVO) request.getAttribute("memberVO");
%>

<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
<title>會員資料新增 - addMem.jsp</title>

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
			width: 85%;
			margin: 2em auto;
			background: linear-gradient(145deg, #ffffff 0%, #f8fdff 100%);
			box-shadow: 0 8px 25px rgba(21, 101, 192, 0.15);
			border-radius: 12px;
			overflow: hidden;
		}

		table#table-1 {
			background: linear-gradient(135deg, #1565c0 0%, #26a69a 100%);
			color: white;
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

		thead {
			background: linear-gradient(135deg, #1565c0 0%, #26a69a 100%);
			color: white;
		}

		thead th {
			padding: 15px;
			font-size: 16px;
			font-weight: 600;
		}

		tbody td {
			padding: 12px 15px;
			border-bottom: 1px solid #e0f7fa;
			text-align: left;
			vertical-align: middle;
		}

		tbody td:first-child {
			background: linear-gradient(90deg, #e0f7fa 0%, transparent 100%);
			font-weight: 600;
			color: #1565c0;
			width: 150px;
			text-align: right;
			padding-right: 20px;
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

		/* 日期選擇器樣式調整 */
		.xdsoft_datetimepicker .xdsoft_datepicker {
			width: 300px;
		}

		.xdsoft_datetimepicker .xdsoft_timepicker .xdsoft_time_box {
			height: 151px;
		}

		/* 主標題樣式 */
		h3 {
			background: linear-gradient(135deg, #1565c0, #26a69a);
			-webkit-background-clip: text;
			-webkit-text-fill-color: transparent;
			background-clip: text;
			font-size: 1.5em;
			margin: 1em 0;
		}
	</style>

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

</head>
<body bgcolor='white'>

<table id="table-1" class="card form-table">
	<tr><td>
		 <h3>會員資料新增 - addMem.jsp</h3></td><td>
		 <h4><a href="select_page.jsp"><img src="images/tomcat.png" width="100" height="100" border="0">回首頁</a></h4>
	</td></tr>
</table>

<h3>資料新增:</h3>

<%-- 錯誤表列 --%>
<c:if test="${not empty errMsgs}">
	<font style="color:red">請修正以下錯誤:</font>
	<ul>
		<c:forEach var="message" items="${errMsgs}">
			<li style="color:red">${message}</li>
		</c:forEach>
	</ul>
</c:if>

<FORM METHOD="post" ACTION="mem.do" name="form1">
<table>

	<tr>
		<td>會員姓名:</td>
		<td><input type="TEXT" name="memName" value="<%=(memberVO==null)?"大小吳Tomcat":memberVO.getMemName()%>" size="45"/></td>
	</tr>
	<tr>
		<td>會員暱稱:</td>
		<td><input type="TEXT" name="memNickName"   value="<%=(memberVO==null)?"膽固醇Tomcat":memberVO.getMemNickName()%>" size="45"/></td>
	</tr>
	<tr>
		<td>會員帳號:</td>
		<td><input type="TEXT" name="memAccount"   value="<%=(memberVO==null)?"AstroidCat":memberVO.getMemNickName()%>" size="45"/></td>
	</tr>
	<tr>
		<td>會員密碼:</td>
		<td><input type="TEXT" name="memPassword"   value="<%=(memberVO==null)?"jdbchibernate":memberVO.getMemPassword()%>" size="45"/></td>
	</tr>
	<tr>
		<td>會員Email:</td>
		<td><input type="TEXT" name="memEmail"   value="<%=(memberVO==null)?"David@TJA101.com.tw":memberVO.getMemEmail()%>" size="45"/></td>
	</tr>
	<tr>
		<td>會員地址:</td>
		<td><input type="TEXT" name="memAddress"   value="<%=(memberVO==null)?"兄弟大飯店斜對面滷味攤":memberVO.getMemAdrs()%>" size="45"/></td>
	</tr>
	<tr>
		<td>會員電話:</td>
		<td><input type="TEXT" name="memPhone"   value="<%=(memberVO==null)?"0987487487":memberVO.getMemPhone()%>" size="45"/></td>
	</tr>
	<tr>
		<td>會員生日日期:</td>
		<td><input name="memBirthday" id="f_date1" type="text" ></td>
	</tr>

<%--	<jsp:useBean id="deptSvc" scope="page" class="com.dept.model.DeptService" />--%>
<%--	<tr>--%>
<%--		<td>部門:<font color=red><b>*</b></font></td>--%>
<%--		<td><select size="1" name="deptno">--%>
<%--			<c:forEach var="deptVO" items="${deptSvc.all}">--%>
<%--				<option value="${deptVO.deptno}" ${(empVO.deptno==deptVO.deptno)? 'selected':'' } >${deptVO.dname}--%>
<%--			</c:forEach>--%>
<%--		</select></td>--%>
<%--	</tr>--%>

</table>
<br>
<input type="hidden" name="action" value="insert">
<input type="submit" value="送出新增" class="btn"></FORM>

</body>



<!-- =========================================以下為 datetimepicker 之相關設定========================================== -->

<% 
  java.sql.Date birthday = null;
  try {
	    birthday = memberVO.getMemBirthday();
   } catch (Exception e) {
	  birthday = new java.sql.Date(System.currentTimeMillis());
   }
%>
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
		   value: '<%=birthday%>', // value:   new Date(),
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