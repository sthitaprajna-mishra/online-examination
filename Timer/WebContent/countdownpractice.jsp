<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>

.done {color: tomato !important; font-weight: bold;}
.blink {
  animation: blinker 1s step-start infinite;
}

@keyframes blinker {
  50% {
    opacity: 0;
  }
}

</style>
<script>
var startTime = 10; //set countdown in Minutes  
var doneClass = "done";
var blinkerClass = "blink";
function startTimer(duration, display) {
  var timer = duration, minutes, seconds;
  var intervalLoop = setInterval(function () {
      minutes = parseInt(timer / 60, 10)
      seconds = parseInt(timer % 60, 10);
      minutes = minutes < 10 ? "0" + minutes : minutes;
      seconds = seconds < 10 ? "0" + seconds : seconds;
      for(var i=0;i<display.length;i++){
        display[i].textContent = minutes + ":" + seconds;
      }
      if (--timer < 0) {
        for(var i=0;i<display.length;i++){
          display[i].classList.add(doneClass);
          display[i].classList.add(blinkerClass);
          display[i].textContent = "Save Now";
        }
        clearInterval(intervalLoop);
      }
      }, 1000);
  }
window.onload = function () {
  var setMinutes = 60 * startTime,
  display = $('#timer');
  startTimer(setMinutes, display);
};

//End Countdown timer
</script>
</head>
<body>
	<div id = "timer"></div>
</body>
</html>