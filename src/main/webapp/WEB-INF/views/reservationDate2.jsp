<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html lang="kr">

    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>board</title>
        <link rel="stylesheet" href="/css/reset.css" />
        <link rel="stylesheet" href="/css/KDB.css" />
        <script src="/js/KDB.js"></script>
        <script src="/js/YSY.js"></script>
    </head>

    <script>
	

</script>
<body>
    <header class="header">
        <h1 onclick="location.href='/'">SNP</h1>
        <div>
            <input id="memNickname" name="memNickname" placeholder="ニックネーム" />
            <button onclick="login()">ログイン</button>
        </div>
    </header>
    <br>
    <br>
    <br>
    <br>
    <form  action="/reservationDate" id="reserveForm" method="post">
       <fieldset>
          <label for="selectDate">date</label>
          <input type="date" name="rsvDate" path="selectDate" id="selectDate" required><br>
          <label for="selectTime" id="tiTime">시간 선택 : </label>
          <select path="timeStr" id="selectTime" name="rsvTime" required>

	       <div>인원</div>
		       <input type="radio" id="rsvCount4" name="rsvCount" value="4" checked />4인
		       <input type="radio" id="rsvCount8" name="rsvCount" value="8" />8인
	       <div>홀</div>
		       <input type="radio" id="rsvHole9" name="rsvHole" value="1" checked />9홀
		       <input type="radio" id="rsvHole18" name="rsvHole" value="2" />18홀
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
	   </fieldset> 
    </form:form>
    
    
    <script>
        if (`${message}` !== ``) alert(`${message}`);
        if (`${headerHTML}` !== ``) document.querySelector('.header').innerHTML = `${headerHTML}`;
    </script>

    </html>