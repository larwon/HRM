<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<jsp:include page="../include/header.jsp" />

<%
	request.setCharacterEncoding("UTF-8");
	String sabun = request.getParameter("sabun");
	String s_sabun = request.getParameter("s_sabun");
	String s_name = request.getParameter("s_name");
	String s_join_type = request.getParameter("s_join_type");
	String s_put_yn = request.getParameter("s_put_yn");
	String s_pos_gbn_code = request.getParameter("s_pos_gbn_code");
	String s_join_day = request.getParameter("s_join_day");
	String s_retire_day = request.getParameter("s_retire_day");
	String s_join_gbn_code = request.getParameter("s_join_gbn_code");
%>

<!-- Style -->
<link rel="stylesheet" href="resources/css/insaInputForm.css">

<!-- datapicker -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<!-- datapicker -->
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<!-- daum api -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<!-- script -->
<script type="text/javascript" src="resources/js/insaUpdateForm.js"></script>

<input type="hidden" id="sabun" value="<%=sabun%>" />

<div class="input_name">
	직원 상세 정보
</div>
<div class="top_btn">
	<button class="input_btn" id="update_btn">수정</button>
	<button class="input_btn" id="delete_btn">삭제</button>
	<a href="insaListForm.do?
		s_sabun=<%=s_sabun%>
		&s_name=<%=s_name%>
		&s_join_type=<%=s_join_type%>
		&s_put_yn=<%=s_put_yn%>
		&s_pos_gbn_code=<%=s_pos_gbn_code%>
		&s_join_day=<%=s_join_day%>
		&s_retire_day=<%=s_retire_day%>
		&s_join_gbn_code=<%=s_join_gbn_code%>">
		<button class="input_btn" id="back_btn">전화면</button>
	</a>
</div>
<form id="fileForm" method="post" enctype="multipart/form-data">
<div class="infoTable">
	<table>
	<tbody>
		<tr>
			<td style="vertical-align: middle;" colspan="2" rowspan="6">
				<img style="" src="resources/img/iconmonstr-user-1-240.png" width="214" height="214" id="profile_image" />
			</td>
			<td class="info-name"><span class="essential">*</span> 사번</td>
			<td>
				<input class="info" type="text" name="sabun" id="sabun" readonly >
			</td>
			<td class="info-name"><span class="essential">*</span> 한글성명</td>
			<td><input class="info" type="text" name="name" id="name" ></td>
			<td class="info-name">영문성명</td>
			<td><input class="info" type="text" name="eng_name" id="eng_name" ></td>
		</tr>
		<tr>
			<td class="info-name"><span class="essential">*</span> 아이디</td>
			<td><input class="info" type="text" name="id" id="id" readonly ></td>
			<td class="info-name"><span class="essential">*</span> 패스워드</td>
			<td><input class="info" type="password" name="pwd" id="pwd" ></td>
			<td class="info-name"><span class="essential">*</span> 패스워드 확인</td>
			<td><input class="info" type="password" name="pwd_check" id="pwd_check" ></td>
		</tr>
		<tr>
			<td class="info-name"></td>
			<td></td>
			<td class="info-name"></td>
			<td><span id="pwCheckResult">(영문 대소문자/숫자 조합, 8~16자)</span></td>
			<td class="info-name"></td>
			<td><span id="pwCheckResult2"></span></td>
		</tr>
		<tr>
			<td class="info-name">전화번호</td>
			<td><input class="info" type="text" name="phone" id="phone" ></td>
			<td class="info-name"><span class="essential">*</span> 핸드폰번호</td>
			<td><input class="info" type="text" name="hp" id="hp" ></td>
			<td class="info-name">주민번호</td>
			<td>
				<input class="info" type="text" name="reg_no" id="reg_no">
				<input class="info" type="text" name="mask_reg_no" id="mask_reg_no">
			</td>
		</tr>
		<tr>
			<td class="info-name">연령</td>
			<td><input class="info" type="text" name="years" id="years" ></td>
			<td colspan="2">
				<span class="essential">*</span> 이메일
				<input style="width: 120px;" class="info" type="text" id="email1" >
				@
				<input style="width: 120px;" class="info" type="text" id="email2" placeholder="이메일을 선택하세요." disabled="disabled">
				<select style="width: 120px;" class="info" id="selectEmail" >
					<option value="" disabled selected>E-Mail 선택</option>
					<option value="naver.com">naver.com</option>
					<option value="gmail.com">gmail.com</option>
					<option value="daum.net">daum.net</option>
					<option value="kakao.com">kakao.com</option>
					<option value="nate.com">nate.com</option>
					<option value="yahoo.com">yahoo.com</option>
					<option value="directly" id="email2">직접 입력하기</option>
				</select>
				<input type="hidden" name="email" id="email" />
			</td>
			<td colspan="2">
				직종체크
				<select style="width: 150px;" class="info" name="join_gbn_code" id="join_gbn_code">
					<option value="" selected></option>
					<c:if test="${!empty jobList}">
						<c:forEach var="insaComDto" items="${jobList}">
         					<option value="${insaComDto.code}">${insaComDto.name}</option>
         				</c:forEach>
					</c:if>
				</select>
				성별
				<select style="width: 150px;" class="info" name="sex" id="sex">
					<option value="" selected></option>
					<c:if test="${!empty gender}">
						<c:forEach var="insaComDto" items="${gender}">
         					<option value="${insaComDto.code}">${insaComDto.name}</option>
         				</c:forEach>
					</c:if>
				</select>
			</td>
		</tr>
		<tr>
			<td class="info-name">주소</td>
			<td style="text-align: left;">
				<input style="width: 150px;" class="info" type="text" name="zip" id="zip" placeholder="우편번호" readonly >
				<button style="width: 70px;" class="basic-btn" type="button" id="postCode_btn">주소검색</button>
			</td>
			<td colspan="2">
				<input style="width: 450px;" class="info" type="text" name="addr1" id="addr1" placeholder="주소" readonly >
			</td>
			<td colspan="2">
				<input style="width: 450px;" class="info" type="text" name="addr2" id="addr2" placeholder="세부주소" >
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<label style="vertical-align: -webkit-baseline-middle;" class="profile-img-btn" for="files">
					<img style="margin-right: 10px;" src="resources/svg/iconmonstr-photo-camera-4.svg" >사진올리기
				</label>
				<input style="display: none;" type="file" name="files" id="files" multiple />
			</td>
			<td class="info-name">직위</td>
			<td>
				<select class="info" name="pos_gbn_code" id="pos_gbn_code">
					<option value="" selected></option>
					<c:if test="${!empty position}">
						<c:forEach var="insaComDto" items="${position}">
         					<option value="${insaComDto.code}">${insaComDto.name}</option>
         				</c:forEach>
					</c:if>
				</select>
			</td>
			<td class="info-name">부서</td>
			<td>
				<select class="info" name="dept_code" id="dept_code">
					<option value="" selected></option>
					<c:if test="${!empty dept}">
						<c:forEach var="insaComDto" items="${dept}">
         					<option value="${insaComDto.code}">${insaComDto.name}</option>
         				</c:forEach>
					</c:if>
				</select>
			</td>
			<td class="info-name">연봉(만원)</td>
			<td><input style = "text-align:right;" class="info" type="text" placeholder="(만원)" name="salary" id="salary" ></td>
		</tr>
		<tr>
			<td class="info-name">입사구분</td>
			<td>
				<select class="info" name="join_type" id="join_type">
					<option value="" selected></option>
					<c:if test="${!empty joinGu}">
						<c:forEach var="insaComDto" items="${joinGu}">
         					<option value="${insaComDto.code}">${insaComDto.name}</option>
         				</c:forEach>
					</c:if>
				</select>
			</td>
			<td class="info-name">등급</td>
			<td>
				<select class="info" name="gart_level" id="gart_level">
					<option value="" selected></option>
					<c:if test="${!empty rank}">
						<c:forEach var="insaComDto" items="${rank}">
         					<option value="${insaComDto.code}">${insaComDto.name}</option>
         				</c:forEach>
					</c:if>
				</select>
			</td>
			<td class="info-name">투입여부</td>
			<td>
				<select class="info" name="put_yn" id="put_yn">
					<option value="" selected></option>
					<c:if test="${!empty inputCheck}">
						<c:forEach var="insaComDto" items="${inputCheck}">
         					<option value="${insaComDto.code}">${insaComDto.name}</option>
         				</c:forEach>
					</c:if>
				</select>
			</td>
			<td class="info-name">군필여부</td>
			<td>
				<select class="info" name="mil_yn" id="mil_yn">
					<option value="" selected></option>
					<c:if test="${!empty armyCheck}">
						<c:forEach var="insaComDto" items="${armyCheck}">
         					<option value="${insaComDto.code}">${insaComDto.name}</option>
         				</c:forEach>
					</c:if>
				</select>
			</td>
		</tr>
		<tr id="armyBox">
			<td class="info-name">군별</td>
			<td>
				<select class="info" name="mil_type" id="mil_type">
					<option value="" selected></option>
					<c:if test="${!empty armyType}">
						<c:forEach var="insaComDto" items="${armyType}">
         					<option value="${insaComDto.code}">${insaComDto.name}</option>
         				</c:forEach>
					</c:if>
				</select>
			</td>
			<td class="info-name">계급</td>
			<td>
				<select class="info" name="mil_level" id="mil_level" >
					<option value="" selected></option>
					<c:if test="${!empty classes}">
						<c:forEach var="insaComDto" items="${classes}">
         					<option value="${insaComDto.code}">${insaComDto.name}</option>
         				</c:forEach>
					</c:if>
				</select>
			</td>
			<td class="info-name" style="width: 100px;">입영일자</td>
			<td>
				<input class="info-date" type="text" name="mil_startdate" id="mil_startdate" readonly>
				<label for="mil_startdate">
					<img class="img-date" src="resources/svg/iconmonstr-calendar-4.svg" title="date">
				</label>
			</td>
			<td class="info-name">전역일자</td>
			<td>
				<input class="info-date" type="text" name="mil_enddate" id="mil_enddate" readonly>
				<label for="mil_enddate">
					<img class="img-date" src="resources/svg/iconmonstr-calendar-4.svg" title="date">
				</label>
			</td>
		</tr>
		<tr>
			<td class="info-name">KOSA등록</td>
			<td>
				<select class="info" name="kosa_reg_yn" id="kosa_reg_yn" >
					<option value="" selected></option>
					<c:if test="${!empty kosa}">
						<c:forEach var="insaComDto" items="${kosa}">
         					<option value="${insaComDto.code}">${insaComDto.name}</option>
         				</c:forEach>
					</c:if>
				</select>
			</td>
			<td class="info-name">KOSA등급</td>
			<td>
				<select class="info" name="kosa_class_code" id="kosa_class_code" >
					<option value="" selected></option>
					<c:if test="${!empty kosaRank}">
						<c:forEach var="insaComDto" items="${kosaRank}">
         					<option value="${insaComDto.code}">${insaComDto.name}</option>
         				</c:forEach>
					</c:if>
				</select>
			</td>
			<td class="info-name"><span class="essential">*</span> 입사일자</td>
			<td>
				<input class="info-date" type="text" name="join_day" id="join_day" readonly>
				<label for="join_day">
					<img class="img-date" src="resources/svg/iconmonstr-calendar-4.svg" title="date">
				</label>
			</td>
			<td class="info-name">퇴사일자</td>
			<td>
				<input class="info-date" type="text" name="retire_day" id="retire_day" readonly>
				<label for="retire_day">
					<img class="img-date" src="resources/svg/iconmonstr-calendar-4.svg" title="date">
				</label>
			</td>
		</tr>
		<tr>
			<td class="info-name">사업자번호</td>
			<td><input class="info" type="text" name="cmp_reg_no" id="cmp_reg_no" ></td>
			<td class="info-name">업체명</td>
			<td><input class="info" type="text" name="crm_name" id="crm_name" ></td>
			<td class="info-name">사업자등록증</td>
			<td><input class="info" type="text" name="cmp_reg_image" id="cmp_reg_image" readonly ></td>
			<td colspan="2">
				<button class="basic-btn" type="button" id="opener">미리보기</button>
				<label style="position: absolute; margin-left: 5px; width: 150px;" class="profile-img-btn" for="files2">
					등록
				</label>
				<input style="display: none;" type="file" name="files" id="files2" multiple />
			</td>
		</tr>
		<tr>
			<td style="vertical-align: middle;" class="info-name">자기소개</td>
			<td colspan="3"><textarea style="border: 1px solid lightgrey;" rows="2" cols="104" placeholder="100자 내외로 적으시오" name="self_intro" id="self_intro" ></textarea></td>
			<td style="vertical-align: middle;" class="info-name">이력서</td>
			<td style="vertical-align: middle;" ><input class="info" type="text" name="carrier" id="carrier" readonly ></td>
			<td style="vertical-align: middle; text-align: center;" colspan="2">
				<button class="basic-btn" type="button" id="fileDown_btn">다운</button>
				<label style="position: absolute; margin-left: 5px; width: 150px;" class="profile-img-btn" for="files3">
					파일 업로드
				</label>
				<input style="display: none;" type="file" name="files" id="files3" multiple />
			</td>
		</tr>
	</tbody>
	</table>
</div>
</form>

<div id="dialog" title="Preview">
	<img src="resources/img/noimage.png" id="preview" />
</div>

<div style="margin-top: 20px" id="tabs">
	<ul>
		<li><a href="#tabs-1">투입기능정보</a></li>
		<li><a href="#tabs-2">학력사항</a></li>
		<li><a href="#tabs-3">경력사항</a></li>
	</ul>
	<div id="tabs-1">
		<p>Proin elit arcu, rutrum commodo, vehicula tempus, commodo a,
			risus. Curabitur nec arcu. Donec sollicitudin mi sit amet mauris. Nam
			elementum quam ullamcorper ante. Etiam aliquet massa et lorem. Mauris
			dapibus lacus auctor risus. Aenean tempor ullamcorper leo. Vivamus
			sed magna quis ligula eleifend adipiscing. Duis orci. Aliquam sodales
			tortor vitae ipsum. Aliquam nulla. Duis aliquam molestie erat. Ut et
			mauris vel pede varius sollicitudin. Sed ut dolor nec orci tincidunt
			interdum. Phasellus ipsum. Nunc tristique tempus lectus.</p>
	</div>
	<div id="tabs-2">
		<p>Morbi tincidunt, dui sit amet facilisis feugiat, odio metus
			gravida ante, ut pharetra massa metus id nunc. Duis scelerisque
			molestie turpis. Sed fringilla, massa eget luctus malesuada, metus
			eros molestie lectus, ut tempus eros massa ut dolor. Aenean aliquet
			fringilla sem. Suspendisse sed ligula in ligula suscipit aliquam.
			Praesent in eros vestibulum mi adipiscing adipiscing. Morbi
			facilisis. Curabitur ornare consequat nunc. Aenean vel metus. Ut
			posuere viverra nulla. Aliquam erat volutpat. Pellentesque convallis.
			Maecenas feugiat, tellus pellentesque pretium posuere, felis lorem
			euismod felis, eu ornare leo nisi vel felis. Mauris consectetur
			tortor et purus.</p>
	</div>
	<div id="tabs-3">
		<p>Mauris eleifend est et turpis. Duis id erat. Suspendisse
			potenti. Aliquam vulputate, pede vel vehicula accumsan, mi neque
			rutrum erat, eu congue orci lorem eget lorem. Vestibulum non ante.
			Class aptent taciti sociosqu ad litora torquent per conubia nostra,
			per inceptos himenaeos. Fusce sodales. Quisque eu urna vel enim
			commodo pellentesque. Praesent eu risus hendrerit ligula tempus
			pretium. Curabitur lorem enim, pretium nec, feugiat nec, luctus a,
			lacus.</p>
		<p>Duis cursus. Maecenas ligula eros, blandit nec, pharetra at,
			semper at, magna. Nullam ac lacus. Nulla facilisi. Praesent viverra
			justo vitae neque. Praesent blandit adipiscing velit. Suspendisse
			potenti. Donec mattis, pede vel pharetra blandit, magna ligula
			faucibus eros, id euismod lacus dolor eget odio. Nam scelerisque.
			Donec non libero sed nulla mattis commodo. Ut sagittis. Donec nisi
			lectus, feugiat porttitor, tempor ac, tempor vitae, pede. Aenean
			vehicula velit eu tellus interdum rutrum. Maecenas commodo.
			Pellentesque nec elit. Fusce in lacus. Vivamus a libero vitae lectus
			hendrerit hendrerit.</p>
	</div>
</div>

<jsp:include page="../include/footer.jsp" />