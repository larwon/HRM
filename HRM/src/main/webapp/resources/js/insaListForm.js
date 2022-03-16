/**
 * 
 */

$(function() {
	let dateFormat = "yy-mm-dd",
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
});

$(window).ready(function() {
	if (window.location.href != 'http://localhost:9090/hrmapp/insaListForm.do') {
		fn_insaSearch();
	}
});

$(document).ready(function() {
	$('#search_btn').click(fn_insaSearch);
	fn_reset();
});

let page = 1;

function fn_insaSearch() {
	let sabun = $('#sabun').val();
	let name = $('#name').val();
	let join_type = $('#join_type').val();
	let put_yn = $('#put_yn').val();
	let pos_gbn_code = $('#pos_gbn_code').val();
	let join_day = $('#join_day').val();
	let retire_day = $('#retire_day').val();
	let join_gbn_code = $('#join_gbn_code').val();
	let sendBySearch = {
		"sabun" : sabun,
		"name" : name,
		"join_type" : join_type,
		"put_yn" : put_yn,
		"pos_gbn_code" : pos_gbn_code,
		"join_day" : join_day,
		"retire_day" : retire_day,
		"join_gbn_code" : join_gbn_code,
		"page" : page
	}
	$.ajax({
		url : 'insaList.do',
		type : 'post',
		data : JSON.stringify(sendBySearch),
		contentType : 'application/json',
		dataType : 'json',
		success : function(responseObj) {
			if (responseObj.listResult == true) {
				fn_searchList(responseObj.list);
			} else {
				$('#insaList').empty();
				$('<tr>')
				.append($('<td style="text-align: center;" colspan="9">').html('검색된 데이터가 없습니다.'))
				.appendTo('#insaList');
			}
			
			let paging = responseObj.paging;

			$('#paging').empty();
			if (paging.beginPage <= paging.pagePerBlock) {
				// class 의미
				// disable : css (클릭 안 되는 건 실버색) 적용하려고
				$('#paging').append('<div class="disable"><a>◀</a></div>');
			} else {
				// class 의미
				// 1) prev-block : 이전(◀)으로 이동하려고
				// 2) go-page : css (cursor: pointer) 적용하려고
				$('#paging').append('<div class="prev-block go-page" data-page="' + (paging.beginPage - 1) + '"><a>◀</a></div>');
			}
			// 1 2 3 4 5
			for (let p = paging.beginPage; p <= paging.endPage; p++) {
				if (paging.page == p) { // 현재페이지는 링크가 안 됩니다.
					// class 의미
					// now-page : css (현재 페이지는 녹색) 적용하려고
					$('#paging').append('<div class="now-page"><a>' + p + '</a></div>')
				} else {
					// class 의미
					// go-page : css (cursor: pointer) 적용하려고
					$('#paging').append('<div class="go-page" data-page="' + p + '"><a>' + p + '</a></div>');
				}
			}

			// ▶
			if (paging.endPage >= paging.totalPage) {
				// class 의미
				// disable : css (클릭 안 되는 건 실버색) 적용하려고
				$('#paging').append('<div class="disable"><a>▶</a></div>');
			} else {
				// class 의미
				// 1) next-block : 다음(▶)으로 이동하려고
				// 2) go-page : css (cursor: pointer) 적용하려고
				$('#paging').append('<div class="next-block go-page" data-page="' + (paging.endPage + 1) + '"><a>▶</a></div>');
			}
		},
		error : function() {
			alert('AJAX FAIL');
		}
	});
	
	//링크가 걸릴 때 이동할 페이지 번호를 알아내서 다시 목록을 뿌리는 함수들
	$('body').on('click', '.prev-block', function() {
		page = $(this).attr('data-page');
		fn_insaSearch();
	});
	$('body').on('click', '.go-page', function() {
		page = $(this).attr('data-page');
		fn_insaSearch();
	});
	$('body').on('click', '.next-block', function() {
		page = $(this).attr('data-page');
		fn_insaSearch();
	});
}

function fn_searchList(list) {
	let sabun = $('#sabun').val();
	let name = $('#name').val();
	let join_type = $('#join_type').val();
	let put_yn = $('#put_yn').val();
	let pos_gbn_code = $('#pos_gbn_code').val();
	let join_day = $('#join_day').val();
	let retire_day = $('#retire_day').val();
	let join_gbn_code = $('#join_gbn_code').val();
	$('#insaList').empty();
	$.each(list, function(idx, insa) {
		$('<tr style="cursor:pointer;" onclick="location.href='
				+ "'insaUpdateForm.do?sabun=" + insa.sabun
				+ '&s_sabun=' + sabun
				+ '&s_name=' + name
				+ '&s_join_type=' + join_type
				+ '&s_put_yn=' + put_yn
				+ '&s_pos_gbn_code=' + pos_gbn_code
				+ '&s_join_day=' + join_day
				+ '&s_retire_day=' + retire_day
				+ '&s_join_gbn_code=' + join_gbn_code
				+ "'" + '">')
		.append($('<td style="text-align: center;">').html(insa.sabun))
		.append($('<td>').html(insa.name))
		.append($('<td>').html(insa.reg_no))
		.append($('<td>').html(insa.hp))
		.append($('<td>').html(insa.pos_gbn_code))
		.append($('<td>').html(insa.join_day))
		.append($('<td>').html(insa.retire_day))
		.append($('<td>').html(insa.put_yn))
		.append($('<td style="text-align: right;">').html(insa.salary.toLocaleString() != 0 ? insa.salary.toLocaleString() : null))
		.appendTo('#insaList');
	});
}

function fn_reset() {
	$('#reset_btn').on('click', function() {
		$('#sabun').val('');
		$('#name').val('');
		$('#join_type').val('');
		$('#put_yn').val('');
		$('#pos_gbn_code').val('');
		$('#join_day').val('');
		$('#retire_day').val('');
		$('#join_gbn_code').val('');
	});
}