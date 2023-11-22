<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="kr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>예약</title>
    <link rel="stylesheet" href="/css/KDB.css" />
    <script src="/js/KDB.js"></script>
</head>
<body>

<h1>예약</h1>

<form action ="/bookPage" method="get">
인원        <input type="radio" name="rsvCount" value="4" checked="checked" />4인   
           <input type="radio" name="rsvCount" value="8" />8인   

<br>
코스       <input type="radio" name="rsvHole" value="1" checked="checked" />9홀  
           <input type="radio" name="rsvHole" value="2" />18홀  

<br>
캐디       <input type="radio" name="rsvCaddy" value="3" checked="checked" /> 유
           <input type="radio" name="rsvCaddy" value="4" /> 무

<h1>옵션</h1>
골프세트  <input type="radio" name="rsvClothes" value="5" checked="checked" /> 선택
         <input type="radio" name="rsvClothes" value="6"/> 선택안함

<br>
골프슈즈 <input type="radio" name="rsvShoes" value="7" checked="checked"/> 선택
       <input type="radio" name="rsvShoes" value="8"/> 선택안함

       <br>
       <br>
       <br>
       <input type="submit" value="예약확정">
     </body>
</html> 