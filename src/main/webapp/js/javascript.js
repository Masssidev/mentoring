function selectAllCheckBox(allcheck, containerID, checkboxIDMatch) { // (all체크박스,
	// 그룹ID,
	// 체크박스ID)
	var checkboxContainer = document.getElementById(containerID);
	var inputs = checkboxContainer.getElementsByTagName('input') // 그룹에서
	// input태그
	// elements만
	// 가져오는
	// 코드
	for (var i = 1; i < inputs.length; i++) {
		var item = inputs.item(i);
		if (item.id.indexOf(checkboxIDMatch) > -1) {
			item.checked = allcheck.checked; // input태그 elements 중
			// 체크박스ID를 가진 것만 상태 변경
		}

	}
};

/*
 * var submitcheck = true; // 중복신청 방지
 * 
 * window.onload = function() { var btns =
 * document.getElementsByClassName("submitbtn"); // 신청 버튼의 집합 for (var i = 0; i <
 * btns.length; i++) { var btn = btns.item(i); btn.onclick = function() { if
 * (this.value == "신청" && submitcheck) { alert("신청되었습니다");// 확인용 임시코드
 * submitcheck = false; this.value = "신청취소"; this.className = "btn btn-cancel
 * btn-lg submitbtn"; } else if (this.value == "신청취소") { alert("취소되었습니다");// 확인용
 * 임시코드 submitcheck = true; this.value = "신청"; this.className = "btn btn-primary
 * btn-lg submitbtn"; } else { alert("이미 신청했습니다");// 확인용 임시코드 } }; } };
 */

function selectAllCheckBox(allcheck, containerID, checkboxIDMatch) { // (all체크박스,
	// 그룹ID,
	// 체크박스ID)
	var checkboxContainer = document.getElementById(containerID);
	var inputs = checkboxContainer.getElementsByTagName('input') // 그룹에서
	// input태그
	// elements만
	// 가져오는
	// 코드
	for (var i = 1; i < inputs.length; i++) {
		var item = inputs.item(i);
		if (item.id.indexOf(checkboxIDMatch) > -1) {
			item.checked = allcheck.checked; // input태그 elements 중
			// 체크박스ID를 가진 것만 상태 변경
		}

	}
}

$(".autoCheck").on('click', 'td', function(){
    var target = $(this).find('input[type="checkbox"]');

    // If it's checked then uncheck it and vice versa
    target.prop('checked', !target.prop('checked'));
});

$(".autoCheck").on('click', 'input[type="checkbox"]', function(){
    $(this).prop('checked', !target.prop('checked'));
});

$(function() {

	$(".autosubmit").change(function() {
		$(this).parents("form").submit();
	})
})

function register() {
	if (document.r_form.file.value == "")
		alert("파일을 등록해주세요");
	else {
		r_form.submit();
	}
}

function survey() {
	if (document.r_form.link.value == "")
		alert("설문조사 링크를 등록해주세요");
	else {
		r_form.submit();
	}
}

function double_dep(v, showId, nonShowId) {
	// 라디오 버튼 value 값 조건 비교
	if (v == "1") {
		if (document.getElementById('status_id').value == 1
				|| document.getElementById('status_id').value == 0) {
			document.getElementById(showId).style.display = ""; // 보여줌
			document.getElementById(nonShowId).style.display = "none";
		} else {
			document.getElementById(showId).style.display = "none";
			document.getElementById(nonShowId).style.display = "none";
		}
	} else {
		if (document.getElementById('status_id').value != 0
				|| document.getElementById('status_id').value != 1
				|| document.getElementById('status_id').value != 3) {
			document.getElementById(showId).style.display = "none"; // 숨김
		}
	}
}
mdown.fList = [];
function mdown(N) {
	var objs = document.getElementsByName(N);
	var Body = document.getElementsByTagName('BODY')[0];
	var j;

	for (var i = j = 0; i < objs.length; i++) {
		if (!objs[i].checked)
			continue;
		if (mdown.fList[j] == undefined) {
			mdown.fList[j] = document.createElement("IFRAME");
			mdown.fList[j].style.display = 'none';

			Body.appendChild(mdown.fList[j]);
		}
		mdown.fList[j].src = mdown.GetURL(objs[i].value);
		j++;
	}

}

mdown.GetURL = function(val) {
	// 이 함수를 각자의 프로그램 사양에 따라 적당히 만들어주세요.
	// 체크박스에 있던 value 값이 val로 전달됩니다.

	return 'http://localhost:8080/mybatisEx/report/excel-xls?id=' + val;
}

function minor_dep(v, showId, nonShowId) {
	// 라디오 버튼 value 값 조건 비교
	if (v == "2") {
		if (document.getElementById('status_id').value == 1
				|| document.getElementById('status_id').value == 0) {
			document.getElementById(showId).style.display = ""; // 보여줌
			document.getElementById(nonShowId).style.display = "none";
		} else {
			document.getElementById(showId).style.display = "none";
			document.getElementById(nonShowId).style.display = "none";
		}

	} else {
		if (document.getElementById('status_id').value != 0
				|| document.getElementById('status_id').value != 1
				|| document.getElementById('status_id').value != 3) {
			document.getElementById(showId).style.display = "none"; // 숨김
		}
	}
}

document.getElementById('datePicker').valueAsDate = new Date();
document.getElementById('datePicker2').valueAsDate = new Date();
document.getElementById('datePicker3').valueAsDate = new Date();
document.getElementById('datePicker4').valueAsDate = new Date();
document.getElementById('datePicker5').valueAsDate = new Date();
document.getElementById('datePicker6').valueAsDate = new Date();
document.getElementById('datePicker7').valueAsDate = new DateTime();
document.getElementById('datePicker8').valueAsDate = new DateTime();

function show_office() {
	// 라디오 버튼 value 값 조건 비교
	if (document.getElementById('status_id').value == 0) {
		document.getElementById('search_minor').style.display = "none";
		document.getElementById('search_double').style.display = "none";
		return false;
	} else if (document.getElementById('status_id').value == 2) {
		document.getElementById('officeDIV').style.display = ""; // 보여줌
		document.getElementById('search_minor').style.display = "none";
		document.getElementById('search_double').style.display = "none";
		return false;
	} else if (document.getElementById('status_id').value == 3) {
		document.getElementById('officeDIV').style.display = "none";
		document.getElementById('search_minor').style.display = "none";
		document.getElementById('search_double').style.display = "none";
		return false;
	} else {
		document.getElementById('officeDIV').style.display = "none";
		return false;
	}
}

function show_photoFile() {
	document.getElementById('photoFileDIV').style.display = "";
	return false;
}

function show_studyFile() {
	document.getElementById('studyFileDIV').style.display = "";
	return false;
}

function checkSearch2() {
	if (document.searchForm.semester.value == 0) {
		alert("검색을 원하는 학기를 선택해주세요");
		document.searchForm.semester.focus();
		return false;
	} else {
		searchForm.submit();
	}
}

function checkReportSearch() {
	if (document.reportForm.year.value == "") {
		alert("검색을 원하는 년도를 입력해주세요.");
		document.reportForm.year.focus();
		return false;
	} else if(document.reportForm.semester.value == 0){
		alert("검색을 원하는 학기를 선택해주세요.");
		document.reportForm.semester.focus();
		return false;
	}else {
		reportForm.submit();
	}
}

function checkSearchMentoring() {
	if (document.searchMentoringForm.mentoringSearch.value == "") {
		alert("검색어를 입력해주세요");
		document.searchMentoringForm.mentoringSearch.focus();
		return false;
	} else {
		searchMentoringForm.submit();
	}
}

function checkSearch1() {
	if (document.fm.search.value == "") {
		alert("검색어를 입력해주세요");
		document.fm.search.focus();
		return false;
	} else {
		fm.submit();
	}
}

function checkMentorApply(min,max) {
	if (document.form.group_name.value == "") {// 이름이 입력하지 않았으면
		alert("그룹 이름을 입력해주세요");
		document.form.group_name.focus();
		return false;
	} else if (document.form.subject.value == "") {
		alert("주제를 입력해주세요");
		document.form.subject.focus();
		return false;
	} else if (document.form.year.value == 0) {
		alert("학년을 입력해주세요");
		document.form.year.focus();
		return false;
	} else if (document.form.grade.value == "") { 
		alert("해당 과목 성적을 입력해주세요");
	    document.form.grade.focus();
	    return false;
	} else if (document.form.count.value == "") {
		alert("희망 멘티 인원을 입력해주세요");
		document.form.count.focus();
		return false;
	} else if (document.form.study_purpose.value == "") {
		alert("스터디 목적을 입력해주세요");
		document.form.study_purpose.focus();
		return false;
	} else if (document.form.study_content.value == "") {
		alert("스터디 내용을 입력해주세요");
		document.form.study_content.focus();
		return false;
	} else if (document.form.study_method.value == "") {
		alert("스터디 방법을 입력해주세요");
		document.form.study_method.focus();
		return false;
	} else if (document.form.file1.value == "") {
		alert("홍보 이미지를 등록해주세요");
		document.form.file2.focus();
		return false;
	} else if (document.form.file2.value == "") {
		alert("시간표 파일을 등록해주세요");
		document.form.file1.focus();
		return false;
	} else if (document.form.file3.value == "") {
		alert("증빙서류를 등록해주세요");
		document.form.file3.focus();
		return false;
	} else if ((document.form.count.value < min) || (document.form.count.value > max)) {
		alert("희망 멘티 인원은 "+min+"명부터 "+max+"명 사이여야 합니다");
		document.form.count.focus();
		return false;
	} else {
		form.submit();
	}
}

function checkWriteReport() {
	if (document.form.subject.value == "") {// 이름이 입력하지 않았으면
		alert("스터디 주제를 입력해주세요");
		document.form.subject.focus();
		return false;
	} else if (document.form.place.value == "") {
		alert("스터디 장소를 입력해주세요");
		document.form.place.focus();
		return false;
	} else if (document.form.day.value == 0) {
		alert("이번 주 스터디 요일을 입력해주세요");
		document.form.day.focus();
		return false;
	} else if (document.form.study_content.value == "") {
		alert("스터디 내용을 입력해주세요");
		document.form.study_content.focus();
		return false;
	} else if (document.form.file3.value == "") {
		alert("인증샷을 등록해주세요");
		document.form.file3.focus();
		return false;
	} else if (document.form.file4.value == "") {
		alert("활동 증명 자료를 등록해주세요");
		document.form.file4.focus();
		return false;
	} else {//
		form.submit();
	}
}

function checkM_setting() {
	if (document.form.max_mentor.value == 0) {
		alert("최대 멘토 인원을입력해주세요");
		document.form.max_mentor.focus();
		return false;
	} else if (document.form.study_count.value == 0) {
		alert("멘토링 모임 횟수를 입력해주세요");
		document.form.study_count.focus();
		return false;
	} else if (document.form.min_mentee.value == 0) {
		alert("멘토당 최소 멘티 인원을 입력해주세요");
		document.form.min_mentee.focus();
		return false;
	} else if (document.form.max_mentee.value == 0) {
		alert("멘토당 최대 멘티 인원을 입력해주세요");
		document.form.max_mentee.focus();
		return false;
	} else if (document.form.report_deadline.value == 0) {
		alert("보고서 마감 요일을 선택해주세요");
		document.form.report_deadline.focus();
		return false;
	} else {//
		form.submit();
	}
}

function checkInput() {
	if ($("#form [name=user_id]").val() == "") {
		alert("아이디를 입력해주세요");
		$("#form [name=user_id]").focus();
		return false;
	} else if (document.all.radio[0].checked == true) {
		if ($("#form [name=double_id]").val() == 0) {
			alert("복수전공 학과를 선택해주세요");
			$("#form [name=double_id]").focus();
			return false;
		}
		if ($("#form [name=double_id]").val() == $("#form [name=major_id]")
				.val()) {
			alert("올바르지 않은 복수전공입니다");
			$("#form [name=double_id]").focus();
			return false;
		}
		if (document.all.radio[1].checked == true) {
			if ($("#form [name=minor_id]").val() == 0) {
				alert("부전공 학과를 선택해주세요");
				$("#form [name=minor_id]").focus();
				return false;
			}
			if ($("#form [name=minor_id]").val() == $("#form [name=major_id]")
					.val()) {
				alert("올바르지 않은 부전공입니다");
				$("#form [name=minor_id]").focus();
				return false;
			}
			form.submit();
		}
		form.submit();
	} else if (document.all.radio[1].checked == true) {
		if ($("#form [name=minor_id]").val() == 0) {
			alert("부전공 학과를 선택해주세요");
			$("#form [name=minor_id]").focus();
			return false;
		}
		if ($("#form [name=minor_id]").val() == $("#form [name=major_id]")
				.val()) {
			alert("올바르지 않은 부전공입니다");
			$("#form [name=minor_id]").focus();
			return false;
		}
		if (document.all.radio[0].checked == true) {
			if ($("#form [name=double_id]").val() == 0) {
				alert("복수전공 학과를 선택해주세요");
				$("#form [name=double_id]").focus();
				return false;
			}
			if ($("#form [name=double_id]").val() == $("#form [name=major_id]")
					.val()) {
				alert("올바르지 않은 복수전공입니다");
				$("#form [name=double_id]").focus();
				return false;
			}
			form.submit();
		}
		form.submit();
	} else if ($("#form [name=pw]").val() == "") {
		alert("비밀번호를 입력해주세요");
		$("#form [name=pw]").focus();
		return false;
	} else if ($("#form [name=major_id]").val() == 0) {
		alert("학과를 선택해주세요");
		$("#form [name=major_id]").focus();
		return false;
	} else if ($("#form [name=status_id]").val() == 0) {
		alert("직책을 선택해주세요");
		$("#form [name=status_id]").focus();
		return false;
	} else if ($("#form [name=status_id]").val() == 2) {
		if ($("#form [name=office]").val() == "") {
			alert("사무실을 입력해주세요");
			$("#form [name=office]").focus();
			return false;
		}
		if ($("#form [name=office_tel]").val() == "") {
			alert("사무실 전화번호를 입력해주세요");
			$("#form [name=office_tel]").focus();
			return false;
		}
	} else if ($("#form [name=name]").val() == "") {
		alert("이름을 입력해주세요");
		$("#form [name=name]").focus();
		return false;
	} else if ($("#form [name=email]").val() == "") {
		alert("이메일을 입력해주세요");
		$("#form [name=email]").focus();
		return false;
	} else if ($("#form [name=phone]").val() == "") {
		alert("연락처를 입력해주세요");
		$("#form [name=phone]").focus();
		return false;
	} else if (!($("#form [name=newPw]").val() == "")) {
		if ($("#form [name=newPw]").val() != $("#form [name=newPw2]").val()) {
			alert("비밀번호가 일치하지 않습니다");
			$("#form [name=newPw]").focus();
			return false;
		}
	} else {//
		form.submit();
	}

}

function checkInputMeminfo() {
	if ($("#form [name=pw]").val() == "") {
		alert("비밀번호를 입력해주세요");
		$("#form [name=pw]").focus();
		return false;
	} else if (!($("#form [name=newPw]").val() == "")) {
		if ($("#form [name=newPw]").val() != $("#form [name=newPw2]").val()) {
			alert("비밀번호가 일치하지 않습니다");
			$("#form [name=newPw]").focus();
			return false;
		}
	} else {//
		form.submit();
	}
}

function checkInputEmail() {
	if ($("#form [name=to]").val() == "") {
		alert("보내는 이메일 주소를 입력해주세요");
		$("#form [name=to]").focus();
		return false;
	} else if ($("#form [name=subject]").val() == "") {
		alert("제목을 입력해주세요");
		$("#form [name=subject]").focus();
		return false;
	} else if ($("#form [name=text]").val() == "") {
		alert("내용을 입력해주세요");
		$("#form [name=text]").focus();
		return false;
	} else {//
		form.submit();
	}
}

function comment_edit(i) {
	$(".c_content_" + i).toggle();
	$(".c_content_edit_" + i).toggle();
}

var oEditors = [];
$(function() {
	nhn.husky.EZCreator.createInIFrame({
		oAppRef : oEditors,
		elPlaceHolder : "ir1",
		// SmartEditor2Skin.html 파일이 존재하는 경로
		sSkinURI : "/editor/SmartEditor2Skin.html",
		htParams : {
			// 툴바 사용 여부 (true:사용/ false:사용하지 않음)
			bUseToolbar : true,
			// 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
			bUseVerticalResizer : true,
			// 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
			bUseModeChanger : true,
			fOnBeforeUnload : function() {

			}
		},
		fOnAppLoad : function() {
			// 기존 저장된 내용의 text 내용을 에디터상에 뿌려주고자 할때 사용
			oEditors.getById["ir1"].exec("PASTE_HTML",
					[ "기존 DB에 저장된 내용을 에디터에 적용할 문구" ]);
		},
		fCreator : "createSEditor2"
	});
});

$("#save").click(function() {
	oEditors.getById["ir1"].exec("UPDATE_CONTENTS_FIELD", []);
	$("#frm").submit();
});

function deleteApply() {
	return confirm("신청을 취소하시겠습니까?");
}

function deleteReport() {
	return confirm("해당 보고서를 삭제하시겠습니까?");
}

function delete_report() {
	if ($('input:checkbox[name="semesterCheckbox"]:checked').length > 0) {
		if (confirm('정말 삭제하시겠습니까?')) {
			return true;
		} else {
			return false;
		}

	} else {
		alert('선택된 보고서가 없습니다.');
		return false;
	}
}

function deleteComment() {
	return confirm("해당 댓글을 삭제하시겠습니까?");
}

function deleteAlert() {
	return alert("삭제되었습니다");
}

/*
 * function save() { >>>>>>> branch 'master' of
 * https://github.com/choiyk/smProject.git if ($("#form [name=title]").val() ==
 * "") { alert("제목을 입력해주세요"); $("#form [name=title]").focus(); return false; }
 * var s = $("#summernote").summernote('code'); $("input[name=content]").val(s);
 * $("#form").submit(); }
 */