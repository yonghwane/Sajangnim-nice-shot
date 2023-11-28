<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html lang="kr">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>board</title>
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@400;700&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="/css/reset.css" />
        <link rel="stylesheet" href="/css/KDB.css" />
        <link rel="stylesheet" href="/css/KYH.css" />
        <link rel="stylesheet" href="/css/YSY.css" />
        <script src="/js/KDB.js"></script>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>

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
            <div class="row">
            <div class="col-sm-6 mb-3 mb-sm-0" style="height: 30rem">
              <div class="card">
                <div class="card-body">
                <img src="/img/nice.jpg" class="card-img-top" alt="">
                <p></p>
                  <h5 class="card-title">사장님 나이스샷,, ~</h5>
                  <p></p>
                  <p class="card-text">이랏샤이마세 일본 골프 저렴하게 모십니다 엔저일 때 많이들 가셔라</p>
                  <div id="reservation" class="btn btn-primary" onclick="location.href='/moveReservation'">예약하러 가기</div>
                </div>
              </div>
            </div>
            <div class="col-sm-6">
              <div class="card">
                <div class="card-body">
                <img src="/img/event.jpg" class="card-img-top" alt="">
                <p></p>
                  <h5 class="card-title">EVENT</h5>
                  <p></p>
                  <p class="card-text">일본에서 일어나는 다양한 골프 관련 정보를 받아보세요.</p>
                  <div id="reservation" class="btn btn-primary" onclick="location.href='/moveCrawledData'">이벤트 확인하기</div>
                </div>
              </div>
            </div>
          </div>
            </section>
        </main>
        <footer>
        <span id="company">Sajangnim Nice Shot</span>
        <span id="git" onclick="redirectToGitHub()">contact-us</span>
        <span id="contact" onclick="location.href='/moveContact'">문의하기</span>
        </footer>
        
    </body>
    <script>
        if (`${message}` !== ``) {alert(`${message}`); }
        if (`${headerHTML}` !== ``) document.querySelector('.header').innerHTML = `${headerHTML}`;
    </script>
