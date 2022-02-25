<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="notice.NoticeDAO" %>
<%@ page import="notice.Notice" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
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
		} else {
				NoticeDAO noticeDAO = new NoticeDAO();
				int result = noticeDAO.delete(noticeNum);
				if (result == -1){
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('글 삭제에 실패했습니다.')");
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

	%>
</body>
</html>