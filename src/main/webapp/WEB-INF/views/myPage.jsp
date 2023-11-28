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
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@400;700&display=swap" rel="stylesheet">
<link rel="stylesheet" href="/css/reset.css" />
<link rel="stylesheet" href="/css/KDB.css" />
<link rel="stylesheet" href="/css/KYH.css" />
<script src="/js/KDB.js"></script>
<style>
</style>
</head>

<body>
    <header class="header">
        <img id="logo" onclick="location.href='/'" src="/img/SNP_LOGO4.png" />
        <div>
            <input class="login-input" id="memNickname" name="memNickname" placeholder="닉네임" />
            <button class="login-button" onclick="login()">로그인</button>
        </div>
    </header>
	<main>
		<aside>
			<div id="aside-main" onclick="location.href='/'">메인페이지</div>
			<div onclick="location.href='/moveReservation'">예약</div>
			<div onclick="location.href='/moveMyPage'">마이페이지</div>
			<div onclick="location.href='/moveCrawledData'">이벤트</div>
		</aside>

      <section>
      	<div id="h3" onclick="location.href='/moveMyPage'">마이페이지</div>
      	<hr>
         <ul class="list">
            <div id="reservation"></div>
         </ul>
      </section>
   </main>
   <footer>
   <span id="company">Sajangnim Nice Shot</span>
   <span id="git" onclick="redirectToGitHub()">contact-us</span>
   <span id="contact" onclick="location.href='/moveContact'">문의하기</span>
   </footer>
</body>
<script>
        if (`${message}` !== ``) {alert(`${message}`); window.location.href = "/"; }
        if (`${headerHTML}` !== ``) document.querySelector('.header').innerHTML = `${headerHTML}`;
    
        let reservation = document.querySelector('#reservation');
        let getRsvList = JSON.parse(`${getRsvList}`);
    
        function createButton(text, clickHandler) {
            let button = document.createElement('button');
            button.textContent = text;
            button.addEventListener('click', clickHandler);
            return button;
        }
    
        function updateRsvList() {
            reservation.innerHTML = ""; 
    
            getRsvList.forEach((list) => {
                let li = document.createElement('li');
                let span = document.createElement('span');
                li.textContent = "・ 예약일 : " + list.rsvDate + " | 예약시간 : " + list.rsvTime;
                let detail = createButton("상세", () => (location.href = '/moveReservedDetail/' + list.rsvCode));
                let cancel = createButton("취소", () => {
                    removeReservation(list.rsvCode);
                    li.classList.add('fade-out');
                });
                let transfer = createButton("양도", () => (location.href = '/moveMyPageTransfer/' + list.rsvCode));
                li.appendChild(span);
                span.appendChild(detail);
                span.appendChild(cancel);
                span.appendChild(transfer);
                reservation.appendChild(li);
            });
        }
    
        updateRsvList();
    </script>
</html>
