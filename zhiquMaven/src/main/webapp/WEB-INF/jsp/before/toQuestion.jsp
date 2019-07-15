<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>提交问题</title>
<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-3.2.1.min.js"></script>
  <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
<script type="text/javascript">
function CheckForm(obj) 
{ 
if (obj.length == 0||obi=='') { 
alert("输入值不能为空!"); 
return false; 
} 
return true; 

} 

</script>

<style type="text/css">
		*{margin: 0;padding: 0;}
		/*h1,h2,h3,h4,h5,h6{font-size: 16px;font-weight: normal;}*/
		input{border: 0;outline: none;}
		#BigBox{width: 602px;height:454px;margin: 0 auto;padding-top: 50px;}
		.wdk{width: 598px;height: 60px;border: 1px solid black;margin-top: 24px;font-size: 20px;color: #C4D0D7}
		#BigBox textarea{width: 598px;height: 234px;border: 1px solid #C5D0D8;margin-top: 20px;font-size: 16px; color: #C4D0D7}
		.tijiao{width: 90px;height: 34px;background: #48C96E;float: right;display: block;margin-top: 50px;}
	.tijiao1{width: 90px;height: 34px;background: #48C96E;float: left;display: block;margin-top: 50px;}
	</style>

</head>
<body>
    
        <div id="BigBox">
         ${msg}<br>
		<form action="${pageContext.request.contextPath }/question/addQuestion">
			<!-- <img src="images/before/tiwen.jpg">	 -->
			<input onblur="CheckForm(this.value)" class="wdk" name="summary" id="summary" type="text" value="请描述你的问题" onfocus="if (value =='请描述你的问题'){value =''}"onblur="if (value ==''){value='请描述你的问题'}"/>
			<textarea onblur="CheckForm(this.value)" name="questionContent"  id="questionContent" cols="80" rows="17" onfocus="if(value=='详细说明问题，以便获得更好的回答（选填）'){value=''}" onblur="if (value =='')
			{value='详细说明问题，以便获得更好的回答（选填）'}"></textarea>
			<a class="tijiao1" href="${pageContext.request.contextPath }/question/showAll">返回首页</a> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<input class="tijiao" type="submit"  value="提交">
		</form>
	</div> 
        
        
        
 
</body>
</html>