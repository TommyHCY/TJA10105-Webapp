<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- <!DOCTYPE html> -->
<!-- <html> -->
<!-- <head> -->
<!-- <meta charset="UTF-8"> -->
<!-- <title>Insert title here</title> -->
<!-- </head> -->
<!-- <body> -->

<!-- </body> -->
<!-- </html> -->

<%@ page isErrorPage="true"%>
<html>
<head>
<meta charset="UTF-8">
<title>錯誤發生</title>
<style>
body {
	background-color: #f0f8ff;
	font-family: 'Segoe UI', sans-serif;
	color: #003366;
	margin: 0;
	padding: 0;
}

.container {
	max-width: 600px;
	margin: 100px auto;
	background-color: #ffffff;
	border: 2px solid #40e0d0; /* Tiffany 綠邊框 */
	border-radius: 12px;
	padding: 30px;
	box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
	text-align: center;
}

h1 {
	color: #007acc; /* 淡藍色標題 */
	margin-bottom: 20px;
}

p {
	font-size: 16px;
	margin: 10px 0;
}

a.button {
	display: inline-block;
	margin-top: 20px;
	padding: 10px 20px;
	background-color: #40e0d0; /* Tiffany 綠按鈕 */
	color: white;
	text-decoration: none;
	border-radius: 8px;
	font-weight: bold;
	transition: background-color 0.3s;
}

a.button:hover {
	background-color: #32c9b3;
}
</style>
</head>
<body>
	<div class="container">
		<h1>Oops！發生錯誤了</h1>
		<p>
			🚫 錯誤狀態碼：<%= response.getStatus() %></p>
		<p>
			📌 錯誤訊息：<%= exception != null ? exception.getMessage() : "無詳細資訊" %></p>
		<a class="button"
			href="<%= request.getContextPath()+"/member/select_page.jsp" %>">回首頁</a>
	</div>
</body>
</html>
