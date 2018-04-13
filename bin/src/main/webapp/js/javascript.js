function selectAllCheckBox(allcheck, containerID, checkboxIDMatch){ //(all체크박스, 그룹ID, 체크박스ID)
		var checkboxContainer = document.getElementById(containerID);
		var inputs = checkboxContainer.getElementsByTagName('input') //그룹에서 input태그 elements만 가져오는 코드
		for(var i = 1; i < inputs.length; i++){
			var item = inputs.item(i);
			if (item.id.indexOf(checkboxIDMatch) > -1){
				item.checked = allcheck.checked; //input태그 elements 중 체크박스ID를 가진 것만 상태 변경
			}
			
		}
	};
	
var submitcheck = true; //중복신청 방지
	
	window.onload = function(){
		var btns = document.getElementsByClassName("submitbtn"); //신청 버튼의 집합
		for(var i=0; i<btns.length; i++){
			var btn = btns.item(i);
			btn.onclick = function() {
	 			if(this.value=="신청" && submitcheck){
	 				alert("신청되었습니다");//확인용 임시코드
	 				submitcheck = false;
	 				this.value="신청취소";
	 				this.className = "btn btn-cancel btn-lg submitbtn";
	 			}
				else if(this.value=="신청취소"){
					alert("취소되었습니다");//확인용 임시코드
	 				submitcheck = true;
	 				this.value="신청";
	 				this.className = "btn btn-primary btn-lg submitbtn";
	 			}
	 			else{
	 				alert("이미 신청했습니다");//확인용 임시코드
	 			}
			};
		}
	};
	
	function selectAllCheckBox(allcheck, containerID, checkboxIDMatch){ //(all체크박스, 그룹ID, 체크박스ID)
		var checkboxContainer = document.getElementById(containerID);
		var inputs = checkboxContainer.getElementsByTagName('input') //그룹에서 input태그 elements만 가져오는 코드
		for(var i = 1; i < inputs.length; i++){
			var item = inputs.item(i);
			if (item.id.indexOf(checkboxIDMatch) > -1){
				item.checked = allcheck.checked; //input태그 elements 중 체크박스ID를 가진 것만 상태 변경
			}
			
		}
	}

	