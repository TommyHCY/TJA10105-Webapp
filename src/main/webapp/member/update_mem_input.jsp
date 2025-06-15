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
			font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
			background-color: #f8f9fa;
			color: #333;
			margin: 20px;
		}
		table.card {
			width: 100%;
			max-width: 900px;
			margin: 20px auto;
			background-color: #fff;
			border-radius: 8px;
			border-collapse: collapse;
			box-shadow: 0 4px 12px rgba(0, 0, 0, 0.05);
		}
		table.card td {
			padding: 10px;
			border-bottom: 1px solid #dee2e6;
		}
		table.card tr:hover {
			background-color: #f1f3f5;
		}
		input[type="text"] {
			width: 100%;
			padding: 6px 8px;
			font-size: 1em;
			border: 1px solid #ced4da;
			border-radius: 4px;
			box-sizing: border-box;
		}
		.btn {
			background-color: #007bff;
			border: none;
			color: white;
			padding: 8px 16px;
			font-size: 0.95em;
			border-radius: 4px;
			cursor: pointer;
			margin-top: 10px;
		}
		.btn:hover {
			background-color: #0056b3;
		}
		.error {
			color: red;
			font-weight: bold;
			margin-top: 10px;
		}
	</style>

</head>
<body bgcolor='white'>

<table id="table-1">
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
			<li style="color:red">${message}</li>
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