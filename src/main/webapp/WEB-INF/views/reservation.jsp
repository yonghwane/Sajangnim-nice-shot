<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html lang="kr">

    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>board</title>
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@400;700&display=swap" rel="stylesheet"><link rel="stylesheet" href="/css/reset.css" />
        <link rel="stylesheet" href="/css/reset.css" />
        <link rel="stylesheet" href="/css/KDB.css" />
        <link rel="stylesheet" href="/css/KYH.css" />
        <script src="/js/KDB.js"></script>
        <script src="/js/YSY.js"></script>

        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>

    </head>

    <script>


    </script>

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
                <form action="/reservation" id="reserveForm" method="post">
                	<div id="h3" onclick="location.href='/moveMyPage'">예약</div>
                    <fieldset>
                            <table class = "table">
                            	<thead>
                            	<tr style="width: 20%">
	                              <th style="width: 20%">날짜 선택</th>
	                              <td style="width: 20%">
	                              	<label for="selectDate"></label>
	                              	<input type="date" name="rsvDate" path="selectDate" id="selectDate" required><br>
	                              </td>
	                              <td></td>
	                            </tr>
	                            <tr>
	                            	<th style="width: 10%">시간 선택</th>
	                              <td style="width: 20%">
	                              	<label for="selectTime" id="tiTime"></label>
	                              	<select path="timeStr" id="selectTime" name="rsvTime" required></select>
	                              </td> 
	                              <td></td>
	                            </tr>
                            	</thead>
	                            <tbody>
		                            <tr>
		                              <th style="width: 10%">인원</th>
		                              <td style="width: 5%">4인
		                              	<input type="radio" id="rsvCount4" name="rsvCount" value="4" checked />
		                              </td> 
		                              <td style="width: 20%">8인
		                              <input type="radio" id="rsvCount8" name="rsvCount" value="8" />
		                              </td> 
		                            </tr>
		                            
		                            <tr>
		                            <th scope="row">홀</th>
		                            <td>9홀
		                            	<input type="radio" id="rsvHole9" name="rsvHole" value="1" checked />
		                            </td> 
		                            <td>18홀
		                            	<input type="radio" id="rsvHole18" name="rsvHole" value="2" />
		                            </td> 
		                            </tr>

		                            <tr>
		                              <th scope="row">캐디</th>
		                              <td>유
		                              	<input type="radio" id="rsvCaddyo" name="rsvCaddy" value="3" checked />
		                              </td> 
		                              <td>무
		                              	<input type="radio" id="rsvCaddyx" name="rsvCaddy" value="4" />
		                              </td> 
		                            </tr>

		                            <tr>
		                              <th scope="row">골프웨어</th>
		                              <td>유
		                              	<input type="radio" id="rsvClotheso" name="rsvClothes" value="5" checked />
		                              </td> 
		                              <td>무
		                              <input type="radio" id="rsvClothesx" name="rsvClothes" value="6" />
		                              </td> 
		                            </tr>

		                            <tr>
		                              <th scope="row">골프화</th>
		                              <td>유
		                              	<input type="radio" id="rsvShoeso" name="rsvShoes" value="7" checked />
		                              </td> 
		                              <td>무
		                              <input type="radio" id="rsvShoesx" name="rsvShoes" value="8" />
		                              </td> 
		                            </tr>
                            
                            </table>
                            <br>
                            <button type="submit" class="btn btn-outline-primary">예약</button>
                    </fieldset>
                    </form:form>
            </section>
        </main>
        <footer>
        <div id="contact" onclick="location.href='/moveContact'">문의하기</div>
        </footer>
    </body>

    <script>
        if (`${message}` !== ``) alert(`${message}`);
        if (`${headerHTML}` !== ``) document.querySelector('.header').innerHTML = `${headerHTML}`;
    </script>

    </html>