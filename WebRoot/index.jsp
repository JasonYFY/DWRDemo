<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'index.jsp' starting page</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<script type='text/javascript' src='dwr/engine.js'></script>  
	<script type='text/javascript' src='dwr/util.js'></script>  
	<script type='text/javascript' src='dwr/interface/dwrTest.js'></script>
  </head>
  
  <body>
    <button name="testDwr" onclick="testDwr()">DWR测试</button>
    <input type="text" id="demo" size="40">
  </body>
  <script type="text/javascript">
  	function testDwr(){
  		dwrTest.getHello(callback); //调用java方法，其参数为回调函数，如是java带参的方法，则在回调函数前放参数值。
  		
  	}
  	var callback = function mycall(data){
  		dwr.util.setValue("demo",data);
  	}
  </script>
</html>
