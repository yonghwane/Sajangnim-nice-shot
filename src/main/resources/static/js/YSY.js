function main1() {
    const form = document.createElement('form')
    document.body.appendChild(form)
    form.method = 'post'
    form.action = '/main1'
    //const memNickname = document.querySelector('#memNickname')
    //form.appendChild(memNickname)
    //form.submit()
}


function selectTime() {
		const timeSelect = document.getElementById("selectTime"); 
		for (let hour = 7; hour < 21; hour++) {  // 오전 7시부터 오후 8시까지
			for (let minute = 0; minute < 60; minute += 7) {  // 7의 배수로 분 계산
	            // 시간과 분을 두 자리 숫자로 표현하고 조건에 맞게 출력 형식을 설정
	            const selectTime = (hour !== 7 || minute >= 21) ? `${hour.toString().padStart(2, '0')}${minute.toString().padStart(2, '0')}` : `0${hour}${minute.toString().padStart(2, '0')}`;
	            
	         // 새로운 option 요소를 생성하여 select에 추가
                const option = document.createElement("option");
                option.value = selectTime;
                option.text = `${hour}:${minute.toString().padStart(2, '0')}`;
                timeSelect.add(option);
	    }
	}
	
}
	
	 // 페이지 로드 후 selectTime 함수 호출
    window.onload = function() {
//		if (!selectTime() || !checkDate()) {
//        // 조건이 충족되지 않으면 제출을 막고 경고창 표시
//        alert("시간과 날짜를 선택하세요.");
//        return false;
//    }
        selectTime();
    };

function checkDate() {
        const selectDate = document.getElementById("selectDate");
        const currentDate = new Date();
        const selectedDate = new Date(selectDate.value);

        if (selectedDate < currentDate) {
            alert("과거 날짜는 선택할 수 없습니다.");
            selectDate.value = '';  // 선택한 값을 초기화
        }
    }
    
    document.addEventListener("DOMContentLoaded", function () {
        const selectDate = document.getElementById("selectDate");
        selectDate.addEventListener("input", checkDate);
    });
    

    
