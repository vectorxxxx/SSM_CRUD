<html>
<head>
    <meta charset="UTF-8">
    <title>test</title>
    <link href="WEB-INF/static/bootstrap-3.3.7-dist/css/bootstrap.css">
    <script src="WEB-INF/static/bootstrap-3.3.7-dist/js/bootstrap.js"></script>
    <script src="WEB-INF/js/jquery-3.3.1.js"></script>
</head>
<body>

<p id="test">Hello World!</p>
<button type="button" class="btn btn-success" onclick="selectUser()">onclick test</button>

<script>
    function selectUser(){
        var xmlhttp = new XMLHttpRequest();
        xmlhttp.onreadystatechange = function () {
            if(xmlhttp.readyState==4&&xmlhttp.status==200) {
                document.getElementById("test").innerHTML = xmlhttp.responseText;
            }
        }
        xmlhttp.open("POST", "user/showUser.do", true);
        xmlhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
        xmlhttp.send("userid=1");
    }
</script>
</body>
</html>
