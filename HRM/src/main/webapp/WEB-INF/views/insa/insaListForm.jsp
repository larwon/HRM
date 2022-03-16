<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<jsp:include page="../include/header.jsp" />

<!-- Style -->
<link rel="stylesheet" href="resources/css/insaListForm.css">

<!-- datapicker -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<!-- datapicker -->
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<%
	request.setCharacterEncoding("UTF-8");
	String sabun = request.getParameter("s_sabun");
	if (sabun == null) {
		sabun = "";
	}
	String name = request.getParameter("s_name");
	if (name == null) {
		name = "";
	}
	String join_type = request.getParameter("s_join_type");
	String put_yn = request.getParameter("s_put_yn");
	String pos_gbn_code = request.getParameter("s_pos_gbn_code");
	String join_day = request.getParameter("s_join_day");
	if (join_day == null) {
		join_day = "";
	}
	String retire_day = request.getParameter("s_retire_day");
	if (retire_day == null) {
		retire_day = "";
	}
	String join_gbn_code = request.getParameter("s_join_gbn_code");
%>

<script type="text/javascript">
	$(function() {
		if (window.location.href != 'http://localhost:9090/hrmapp/insaListForm.do') {
			$('select[id="join_type"]').val(<%=join_type%>);
			$('select[id="put_yn"]').val(<%=put_yn%>);
			$('select[id="pos_gbn_code"]').val(<%=pos_gbn_code%>);
			$('select[id="join_gbn_code"]').val(<%=join_gbn_code%>);
		}
	});
</script>

<!-- script -->
<script type="text/javascript" src="resources/js/insaListForm.js"></script>

<div class="input_name">
	직원 리스트
</div>
<div class="top_btn">
	<button class="input_btn" id="search_btn">검색</button>
	<input style="cursor:pointer;" class="input_btn" type="reset" id="reset_btn" />
	<a href="index.do"><button class="input_btn" >이전</button></a>
</div>
<div class="infoTable">
	<table>
	<tbody>
		<tr>
			<td class="info-name">사번</td>
			<td><input class="info" type="text" id="sabun" value="<%=sabun%>" ></td>
			<td class="info-name">성명</td>
			<td><input class="info" type="text" id="name" value="<%=name%>" ></td>
			<td class="info-name">입사구분</td>
			<td>
				<select class="info" id="join_type">
					<option value="" selected></option>
					<c:if test="${!empty joinGu}">
						<c:forEach var="insaComDto" items="${joinGu}">
         					<option value="${insaComDto.code}">${insaComDto.name}</option>
         				</c:forEach>
					</c:if>
				</select>
			</td>
			<td class="info-name">투입여부</td>
			<td>
				<select class="info" id="put_yn">
					<option value="" selected></option>
					<c:if test="${!empty inputCheck}">
						<c:forEach var="insaComDto" items="${inputCheck}">
         					<option value="${insaComDto.code}">${insaComDto.name}</option>
         				</c:forEach>
					</c:if>
				</select>
			</td>
		</tr>		
		<tr>
			<td class="info-name">직위</td>
			<td>
				<select class="info" id="pos_gbn_code">
					<option value="" selected></option>
					<c:if test="${!empty position}">
						<c:forEach var="insaComDto" items="${position}">
         					<option value="${insaComDto.code}">${insaComDto.name}</option>
         				</c:forEach>
					</c:if>
				</select>
			</td>
			<td class="info-name">입사일자</td>
			<td>
				<input class="info-date" type="text" id="join_day" value="<%=join_day%>" readonly>
				<label for="join_day">
					<img class="img-date" src="resources/svg/iconmonstr-calendar-4.svg" title="date">
				</label>
			</td>
			<td class="info-name">퇴사일자</td>
			<td>
				<input class="info-date" type="text" id="retire_day" value="<%=retire_day%>" readonly>
				<label for="retire_day">
					<img class="img-date" src="resources/svg/iconmonstr-calendar-4.svg" title="date">
				</label>
			</td>
			<td class="info-name">직종분류</td>
			<td>
				<select class="info" id="join_gbn_code">
					<option value="" selected></option>
					<c:if test="${!empty jobList}">
						<c:forEach var="insaComDto" items="${jobList}">
         					<option value="${insaComDto.code}">${insaComDto.name}</option>
         				</c:forEach>
					</c:if>
				</select>
			</td>
		</tr>		
	</tbody>
	</table>
</div>
<div class="search_list">
	<table>
		<thead>
			<tr>
				<th>사번</th>
				<th>성명</th>
				<th>주민번호</th>
				<th>핸드폰번호</th>
				<th>직위</th>
				<th>입사일자</th>
				<th>퇴사일자</th>
				<th>투입여부</th>
				<th>연봉</th>
			</tr>
		</thead>
		<tbody id="insaList">
			<tr>
				<td style="text-align: center;" colspan="9">검색된 데이터가 없습니다.</td>
			</tr>
		</tbody>
	</table>
</div>
<div class="right">
	<div id="paging"></div>
</div>

<jsp:include page="../include/footer.jsp" />