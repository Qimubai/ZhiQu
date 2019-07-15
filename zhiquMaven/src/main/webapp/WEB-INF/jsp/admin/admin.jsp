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
 <script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-3.2.1.min.js"></script>
  <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
<script type="text/javascript">
	 
	function checkFirst(){
        if(${page.currentPage>1}){
        
          return true;
        
        }
        alert("已到页首,无法加载更多");
       
      return false;
   }
   
   function checkNext(){
   
   if(${page.currentPage<page.totalPage}){
   
     return true;
   
   }
   alert("已到页尾，无法加载更多页");
   return false;   
   }
   //删除按钮
   function deleteuser() {
	   document.loginform.action="/zhiqu/admin/deleteUserByName";
}
</script>
<style type="text/css">
 .div1{ 
       padding: 30px;
       margin: 0px auto;      
       align-content: center; 
       height: 500px;
       width: 600px;
       }
a{text-decoration:none}
.home{
    height:36px;
    width:600px;
 padding: 5px;
  line-height: 36px;
}
span {
	margin-left:10px;
	color: red;
	font-size: 10px;
}
</style>
<title>管理员页面</title>
</head>
<body>
     
        <div class="div1" >   
        	<form action="${pageContext.request.contextPath }/admin/deleteUserByName">
        	删除用户：<input type="text" name="userName" placeholder="请输入用户名">&nbsp;
        	&nbsp;&nbsp;<input type="submit" value="Go">
        	</form>
        	<c:forEach items="${Invlist}" var="Invlist">
        	<%-- <input type="hidden" name="questionId" value="${Invlist.questionId}"> --%>
        	<div class="home">
        	<a href="${pageContext.request.contextPath }/answer/showQues?questionId=${Invlist.questionId}">${Invlist.summary}</a>  	        	    	    
        	<a href="${pageContext.request.contextPath }/admin/AdminDelete?questionId=${Invlist.questionId}"><span>删除该问题</span></a>
        	<hr>
        	</div>
        	</c:forEach>            
          ${msg}	
     <label>第${page.currentPage}/${page.totalPage}页 共${page.totalRows}条</label> 
   <a href="question/showAll?currentPage=0">首页</a> 
   <a href="question/showAll?currentPage=${page.currentPage-1}" onclick="return checkFirst()">上一页</a> 
   <a href="question/showAll?currentPage=${page.currentPage+1}" onclick="return checkNext()">下一页</a> 
   <a href="question/showAll?currentPage=${page.totalPage}">尾页</a> 跳转到:
   <input type="text" style="width:30px" id="turnPage" />页 
   <input type="button" onclick="startTurn()" value="跳转" />    
        </div> 
</body>
</html>