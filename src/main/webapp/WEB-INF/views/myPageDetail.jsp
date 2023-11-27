<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="kr">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>myPageDetail</title>
<link rel="stylesheet" href="/css/reset.css" />
<link rel="stylesheet" href="/css/KDB.css" />
<link rel="stylesheet" href="/css/KYH.css" />
<link rel="stylesheet" href="/css/SHS.css" />
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
      <div id="h3">마이페이지</div>
      <hr>
         <div id="table1">
         </div>
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
            table.innerHTML = `
        <div class="row header">
            <div class="cell">예약번호</div>
            <div class="cell">예약자명</div>
            <div class="cell">예약날짜</div>
            <div class="cell">예약시간</div>
            <div class="cell">인원수</div>
        </div>`;
                                
            postType.forEach((detail) => {
                const tr1 = document.createElement('div');
                tr1.innerHTML =
                    `<div class="row body">
                    <div class="cell">` + detail.rsvCode + `</div>
                    <div class="cell">` + detail.rsvMemNickname + `</div>
                    <div class="cell">` + detail.rsvDate + `</div>
                    <div class="cell">` + detail.rsvTime + `</div>
                    <div class="cell">` + detail.rsvCount+ `</div>
                    </div>`;
                table.appendChild(tr1);
            });
                
            table.innerHTML += `<div class="row header">
            <div class="cell">HOLE</div>
            <div class="cell">CADDY</div>
            <div class="cell">CLOTHES</div>
            <div class="cell">SHOES</div>
            <div class="cell">총가격</div>
        </div>`;
            		
            
        postType.forEach((detail) => {    
    const tr3 = document.createElement('div');
    tr3.className = 'row';
    if (detail.pricesBean && detail.pricesBean.length > 0) {
        const pricesBean = detail.pricesBean[0];
        tr3.innerHTML +=
            `<div class="row body">
            <div class="cell">` + pricesBean.priOption1 + "홀" + `</div>
            <div class="cell">` + pricesBean.priOption2 + `</div>
            <div class="cell">` + pricesBean.priOption3 + `</div>
            <div class="cell">` + pricesBean.priOption4 + `</div>
            <div class="cell">` + detail.rsvPrice + "원" + `</div>
            </div>`;
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
                            `<td class = "td_style">` + pricesBean.priPrice1 + "원" + `</td>`;
                    } 
                table.appendChild(tr4);
                
                const tr5 = document.createElement('tr');
                if (detail.pricesBean && detail.pricesBean.length > 0) {
                    const pricesBean = detail.pricesBean[0];
                    tr5.innerHTML +=
                        `<th class = "th_style1">` + "캐디 " + `</th><td class = "td_style1">` + pricesBean.priOption2 + `</td>` + 
                        `<td class = "td_style">` + pricesBean.priPrice2 + "원" +  `</td>`;
                } 
                table.appendChild(tr5);
            
	            const tr6 = document.createElement('tr');
	            if (detail.pricesBean && detail.pricesBean.length > 0) {
	                const pricesBean = detail.pricesBean[0];
	                tr6.innerHTML +=
	                    `<th class = "th_style1">` + "골프웨어 " + `</th><td class = "td_style1">` + pricesBean.priOption3 + `</td>` 
	                    + `<td class = "td_style">` + pricesBean.priPrice3 + "원" +  `</td>`;
	            } 
	            table.appendChild(tr6);
	        
		        const tr7 = document.createElement('tr');
		        if (detail.pricesBean && detail.pricesBean.length > 0) {
		            const pricesBean = detail.pricesBean[0];
		            tr7.innerHTML +=
		                `<th class = "th_style1">` + "골프신발 " + `</th><td class = "td_style1">` + pricesBean.priOption4 + `</td>` + 
		                `<td class = "td_style">` + pricesBean.priPrice4 + "원" +  `</td>`;
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
    </script>
</html>