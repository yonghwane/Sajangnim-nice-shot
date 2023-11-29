<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="kr">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>myPage</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@400;700&display=swap" rel="stylesheet">
<link rel="stylesheet" href="/css/reset.css" />
<link rel="stylesheet" href="/css/KDB.css" />
<link rel="stylesheet" href="/css/KYH.css" />
<link rel="stylesheet" href="/css/SHS.css" />
<link rel="stylesheet" href="/css/YSY.css" />
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
        <div onclick="location.href=location.href='/moveReservation'">예약</div>
        <div onclick="location.href='/moveMyPage'">마이페이지</div>
        <div onclick="location.href='moveCrawledData'">이벤트</div>
		</aside>

      <section>
   		<div id="h3" onclick="location.href='/moveMyPage'">마이페이지로 돌아가기</div>
	   		<table class = "table_style1" id="table1">
	   			<tr></tr>
	        </table>
	        <br/>
	        <div id="h5">예약이 완료되었습니다.</div>
	        <br/>
	        <br/>
	  </ul>
      </section>
   </main>
   <footer>
   <span id="company">Sajangnim Nice Shot</span>
   <span id="git" onclick="redirectToGitHub()">contact-us</span>
   <span id="contact" onclick="location.href='/moveContact'">문의하기</span>
   </footer>
</body>
<script>
        if (`${message}` !== ``) {alert(`${message}`);
        }
        if (`${headerHTML}` !== ``) document.querySelector('.header').innerHTML = `${headerHTML}`;
        
        let rsvDetail = JSON.parse(`${rsvDetail}`);
        console.log(rsvDetail);
        
        let postType = rsvDetail;
        createTable(); 
        function createTable() {
            const table = document.querySelector('#table1');
            table.innerHTML = `<th class = "th_style">예약번호</th>
            					<th class = "th_style">예약자명</th>
                                <th class = "th_style">예약날짜</th>
                                <th class = "th_style">예약시간</th>
                                <th class = "th_style">인원수</th>`;
                                
            postType.forEach((detail) => {
		const convertedTime = convertTimeFormat(detail.rsvTime); 
                const tr1 = document.createElement('tr');
                tr1.innerHTML =
                    `<td class = "td_style">` + detail.rsvCode + `</td>
                    <td class = "td_style">` + detail.rsvMemNickname + `</td>
                    <td class = "td_style">` + detail.rsvDate + `</td>
                    <td class = "td_style">` + convertedTime + `</td>
                    <td class = "td_style">` + detail.rsvCount+"명" +`</td>`;
                table.appendChild(tr1);
            });
                
            table.innerHTML += `<th class = "th_style">홀</th>
						          <th class = "th_style">캐디</th>
						          <th class = "th_style">골프웨어</th>
						          <th class = "th_style">골프화</th>
						          <th class = "th_style">총가격</th>`;
            		
            
            postType.forEach((detail) => {    
                const tr3 = document.createElement('tr');
                    if (detail.pricesBean && detail.pricesBean.length > 0) {
                        const pricesBean = detail.pricesBean[0];
                        tr3.innerHTML +=
                            `<td class = "td_style">` + pricesBean.priOption1 + "홀" + `</td>
                            <td class = "td_style">` + pricesBean.priOption2 + `</td>
                            <td class = "td_style">` + pricesBean.priOption3 + `</td>
                            <td class = "td_style">` + pricesBean.priOption4 + `</td>
                            <td class = "td_style">` + detail.rsvPrice + "원" + `</td>`;
                    } 
                table.appendChild(tr3);
            });
        
        }
        function convertTimeFormat(inputTime) {
        	  // 입력된 시간 문자열을 'HHmm' 형식에서 'HH:mm' 형식으로 변환
        	  const formattedTime = inputTime.replace(/(\d{2})(\d{2})/, '$1:$2');
        	  // 변환된 시간 문자열에서 시와 분을 추출
        	  const hours = formattedTime.substr(0, 2);
        	  const minutes = formattedTime.substr(3, 2);
        	  // 'HH시 mm분' 형식으로 반환
        	  const result = hours + '시 ' + minutes + '분';
        	  return result;
        	}
        
    </script>
</html>
