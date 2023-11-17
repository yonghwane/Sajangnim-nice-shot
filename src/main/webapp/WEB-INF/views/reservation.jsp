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
        <script src="/js/fullcalendar-6.1.9/examples/month-view.js"></script>
        <script src='/js/fullcalendar-6.1.9/dist/index.global.min.js'></script>
        	
        
        <script>
        document.addEventListener('DOMContentLoaded', function() {
        	  var calendarEl = document.getElementById('calendar');

        	  var calendar = new FullCalendar.Calendar(calendarEl, {
        	    initialDate: '2023-01-12',
        	    editable: true,
        	    selectable: true,
        	    businessHours: true,
        	    dayMaxEvents: true, // allow "more" link when too many events
        	    
//        	 select: function(arg) {
//              	  eventClick: function(arg) {
//          	    	  // 있는 일정 클릭시,
//          	    	  console.log("#등록된 일정 클릭#");
//          	    	  console.log(arg.event);
//          	    	  
//          	        if (confirm('Are you sure you want to delete this event?')) {
//          	          arg.event.remove()
//          	        }
//          	      }
//        	    }
        	    
        	    events: [
        	      {
        	        title: '양송이 집에 가는 날',
        	        start: '2023-01-01'
        	      },
        	      {
        	        title: 'Click for Google',
        	        url: 'http://google.com/',
        	        start: '2023-01-28'
        	      }
        	    ]
        	  });
        	  
        	  calendar.render();
        	});

        	</script>
    	<style>

    	body {
    	  margin: 40px 10px;
    	  padding: 0;
    	  font-family: Arial, Helvetica Neue, Helvetica, sans-serif;
    	  font-size: 14px;
    	}

    	#calendar {
    	  max-width: 1100px;
    	  margin: 0 auto;
    	}

    	</style>
    	
    </head>

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
        <div id='calendar'></div>
        
    </body>
    <script>
        if (`${message}` !== ``) alert(`${message}`);
        if (`${headerHTML}` !== ``) document.querySelector('.header').innerHTML = `${headerHTML}`;
    </script>
    </html>
