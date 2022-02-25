<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="notice.Notice" %>
<%@ page import="notice.NoticeDAO" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>공지사항</title>
    <link rel="stylesheet" href="noticeEdit.css">
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
		if (userID == null){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인이 필요합니다.')");
			script.println("history.back()");
			script.println("</script>");
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
		if(!userID.equals(notice.getUserID())){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('권한이 없습니다.')");
			script.println("location.href = 'noticeList.jsp'");
			script.println("</script>");
		}
	%>
  <!-- 화면 상단 로고와 메뉴바 -->
    <div class="container">
        <header class="header">
            <h1><a href="../main/main.jsp">binary;</a></h1>
            <div class="nav">
				<ul>
                    <li><a href="../login/logoutAction.jsp">LOGOUT</a></li>
                    <li><a href="../notice/noticeList.jsp" id="now">공지사항</a></li>    
                    <li><a href="../prize/prize.jsp">수상내역</a></li>      
                    <li><a href="../info/info.jsp">동아리 소개</a></li>   
                    <li><a href="#">문의 게시판</a></li>
                    <li><a href="#">활동 게시판</a></li>
                </ul>
            </div>
        </header>
        <form method="post" action="editAction.jsp?noticeNum=<%= notice.getNoticeNum() %>">
        <div class="board_wrap">
            <div class="board_title">
               <!-- 바디부분 제목 -->
                <strong>공지사항</strong>
                <!-- <p>공지사항을 빠르고 정확하게 안내해드립니다.</p> -->
            </div>
            <div class="board_write_wrap">
            <div class="board_write">
                <div class="title">
                    <dl>
                      <!--공지사항 제목 입력 부분 -->
                        <dt>제목</dt> 
                        <dd><input type="text" placeholder="제목 입력" value="<%= notice.getNoticeTitle() %>" name="noticeTitle"></dd>
                    </dl>
                </div>
                <div class="cont">
                  <!--공지사항 내용(수정) 입력 부분-->
                    <textarea placeholder="내용 입력" name="noticeContent"><%= notice.getNoticeContent() %></textarea>
                </div>
            </div>
            <!-- 공지사항 수정과 취소 버튼 부분 -->
            <div class="bt_wrap">
                <button type="submit" class="on">수정</button>
                <a href="noticeView.jsp?noticeNum=<%= notice.getNoticeNum() %>">취소</a>
            </div>
        </div>
        </div>
        </form>
    </div>
    <!-- 화면 아래 푸터 부분 -->
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