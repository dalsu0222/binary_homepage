<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="notice.NoticeDAO" %>
<%@ page import="notice.Notice" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html lang="ko">

<head>
  <meta charset="UTF-8">
  <title>binary;</title>
  <link rel="stylesheet" href="noticeList.css">
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
		int pageNumber = 1;
		if(request.getParameter("pageNumber") != null){
			pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
		}
	%>
  <div class="container">
    <header class="header">
      <!-- 상단 로고와 메뉴바 -->
      <h1><a href="../main/main.jsp">binary;</a></h1>
      <div class="nav">
            	<%
            	if(userID == null){
            	%>
                <ul>
                    <li><a href="../login/login.jsp">LOGIN</a></li>
                    <li><a href="../notice/noticeList.jsp" id="now">공지사항</a></li>    
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
                    <li><a href="../notice/noticeList.jsp" id="now">공지사항</a></li>    
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
      <!-- 바디부분 제목과 공지사항 표부분 -->
        <div class="board_title">
          공지사항
        </div>
        <!-- 글쓰기 버튼 -->
        <button><a href="noticeWrite.jsp">글쓰기</a></button>
        <div class="board_list_wrap">
            <div class="board_list">
                <div class="board_list_head">
                    <div class="num">번호</div>
                    <div class="tit">제목</div>
                    <div class="writer">글쓴이</div>
                    <div class="date">작성일</div>
                    <div class="view">조회</div>
                </div>
                
                <div class="board_list_body">
                  <!-- 표 내용 부분 -->
                  	<%
		                NoticeDAO noticeDAO = new NoticeDAO();
		                ArrayList<Notice> list = noticeDAO.getList(pageNumber);
		                for(int i = 0; i < list.size(); i++){
	                %>
                    <div class="item">
                    	<div class="num"><%= list.get(i).getNoticeNum() %></div>
                        <div class="tit"><a href="noticeView.jsp?noticeNum=<%= list.get(i).getNoticeNum() %>"><%= list.get(i).getNoticeTitle() %></a></div>
                        <div class="writer"><%= list.get(i).getUserID() %></div>
                        <div class="date"><%= list.get(i).getNoticeDate().substring(0, 11) %></div>
                        <div class="view"><%= list.get(i).getNoticeNum() %></div>
                    </div>
                    <%
	                }
                    %>
                    
                    
                </div>
               
            </div>
            <div class="paging">
              <!-- 바디 부분 하단 다음페이지, 전 페이지 버튼 부분 -->
              	<%
              		if(pageNumber == 2){
              	%>
              		<a href="noticeList.jsp?pageNumber=1" class="bt first">&lt;&lt;</a>
                	<a href="noticeList.jsp?pageNumber=<%= pageNumber - 1 %>" class="bt prev">&lt;</a>
              		<a href="noticeList.jsp?pageNumber=<%= pageNumber - 1 %>" class="num"><%= pageNumber - 1 %></a>
              	<%		
              		} else if(pageNumber > 2){
              	%>
              		<a href="noticeList.jsp?pageNumber=1" class="bt first">&lt;&lt;</a>
                	<a href="noticeList.jsp?pageNumber=<%= pageNumber - 1 %>" class="bt prev">&lt;</a>
                	<a href="noticeList.jsp?pageNumber=<%= pageNumber - 2 %>" class="num"><%= pageNumber - 2 %></a>
              		<a href="noticeList.jsp?pageNumber=<%= pageNumber - 1 %>" class="num"><%= pageNumber - 1 %></a>
              	<%		
              		}
              	%>
                	<a href="noticeList.jsp?pageNumber=<%= pageNumber %>" class="num on"><%= pageNumber %></a>
                <%
              		if(noticeDAO.nextPage(pageNumber + 2)){
              	%>
              		<a href="noticeList.jsp?pageNumber=<%= pageNumber + 1 %>" class="num"><%= pageNumber + 1 %></a>
                	<a href="noticeList.jsp?pageNumber=<%= pageNumber + 2 %>" class="num"><%= pageNumber + 2 %></a>
	                <a href="noticeList.jsp?pageNumber=<%= pageNumber + 1 %>" class="bt next">&gt;</a>
	                <a href="noticeList.jsp?pageNumber=<%= pageNumber + 2 %>" class="bt last">&gt;&gt;</a>
              	<%		
              		} else if(noticeDAO.nextPage(pageNumber + 1)){
              	%>
              		<a href="noticeList.jsp?pageNumber=<%= pageNumber + 1 %>" class="num"><%= pageNumber + 1 %></a>
	                <a href="noticeList.jsp?pageNumber=<%= pageNumber + 1 %>" class="bt next">&gt;</a>
	                <a href="noticeList.jsp?pageNumber=<%= pageNumber + 1 %>" class="bt last">&gt;&gt;</a>
              	<%		
              		}
              	%>
            </div>
        </div>
  </div>
  </div>
</body>

</html>