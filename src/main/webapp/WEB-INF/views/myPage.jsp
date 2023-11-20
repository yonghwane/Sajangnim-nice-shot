<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="kr">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>myPage</title>
<link rel="stylesheet" href="/css/reset.css" />
<link rel="stylesheet" href="/css/KDB.css" />
<script src="/js/KDB.js"></script>
<style>
</style>
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
         <div onclick="location.href=''">예약</div>
         <div onclick="location.href='/moveMyPage'">마이페이지</div>
         <div onclick="location.href=''">이벤트</div>
      </aside>

      <section>
         <ul class="list">
            <div onclick="location.href='/moveMyPage'">마이페이지</div>
            <div id="reservation"></div>
         </ul>
      </section>
   </main>
</body>
    <script>
        if (`${message}` !== ``) {alert(`${message}`);
//        window.location.href = "/";
        }
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
                li.textContent = list.rsvDate + " " + list.rsvTime;
                li.addEventListener('click', () => (location.href = '/moveReservedDetail/' + list.rsvCode));
    
                let detail = createButton("상세", () => (location.href = '/moveReservedDetail/' + list.rsvCode));
                let cancel = createButton("취소", () => {
                    removeReservation(list.rsvCode);
                    li.classList.add('fade-out');
                });
                let transfer = createButton("양도", () => (location.href = '/moveMyPageTransfer/' + list.rsvCode));
    
                reservation.appendChild(li);
                reservation.appendChild(detail);
                reservation.appendChild(cancel);
                reservation.appendChild(transfer);
            });
        }
    
        updateRsvList();
    </script>
</html>
