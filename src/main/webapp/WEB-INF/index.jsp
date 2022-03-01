<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>입사시스템</title>
	<style>
		.wrapper {
			display: flex;
			justify-content: center;
			align-items: center;
			min-height: 100vh;
		}
		.content {
			text-align: center;
			font-size: 20px;
			font-weight: bold;'
		
		}
	</style>
</head>
<body>
	<div class="wrapper">
		<pre>
			<div class=" content"> 인사관리 시스템 </div>
			
			<div class=" content1"> 인사정보를 입력하겠습니다. <a href="/input"><input type="button" value="입력"></a>
			</div>
			<div class=" content2"> 인사정보를 조회하겠습니다. <a href="/list"><input type="button" value="조회"></a>
			</div>
		</pre>
	</div>
</body>
</html>