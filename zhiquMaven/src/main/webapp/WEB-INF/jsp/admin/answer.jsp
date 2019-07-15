<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
     <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
   <c:set var="ctx" value="${pageContext.request.contextPath}"></c:set>
   <%--  <%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort() + path + "/";
%> --%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>回答页面</title>
<%@ include file="head.jsp"  %>
 <script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-3.2.1.min.js"></script>
 <script type="text/javascript">  
 $(document).ready(function(){
		$("input").click(function(){
			$("#divq").fadeToggle();
		
		});
	});
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
 body{ margin: 0; padding: 0; background-color: #CCCCCC;}
   .div1{
        float: left;
        margin-left:470px;
        height: 500px;
        width: 600px;
        }
      .li1{ 
       font:bold;
        font-family:30px "宋体";  
        margin: 5px;
        padding: 10px;}
        .li2{
        font-family: "宋体";
        font-size:20px;
        margin: 0px;
        padding: 10px; }
        .form2 {
	margin-top: 10px;
}
     
      table {
	 width: 600px;
   
}
.div1 span{
	font-size: 20px;
}
.li0{background-color:#f2f2f2;
	width: 500px;
	height: 16px;
}
.li3{
	float:right;
}
.Answ{
   height:80px;
   width:580px;    
}
.Answp1{
   margin-left:20px; 
}
.AnswP2{
margin-left:50px;
}

 </style>
</head>
<body>     
 <hr>
<div class="div1">

<!--问题展示加答案框  -->
  <form action="" modelAttribute="list">
   <table>                    
           <tr>
           <td > <span>提问人：</span> ${list[0].q_user_name}</td>
           </tr>  
           <tr>
        	<th class="li1">${list[0].summary}</th>     
           </tr> 
           <tr>
            <td class="li2">${list[0].question_content}</td> 
           </tr>
           <tr>
           <td>  </td>
           </tr>
           <tr>
           <td class="li3"> <input type="button" value="我来答"></td>
           </tr>
           <tr>
           <td></td>
           </tr>		
        </table>
        </form>
        
<!-- 答案框提交答案 -->
  <div id="divq" style="display:none">
  <form  class="" id="form1" action="${pageContext.request.contextPath }/answer/addAnswer" method="post">
    <c:forEach items="${list}" var="listQeus" >
    <input type="hidden" name="questionId" value="${listQeus.question_id}">
    </c:forEach>
    <textarea onblur="CheckForm(this.value)" name="replyContent" id="replyContent" rows="10" cols="85"></textarea>
    <br>
    <input type="submit" value="提交" onclick="">
   </form>
   </div>
   <!-- 展示回答人及答案内容  -->
   <hr>
    <c:forEach  items="${list}" var="listAnsw" >  
     <div class="Answ" >    
         <p class="Answp1"> ${listAnsw.a_user_name}</p>               
         <p class="AnswP2">  ${listAnsw.reply_content}</p>
         <p>  ${listAnsw.create_time1}</p>
           <hr>
         </div> 
           </c:forEach>
  
   </div>     
</body>
</html>