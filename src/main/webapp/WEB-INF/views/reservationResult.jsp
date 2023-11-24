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
<link rel="stylesheet" href="/css/AJW.css" />
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

   		<div id="h3" onclick="location.href='/moveMyPage'">마이페이지로 돌아가기</div>
	   		<table class = "table_style1" id="table1">
	   			<tr></tr>
	        </table>
	  </ul>
      </section>
   </main>
   
   
   <section1>

   
   </section1>
</body>
<script>
        if (`${message}` !== ``) {alert(`${message}`);
        }
        if (`${headerHTML}` !== ``) document.querySelector('.header').innerHTML = `${headerHTML}`;
        
        let rsvDetail = JSON.parse(`${getRsvDetailList}`);
        console.log(rsvDetail);
        
        rsvDetail.forEach((list) => {
            let li = document.createElement('li');
            
                                                                                                                                                             
            li.textContent = list.rsvMemNickname;
            reservation.appendChild(li);
        });
        
        
    </script>
</html>
