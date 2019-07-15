<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"+ request.getServerName() + ":" + request.getServerPort() + path + "/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>问题详情页面</title>
<base href="<%=basePath%>">
<jsp:include   page="head.jsp" flush="true"/>

 <script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-3.2.1.min.js"></script>
 <link rel="stylesheet" href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

    <!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
    <script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>
    <!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
    <script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
 <link href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
 <!--引入样式  -->
 <link href="css/before/queDetaills.css" rel="stylesheet" type="text/css"  media="all"/>
 <script type="text/javascript">
 $(document).on("click","#edit-btn",function () {
     //弹出模态框
     $("#empUpdateModal").modal({
         backdrop:"static"
     });
 });
 function deleteQues() {
	 document.loginform.action="${pageContext.request.contextPath }/zhiqu/question/deleteQues"
}

 </script>
 <style type="text/css">

 </style>
</head>

<body>
 <div class="div1">
    	<c:forEach items="${list}" var="list">
    	  <h2 id="summary"> ${list.summary}</h2>  	  	
          <p class="p1" id="qContent"> ${list.questionContent}</p>
          <p class="p2" id=""> ${list.createTime} </p>  
	    
	    <input type="button" value="修改问题" id="edit-btn"  > &nbsp;
	   
	    <a href="${pageContext.request.contextPath }/question/deleteQues?questionId=${list.questionId}">删除问题</a>  
	    <a href="${pageContext.request.contextPath }/question/showAll">返回首页</a>
	 </c:forEach>
	  </div>
	  
	  <div class="modal fade" id="empUpdateModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title">问题修改</h4>
            </div>
            <div class="modal-body">
                <%--表单--%>
                <form class="form-horizontal" action="${pageContext.request.contextPath }/question/updateQues">    
                    <%--问题标题--%>
                    <div class="form-group">
                        <label for="email_add_input" class="col-sm-2 control-label">问题标题</label>
                        <div class="col-sm-10">
                          <c:forEach items="${list}" var="list">
                            <input type="text" name="summary" id="summary" class="form-control" id="email_update_input"
                              value="${list.summary}">
                                  <input type="hidden" name="questionId" value="${list.questionId}">
                                  </c:forEach>
                            <span class="help-block"></span>
                        </div>
                    </div>
                   
                    <%--问题内容--%>
                   <div class="form-group">
                        <label for="email_add_input" class="col-sm-2 control-label">问题标题</label>
                        <div class="col-sm-10">
                        <c:forEach items="${list}" var="list">
                            <textarea name="questionContent" id="questionContent" rows="10" cols="50" class="form-control" >${list.questionContent}</textarea>
                            </c:forEach>
                            <span class="help-block"></span>
                        </div>
                    </div>
                <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="submit" class="btn btn-primary" id="emp_update_btn">更新</button>
            </div>
                </form> 
            </div>
           
        </div>
    </div>
</div>


</body>
</html>