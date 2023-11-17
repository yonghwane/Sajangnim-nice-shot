<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="kr">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>myPage</title>
<link rel="stylesheet" href="/css/reset.css" />
<link rel="stylesheet" href="/css/KDB.css" />
<link rel="stylesheet" href="/css/SHS.css" />
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
         <table class = "table_style">
            <tr></tr>
         </table>
         <br/>
         <br/>
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
            const table = document.querySelector('table');
            table.innerHTML = `<th class = "th_style">예약자명</th>
                                <th class = "th_style">예약날짜</th>
                                <th class = "th_style">예약시간</th>
                                <th class = "th_style">인원수</th>
                                <th class = "th_style">총가격</th>
                                <th class = "th_style">HOLE</th>
                                <th class = "th_style">CADDY</th>
                                <th class = "th_style">CLOTHES</th>
                                <th class = "th_style">SHOES</th>`;
            postType.forEach((detail) => {
                const tr = document.createElement('tr');
                tr.innerHTML =
                    `<td class = "td_style">` + detail.rsvMemNickname + `</td>
                    <td class = "td_style">` + detail.rsvDate + `</td>
                    <td class = "td_style">` + detail.rsvTime + `</td>
                    <td class = "td_style">` + detail.rsvCount + `</td>
                    <td class = "td_style">` + detail.rsvPrice + `</td>`;
                    if (detail.pricesBean && detail.pricesBean.length > 0) {
                        const pricesBean = detail.pricesBean[0];
                        tr.innerHTML +=
                            `<td class = "td_style">` + pricesBean.priOption1 + `</td>
                            <td class = "td_style">` + pricesBean.priOption2 + `</td>
                            <td class = "td_style">` + pricesBean.priOption3 + `</td>
                            <td class = "td_style">` + pricesBean.priOption4 + `</td>`;
                    } 
                table.appendChild(tr);
            });
        }
        
//        [{"rsvCode":"44","rsvMemNickname":"kwon","rsvTime":"1207","rsvCount":"8","rsvPrice":"15000","pricesBean":[{"priOption1":"18","priOption2":"CADDY〇","priOption3":"CLOTHES×","priOption4":"SHOES×"}]}]
    </script>
</html>