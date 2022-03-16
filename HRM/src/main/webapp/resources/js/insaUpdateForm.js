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
	
	let tabs = $("#tabs").tabs();
	tabs.find(".ui-tabs-nav").sortable({
		axis : "x",
		stop : function() {
			tabs.tabs("refresh");
		}
	});
});

$(window).ready(function() {
	fn_onload_insaProfile();
	$('#reg_no').hide();
});

$(document).ready(function() {
	fn_profileImage();
	fn_cmp_Reg_image();
	fn_carrier();
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
	fn_insaUpdate();
	fn_insaDelete();
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
		$('#carrier').val(carrier_name);
	});
}

function fn_onload_insaProfile() {
	let sabun = $('input:hidden[id="sabun"]').val();
	$.ajax({
		url : 'insaProfile/' + sabun,
		type : 'get',
		dataType : 'json', 
		success : function(responseObj) {
			if (responseObj.result == true) {
				email = (responseObj.insaDto.email).split('@');
				salary = (responseObj.insaDto.salary).toString().replace(/[^\d]+/g, "").replace(/(\d)(?=(?:\d{3})+(?!\d))/g, "$1,");
				if (responseObj.insaDto.profile_image != null) {
					$('#profile_image').prop('src', 'resources/storage/' + responseObj.insaDto.profile_image);
				}
				$('input:text[id="sabun"]').val(responseObj.insaDto.sabun);
				$('input:text[id="name"]').val(responseObj.insaDto.name);
				$('input:text[id="eng_name"]').val(responseObj.insaDto.eng_name);
				$('input:text[id="id"]').val(responseObj.insaDto.id);
				$('input:text[id="phone"]').val(responseObj.insaDto.phone);
				$('input:text[id="hp"]').val(responseObj.insaDto.hp);
				$('input:text[id="reg_no"]').val(responseObj.insaDto.reg_no);
				$('input:text[id="years"]').val(responseObj.insaDto.years != 0 ? responseObj.insaDto.years : null);
				$('input:text[id="email1"]').val(email[0]);
				$('input:text[id="email2"]').val(email[1]);
				$('select[id="join_gbn_code"]').val(responseObj.insaDto.join_gbn_code);
				$('select[id="sex"]').val(responseObj.insaDto.sex);
				$('input:text[id="zip"]').val(responseObj.insaDto.zip != 0 ? responseObj.insaDto.zip : null);
				$('input:text[id="addr1"]').val(responseObj.insaDto.addr1);
				$('input:text[id="addr2"]').val(responseObj.insaDto.addr2);
				$('select[id="pos_gbn_code"]').val(responseObj.insaDto.pos_gbn_code);
				$('select[id="dept_code"]').val(responseObj.insaDto.dept_code);
				$('input:text[id="salary"]').val(salary != 0 ? salary : null);
				$('select[id="join_type"]').val(responseObj.insaDto.join_type);
				$('select[id="gart_level"]').val(responseObj.insaDto.gart_level);
				$('select[id="put_yn"]').val(responseObj.insaDto.put_yn);
				$('select[id="mil_yn"]').val(responseObj.insaDto.mil_yn);
				if ($('#mil_yn option:selected').val() == '702') {
					$('#armyBox').hide();
				}
				$('select[id="mil_type"]').val(responseObj.insaDto.mil_type);
				$('select[id="mil_level"]').val(responseObj.insaDto.mil_level);
				$('input:text[id="mil_startdate"]').val(responseObj.insaDto.mil_startdate);
				$('input:text[id="mil_enddate"]').val(responseObj.insaDto.mil_enddate);
				$('select[id="kosa_reg_yn"]').val(responseObj.insaDto.kosa_reg_yn);
				$('select[id="kosa_class_code"]').val(responseObj.insaDto.kosa_class_code);
				$('input:text[id="join_day"]').val(responseObj.insaDto.join_day);																															
				$('input:text[id="retire_day"]').val(responseObj.insaDto.retire_day);
				$('input:text[id="cmp_reg_no"]').val(responseObj.insaDto.cmp_reg_no);
				$('input:text[id="crm_name"]').val(responseObj.insaDto.crm_name);
				if (responseObj.insaDto.cmp_reg_image == null) {
					$('input:text[id="cmp_reg_image"]').val(responseObj.insaDto.cmp_reg_image);
				} else {
					let cmp_reg_image1 = (responseObj.insaDto.cmp_reg_image).substring(0, (responseObj.insaDto.cmp_reg_image).lastIndexOf('_'));
					let cmp_reg_image2 = (responseObj.insaDto.cmp_reg_image).substring((responseObj.insaDto.cmp_reg_image).lastIndexOf('.'));
					$('input:text[id="cmp_reg_image"]').val(cmp_reg_image1 + cmp_reg_image2);
					$('#preview').prop('src', 'resources/storage/' + responseObj.insaDto.cmp_reg_image);
				}
				$('textarea[name="self_intro"]').val(responseObj.insaDto.self_intro);
				if (responseObj.insaDto.carrier == null) {
					$('input:text[id="carrier"]').val(responseObj.insaDto.carrier);
				} else {
					let carrier1 = (responseObj.insaDto.carrier).substring(0, (responseObj.insaDto.carrier).lastIndexOf('_'));
					let carrier2 = (responseObj.insaDto.carrier).substring((responseObj.insaDto.carrier).lastIndexOf('.'));
					$('input:text[id="carrier"]').val(carrier1 + carrier2);
				}
				let reg_no = $('#reg_no').val();
				reg_no = reg_no.replace("-", "");
				if(reg_no.length > 6) {
					reg_no1 = reg_no.substring(0, 6);
					reg_no2 = reg_no.substring(6, 7);
					reg_no3 = reg_no.substring(6, 13);
					mask_reg_no2 = reg_no2;
					$('#reg_no').val(reg_no1 + "-" + reg_no3);
					for(i = 1; i < reg_no.substring(6).length && i < 7; i++) {
						mask_reg_no2 = mask_reg_no2 + "*";
					}
					$('#mask_reg_no').val(reg_no1 + "-" + mask_reg_no2);
				}
				// $('input:file[id="files"]').val(responseObj.insaDto.profile_image);
			}
		},
		error : function() {
			alert('AJAX FAIL');
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

//주민번호 정규화식 /^(?:[0-9]{2}(?:0[1-9]|1[0-2])(?:0[1-9]|[1,2][0-9]|3[0,1]))-[1-4][0-9]{6}$/;
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
}

function fn_fileDown() {
	$('#fileDown_btn').on('click', function() {
		let sabun = $('input:hidden[id="sabun"]').val();
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

function fn_insaUpdate() {
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
}

function fn_insaDelete() {
	$('#delete_btn').on('click', function() {
		$('#id').prop('readonly', false);
		let sabun = $('#sabun').val();
		let pwd = $('#pwd').val();
		console.log(id);
		let pwd_check = $('#pwd_check').val();
		let sendByDelete = {
			"sabun" : sabun,
			"pwd" : pwd,
			"pwd_check" : pwd_check
		};
		var deleteCheck = confirm('회원정보를 삭제하시겠습니까?');
		if (deleteCheck) {
			$.ajax({
				url: 'insa/' + sabun,
				type: 'delete',
				data: JSON.stringify(sendByDelete),  // JSON -> String 형변환 후 컨트롤러로 보내는 String 타입의 JSON 데이터
				contentType: 'application/json',
				dataType: 'json',
				success: function(responseObj) {  // 성공하면 받아오는 데이터
					if (responseObj.deleteResult == 1) {
						alert('삭제처리되었습니다.');
						$(document).ready(function(){
							$("#back_btn").trigger('click');
						});
					} else if (responseObj.deleteResult == 0) {
						alert('비밀번호를 입력하세요.');
						$('#pwd').focus();
					} else if (responseObj.deleteResult == -1) {
						alert('비밀번호가 일치하지 않습니다.');
						$('#pwd_check').focus();
					} else if (responseObj.deleteResult == -2) {
						alert('입력하신 패스워드 정보가 올바르지 않습니다.');
						$('#pwd').focus();
					} else if (responseObj.deleteResult == -3) {
						alert('아이디 비밀번호가 일치하지 않습니다.');
						$('#pwd').focus();
					} else {
						alert('탈퇴처리가 실패했습니다.');
					}
				},
				error: function() {
					alert('AJAX FAIL');
				}
			});
		}
	});
}