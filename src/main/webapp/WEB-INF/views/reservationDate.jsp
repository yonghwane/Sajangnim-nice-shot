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
//    <form id="moveReservation" method="post" action="/reservationDate">
//       <fieldset>
//          <label for="checkDate" id="tiDate">date</label>
//          <input type="date" path="selectDate" id="selectDate" required><br>
//          
//          
//          <label for="selectTime" id="tiTime">시간 선택 : </label>
//          <select path="timeStr" id="timeStr" required>
//          	
//          	
//          	<input type = "submit" value = "submit" onclick="location.href='reservationAgree'">
//       </fieldset>
//    </form>
    <form action="/reservationDate" id="reserveForm" method="POST">
    <fieldset>
       <label for = "selectDate">날짜</label>
       <input type="date" id="selectDate" name="rsvDate" required><br>
       
       
       <label for = "selectTime">시간 선택 : </label>
       <select id = "selectTime" name="rsvTime" required>
       	<option value = "0700">7시 00분</option>
       	<option value = "0707">7시 07분</option>
       	<option value = "0714">7시 14분</option>
       	</select>
       	<button type="submit">제출</button>
    </fieldset>
 </form:form>
    
    <script>
        if (`${message}` !== ``) alert(`${message}`);
        if (`${headerHTML}` !== ``) document.querySelector('.header').innerHTML = `${headerHTML}`;
    </script>

    </html>