<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<!--[if IE 8 ]><html class="no-js oldie ie8" lang="en"> <![endif]-->
<!--[if IE 9 ]><html class="no-js oldie ie9" lang="en"> <![endif]-->
<!--[if (gte IE 9)|!(IE)]><!-->
<html class="no-js" lang="en">
<!--<![endif]-->

<head>

<!--- basic page needs
   ================================================== -->
<meta charset="utf-8">
<title>Board - DAMOIM</title>
<meta name="description" content="">
<meta name="author" content="">

<!-- mobile specific metas
   ================================================== -->
<meta name="viewport"
	content="width=device-width, initial-scale=1, maximum-scale=1">

<!-- CSS
   ================================================== -->
<link rel="stylesheet" href="../resources/css/base.css">
<link rel="stylesheet" href="../resources/css/vendor.css">
<link rel="stylesheet" href="../resources/css/main.css">


<!-- script
   ================================================== -->
<script src="../resources/js/modernizr.js"></script>
<script src="../resources/js/pace.min.js"></script>

<!-- favicons
	================================================== -->
<link rel="shortcut icon" href="../resources/favicon.ico"
	type="image/x-icon">
<link rel="icon" href="../resources/favicon.ico" type="image/x-icon">

</head>

<body id="top">

<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>

	<!-- header 
   ================================================== -->
	<header class="short-header">

		<div class="gradient-block"></div>

		<div class="row header-content">

			<div class="logo">
				<a href="../main">Author</a>
			</div>



			<nav id="main-nav-wrap">
				<ul class="main-navigation sf-menu">
					<li><a href="#" title="">Introduce</a>
						<ul class="sub-menu">
							<li><a href="../introPrj">Project</a></li>
							<li><a href="../introMem">Developer</a></li>
						</ul></li>
					<li><a href="../list" title="">Group</a></li>
					<li class="has-children current"><a href="../board/list" title="">Board</a></li>
					<li>&nbsp;&nbsp;&nbsp;&nbsp;</li>

					<c:choose>
						<c:when test="${id != null}">
							<li><a href="../logout" title="">Logout</a></li>
							<li><a href="../mypage" title="">Mypage</a></li>
						</c:when>
						<c:otherwise>
							<li><a href="../login" title="">Login</a></li>
							<li><a href="#" onclick="needLogin()" title="">Mypage</a></li>

						</c:otherwise>
					</c:choose>

					
				



					
				</ul>
			</nav>
			<!-- end main-nav-wrap -->

			


		</div>

	</header>
	<!-- end header -->
	
	
<script>
	function needLogin() {
		alert("로그인 후 이용 가능합니다.");
		location.href = "http://localhost:8080/login";
	}

</script>



<!-- content
   ================================================== -->
<section id="content-wrap" class="site-page">
	<div class="row">
		<div class="col-twelve">

			<section>

				<div class="content-media">


					<div class="form-field">
			               <label>title</label>
			               <input type="text" class="full-width" name="b_title" readonly="readonly" value='<c:out value="${board.b_title}"/>'>
		               </div>
						<div class="form-field">
			               <label>writer</label>
			               <input type="text" class="full-width" name="b_user_id" readonly="readonly" 
			               value='<c:out value="${board.b_user_id}"/>' >
		               </div>
						<div class="form-field">
			               <label>content</label>
			               <textarea class="full-width" name="b_content" readonly="readonly"><c:out value="${board.b_content}"/></textarea>
		               </div>
						
						
						
						<c:choose>
							<c:when test="${id == board.b_user_id}">
								 <button class="submit button-primary full-width-on-mobile" data-oper="modify" onclick="location.href='/board/modify?b_no=<c:out value="${board.b_no}"/>' "class="btn btn-info">Modify</button>
							</c:when>
							<c:otherwise>
								 <button onclick="needWriterId()">Modify</button>
				
							</c:otherwise>
						</c:choose>
		               
		               <button data-oper="list" onclick="location.href='/board/list'">List</button>
		               
		               
		               <form id="openForm" action="/board/modify" method="get">
		                  <input type="hidden" id='b_no' name='b_no' value='<c:out value="${board.b_no}"/>' >
		                  <input type="hidden" id='pageNum' name='pageNum' value='<c:out value="${cri.pageNum}"/>' >
		                  <input type="hidden" id='amount' name='amount' value='<c:out value="${cri.amount}"/>' >
		                  <input type="hidden" id='type' name='type' value='<c:out value="${cri.type}"/>' >
		                  <input type="hidden" id='keyword' name='keyword' value='<c:out value="${cri.keyword}"/>' >
		               </form>
						






<%@include file="comment.jsp"%>


			






				</div>
			</section>


		</div>
		<!-- end col-twelve -->
	</div>
	<!-- end row -->
</section>
<!-- end content -->

<script type="text/javascript">


function needWriterId() {
	alert("작성자만 수정이 가능합니다.");
}



   $(document).ready(function(){
      var openForm = $("#openForm");
      $("button[data-oper='modify']").on("click",function(){
         openForm.attr("action","/board/modify");
         openForm.submit();
      });
      
      $("button[data-oper='list']").on("click",function(){
         openForm.find("#b_no").remove();
         openForm.attr("action","/board/list");
         openForm.submit();
      });
   });
</script>

<%@include file="../includes/footer.jsp"%>