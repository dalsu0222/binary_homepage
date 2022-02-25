<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="notice.NoticeDAO" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="notice" class="notice.Notice" scope="page" />
<jsp:setProperty name="notice" property="noticeTitle" />
<jsp:setProperty name="notice" property="noticeContent" />
<!DOCTYPE html>
<html lang="ko">

<head>
  <meta charset="UTF-8">
  <title>binary; LOGIN</title>
  <link rel="stylesheet" href="style4.css">
</head>

<body>
	<%
		String userID = null;
		if(session.getAttribute("userID") != null){
			userID = (String) session.getAttribute("userID");
		}
		if(userID == null){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인이 필요합니다.')");
			script.println("history.back()");
			script.println("</script>");
		}
		else{
			if(notice.getNoticeTitle() == null || notice.getNoticeContent() == null){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('입력이 안 된 사항이 있습니다.')");
				script.println("history.back()");
				script.println("</script>");
			}
			else{
				NoticeDAO noticeDAO = new NoticeDAO();
				int result = noticeDAO.write(notice.getNoticeTitle(), userID, notice.getNoticeContent());
				if (result == -1){
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('글쓰기에 실패했습니다.')");
					script.println("history.back()");
					script.println("</script>");
				}
				else{
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("location.href = 'noticeList.jsp'");
					script.println("</script>");
				}
			}
			
		}

	%>
</body>
</html>