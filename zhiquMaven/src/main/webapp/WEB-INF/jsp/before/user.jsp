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
<title>用户页面</title>
<base href="<%=basePath%>">
<link href="css/before/user.css" rel="stylesheet" type="text/css"  media="all"/>
<jsp:include   page="head.jsp" flush="true"/>
<script type="text/javascript">
 $(document).ready(function(){
	 $("#basic").click(function(){	    
		  $("#Rbasic").show();
		  $("#Rques").hide();
		  $("#Ransw").hide();
	  }); 
	 $("#ques").click(function(){	    
		  $("#Rbasic").hide();
		  $("#Rques").show();
		  $("#Ransw").hide();
	  });
	  $("#answ").click(function(){	    
		  $("#Rbasic").hide();
		  $("#Rques").hide();
		  $("#Ransw").show();
	  });
	});
 </script>
</head>
<body>
   <hr>
   <div class="Big">
         <div class="left" >
              
              <table>              
              <tr>
                <td id="basic" class="leftTd">       
                 基本信息
                </td>
              </tr>
                  <tr>
                <td id="ques" class="leftTd">
                 我的问题
                </td>
              </tr> 
                   <tr>
                <td id="answ" class="leftTd">
                 我的答案
                </td>
              </tr>
         
              </table>                                         
         </div>
         
         <div class="right" >
           <div id="Rbasic" modelAttribute="quesList">
         <table>
         <tr>
             <td>${msg}</td>
         </tr>
           <tr>
            <td>用户名：${quesList[0].user_name}</td>
           </tr>
           <tr>
            <td>性别：${quesList[0].user_sex}</td>
           </tr>
           <tr>
            <td>年龄：${quesList[0].user_age}</td>
           </tr>         
         </table>
  <a href="${pageContext.request.contextPath}/user/exit">退出登陆</a> 
  <a href="${pageContext.request.contextPath}/user/updateUser?userId=${quesList[0].user_id}">修改信息</a>
           </div>
            <div id="Rques" style="display:none">
             ${msg}
           <table>          
           <c:forEach items="${quesList}" var="quesList">
           <tr>
            <td class="totle"><a href="${pageContext.request.contextPath}/answer/showQues?questionId=${quesList.question_id}">${quesList.summary}</a>
       &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="${pageContext.request.contextPath}/question/deleteQues2?questionId=${quesList.question_id}"><span>删除问题</span></a>
            </td>
           </tr>
           <tr>
            <td class="time">${quesList.create_time}</td>
           </tr>
         </c:forEach>
         </table>
            </div>
            
           <div id="Ransw" style="display:none">
       <c:forEach items="${answList}" var="answList">          
        <input type="hidden" name="question_id" value="${answList.question_id}">
          <table>
                 <tr>
             <td class="totle">
         
                <a href="${pageContext.request.contextPath}/answer/showQues?questionId=${answList.question_id}">${answList.summary}</a>
             </td>
           </tr>
           <tr>
            <td class="time">${answList.reply_content}</td>
           </tr>
           <tr>
            <td class="time">${answList.create_time}</td>
           </tr>
         </table>
                  </c:forEach>
           </div>
         
         </div>
	</div>
   
   
</body>
</html>