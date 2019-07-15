<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>  

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>登录页面</title>
	<link href="css/before/daohang.css" rel="stylesheet" type="text/css" />
	<link href="css/before/common.css" rel="stylesheet" type="text/css" />
	<link href="css/before/style.css" rel="stylesheet" type="text/css" />
<style type="text/css">
  .basic-grey {
margin-left:auto;
margin-right:auto;
max-width: 500px;
background: #F7F7F7;
padding: 25px 15px 25px 10px;
font: 12px Georgia, "Times New Roman", Times, serif;
color: #888;
text-shadow: 1px 1px 1px #FFF;
border:1px solid #E4E4E4;
}
.basic-grey h1 {
font-size: 25px;
padding: 0px 0px 10px 40px;
display: block;
border-bottom:1px solid #E4E4E4;
margin: -10px -15px 30px -10px;;
color: #888;
}
.basic-grey h1>span {
display: block;
font-size: 11px;
}
.basic-grey label {
display: block;
margin: 0px;
}
.basic-grey label>span {
float: left;
width: 20%;
text-align: right;
padding-right: 10px;
margin-top: 10px;
color: #888;
}
.basic-grey input[type="text"],  .basic-grey select {
border: 1px solid #DADADA;
color: #888;
height: 30px;
margin-bottom: 16px;
margin-right: 6px;
margin-top: 2px;
outline: 0 none;
padding: 3px 3px 3px 5px;
width: 40%;
font-size: 12px;
line-height:15px;
box-shadow: inset 0px 1px 4px #ECECEC;
-moz-box-shadow: inset 0px 1px 4px #ECECEC;
-webkit-box-shadow: inset 0px 1px 4px #ECECEC;
}


.basic-grey .button {
background: #E27575;
border: none;
padding: 10px 25px 10px 25px;
color: #FFF;
box-shadow: 1px 1px 5px #B6B6B6;
border-radius: 3px;
text-shadow: 1px 1px 1px #9E3F3F;
cursor: pointer;
}
.basic-grey .button:hover {
background: #CF7A7A
}
.button1{
background: #6495ED;
border: none;
padding: 10px 25px 10px 25px;
color: #FFF;
box-shadow: 1px 1px 5px #B6B6B6;
border-radius: 3px;
text-shadow: 1px 1px 1px #9E3F3F;
cursor: pointer;
}
.button2{
background: #ccc;
border: none;
padding: 10px 25px 10px 25px;
color: #FFF;
box-shadow: 1px 1px 5px #B6B6B6;
border-radius: 3px;
text-shadow: 1px 1px 1px #9E3F3F;
cursor: pointer;
}
  </style>

	<script type="text/javascript">
	//确定按钮
	function gogo(){
		document.loginform.submit();
	}
	//取消按钮
	function cancel(){
		document.loginform.action="/zhiqu/home/toHome";
	}
	//注册按钮
	function goReg() {
		document.loginform.action="/zhiqu/user/toRegister";
	}
	function refreshCode(){
		document.getElementById("code").src = "validateCode?" + Math.random();
    }
	</script>
  </head>
  <body>
<div class="basic-grey">
  	<form:form action="user/login" method="post" modelAttribute="user"  name = "loginform">
  	<h1>登录
<span>Please input your account&password here</span>
</h1>
	<label>
<span>用户名：</span>
<input type="text" name="userName" value="${user.userName}" />
</label>
<label>
<span>密码：</span>
<input type="password" name="userPassword" class="textSize"/>
</label>
 
<label>
<table>
<tr>
			<td>验证码：</td>
			<td><input type="text" name="code" class="textSize"/></td>
		</tr>		
		<tr>
			<td>
				<img id="code" src="validateCode"/>
			</td>
			<td class="ared">
				<a href="javascript:refreshCode();"><font color="blue">看不清，换一个！</font></a>
			</td>
			<td>${codeError}</td>
		</tr>	
		</form:form>
</table>
<br><br>
<span>&nbsp;</span>

<input type="submit" class="button" value="登陆" onclick="gogo()"/>
<input type="submit" class="button1" value="注册" onclick="goReg()">
<input type="submit" class="button2" value="取消"  onclick="cancel()">

</label>
</div>
  </body>
</html>