<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html lang="kr">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>board</title>
        <link rel="stylesheet" href="/css/reset.css" />
        <link rel="stylesheet" href="/css/KDB.css" />
        <link rel="stylesheet" href="/css/KYH.css" />
        <script src="/js/KDB.js"></script>
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
        	<div class="aside-list" onclick="location.href='/moveReservation'">예약</div>
        	<div class="aside-list" onclick="location.href='/moveMyPage'">마이페이지</div>
        	<div class="aside-list" onclick="location.href='/moveCrawledData'">이벤트</div>
        	</aside>
            <section>
            	<h2>hello SnpWorld</h2>
            </section>
        </main>
        
    </body>
    <script>
        if (`${message}` !== ``) {alert(`${message}`); window.location.href = "/";}
        if (`${headerHTML}` !== ``) document.querySelector('.header').innerHTML = `${headerHTML}`;
        
    </script>
