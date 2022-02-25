<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>공지사항</title>
    <link rel="stylesheet" href="noticeWrite.css">
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
        <form method="post" action="writeAction.jsp">
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
                            <dd><input type="text" placeholder="제목 입력" name="noticeTitle" maxlength="50"></dd>
                        </dl>
                    </div>
                    <!--공지사항 내용 입력 부분-->
                    <div class="cont">
                        <textarea placeholder="내용 입력" name="noticeContent" maxlength="2000"></textarea>
                    </div>
                </div>
                <!-- 공지사항 등록과 취소 버튼 부분 -->
                <div class="bt_wrap">
                    <button type="submit" class="on">등록</button>
                    <a href="noticeList.jsp">취소</a>
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