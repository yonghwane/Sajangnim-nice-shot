<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="kr">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>myPage</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@400;700&display=swap" rel="stylesheet"><link rel="stylesheet" href="/css/reset.css" />
<link rel="stylesheet" href="/css/KDB.css" />
<script src="/js/KDB.js"></script>
</head>

<body>
	<header class="header">
		<h1 onclick="location.href='/'">SNP</h1>
		<div>
			<input id="memNickname" name="memNickname" placeholder="닉네임" />
			<button onclick="login()">로그인</button>
		</div>
	</header>
	<main>
		<aside>
			<div id="aside-main" onclick="location.href='/'">메인페이지</div>
			<div onclick="location.href=''">예약</div>
			<div onclick="location.href='/moveMyPage'">마이페이지</div>
			<div onclick="location.href=''">이벤트</div>
		</aside>

		<section>
			<ul class="list">
				<div id="h3" onclick="location.href='/moveMyPage'">마이페이지</div>
				<div id="reservation"></div>
			</ul>
		</section>
	</main>
</body>
<script>
    	if (`${message}` !== ``) {alert(`${message}`);
//    	window.location.href = "/";
    	}
        if (`${headerHTML}` !== ``) document.querySelector('.header').innerHTML = `${headerHTML}`;
        
        console.log(`${getRsvList}`);
        let reservation = document.querySelector('#reservation');
        let getRsvList = JSON.parse(`${getRsvList}`);
        
        getRsvList.forEach((list) => {
            let li = document.createElement('li');
            let span = document.createElement('span');
            let detail = document.createElement('button');
            let cancel = document.createElement('button');
            let transfer = document.createElement('button');
            
            li.textContent = "・ 예약일 : " + list.rsvDate + " | 예약시간 : " + list.rsvTime;
            detail.textContent = "상세";
            cancel.textContent = "취소";
            transfer.textContent = "양도";
            
            detail.addEventListener('click', () => (location.href = '/moveReservedDetail/' + list.rsvCode));
            cancel.addEventListener('click', () => removeReservation(list.rsvCode));
            transfer.addEventListener('click', () => (location.href = '/moveReservedTransfer/' + list.rsvCode));
            li.appendChild(span);
            span.appendChild(detail);
            span.appendChild(cancel);
            span.appendChild(transfer);
            reservation.appendChild(li);
        });
    </script>
</html>