<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<!DOCTYPE html>
<html lang="ko">

<head>
  <meta charset="UTF-8">
  <title>binary;</title>
  <link rel="stylesheet" href="prize.css">
  <style>
    header {
      border-bottom: 3px solid green;
    }
  </style>
</head>

<body>
	<%
		String userID = null;
		if(session.getAttribute("userID") != null){
			userID = (String) session.getAttribute("userID");
		}
	%>
	<div class="container">
    <header class="header">
      <h1><a href="../main/main.jsp">binary;</a></h1>
      <div class="nav">
            	<%
            	if(userID == null){
            	%>
                <ul>
                    <li><a href="../login/login.jsp">LOGIN</a></li>
                    <li><a href="#">공지사항</a></li>    
                    <li><a href="../prize/prize.jsp">수상내역</a></li>      
                    <li><a href="../info/info.jsp">동아리 소개</a></li>   
                    <li><a href="#">문의 게시판</a></li>
                    <li><a href="#">활동 게시판</a></li>
                </ul>
                <%
            	} else {
            	%>
				<ul>
                    <li><a href="../login/logoutAction.jsp">LOGOUT</a></li>
                    <li><a href="#">공지사항</a></li>    
                    <li><a href="../prize/prize.jsp">수상내역</a></li>      
                    <li><a href="../info/info.jsp">동아리 소개</a></li>   
                    <li><a href="#">문의 게시판</a></li>
                    <li><a href="#">활동 게시판</a></li>
                </ul>            	
            	<%
            	}
            	%>
     </div>
    </header>
    <div class="wrap">
      <aside id="sidebar">
        <h2>수상내역</h2>
        ▼<br><br>
        <p><a href="#no_1">1. 교내 대회</a><br></p>
        <!-- <p><a href="#no_2">2. 외부 대회</a><br></p> -->
      </aside>
      <section id="contents">
        <br>
        <h2>수상 내역</h2>
        <br>
        <br>
        <img src="../images/award1.jpg" alt="awards" width=60% >
        <p>세종대학교 제 2회 창의융합노마드 융합아이디어 학술제 우수상</p>
        <br>
        <img src="../images/award2.jpg" alt="awards" width=60% >
        <p>세종대학교 제 4회 SW·해커톤 은상</p>
        <br>
        <img src="../images/award3.jpg" alt="awards" width=60% >
        <p>세종대학교 제 5회 SW·해커톤 은상</p>
        <br>
        <img src="../images/award4.jpg" alt="awards" width=60% >
        <p>세종대학교 제 7회 SW·인공지능 해커톤 장려상</p>
        <br>
        <img src="../images/award5.jpg" alt="awards" width=60% >
        <p>세종대학교 창의설계경진대회 최우수상</p>
        <br>
      </section>
      </div>
      <footer id="footer">
        <p>Address : 서울특별시 광진구 능동로 209</p>
        <!-- 푸터 링크 클릭 시 새 창 새 탭으로 이동하여 링크 열기 -->
        <p>Contact us : <a href="https://open.kakao.com/o/sJiqCFKd" target="_blank">https://open.kakao.com/o/sJiqCFKd</a>
        </p>
        <p>Designed by : 신아진, 이은서, 박도성</p>
        <br>
      </footer>
  </div>
</body>

</html>