 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
   <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
     <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
   <c:set var="ctx" value="${pageContext.request.contextPath}"></c:set>
   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd"> --%>
 <%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
	function clearValue(){
		document.myForm.mykey.value = "";
	}
</script>
<title>知趣首页</title>
<base href="<%=basePath%>">
<link href="css/before/home.css" rel="stylesheet" type="text/css"  media="all"/>
</head>
	<body>
	<div>
		<ul>
  <li><a class="active" href="#home"></a></li>
 <li><a href="${pageContext.request.contextPath}/user/exit">退出系统</a></li>
  <li style="float: right;"><a href="${pageContext.request.contextPath }/user/toLogin">登陆</a></li>
  <li style="float: right;"><a href="${pageContext.request.contextPath }/user/toRegister">注册</a></li>
  <div class="dropdown">
    <a href="${pageContext.request.contextPath }/user/selectUser" class="dropbtn">我的知趣</a>
    
    <div class="dropdown-content">
     
      </div>
    </div>
  </div>
  <div class="dibu">
		<div class="logo">
		   
			<img src="images/before/zhiqu.png"> 
		</div>
		
			<div class="ask">
				<form action="${pageContext.request.contextPath }/question/queryQues">
					<input class="txt" type="text" value="请输入您要查询的问题" name="queryCondition"  >										
					<input class="btn1" type="submit"  value="搜索答案">					
                </form>               
			</div>
			<form class="an"  action="${pageContext.request.contextPath }/question/toQuestion"  method="post">
                <input class="btn2" type="submit" value="我要提问">
                </form>
			</div>
</ul>
         

</body>
</html>