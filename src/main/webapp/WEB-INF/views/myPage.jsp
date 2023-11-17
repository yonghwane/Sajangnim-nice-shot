<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html lang="kr">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>myPage</title>
        <link rel="stylesheet" href="/css/reset.css" />
        <link rel="stylesheet" href="/css/KDB.css" />
        <script src="/js/KDB.js"></script>
    </head>

    <body>
        <header class="header">
            <h1 onclick="location.href='/'">SNP</h1>
            <div>
                <input id="memNickname" name="memNickname" placeholder="ニックネーム" />
                <button onclick="login()">ログイン</button>
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
    	if (`${message}` !== ``) {alert(`${message}`); window.location.href = "/";}
        if (`${headerHTML}` !== ``) document.querySelector('.header').innerHTML = `${headerHTML}`;
        
        console.log(`${getRsvList}`);
        const getRsvList = JSON.parse(`${getRsvList}`);
        
        const reservation = document.querySelector('#reservation');
        getRsvList.forEach((list) => {
            const li = document.createElement('li');
            const detail = document.createElement('button');
            const cancel = document.createElement('button');
            const transfer = document.createElement('button');
            li.textContent = list.rsvDate + " " + list.rsvTime;
            detail.textContent = "상세";
            cancel.textContent = "취소";
            transfer.textContent = "양도";
            li.addEventListener('click', () => (location.href = '/moveMyPage/' + list.rsvCode));
            detail.addEventListener('click', () => (location.href = '/moveMyPage/' + list.rsvCode));
            cancel.addEventListener('click', () => (location.href = '/removeReservation/' + list.rsvCode));
            transfer.addEventListener('click', () => (location.href = '/transferReservation/' + list.rsvCode));
            reservation.appendChild(li);
            reservation.appendChild(detail);
            reservation.appendChild(cancel);
            reservation.appendChild(transfer);
        });
    </script>
    </html>