<%@page import="java.util.List"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page pageEncoding="UTF-8"%>
<%@ page import="com.ahmed.entities.Person"%>
<%@ include file="/WEB-INF/views/templates/header.jsp"%>

<nav class="navbar navbar-inverse sidebar" dir="rtl">
	<div class="container">
		<!-- Brand and toggle get grouped for better mobile display -->
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
				aria-expanded="false">
				<span class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand page-scroll" href="#page-top">لوحه التحكم</a>
		</div>

		<!-- Collect the nav links, forms, and other content for toggling -->
		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav navbar-left" dir="rtl">
				<li class="hidden"><a href="#page-top"></a></li>
				<li><a class="page-scroll" href="voteProcess">العمليه الانتخابيه</a></li>
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false">المنتخبين <span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="addUser">اضافه منتخب</a></li>
						<li><a href="removeUser">تعديل/ازاله منتخب</a></li>
					</ul></li>
					<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-haspopup="true"
					aria-expanded="false">المرشحين <span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="candidates">قبول طلبات الترشح</a></li>
						<li><a href="viewCandidates">ازاله مرشح</a></li>
					</ul></li>
			</ul>
		</div>
		<!-- /.navbar-collapse -->
	</div>
	<!-- /.container-fluid -->
</nav>
