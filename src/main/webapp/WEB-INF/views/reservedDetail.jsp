<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="kr">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>myPage</title>
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
		<div onclick="location.href='/moveMyPage'">마이페이지로 돌아가기</div>
			<table>
				<tr></tr>
			</table>
		</section>
	</main>
</body>
<script>
        if (`${message}` !== ``) {
            alert(`${message}`);
            window.location.href = '/';
        }
        if (`${headerHTML}` !== ``) document.querySelector('.header').innerHTML = `${headerHTML}`;
        
        console.log(`${getReservationDetail}`);
        const getReservationDetail = JSON.parse(`${getReservationDetail}`);
        
        let postType = getReservationDetail;
        createTable();
//     [{"rsvCode":"2","rsvMemNickname":"kwon","rsvDate":"2023-11-10","rsvTime":"1207","rsvCount":"8","rsvHole":"1 ","rsvCaddy":"3","rsvClothes":"5","rsvShoes":"7","rsvStatus":"F","rsvPrice":"15000",
//     "pricesBean":[{"priOption1":"9","priOption2":"〇","priOption3":"〇","priOption4":"〇","priPrice1":"5000","priPrice2":"5000","priPrice3":"3000","priPrice4":"2000"}]}]
        function createTable() {
            const table = document.querySelector('table');
            table.innerHTML = `<th>예약자명</th>
                                <th>예약날짜</th>
                                <th>예약시간</th>
                                <th>인원수</th>
                                <th>총가격</th>
                                <th>HOLE</th>
                                <th>CADDY</th>
                                <th>CLOTHES</th>
                                <th>SHOES</th>`;
            postType.forEach((detail) => {
                const tr = document.createElement('tr');
                tr.innerHTML =
                    `<td>` + detail.rsvMemNickname + `</td>
                    <td>` + detail.rsvDate + `</td>
                    <td>` + detail.rsvTime + `</td>
                    <td>` + detail.rsvCount + `</td>
                    <td>` + detail.rsvPrice + `</td>`;
                    if (detail.pricesBean && detail.pricesBean.length > 0) {
                        const pricesBean = detail.pricesBean[0];
                        tr.innerHTML +=
                            `<td>` + pricesBean.priOption1 + `</td>
                            <td>` + pricesBean.priOption2 + `</td>
                            <td>` + pricesBean.priOption3 + `</td>
                            <td>` + pricesBean.priOption4 + `</td>`;
                    } 
                table.appendChild(tr);
            });
        }
        

    </script>
</html>
