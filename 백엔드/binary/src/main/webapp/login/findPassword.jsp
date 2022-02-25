<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">

<head>
  <meta charset="UTF-8">
  <title>binary; LOGIN</title>
  <link rel="stylesheet" href="findPassword.css">
  <!-- on('click')과 addClass는 jquery에서 제공하기 때문에 넣음 -->
  <script src="#"></script>
  <!-- google에서 icon을 불러오는 링크 -->
  <link href="https://fonts.googleapis.com/
icon?family=Material+Icons|Material+Icons+Sharp|Material+Icons+Two+Tone|Material+Icons+Outlined"
rel="stylesheet">
</head>

<body>
    
<!--왼쪽상단 바이너리 로고 띄우기 (미완성, 공부중) <div class="header">
<h1><a href="index.html">binary;</a></h1>
</div>-->

  <section class="login-form">
    <!-- 로그인 제목 -->
    <h1><a href="../main/main.jsp">binary;</a></h1>
    <form action="findPasswordAction.jsp">
      <!-- 학번부분 박스 -->
      <div class="int-area">
        <input type="text" name="userID" id="userID" autocomplete="on" required>
        <label for="userID">STUDENT ID</label>
      </div>
      <!-- 이름부분 박스 -->
      <div class="int-area">
        <!-- autocomplete사용:on로 자동완성 기능 사용함 -->
        <input type="text" name="userName" id="userName" autocomplete="on" required>
        <label for="userName">NAME</label>
      </div>
      <!-- 비밀번호부분 박스 -->
      <div class="int-area">
        <input type="password" name="userPassword" id="userPassword" required>
        <label for="userPassword">NEW PASSWORD</label>
        <!-- google에서 eye 아이콘들을 추가하여 
          아이콘을 클릭했을때 맨 하단의 함수(myFunction())가 작동하도록 함-->
        <span class="eye" onclick="myFunction()"> 
          <span class="material-icons-outlined" style="color: white;" id="hide1">
            visibility_off
          </span>
          <span class="material-icons-outlined" style="color: white;" id="hide2">
            visibility
          </span>
        </span>
      </div>
      <!-- 비밀번호확인부분 박스 -->
      <div class="int-area">
        <input type="password" name="userPassword2" id="userPassword2" required>
        <label for="userPassword2">CONFIRM NEW PASSWORD</label>
        <!-- google에서 eye 아이콘들을 추가하여 
          아이콘을 클릭했을때 맨 하단의 함수(myFunction())가 작동하도록 함-->
        <span class="eye2" onclick="myFunction2()"> 
          <span class="material-icons-outlined" style="color: white;" id="hide3">
            visibility_off
          </span>
          <span class="material-icons-outlined" style="color: white;" id="hide4">
            visibility
          </span>
        </span>
      </div>
      <!-- 로그인 버튼 -->
      <div class="btn-area">
          <!-- 로그인 버튼 이름 : submit -->
        <button type="submit" name="submit" id="submit">CHANGE PASSWORD</button>
      </div>
      
    </form>
  </section>
  <script>
    function myFunction(){
      var x= document.getElementById("userPassword");   /* x는 비밀번호 입력 란 */
      var y= document.getElementById("hide1");  /* y와 z는 각각 눈감은 아이콘/눈뜬 아이콘*/
      var z= document.getElementById("hide2");

      if (x.type == 'password'){
        x.type="text";
        y.style.display = "block";
        z.style.display = "none";
      }
      else{
        x.type="password";
        y.style.display = "none";
        z.style.display = "block";
      }
    }
  </script>
  <script>
    function myFunction2(){
      var x= document.getElementById("userPassword2");   /* x는 비밀번호 입력 란 */
      var y= document.getElementById("hide3");  /* y와 z는 각각 눈감은 아이콘/눈뜬 아이콘*/
      var z= document.getElementById("hide4");

      if (x.type == 'password'){
        x.type="text";
        y.style.display = "block";
        z.style.display = "none";
      }
      else{
        x.type="password";
        y.style.display = "none";
        z.style.display = "block";
      }
    }
  </script>
  
</body>
</html>