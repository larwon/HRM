<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<jsp:include page="../include/header.jsp" />

<!-- Style -->
<link rel="stylesheet" href="resources/css/insaInputForm.css">

<!-- jQuery -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<!-- jQuery -->
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<!-- daum api -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<!-- script -->
<script type="text/javascript" src="resources/js/insaInputForm.js"></script>
  
<div class="input_name">
	직원 상세 정보
</div>
<div class="top_btn">
	<span id="insaInput_btn">
		<button class="input_btn" id="input_btn">등록</button>
		<input style="cursor:pointer;" class="input_btn" type="reset" id="reset_btn" />
		<a href="index.do"><button class="input_btn">전화면</button></a>
	</span>
	<span id="insaInput_btn2"></span>
</div>
<form id="fileForm" method="post" enctype="multipart/form-data">
<div class="infoTable">
	<table>
	<tbody>
		<tr>
			<td style="vertical-align: middle;" colspan="2" rowspan="6">
				<img style="width: 214px; height: 214px;" src="resources/img/iconmonstr-user-1-240.png" id="profile_image" />
			</td>
			<td class="info-name"><span class="essential">*</span> 사번</td>
			<td>
				<input class="info" type="text" name="sabun" id="sabun" value="${sabun}" readonly >
			</td>
			<td class="info-name"><span class="essential">*</span> 한글성명</td>
			<td><input class="info" type="text" name="name" id="name" ></td>
			<td class="info-name">영문성명</td>
			<td><input class="info" type="text" name="eng_name" id="eng_name" ></td>
		</tr>
		<tr>
			<td class="info-name"><span class="essential">*</span> 아이디</td>
			<td><input class="info" type="text" name="id" id="id" ></td>
			<td class="info-name"><span class="essential">*</span> 패스워드</td>
			<td><input class="info" type="password" name="pwd" id="pwd" ></td>
			<td class="info-name"><span class="essential">*</span> 패스워드 확인</td>
			<td><input class="info" type="password" name="pwd_check" id="pwd_check" ></td>
		</tr>
		<tr>
			<td class="info-name"></td>
			<td><span id="idCheckResult">(소문자로 시작, 소문자나 숫자 사용, 5~20자)</span></td>
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
				<input style="width: 120px;" class="info" id="email2" placeholder="이메일을 선택하세요." disabled="disabled">
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
				<span id="insaInput"><button class="basic-btn" type="button" id="opener2">미리보기</button></span>
				<span id="insaUpdate"><button class="basic-btn" type="button" id="fileDown_btn">다운</button></span>
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
<div id="dialog2" title="Preview">
	<img src="resources/img/noimage.png" id="preview2" />
</div>

<jsp:include page="../include/footer.jsp" />