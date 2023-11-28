function makeFormData(keys, values) {
	// 기본 배열로 돌아감. 문자열이 온 경우 배열로 변환
	if (!Array.isArray(keys)) {
		keys = [keys];
		values = [values];
	}
	const formDataArray = keys.map((key, index) => key + '=' + values[index]);
	return formDataArray.join('&');
}

/* AJAX :: POST */
function postAjaxJson(jobCode, clientData, fn) {
	const ajax = new XMLHttpRequest()

	ajax.onreadystatechange = function() {
		if (ajax.readyState == 4 && ajax.status == 200) {
			window[fn](ajax.responseText)
		}
	}
	ajax.open('post', jobCode)
	ajax.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded')
	ajax.send(clientData)
}
function postAjaxMultipartFormData(jobCode, clientData, fn) {
	const ajax = new XMLHttpRequest();

	ajax.onreadystatechange = function() {
		if (ajax.readyState == 4 && ajax.status == 200) {
			window[fn](ajax.responseText);
		}
	}

	const formData = new FormData();
	for (const key in clientData) formData.append(key, clientData[key]);


	ajax.open('POST', jobCode);
	// ajax.setRequestHeader('Content-Type', 'multipart/form-data');
	ajax.send(formData);
}
function getAjaxJson(jobCode, clientData, fn) {
	const ajax = new XMLHttpRequest()
	const action = clientData != '' ? jobCode + '?' + clientData : jobCode

	ajax.onreadystatechange = function() {
		if (ajax.readyState == 4 && ajax.status == 200) {
			window[fn](ajax.responseText)
		}
	}
	ajax.open('get', action)
	ajax.send()
}

/* AJAX :: POST */
// 컨트롤러로 전달할 서비스 코드, key=value형태의 데이터, 콜백함수
function sendAjaxPost(serviceCode, formData, callBackFunction) {
	fetch(serviceCode, {
		method: 'POST',
		headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
		body: formData,
	})
		.then(response => {
			if (response.ok) {
				const clonedResponse = response.clone(); // Clone the response
				return response.json().catch(() => clonedResponse.text()); // Try parsing original response as JSON, if fails, get text from cloned response
			} else {
				throw new Error('Network response was not ok.');
			}
		})
		.then(data => window[callBackFunction](data))
		.catch(error => console.error('Error:', error));
}

function login() {
    const form = document.createElement('form');
    form.method = 'post';
    form.action = '/login';

    const memNickname = document.querySelector('#memNickname');
    const input = document.createElement('input');
    input.type = 'hidden';
    input.name = 'memNickname';
    input.value = memNickname.value;

    form.appendChild(input);
    document.body.appendChild(form);
    form.submit();
}
async function login2() {
    const memNickname = document.querySelector('#memNickname').value;

    try {
        const response = await fetch('/login', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded',
            },
            body: JSON.stringify({ memNickname: memNickname }),
        });

        if (!response.ok) {
            console.log(`Error: ${response.status} ${response.statusText}`);
            return;
        }

        const data = await response.json();

        console.log(data.message);
        updateHeader(memNickname);

    } catch (error) {
        console.log(error);
    }
}

async function updateHeader(memNickname) {
    try {
        const response = await fetch('/header');

        if (!response.ok) {
            console.log(`Error: ${response.status} ${response.statusText}`);
            return;
        }

        document.querySelector('.header').innerHTML = `로그인 성공: ${memNickname}`;

    } catch (error) {
        console.log(error);
    }
}
//function removeReservation(rsvCode) { // 프론트 서버로 요청 보내고, 서버에서 처리 후 json형식으로 반환, delete함수에 그 값을 전달
//	const isConfirmed = confirm("예약을 취소하시겠습니까?");
//	if (isConfirmed) {
//		postAjaxJson('/removeReservation', '&rsvCode=' + rsvCode, 'deleteReservation')
//	} else {
//		alert("삭제 취소");
//	}
//}
//
//function deleteReservation(result) {
//	console.log(result) // 1 or 0
//	console.log(typeof (result)) // string (json은 string)
//	if (result === '1') {
//		alert("삭제 성공");
//		window.location.href = "/moveMyPage";
//		const form = document.createElement('form')
//		document.body.appendChild(form)
//		form.method = 'post'
//		form.action = '/login'
//		const memNickname = document.querySelector('#memNickname')
//		form.appendChild(memNickname)
//		form.submit()
//	}

function removeReservation(rsvCode) { // 프론트 서버로 요청 보내고, 서버에서 처리 후 json형식으로 반환, delete함수에 그 값을 전달
	const isConfirmed = confirm("예약을 삭제하시겠습니까?");
	if (isConfirmed) {
		postAjaxJson('/removeReservation', '&rsvCode=' + rsvCode, 'deleteReservation')
		getRsvList = getRsvList.filter(list => list.rsvCode !== rsvCode);
		updateRsvList();
	} else {
		alert("삭제 취소");
	}
}

	function deleteReservation(result) {
		console.log(result) // 1 or 0
		console.log(typeof (result)) // string (json은 string)
		if (result === '1') {
			alert("삭제 성공");
			console.log(getRsvList)
		}
}

function redirectToGitHub() {
	window.location.href = 'https://github.com/yonghwane/Sajangnim-nice-shot';
}
