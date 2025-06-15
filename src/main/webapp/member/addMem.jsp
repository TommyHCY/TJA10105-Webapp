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