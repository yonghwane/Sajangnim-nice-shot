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
          	
          	
          	<input type = "submit">
       </fieldset>
    </form:form>
    
    
    <script>
        if (`${message}` !== ``) alert(`${message}`);
        if (`${headerHTML}` !== ``) document.querySelector('.header').innerHTML = `${headerHTML}`;
    </script>

    </html>