<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html lang="kr">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>board</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@400;700&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="/css/reset.css" />
        <link rel="stylesheet" href="/css/KDB.css" />
        <link rel="stylesheet" href="/css/KYH.css" />
        <link rel="stylesheet" href="/css/YSY.css" />
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
                <div class="layout">
                    <div class="right-side">

                        <form id="contact-form" class="modern-form">
                            <h2>문의하기</h2>
                            <input type="hidden" name="contact_number">
                            
                            <label for="user_name" class="form-label">성함</label>
                            <input type="text" name="user_name" id="user_name" class="form-input" required>
                    
                            <label for="user_phone" class="form-label">휴대폰 번호</label>
                            <input type="text" name="user_phone" id="user_phone" class="form-input" required>
                    
                            <label for="user_email" class="form-label">이메일</label>
                            <input type="email" name="user_email" id="user_email" class="form-input" required>
                    
                            <label for="message" class="form-label">문의내용</label>
                            <textarea name="message" id="message" class="form-input form-textarea" rows="4" required></textarea>
                    
                            <input type="submit" value="Send" class="form-submit">
                        </form>
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
        document.getElementById('contact-form').addEventListener('submit', function(event) {
            event.preventDefault();

            emailjs.sendForm('YOUR_SERVICE_ID', 'YOUR_TEMPLATE_ID', this)
                .then(function() {
                    console.log('Email successfully sent!');
                })
                .catch(function(error) {
                    console.error('Error occurred:', error);
                });
        });
    </script>
    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/@emailjs/browser@3/dist/email.min.js"></script>
    <script type="text/javascript">
        (function() {
            emailjs.init('-X6fnyvQelDfi74gS');
        })();
    </script>
    <script type="text/javascript">
        window.onload = function() {
            document.getElementById('contact-form').addEventListener('submit', function(event) {
                event.preventDefault();
                this.contact_number.value = Math.random() * 100000 | 0;
                emailjs.sendForm('service_gvf4jd7', 'template_z8t4e64', this)
                    .then(function() {
                        console.log('SUCCESS!');
                    }, function(error) {
                        console.log('FAILED...', error);
                    });
            });
        }
    </script>
