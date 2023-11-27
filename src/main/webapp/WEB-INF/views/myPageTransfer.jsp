<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
    <meta charset="UTF-8">
    <title>양도 페이지</title>
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
		    <div onclick="location.href='/moveReservation'">예약</div>
		    <div onclick="location.href='/moveMyPage'">마이페이지</div>
		    <div onclick="location.href='/moveCrawledData'">이벤트</div>
	    </aside>
        <section>
        
        <div class="send-container">
        <input type = "hidden" value = "rsvCode"/>
        <form action="/transferReservation" method="post">
        <input type="hidden" name="rsvCode" value="${rsvCode}">
        <p>예약 코드: ${rsvCode}</p>
        <input type="text" id="transferNickname" name="memNickName" placeholder="양도할 사람을 입력해주세요" pattern="^[A-Za-z]+$" title="공백, 숫자, 특수 문자는 허용되지 않습니다." required>
        <button type="submit">양도</button>
        <p id="error-message" style="color: red; font-size: 10px; margin-top: 7px;"></p>
        <div onclick="location.href='/moveMyPage'">마이페이지로 돌아가기</div>
    </form>
    </div>
        </section>
    </main>
    
</body>

<body>
    

    
</body>
<script>
	if (`${message}` !== ``) {
	    alert(`${message}`);
	}
	if (`${headerHTML}` !== ``) document.querySelector('.header').innerHTML = `${headerHTML}`;

    document.getElementById('transferNickname').addEventListener('input', function (e) {
        var message = '';
        if (!/^[A-Za-z]+$/.test(e.target.value)) {
            message = '공백, 숫자, 특수 문자는 허용되지 않습니다.';
        }
        document.getElementById('error-message').textContent = message;
    });
</script>
    
</html>
