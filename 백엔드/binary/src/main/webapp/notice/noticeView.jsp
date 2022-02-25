<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="notice.Notice" %>
<%@ page import="notice.NoticeDAO" %>
<%@ page import="user.UserDAO" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>공지사항</title>
    <link rel="stylesheet" href="noticeView.css">
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
		int noticeNum = 0;
		if (request.getParameter("noticeNum") != null){
			noticeNum = Integer.parseInt(request.getParameter("noticeNum"));
		}
		if (noticeNum == 0){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('유효하지 않은 글입니다.')");
			script.println("location.href = 'noticeList.jsp'");
			script.println("</script>");
		}
		Notice notice = new NoticeDAO().getNotice(noticeNum);
		UserDAO userDAO = new UserDAO();
	%>
  <!-- 화면 상단 로고와 메뉴바 -->
    <div class="container">
        <header class="header">
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
        <div class="board_wrap">
            <div class="board_title">
                <!-- 바디부분 제목 -->
                <strong>공지사항</strong>
                <!-- <p>공지사항을 빠르고 정확하게 안내해드립니다.</p> -->
            </div>
            <div class="board_view_wrap">
                <div class="board_view">
                    <div class="title">
                        <!-- 공지사항 글 보이는 제목 부분 -->
                        <%= notice.getNoticeTitle().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>") %>
                    </div>
                    <!-- 글 번호,글쓴이,작성일,조회와 같은 정보 -->
                    <div class="info">
                        <dl>
                            <dt>번호</dt>
                            <dd><%= notice.getNoticeNum() %></dd>
                        </dl>
                        <dl>
                            <dt>글쓴이</dt>
                            <dd><%= userDAO.userName(notice.getUserID()) %></dd>
                        </dl>
                        <dl>
                            <dt>작성일</dt>
                            <dd><%= notice.getNoticeDate().substring(0, 11) %></dd>
                        </dl>
                        <dl>
                            <dt>조회</dt>
                            <dd><%= notice.getNoticeCount()+1 %></dd>
                        </dl>
                    </div>
                    <!-- 공지사항 글쓰는 부분(내용) -->
                    <div class="cont">
                        <%= notice.getNoticeContent().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>") %>
                    </div>
                </div>
                <!-- 공지사항 수정과 목록 버튼(화면 하단) -->
                <div class="bt_wrap">
                    <a href="noticeList.jsp" class="on">목록</a>
                    <%
                    	if(userID != null && userID.equals(notice.getUserID())){
                    %>
                    		<a href="noticeEdit.jsp?noticeNum=<%= noticeNum %>">수정</a>
                    		<a onclick="return confirm('정말로 삭제하시겠습니까?')" href="deleteAction.jsp?noticeNum=<%= noticeNum %>">삭제</a>
                    <%
                    	}
                    %>
                </div>
            </div>
        </div>
    </div>
    <!-- 화면 맨 아래 하단 푸터부분(5-1과 동일) -->
    <footer id="footer">
        <p>Address : 서울특별시 광진구 능동로 209</p>
        <!-- 푸터 링크 클릭 시 새 창 새 탭으로 이동하여 링크 열기 -->
        <p>Contact us : <a href="https://open.kakao.com/o/sJiqCFKd" target="_blank">https://open.kakao.com/o/sJiqCFKd</a>
        </p>
        <p>Designed by : 신아진, 이은서, 박도성</p>
        <br>
      </footer>
</body>
</html>