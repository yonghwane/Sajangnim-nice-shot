<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Crawled Data</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@400;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="/css/reset.css" />
    <link rel="stylesheet" href="/css/KDB.css" />
    <link rel="stylesheet" href="/css/KYH.css" />
    <link rel="stylesheet" href="/css/YSY.css" />
    <script src="/js/KDB.js"></script>
    <style>
#container {
    width: 80%;
    margin: 0 auto;
    padding: 10px;
    background-color: #f8f8f8;
    border-radius: 5px;
    box-shadow: 0 2px 5px rgba(0, 0, 0, 0.15);
    text-align: left;
    display: flex;
    flex-direction: column;
    overflow-y:scroll; 
    height:500px;
}
.banner-box {
    display: flex; 
    align-items: center; 
    justify-content: center; 
    background-color: rgb(0, 0, 64); 
    padding: 20px;
    padding-bottom: 30px;
    height: 100px; 
}

.banner-box h2 {
        font-size: 2em; 
        color: white; 
        font-family: 'Nanum Gothic', sans-serif;
        padding-top: 20px;
}
.newsDiv {
    border-bottom: 1px solid rgb(12, 12, 12);
    padding: 10px;
    font-family: 'San Francisco', sans-serif; 
    font-size: 16px; 
    line-height: 1.5; 
}

.title-div {
    border-bottom: 1px solid rgb(0, 0, 64); 
    padding: 10px 0; 
    font-family: 'San Francisco', sans-serif;
    font-size: 13px; 
    font-weight: bold; 
}
.title {
    color: rgb(0, 0, 64); 
    margin-bottom: 13px;
}
.titleP:hover {
    color: blue; 
}
.span-div {
    display: flex;
    justify-content: space-between;
}
.date, .type span{
    font-size: 10px; 
}
.date {
    color: gray;
}

    </style>
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
        <div onclick="location.href=location.href='/moveReservation'">예약</div>
        <div onclick="location.href='/moveMyPage'">마이페이지</div>
        <div onclick="location.href='moveCrawledData'">이벤트</div>
        </aside>
        <section>
        <div id="container">
        <div class="banner-box"> 
            <h2>일본 JGA's Pikcup</h2>
        </div>
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
    	}
        if (`${headerHTML}` !== ``) document.querySelector('.header').innerHTML = `${headerHTML}`;
        
    let newsTitles = JSON.parse(`${newsTitles}`);
    let newsDatesAll = JSON.parse(`${newsDates}`);
    let newsTypesAll = JSON.parse(`${newsTypes}`);
    let hrefValues = JSON.parse(`${hrefValues}`);

    let printevent = () => {
    let container = document.getElementById('container');

    newsTitles.forEach((title, i) => {
        let newsDiv = document.createElement('div');
        newsDiv.className = "title-div";
        let titleP = document.createElement('p');
        titleP.className = "title";
        let spanDiv = document.createElement('div');
        spanDiv.className = "span-div"
        let typeP = document.createElement('span');
        typeP.className = "type"; 
        let dateP = document.createElement('span');
        dateP.className = "date";
        
        titleP.textContent = newsTitles[i];
        typeP.textContent = newsTypesAll[i];
        dateP.textContent = newsDatesAll[i];

        spanDiv.appendChild(typeP); 
        spanDiv.appendChild(dateP); 


        newsDiv.appendChild(titleP);
        newsDiv.appendChild(spanDiv);
        titleP.addEventListener('mouseover', () => {
            titleP.style.cursor = "pointer";
            titleP.style.color = "blue";
        });
        titleP.addEventListener('mouseout', function() {
        this.style.color = 'rgb(0, 0, 64)'; // 마우스가 요소 밖으로 나갔을 때 원래 색상으로 복원
        });
        titleP.addEventListener('click', () => {
        window.open('http://www.jga.or.jp/jga/jsp/' + hrefValues[i], '_blank');
    });
        
        container.appendChild(newsDiv);
    });
}

    printevent();
</script>
</html>
