<%--
  Created by IntelliJ IDEA.
  User: Yuqin
  Date: 3/12/2019
  Time: 3:28 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <title>Refresh of Local Scope of Page</title>

        <script>
            // 创建一个XMLHttpRequest对象, 利用此对象与服务器进行通信, 这个对象是AJAX技术的核心
            function getXMLHttpRequest() {
                var xmlHttpRequest;
                try { // Firefox, Opera 8.0+, Safari
                    xmlHttpRequest = new XMLHttpRequest();
                } catch (e) {
                    try {// Internet Explorer
                        xmlHttpRequest = new ActiveXObject("Msxml2.XMLHTTP");
                    } catch (e) {
                        try {
                            xmlHttpRequest = new ActiveXObject("Microsoft.XMLHTTP");
                        } catch (e) {
                        }
                    }
                }
                return xmlHttpRequest;
            }

            function checkName() {
                // 获取输入框的值document整个网页
                var username = document.getElementById("username").value;
                // 创建XMLHttpRequest对象
                var xmlHttpRequest = getXMLHttpRequest();
                // 发送请求
                xmlHttpRequest.open("POST", "CheckNameServlet", true);
                // 注册状态改变监听，获取服务器传送过来的数据
                xmlHttpRequest.onreadystatechange = function () {
                    if (xmlHttpRequest.readyState == 4 && xmlHttpRequest.status == 200) {
                        var isExist = xmlHttpRequest.responseText;
                        if (isExist == 1) {
                            document.getElementById("span001").innerText = "<font color='red'>This username has been registered!</font>";
                        } else {
                            document.getElementById("span001").innerText = "<font color='red'>Pass check!</font>";
                        }
                    }
                }
                // 如果使用的是post方式带数据，那么这里要添加头，说明提交的数据类型是一个经过url编码的form表单数据
                xmlHttpRequest.setRequestHeader("Content-type", "application/x-www-form-urlencoded");

                xmlHttpRequest.send("username=" + username);
            }
        </script>
    </head>
    <body>
        <table border="1" width="500">
            <tr>
                <td>username:</td>
                <td><input type="text" name="username" id="username" onblur="checkName()">
                    <span id="span001"></span>
                </td>
            </tr>
            <tr>
                <td>password:</td>
                <td><input type="password" name="password"></td>
            </tr>
            <tr>
                <td>email:</td>
                <td><input type="text" name="email"></td>
            </tr>
            <tr>
                <td>description:</td>
                <td><input type="text" name="desc"></td>
            </tr>
            <tr>
                <td colspan="2"><input type="submit" value="sign up"></td>
            </tr>
        </table>
    </body>
</html>
