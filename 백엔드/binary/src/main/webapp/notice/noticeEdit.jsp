<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
  <!-- 화면 상단 로고와 메뉴바 -->
    <div class="container">
        <header class="header">
            <h1><a href=".\index.html">binary;</a></h1>
            <div class="nav">
            <ul>
                <li><a href="index4.html">LOGIN</a></li>
                <li><a href="index5.html" id="now">공지사항</a></li>
                <li><a href="index2.html">수상내역</a></li>
                <li><a href="index1.html" >동아리 소개</a></li>
                <li><a href="#">문의 게시판</a></li>
                <li><a href="#">활동 게시판</a></li>
            </ul>
            </div>
        </header>
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
                        <dd><input type="text" placeholder="제목 입력" value="글 제목이 들어갑니다"></dd>
                    </dl>
                </div>
                <div class="cont">
                  <!--공지사항 내용(수정) 입력 부분-->
                    <textarea placeholder="내용 입력">
글 내용이 들어갑니다.
글 내용이 들어갑니다.
글 내용이 들어갑니다.
글 내용이 들어갑니다.
글 내용이 들어갑니다.
글 내용이 들어갑니다.
글 내용이 들어갑니다.
글 내용이 들어갑니다.</textarea>
                </div>
            </div>
            <!-- 공지사항 수정과 취소 버튼 부분 -->
            <div class="bt_wrap">
                <a href="view.html" class="on">수정</a>
                <a href="view.html">취소</a>
            </div>
        </div>
        </div>
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