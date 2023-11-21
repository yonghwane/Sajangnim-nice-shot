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
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
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

	        <form action="/reservedTransfer/${rsvCode}" method="post" >
	            <input id="memNickname" name="memNickname" placeholder="양도자를 입력해주세요" />
	            <button type="submit">양도</button>
	        </form>
	    </ul>
	</section>
	</main>
</body>
<script>
    	if (`${message}` !== ``) {
    		alert(`${message}`);
    	}
        if (`${headerHTML}` !== ``) document.querySelector('.header').innerHTML = `${headerHTML}`;
        
    </script>
</html>