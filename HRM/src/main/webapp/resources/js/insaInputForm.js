/**
 * 
 */

$(function() {
	let dateFormat = "yy-mm-dd",
	mil_startdate = $("#mil_startdate").datepicker({
		dateFormat : "yy-mm-dd",
		defaultDate : "+1w",
		changeMonth : true,
		changeYear : true,
		showButtonPanel: true,
		numberOfMonths : 1,
		onClose: function () {
	        if ($(window.event.srcElement).hasClass('ui-datepicker-close')) {
	            $(this).val('');
	            mil_enddate.datepicker("option", "minDate", "");
	        }
	    }
	}).on("change", function() {
		mil_enddate.datepicker("option", "minDate", getDate(this));
	}), mil_enddate = $("#mil_enddate").datepicker({
		dateFormat : "yy-mm-dd",
		defaultDate : "+1w",
		changeMonth : true,
		changeYear : true,
		showButtonPanel: true,
		numberOfMonths : 1,
		onClose: function () {
	        if ($(window.event.srcElement).hasClass('ui-datepicker-close')) {
	            $(this).val('');
	            mil_startdate.datepicker("option", "maxDate", "");
	        }
	    }
	}).on("change", function() {
		mil_startdate.datepicker("option", "maxDate", getDate(this));
	});
	
	join_day = $("#join_day").datepicker({
		dateFormat : "yy-mm-dd",
		defaultDate : "+1w",
		changeMonth : true,
		changeYear : true,
		showButtonPanel: true,
		numberOfMonths : 1,
		onClose: function () {
	        if ($(window.event.srcElement).hasClass('ui-datepicker-close')) {
	            $(this).val('');
	            retire_day.datepicker("option", "minDate", "");
	        }
	    }
	}).on("change", function() {
		retire_day.datepicker("option", "minDate", getDate(this));
	}), retire_day = $("#retire_day").datepicker({
		dateFormat : "yy-mm-dd",
		defaultDate : "+1w",
		changeMonth : true,
		changeYear : true,
		showButtonPanel: true,
		numberOfMonths : 1,
		onClose: function () {
	        if ($(window.event.srcElement).hasClass('ui-datepicker-close')) {
	            $(this).val('');
	            join_day.datepicker("option", "maxDate", "");
	        }
	    }
	}).on("change", function() {
		join_day.datepicker("option", "maxDate", getDate(this));
	});

	function getDate(element) {
		var date;
		try {
			date = $.datepicker.parseDate(dateFormat, element.value);
		} catch (error) {
			date = null;
		}

		return date;
	}
	
	$("#dialog").dialog({
		autoOpen : false,
		width : 'auto',
		modal : true,
	});
	$("#dialog2").dialog({
		autoOpen : false,
		width : 'auto',
		modal : true,
	});
});

$(window).ready(function() {
	$('#mask_reg_no').hide();
	$('#insaUpdate').hide();
});

$(document).ready(function() {
	fn_profileImage();
	fn_cmp_Reg_image();
	fn_carrier();
	fn_reset();
	fn_idCheck();
	fn_pwCheck();
	fn_pwCheck2();
	fn_phone_hyphen();
	fn_hp_hyphen();
	fn_reg_no();
	fn_mask_reg_no();
	fn_selectEmail();
	fn_postCode();
	fn_comma();
	fn_mil_yn();
	fn_cmp_reg_no();
	fn_dialog();
	fn_fileDown();
	fn_insaInput();
});

function fn_profileImage() {
	$('#files').on('change', function() {
		setImageFromFile(this, '#profile_image');
	});
}

function setImageFromFile(input, expression) {
    if (input.files && input.files[0]) {
        let reader = new FileReader();
        reader.onload = function (e) {
            $(expression).prop('src', e.target.result);
        }
        reader.readAsDataURL(input.files[0]);
    }
}

function fn_cmp_Reg_image() {
	$('#files2').on('change', function() {
		let cmp_reg_image = $('#files2').val().split("\\");
		let cmp_reg_image_name = cmp_reg_image[cmp_reg_image.length - 1];
		let cmp_reg_image_ext = cmp_reg_image_name.substring((cmp_reg_image_name).lastIndexOf('.') + 1);
		$('#cmp_reg_image').val(cmp_reg_image_name);
		if (cmp_reg_image_ext == 'jpg' || cmp_reg_image_ext == 'png' || cmp_reg_image_ext == 'gif' || cmp_reg_image_ext == 'bmp') {
			setImageFromFile(this, '#preview');
		} else {
			$('#preview').prop('src', 'resources/img/noimage.png');
		}
	});
}

function fn_carrier() {
	$('#files3').on('change', function() {
		let carrier = $('#files3').val().split("\\");
		let carrier_name = carrier[carrier.length - 1];
		let carrier_ext = carrier_name.substring((carrier_name).lastIndexOf('.') + 1);
		$('#carrier').val(carrier_name);
		if (carrier_ext == 'jpg' || carrier_ext == 'png' || carrier_ext == 'gif' || carrier_ext == 'bmp') {
			setImageFromFile(this, '#preview2');
		} else {
			$('#preview2').prop('src', 'resources/img/noimage.png');
		}
	});
}

function fn_reset() {
	$('#reset_btn').on('click', function() {
		$('#profile_image').prop('src', 'resources/img/iconmonstr-user-1-240.png');
		$('#files').val('');
		$('#files2').val('');
		$('#files3').val('');
		$('#name').val('');
		$('#eng_name').val('');
		$('#id').val('');
		$('#pwd').val('');
		$('#pwd_check').val('');
		$('#phone').val('');
		$('#hp').val('');
		$('#reg_no').val('');
		$('#years').val('');
		$('#email1').val('');
		$('#email2').val('');
		$('#join_gbn_code').val('');
		$('#sex').val('');
		$('#zip').val('');
		$('#addr1').val('');
		$('#addr2').val('');
		$('#pos_gbn_code').val('');
		$('#dept_code').val('');
		$('#salary').val('');
		$('#join_type').val('');
		$('#gart_level').val('');
		$('#put_yn').val('');
		$('#mil_yn').val('');
		$('#mil_type').val('');
		$('#mil_level').val('');
		$('#mil_startdate').val('');
		$('#mil_enddate').val('');
		$('#kosa_reg_yn').val('');
		$('#kosa_class_code').val('');
		$('#join_day').val('');
		$('#retire_day').val('');
		$('#cmp_reg_no').val('');
		$('#crm_name').val('');
		$('#cmp_reg_image').val('');
		$('#self_intro').val('');
		$('#carrier').val('');
	});
}

function fn_idCheck() {
	$('#id').keyup(function() {
		// 아이디: 5~20자 사이의 소문자나 숫자를 사용하고, 반드시 첫 글자는 소문자이다.
		let regId = /^[a-z][0-9a-z]{4,19}$/;
		let id = $('#id').val();
		let sendById = {
			"id" : id
		};
		if (regId.test($('#id').val())) { // 정규식 패턴을 만족한다.
			$.ajax({
				url : 'idCheck.do',
				type : 'post',
				data : JSON.stringify(sendById),
				contentType : 'application/json; charset=UTF-8',
				dataType : 'json',
				success : function(responseObj) {
					if (responseObj.idResult == 1) {
						$('#idCheckResult').text('사용할 수 있는 아이디입니다.').css('color', 'blue');
					} else {
						$('#idCheckResult').text('이미 가입된 아이디입니다.').css('color', 'red');
					}
				},
				error : function() {
					alert('AJAX FAIL');
				}
			});
		} else { // 정규식 패턴을 만족하지 않으면
			$('#idCheckResult').text('소문자로 시작, 소문자나 숫자 사용, 5~20자').css('color', 'red');
		}
	});
}

function fn_pwCheck() {
	$('#pwd').keyup(function() {
		// 영문 대소문자/숫자 조합, 8~16자
		let regPw = /^(?=.*[A-Za-z])(?=.*[0-9])[A-Za-z0-9`~!@#$%^&*()-_=+]{8,16}$/;
		if (regPw.test($('#pwd').val())) {
			$('#pwCheckResult').text('사용할 수 있는 비밀번호입니다.').css('color', 'blue');
		} else { // 정규식 패턴을 만족하지 않으면
			$('#pwCheckResult').text('영문 대소문자/숫자 조합, 8~16자').css('color', 'red');
			}
		});
}

function fn_pwCheck2() {
	$('#pwd_check').keyup(function() {
		let regPw = /^(?=.*[a-z])(?=.*[0-9])[A-Za-z0-9`~!@#$%^&*()-_=+]{8,16}$/;
		let pwd = $('#pwd').val();
		let pwd_check = $('#pwd_check').val();
		if (regPw.test($('#pwd').val()) && pwd == pwd_check) {
			$('#pwCheckResult2').text('비밀번호가 일치합니다.').css('color', 'blue');
		} else if (regPw.test($('#pwd').val())	&& pwd != pwd_check) {
			$('#pwCheckResult2').text('비밀번호가 일치하지 않습니다.').css('color', 'red');
		} else {
			$('#pwCheckResult2').text('');
		}
	});
}

function fn_phone_hyphen() {
	$('#phone').keyup(function() {
		$('#phone').val($('#phone').val().replace(/[^0-9]/g, "").replace(/(^02|^0505|^1[0-9]{3}|^0[0-9]{2})([0-9]+)?([0-9]{4})$/,"$1-$2-$3").replace("--", "-")); 
	});
}

function fn_hp_hyphen() {
	$('#hp').keyup(function() {
		$('#hp').val($('#hp').val().replace(/[^0-9]/g, "").replace(/^(01[016789]{1}|02|0[3-9]{1}[0-9]{1})-?([0-9]{3,4})-?([0-9]{4})$/, "$1-$2-$3").replace("--", "-")); 
	});
}

// 주민번호 정규화식 /^(?:[0-9]{2}(?:0[1-9]|1[0-2])(?:0[1-9]|[1,2][0-9]|3[0,1]))-[1-4][0-9]{6}$/;
function fn_reg_no() {
	$('#mask_reg_no').focus(function() {
		$('#reg_no').show();
		$('#mask_reg_no').hide();
	});
} 

function fn_mask_reg_no() {
	$('#reg_no').blur(function() {
		$('#reg_no').hide();
		$('#mask_reg_no').show();
		
		let reg_no = $('#reg_no').val();
		reg_no = reg_no.replace("-", "");
		if(reg_no.length > 6) {
			reg_no1 = reg_no.substring(0, 6);
			reg_no2 = reg_no.substring(6, 7);
			reg_no3 = reg_no.substring(6, 13);
			mask_reg_no2 = reg_no2;
			$('#reg_no').val(reg_no1 + "-" + reg_no3);
			console.log('주민번호: ' + $('#reg_no').val());
			for(i = 1; i < reg_no.substring(6).length && i < 7; i++) {
				mask_reg_no2 = mask_reg_no2 + "*";
			}
			$('#mask_reg_no').val(reg_no1 + "-" + mask_reg_no2);
			console.log('마스킹주민번호: ' + $('#mask_reg_no').val());
		}
		
		let yy = $('#reg_no').val().substring(0, 2);
		let lastRegno = $('#reg_no').val().substring(7, 8);
		
		// 나이
		let ages;
		let today = new Date();
		let year = today.getFullYear();
		if (lastRegno < 3) {
			ages = year - 1900 - yy + 1;
			console.log('나이: ' + ages);
			console.log('성별: ' + lastRegno);
		} else {
			ages = year - 2000 - yy + 1;
			console.log('나이: ' + ages);
			console.log('성별: ' + lastRegno);
		}
		
		// 성별
		let gender;
		if (lastRegno == 1 || lastRegno == 3) {
			gender = '101';
			console.log('성별: ' + gender);
		} else {
			gender = '102';
			console.log('성별: ' + gender);
		}
		
		if (reg_no.length > 6) {
			$('#years').val(ages);
			$('#sex').val(gender);
			$('#sex').prop('disabled', true);
		}
	});
} 

function fn_selectEmail() {
	$('#selectEmail').change(function() {
        if ($('#selectEmail').val() == 'directly') {
            $('#email2').attr('disabled', false);
            $('#email2').attr('placeholder', '이메일을 입력하세요.')
            $('#email2').val('');
            $('#email2').focus();
        } else {
            $('#email2').val($('#selectEmail').val());
            $('#email2').attr('disabled', true);
        }
    });
}

function fn_postCode() {
	$('#postCode_btn').on('click', function() {
	    new daum.Postcode({
	        oncomplete: function(data) {
	        	// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

				// 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
				// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
				var roadAddr = data.roadAddress; // 도로명 주소 변수
				var extraRoadAddr = ''; // 참고 항목 변수

				// 법정동명이 있을 경우 추가한다. (법정리는 제외)
				// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
				if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
					extraRoadAddr += data.bname;
				}
				// 건물명이 있고, 공동주택일 경우 추가한다.
				if (data.buildingName !== '' && data.apartment === 'Y') {
					extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
				}
				// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
				if (extraRoadAddr !== '') {
					extraRoadAddr = '(' + extraRoadAddr + ')';
				}

				// 우편번호와 주소 정보를 해당 필드에 넣는다.
				document.getElementById('zip').value = data.zonecode;
				document.getElementById('addr1').value = roadAddr;

				// 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
				if (roadAddr !== '') {
					document.getElementById('addr2').value = extraRoadAddr;
				} else {
					document.getElementById('addr2').value = '';
				}
	        }
	    }).open();
	});
}

function fn_comma() {
	$('#salary').keyup(function() {
		$('#salary').val($('#salary').val().replace(/[^\d]+/g, "").replace(/(\d)(?=(?:\d{3})+(?!\d))/g, "$1,"));
		console.log('연봉: ' + $('#salary').val().replace(/,/g, ""));
	});
}

function fn_mil_yn() {
	$('#mil_yn').change(function() {
		let result = $('#mil_yn option:selected').val();
		if (result == '702') {
			$('#armyBox').hide();
			console.log('군필여부: ' + result);
		} else {
			$('#armyBox').show();
			console.log('군필여부: ' + result);
		}
	});
}

function fn_cmp_reg_no() {
	$('#cmp_reg_no').keyup(function() {
		$('#cmp_reg_no').val($('#cmp_reg_no').val().replace(/[^0-9]/g, "").replace(/([0-9]{3})([0-9]{2})([0-9]{5})/, '$1-$2-$3').replace("--", "-")); 
	});
}

function fn_dialog() {
	$("#opener").on("click", function() {
		$("#dialog").dialog("open");
	});
	$("#opener2").on("click", function() {
		$("#dialog2").dialog("open");
	});
}

function fn_fileDown() {
	$('#fileDown_btn').on('click', function() {
		let sabun = $('input:text[id="sabun"]').val();
		$.ajax({
			url : 'insaFileDown/' + sabun,
			type : 'get',
			success : function(responseObj) {
				$.ajax({
					url : 'insaProfile/' + sabun,
					type : 'get',
					dataType : 'json',
					success : function(responseObj) {
						if (responseObj.insaDto.carrier != null) {
							location.href='insaFileDown/' + sabun;
						} else {
							alert('다운로드 가능한 파일이 없습니다.');
						}
					},
					error : function() {
						alert('AJAX FAIL');
					}
				});
			},
			error : function() {
				alert('AJAX FAIL');
			}
		});
	});
}

function fn_insaInput() {
	$('#input_btn').on('click',	function() {
		$('#sex').prop('disabled', false);
		let id = $('#id').val();
		$('#email').val($('#email1').val() + '@' + $('#email2').val());
		let email = $('#email').val();
		let formData = new FormData($('#fileForm')[0]);
		$.ajax({ 
			url : 'insaInput.do',
			type : 'post',
			enctype : 'multipart/form-data', // 필수
			data : formData, // 필수
			dataType : 'json',
			processData : false, // 필수
			contentType : false, // 필수
			cache : false,
			success : function(responseObj) {
				if (responseObj.insaInputResult == 0) {
					alert('한글성명 항목은 필수 입력값입니다.');
					$('#name').focus();
				} else if (responseObj.insaInputResult == -1) {
					alert('아이디 항목은 필수 입력값입니다.');
					$('#id').focus();
				} else if (responseObj.insaInputResult == -2) {
					alert(id + '는 이미 사용중인 아이디입니다.');
					$('#id').focus();
				} else if (responseObj.insaInputResult == -3) {
					alert('아이디는 소문자로 시작, 소문자 또는 숫자 5~20자로 입력해 주세요.');
					$('#id').focus();
				} else if (responseObj.insaInputResult == -4) {
					alert('비밀번호 항목은 필수 입력값입니다.');
					$('#pwd').focus();
				} else if (responseObj.insaInputResult == -5) {
					alert('비밀번호 입력 조건을 다시 한번 확인해주세요.\n\n'
							+ '※ 비밀번호 입력 조건\n'
							+ '- 영문 대소문자/숫자 조합, 8~16자\n'
							+ '- 입력 가능 특수문자\n'
							+ '   ` ~ ! @ # $ % ^ & * ( ) - _ = +');
					$('#pwd').focus();
				} else if (responseObj.insaInputResult == -6) {
					alert('비밀번호가 일치하지 않습니다.');
					$('#pwd_check').focus();
				} else if (responseObj.insaInputResult == -7) {
					alert('입력하신 전화번호는 사용할 수 없습니다.');
					$('#phone').focus();
				} else if (responseObj.insaInputResult == -8) {
					alert('핸드폰 항목은 필수 입력값입니다.');
					$('#hp').focus();
				} else if (responseObj.insaInputResult == -9) {
					alert('입력하신 핸드폰은 사용할 수 없습니다.');
					$('#hp').focus();
				} else if (responseObj.insaInputResult == -10) {
					alert('주민번호가 유효하지 않습니다.');
					$('#reg_no').focus();
				} else if (responseObj.insaInputResult == -11) {
					alert('이메일 항목은 필수 입력값입니다.');
					$('#email').focus();
				} else if (responseObj.insaInputResult == -12) {
					alert(email + '는 이미 사용중인 이메일 입니다.');
					$('#email').focus();
				} else if (responseObj.insaInputResult == -13) {
					alert('입력하신 이메일을 사용할 수 없습니다.');
					$('#email').focus();
				} else if (responseObj.insaInputResult == -14) {
					alert('입사일자 항목은 필수 입력값입니다.');
					$('#join_day').focus();
				} else if (responseObj.insaInputResult == 1) {
					alert($('#id').val() + '님 등록을 완료했습니다.');
					// 비동기로 수정페이지로 설정
					$('#id').prop('readonly', true);
					$('#insaInput_btn').empty();
					$('#insaInput_btn2').append('<button class="input_btn" id="update_btn">수정</button>');
					$('#insaInput_btn2').append('<a href="insaInputForm.do"><button class="input_btn">신규</button></a>');
					$('#insaInput_btn2').append('<a href="index.do"><button class="input_btn">전화면</button></a>');
					$('#insaInput').hide();
					$('#insaUpdate').show();
					
					// 수정
					$('#update_btn').on('click', function() {
						$('#email').val($('#email1').val() + '@' + $('#email2').val());
						let email = $('#email').val();
						let formData = new FormData($('#fileForm')[0]);
						let updateCheck = confirm('회원정보를 수정하시겠습니까?');
						if (updateCheck) {
							$.ajax({
								url : 'insaUpdate.do',
								type : 'post',
								enctype : 'multipart/form-data', // 필수
								data : formData, // 필수
								dataType : 'json',
								processData : false, // 필수
								contentType : false, // 필수
								cache : false,
								success : function(responseObj) {
									if (responseObj.insaUpdateResult == 1) {
										alert('직원정보 수정이 완료되었습니다.');
									} else if (responseObj.insaUpdateResult == 0) {
										alert('입력하신 전화번호는 사용할 수 없습니다.');
										$('#phone').focus();
									} else if (responseObj.insaUpdateResult == -1) {
										alert('핸드폰 항목은 필수 입력값입니다.');
										$('#hp').focus();
									} else if (responseObj.insaUpdateResult == -2) {
										alert('입력하신 핸드폰은 사용할 수 없습니다.');
										$('#hp').focus();
									} else if (responseObj.insaUpdateResult == -3) {
										alert('주민번호가 유효하지 않습니다.');
										$('#reg_no').focus();
									} else if (responseObj.insaUpdateResult == -4) {
										alert('이메일 항목은 필수 입력값입니다.');
										$('#email').focus();
									} else if (responseObj.insaUpdateResult == -5) {
										alert(email + '는 이미 사용중인 이메일 입니다.');
										$('#email').focus();
									} else if (responseObj.insaUpdateResult == -6) {
										alert('입력하신 이메일을 사용할 수 없습니다.');
										$('#email').focus();
									} else if (responseObj.insaUpdateResult == -7) {
										alert('입사일자 항목은 필수 입력값입니다.');
										$('#join_day').focus();
									} else if (responseObj.insaUpdateResult == -8) {
										alert('비밀번호를 입력하세요.');
										$('#pwd').focus();
									} else if (responseObj.insaUpdateResult == -9) {
										alert('비밀번호가 일치하지 않습니다.');
										$('#pwd_check').focus();
									} else if (responseObj.insaUpdateResult == -10) {
										alert('입력하신 패스워드 정보가 올바르지 않습니다.');
										$('#pwd').focus();
									} else if (responseObj.insaUpdateResult == -11) {
										alert('아이디 비밀번호가 일치하지 않습니다.');
										$('#pwd').focus();
									} else {
										alert('result == null');
									}
								},
								error : function() {
									alert('AJAX FAIL');
								}
							});
						}
					});
				} else {
					alert('insaInputResult == null');
				}
			},
			error : function() {
				alert('AJAX FAIL')
			}
		});
	});
}