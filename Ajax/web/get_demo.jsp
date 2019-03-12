<%--
  Created by IntelliJ IDEA.
  User: Yuqin
  Date: 3/12/2019
  Time: 11:11 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <title>Ajax Get</title>

        <script type="text/javascript">
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

            // 执行get请求
            function get() {
                // 1.创建XMLHttpRequest对象
                var xmlHttpRequest = getXMLHttpRequest();

                // 2.发送请求
                /*
                * 参数一: 请求类型
                * 参数二: 请求的路径
                * 参数三: 是否异步*/
                xmlHttpRequest.open("GET", "GetDemoServlet?name=Stephen Duan&age=26", true);

                // 3.获取响应数据 注册监听的意思。一会准备的状态发生了改变，那么就执行 = 号右边的方法
                xmlHttpRequest.onreadystatechange = function () {
                    // 前半段表示 已经能够正常处理。再判断状态码是否是200
                    if (xmlHttpRequest.readyState == 4 && xmlHttpRequest.status == 200) {
                        // 页面弹出响应的信息
                        alert(xmlHttpRequest.responseText);
                    }
                }

                xmlHttpRequest.send();
            }
        </script>
    </head>
    <body>
        <h3><a href="" onclick="get()">send Get requests using Ajax</a></h3>
    </body>
</html>
