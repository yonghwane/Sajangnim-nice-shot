
<html>
<head>
  <title>FullCalendar</title>
  // FullCalendar Core Styles
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/fullcalendar@3.10.2/dist/fullcalendar.min.css" />

  // jQuery
  <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>

  // Moment.js 
  <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>

  // FullCalendar Core Script
  <script src="https://cdn.jsdelivr.net/npm/fullcalendar@3.10.2/dist/fullcalendar.min.js"></script>
</head>
<body>
  <div id="calendar"></div>

  // FullCalendar 초기화 스크립트
  <script src="main1.jsp"></script>
</body>

</html>

function main1() {
    const form = document.createElement('form')
    document.body.appendChild(form)
    form.method = 'post'
    form.action = '/main1'
    //const memNickname = document.querySelector('#memNickname')
    //form.appendChild(memNickname)
    //form.submit()
}