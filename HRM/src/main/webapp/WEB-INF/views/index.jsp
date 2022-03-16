<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>HRM</title>

<!-- Style -->
<link rel="stylesheet" href="resources/css/reset.css">
<link rel="stylesheet" href="resources/css/index.css">

</head>
<body>
	<div class="full-page">
		<div class="header">
			<div class="header-box">
				<div class="logo-box">
					IT & BIZ
				</div>
				<div class="link-box">
					<a class="link-a2" href="insaListForm.do">Search</a>
					<a class="link-a1" href="insaInputForm.do">Input</a>
					<a class="link-a1" href="index.do">Home</a>
				</div>
			</div>
		</div>
		<div class="index">
			<div class="i-hrm">
				인사관리 시스템
			</div>
			<div class="i-input">
				인사정보를 입력하겠습니다. <button type="button" class="btn" onclick="location.href='insaInputForm.do'">입력</button>
			</div>
			<div class="i-search">
				인사정보를 조회하겠습니다. <button type="button" class="btn" onclick="location.href='insaListForm.do'">조회</button>
			</div>
		</div>
		<div class="footer">
			서울시 금천구 서부샛길 606 A-1306 (가산동 대성디폴리스 지식산업센터) / Tel. 02-6049-1114 / Fax. 02-861-9883. Copyright© 2015 IT&BIZ co., LTD. All rights reserved.
		</div>
	</div>
</body>
</html>