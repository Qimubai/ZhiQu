<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
     <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
   <c:set var="ctx" value="${pageContext.request.contextPath}"></c:set>
    <%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="css/before/change.css" rel="stylesheet" type="text/css"  />
	<style type="text/css">
		*{margin: 0;padding: 0;}
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
.basic-grey input[type="text"] {
	border: 1px solid  #DADADA;
	color: #888;
	height: 30px;
	margin-bottom: 16px;
	margin-right: 6px;
	margin-top: 2px;
	outline: 0 none;
	padding: 3px 3px 3px 5px;
	width: 70%;
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
	box-shadow: 1px 1px 5px  #B6B6B6;
	border-radius: 3px;
	text-shadow: 1px 1px 1px #9E3F3F;
	cursor: pointer;
}
.basic-grey .button:hover {
	background: #CF7A7A
}
</style>
</head>

<body>
<form action="${pageContext.request.contextPath}/user/updateUser1" class="basic-grey">
	<h1>用户信息
		<span>Here Is Your Personal Information</span>
	</h1>
	<input type="hidden" name="userId" value="${user.userId}">
	<label>
			<span>用户名：</span>
			<input type="text" name="userName" value="${user.userName}">
		</label>
		<label>
			<span>密码：</span>
			<input type="text" name="userPassword" value="${user.userPassword}">
		</label>
		<label>
			<span>性别：</span>
			<input type="text" name="userSex" value="${user.userSex}">
		</label>
		<label>
			<span> 年龄：</span>
			<input type="text" name="userAge" value="${user.userAge}">
		</label>
		<label>
			<span>&nbsp;</span>
			<input type="submit" value="修改" class="button"> 
		</label><a href="${pageContext.request.contextPath}/user/selectUser">返回</a>
</body>
</html>