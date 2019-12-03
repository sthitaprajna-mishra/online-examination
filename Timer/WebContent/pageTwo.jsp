<html>

<body>
  <div id="hms">00:00:10</div>
</body>

<script>
  var startTime;
  function getCookie(name) {
    var value = "; " + document.cookie;
    var parts = value.split("; " + name + "=");
    if (parts.length == 2) return parts.pop().split(";").shift();
  } // credits kirlich @http://stackoverflow.com/questions/10730362/get-cookie-by-name

  function count() {
    if (typeof getCookie('remaining') != 'undefined') {
      startTime = getCookie('remaining');
    }
    else if (document.getElementById('hms').innerHTML.trim() != '') {
      startTime = document.getElementById('hms').innerHTML;
    }
    else {
      var d = new Date();
      var h = d.getHours();
      var m = d.getMinutes();
      var s = d.getSeconds();
      startTime = h + ':' + m + ':' + s;
      //OR
      startTime = d.toTimeString().split(" ")[0]
    }
    if (startTime == "00:00:00") {
      return;
    }

    var pieces = startTime.split(":");
    var time = new Date();
    time.setHours(pieces[0]);
    time.setMinutes(pieces[1]);
    time.setSeconds(pieces[2]);
    var timediff = new Date(time.valueOf() - 1000)
    var newtime = timediff.toTimeString().split(" ")[0];
    document.getElementById('hms').innerHTML = newtime;
    document.cookie = "remaining=" + newtime;
    setTimeout(count, 1000);
  }
  count();
</script>

</html>