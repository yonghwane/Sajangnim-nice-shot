<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="kr">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>myPageDetail</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@400;700&display=swap" rel="stylesheet">
<link rel="stylesheet" href="/css/reset.css" />
<link rel="stylesheet" href="/css/KDB.css" />
<link rel="stylesheet" href="/css/SHS.css" />
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
      <div id="h3h3">마이페이지</div>
      <hr>
         <table class = "table_style1" id="table1">
            <tr></tr>
         </table>
         <br/>
         <table class = "table_style2" id="table2">
         	<tr></tr>
         </table>
         	<h3 id ="price"></h3>
      <br/>
      <hr>
      <br/>
         <div id="reservation">
         	<input type="button" value="양도" onclick="redirectToMoveMyPageTransfer('${rsvCode}')"/>
         	<input type = "button" value = "삭제" onclick="removeandredirect('${rsvCode}')"/>
         	<br/>
         	<br/>
         	<div onclick="location.href='/moveMyPage'">마이페이지로 돌아가기</div>
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
        if (`${message}` !== ``) {
            alert(`${message}`);
            window.location.href = '/';
        }
        if (`${headerHTML}` !== ``) document.querySelector('.header').innerHTML = `${headerHTML}`;

        console.log(`${getRsvDetailList}`);
        const getReservationDetail = JSON.parse(`${getRsvDetailList}`);
        
        let postType = getReservationDetail;
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
            	console.log(convertedTime);
                const tr1 = document.createElement('tr');
                tr1.innerHTML =
                    `<td class = "td_style">` + detail.rsvCode + `</td>
                    <td class = "td_style">` + detail.rsvMemNickname + `</td>
                    <td class = "td_style">` + detail.rsvDate + `</td>
                    <td class = "td_style">` + convertedTime + `</td>
                    <td class = "td_style">` + detail.rsvCount+ "명" +`</td>`;
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
            const price = document.querySelector('#price');
            		postType.forEach((detail) => {
	                price.innerHTML =
	                    `<h3>` + "총 " + detail.rsvPrice + "원" + `</h3>` ;
            });
         createTable2();   
        }
        
        //[{"rsvCode":"44","rsvMemNickname":"kwon","rsvTime":"1207","rsvCount":"8","rsvPrice":"15000","pricesBean":[{"priOption1":"18","priOption2":"CADDY〇","priOption3":"CLOTHES×","priOption4":"SHOES×"}]}]
        
        function createTable2() {
        	const table = document.querySelector('#table2');
            table.innerHTML = `<th class = "th_style2" colspan = "3">명세서</th>`;
            postType.forEach((detail) => {    
                const tr4 = document.createElement('tr');
                    if (detail.pricesBean && detail.pricesBean.length > 0) {
                        const pricesBean = detail.pricesBean[0];
                        tr4.innerHTML +=
                            `<th class = "th_style1">` + pricesBean.priOption1 + "홀"　+ `</th><td class = "td_style1">` + `</td>` +
                            `<td class = "td_style2">` + pricesBean.priPrice1 + "원" + `</td>`;
                    } 
                table.appendChild(tr4);
                
                const tr5 = document.createElement('tr');
                if (detail.pricesBean && detail.pricesBean.length > 0) {
                    const pricesBean = detail.pricesBean[0];
                    tr5.innerHTML +=
                        `<th class = "th_style1">` + "캐디 " + `</th><td class = "td_style1">` + pricesBean.priOption2 + `</td>` + 
                        `<td class = "td_style2">` + pricesBean.priPrice2 + "원" +  `</td>`;
                } 
                table.appendChild(tr5);
            
	            const tr6 = document.createElement('tr');
	            if (detail.pricesBean && detail.pricesBean.length > 0) {
	                const pricesBean = detail.pricesBean[0];
	                tr6.innerHTML +=
	                    `<th class = "th_style1">` + "골프웨어 " + `</th><td class = "td_style1">` + pricesBean.priOption3 + `</td>` 
	                    + `<td class = "td_style2">` + pricesBean.priPrice3 + "원" +  `</td>`;
	            } 
	            table.appendChild(tr6);
	        
		        const tr7 = document.createElement('tr');
		        if (detail.pricesBean && detail.pricesBean.length > 0) {
		            const pricesBean = detail.pricesBean[0];
		            tr7.innerHTML +=
		                `<th class = "th_style1">` + "골프화화" + `</th><td class = "td_style1">` + pricesBean.priOption4 + `</td>` + 
		                `<td class = "td_style2">` + pricesBean.priPrice4 + "원" +  `</td>`;
		        } 
		        table.appendChild(tr7);
	            });				
        }       
        
        function redirectToMoveMyPageTransfer(rsvCode) {
        	location.href = '../moveMyPageTransfer/' + rsvCode;
        }
        
        function removeandredirect(rsvCode) { // 프론트 서버로 요청 보내고, 서버에서 처리 후 json형식으로 반환, delete함수에 그 값을 전달
        	const isConfirmed = confirm("예약을 삭제하시겠습니까?");
        	if (isConfirmed) {
        		window.location.href = "/moveMyPage";
        		postAjaxJson('/removeReservation', '&rsvCode=' + rsvCode, 'deleteReservation')
        		getRsvList = getRsvList.filter(list => list.rsvCode !== rsvCode);
        	} else {
        		alert("삭제 취소");
        	}
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
