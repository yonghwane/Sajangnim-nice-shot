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
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@400;700&display=swap" rel="stylesheet"><link rel="stylesheet" href="/css/reset.css" />
<link rel="stylesheet" href="/css/KDB.css" />
<script src="/js/KDB.js"></script>
<style>
</style>
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
			<div onclick="location.href=''">예약</div>
			<div onclick="location.href='/moveMyPage'">마이페이지</div>
			<div onclick="location.href=''">이벤트</div>
		</aside>

      <section>
      <form action="/reservation/{rsvCode}" method="post" enctype="multipart/form-data">
      <input type="hidden" id="rsvCode" name="rsvCode" />
      <div>Nickname</div>
      <input id="memNickname" name="memNickname" readonly/>
      <div>TIME</div>
      <input id="rsvTime" name="rsvTime" readonly/>
      <div>DATE</div>
      <input id="rsvDate" name="rsvDate" readonly/>
      <div>인원</div>
      <input type="radio" id="rsvCount4" name="rsvCount" value="4" checked />4인
      <input type="radio" id="rsvCount8" name="rsvCount" value="8" />8인
      
      <div>홀</div>
      <input type="radio" id="rsvHole9" name="rsvHole" value="1" checked />〇
      <input type="radio" id="rsvHole18" name="rsvHole" value="2" />×
      <div>캐디</div>
      <input type="radio" id="rsvCaddyo" name="rsvCaddy" value="3" checked />〇
      <input type="radio" id="rsvCaddyx" name="rsvCaddy" value="4" />×
      <div>골프웨어</div>
      <input type="radio" id="rsvClotheso" name="rsvClothes" value="5" checked />〇
      <input type="radio" id="rsvClothesx" name="rsvClothes" value="6" />×
      <div>골프화</div>
      <input type="radio" id="rsvShoeso" name="rsvShoes" value="7" checked />〇
      <input type="radio" id="rsvShoesx" name="rsvShoes" value="8" />×
      <br/>
      <button type="submit">예약</button>
  </form>
      </section>
   </main>
</body>
<script>
        if (`${message}` !== ``) {alert(`${message}`);
        }
        if (`${headerHTML}` !== ``) document.querySelector('.header').innerHTML = `${headerHTML}`;
    
        let rsvDetail = JSON.parse(`${rsvDetail}`);
        console.log(rsvDetail);
        
        const memNickname = document.querySelector('#memNickname');
        const rsvDate = document.querySelector('#rsvDate');
        const rsvTime = document.querySelector('#rsvTime');
        const rsvCode = document.querySelector('#rsvCode');
        
        rsvDetail.forEach((list) => {
        	memNickname.value = list.rsvMemNickname;
        	rsvDate.value = list.rsvDate;
        	rsvTime.value = list.rsvTime;
        	rsvCode.value = list.rsvCode;
        });
        
    </script>
</html>
