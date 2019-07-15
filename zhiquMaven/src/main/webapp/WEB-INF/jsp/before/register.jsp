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
<title>注册页面</title>
<base href="<%=basePath%>">
<link href="css/before/daohang.css" rel="stylesheet" type="text/css" />
<link href="css/before/common.css" rel="stylesheet" type="text/css" />
<link href="css/before/style.css" rel="stylesheet" type="text/css" />
  <script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-3.2.1.min.js"></script>
  <script type="text/javascript">
  function isChinese(obj){ 
	  var reg=/^[\u0391-\uFFE5]+$/; 
	  if(obj!=""&&!reg.test(obj)){ 
	  alert('用户名必须输入中文！');
	  return false; 
	  } 
	  }
  function Sex(obj) {
	
	if(obj!='男'||obj!='女')
		{
		alert('只能输入男或者女！');
		}
}
  
  function CheckForm(obj) 
  { 
  if (obj.length == 0||obi=='') { 
  alert("密码不能为空!"); 
  return false; 
  } 
  return true; 
  
  } 
  //刷新验证码
	function refreshCode(){
		document.getElementById("code").src = "validateCode?" + Math.random();
    }
	//表单验证
	function check(){ 	
		with(document.all){ 
		if(textfield2.value!=textfield6.value) 
		{ 
		alert("密码不一致") 
		textfield2.value = ""; 
		textfield6.value = ""; 
		} 
		
		}
		} 
        
	//验证只能为数字 
	function checkNumber(obj){ 
	var reg = /^[0-9]+$/; 
	if(obj!=""&&!reg.test(obj)){ 
	alert('只能输入数字且长度小于3！'); 
	return false; 
	} 
	if(textfield7.value.length>3) 
	{ 
	alert("不能超过3个字符！"); 
	document.textfield7.focus(); 
	return false; 
	}
	} 
	
	function checkUser(){
        var userName=$("#userName").val();       
        $.ajax({
           url:"${pageContext.request.contextPath}/user/queryByUser",
           type:"post",
           data:{"userName":userName},
           dataType:"json",
          success:function(data){
               if (data!=null ) {
            	   alert("用户名已存在");
                $("#userName").val('');
            }else if(data==null && username !=''){
                $("#userSpan").text("用户名可用");
            }
          }
        });
    }
	
</script>
</head>


<body>
	<div class="clearfix">
		<div class="blank20"></div>
		<div class="box4">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="100%" valign="bottom">
						<h2>用户注册</h2>
					</td>
				</tr>
			</table>
		</div>
		<div class="blank10"></div>
		<div class="box4">
			<div class="case_ll clearfix">
				<div class="regist">
					<form:form action="${pageContext.request.contextPath }/user/register" method="post" modelAttribute="user"  name="registerForm">
						<table width="100%" border="0" cellspacing="0" cellpadding="0"
							class="ttbb2">
							<tr>
								<td width="16%" align="right"><span class="cl_f30">*</span>
									用户名：</td>
								<td width="59%"><input type="text" name="userName"
									id="userName" class="my_txt_350" placeholder="请输入中文！" /></td>
								<td width="25%">${msg }</td>
							</tr>
							<tr>
								<td align="right">&nbsp;</td>
								<td colspan="2" style="font-size: 12px; padding-bottom: 25px;">
									（不能为空且长度小于5）</td>
							</tr>
							<tr>
								<td align="right"><span class="cl_f30">*</span> 密码：</td>
								<td><input type="password" name="userPassword"  id="textfield2"
								onblur="CheckForm(this.value)"	class="my_txt_350" /></td>
								<td>&nbsp;</td>
							</tr>
							<tr>
								<td align="right">&nbsp;</td>
								<td colspan="2" style="font-size: 12px; padding-bottom: 25px;">
									（为了您帐户的安全，建议使用字符+数字等多种不同类型的组合，且长度大于5位。）</td>
							</tr>
							<tr>
								<td align="right"><span class="cl_f30">*</span>重复密码：</td>
								<td><input type="password" name="reupwd" id="textfield6"
								onblur="check()"	class="my_txt_350" /></td>
								<td>&nbsp;</td>
							</tr>
							<tr>
								<td align="right">&nbsp;</td>
								<td colspan="2" style="font-size: 12px; padding-bottom: 25px;">
									（确保您记住密码。）</td>
							</tr>
							<tr>
								<td align="right"><span class="cl_f30">*</span> 请输入您的年龄：</td>
								<td><input type="text" name="userAge" id="textfield7"
								onblur="checkNumber(this.value)"	class="my_txt_350" /></td>
								<td>&nbsp;</td>
							</tr>
							<tr>
								<td align="right"><span class="cl_f30">*</span> 请输入您的性别：</td>
								<td><input type="text" name="userSex" id="textfield9"
							onblur="Sex(this.value)"		class="my_txt_350" /></td>
								<td>&nbsp;</td>
							</tr>
											
							<tr>
								<td align="right"><span class="cl_f30">*</span> 验证码：</td>
								<td class="ared"><input type="text" name="code"
									id="textfield5" class="my_txt_120" />
									<img id="code" src="validateCode" /> 
									<a href="javascript:refreshCode();"><font color="blue">看不清，换一个！</font></a>
								</td>
								<td>${codeError}</td>
							</tr>
							<tr>
								<td align="right">&nbsp;</td>
								<td colspan="2" class="cl_f30" style="font-size: 12px; padding-bottom: 25px;"></td>
							</tr>
							<tr>
								<td align="right">&nbsp;</td>
								<td height="50"><input type="submit" name="button" id="button"  value="注册账号"  /></td>
								<td>&nbsp;</td>
							</tr>
						</table>
					</form:form>
					<div class="blank20"></div>
				</div>
			</div>
		</div>
		<div class="blank10"></div>
	</div>
</body>
</html>