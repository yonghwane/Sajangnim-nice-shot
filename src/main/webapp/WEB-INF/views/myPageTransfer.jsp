<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
    <meta charset="UTF-8">
    <title>양도 페이지</title>
    <link rel="stylesheet" href="/css/reset.css" />
    <link rel="stylesheet" href="/css/KDB.css" />
    <script src="/js/KDB.js"></script>
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
            <h2>양도 페이지</h2>
    <p>예약 정보: ${getRsvList}</p>
    <p>예약 코드: ${rsvCode}</p>
    <input type = "hidden" value = "rsvCode"/>
    <form action="/transferReservation" method="post">
        <input type="hidden" name="rsvCode" value="${rsvCode}">
        <label for="transferNickname">양도할 닉네임:</label>
        <input type="text" id="transferNickname" name="memNickName" pattern="^[A-Za-z]+$" title="공백, 숫자, 특수 문자는 허용되지 않습니다." required>
        <button type="submit">양도</button>
        <p id="error-message" style="color: red; font-size: 10px; margin-top: 7px;"></p>
    </form>
        </section>
    </main>
    
</body>

<body>
    

    
</body>
<script>
    document.getElementById('transferNickname').addEventListener('input', function (e) {
        var message = '';
        if (!/^[A-Za-z]+$/.test(e.target.value)) {
            message = '공백, 숫자, 특수 문자는 허용되지 않습니다.';
        }
        document.getElementById('error-message').textContent = message;
    });
</script>
    
</html>
