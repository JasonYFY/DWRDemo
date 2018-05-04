<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'Push.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type='text/javascript' src='dwr/engine.js'></script>  

	<script type='text/javascript' src='dwr/util.js'></script>  

	<script type='text/javascript' src='dwr/interface/DemoTest.js'></script>
  </head>
  
  <body>
  	消息：<input type="text" id="msg"/>
	<button onclick="send();">发送</button><br>
	接收的消息：<div id="receive"></div>
  </body>
  <script type="text/javascript">
  	function init(){
  		dwr.engine.setActiveReverseAjax(true);  //激活ajax反转
  		dwr.engine.setNotifyServerOnPageUnload(true);
  		DemoTest.onPageLoad("2");
  	}
  	window.onload = init;
  	function send(){
  		var msg = document.getElementById("msg").value;
  		DemoTest.sendMsg("1",msg);
  	}
  	var receiveMsg = function receiveMsg(msg){
  		document.getElementById("receive").innerText += msg+"\r\n";
  	}
  </script>
</html>
