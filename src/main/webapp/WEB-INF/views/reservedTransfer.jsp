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
<link rel="stylesheet" href="/css/KYH.css" />
<script src="/js/KDB.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
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
	    <ul class="list">

	        <form action="/reservedTransfer/${rsvCode}" method="post" >
	            <input id="memNickname" name="memNickname" placeholder="양도자를 입력해주세요" />
	            <button type="submit">양도</button>
	        </form>
	    </ul>
	</section>
	</main>
	<footer>
    <div id="contact" onclick="location.href='/moveContact'">문의하기</div>
    </footer>
</body>
<script>
    	if (`${message}` !== ``) {
    		alert(`${message}`);
    	}
        if (`${headerHTML}` !== ``) document.querySelector('.header').innerHTML = `${headerHTML}`;
        
    </script>
</html>