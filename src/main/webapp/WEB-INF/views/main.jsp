
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html lang="kr">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>board</title>
        <link rel="stylesheet" href="/css/reset.css" />
        <link rel="stylesheet" href="/css/KDB.css" />
        <script src="/js/KDB.js"></script>
    </head>

    <body>
        <header class="header">
            <img id="logo" onclick="location.href='/'" src="/img/SNP_LOGO4.png" />
            <div>
                <input id="memNickname" name="memNickname" placeholder="닉네임" />
                <button onclick="login()">로그인</button>
            </div>
        </header>
        <main>
        	<aside>
        	<div id="aside-main" onclick="location.href='/'">메인페이지</div>
        	<div onclick="location.href='/moveReservationDate'">예약</div>
        	<div onclick="location.href='/moveMyPage'">마이페이지</div>
        	<div onclick="location.href=''">이벤트</div>
        	</aside>
            <section>
            </section>
        </main>
        
    </body>
    <script>
        if (`${message}` !== ``) {alert(`${message}`); window.location.href = "/";}
        if (`${headerHTML}` !== ``) document.querySelector('.header').innerHTML = `${headerHTML}`;
    </script>
    </html>