<%@page import="com.ahmed.entities.Person"%>
<%@ page pageEncoding="UTF-8" %>

<html>

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>انتخب</title>

    <!-- Bootstrap Core CSS -->
    <link href="<c:url value="/resources/css/bootstrap.min.css"/>" rel="stylesheet">
	
    <!-- Custom CSS -->
    <link href="<c:url value="/resources/css/style.css"/>" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="<c:url value="/resources/font-awesome/css/font-awesome.min.css"/>" rel="stylesheet" type="text/css">
	
	<!-- jquery -->
	<script src="<c:url value="/resources/code.jquery.com/jquery-migrate-1.2.1.min.js"/>"></script>
</head>

<body id="page-top" class="index">
<!-- Navigation -->
    <nav class="navbar navbar-default navbar-fixed-top" dir="rtl">
        <div class="container">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand page-scroll" href="#page-top">انتخب</a>
            </div>

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav navbar-left" dir="rtl">
                    <li class="hidden">
                        <a href="#page-top"></a>
                    </li>
                    <li>
                        <a class="page-scroll" href="index">الريئسية</a>
                    </li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">العملية الانتخابية <span class="caret"></span></a>
                        <ul class="dropdown-menu">
                            <li><a href="view">النسب المحتمله</a></li>
                            <li><a href="#">عن الموقع</a></li>
                            <li><a href="results">النتائج</a></li>
                            <li role="separator" class="divider"></li>
                            <li><a href="#">مواعيد الانتخابات</a></li>
                        </ul>
                    </li>
                    <li>
                        <a class="page-scroll" href="#">القوانين</a>
                    </li>
                    <li>
                        <a class="page-scroll" href="previousWinners">النتائج السابقة</a>
                    </li>
                    <li>
                        <a class="page-scroll" href="#">الشكاوي و الاستفسارات</a>
                    </li>
                    <%  
                    Person person =(Person)session.getAttribute("person");
            		
						     if (person != null) {  
						    	 int pending = (Integer)session.getAttribute("pending");
						    	 int voted = (Integer)session.getAttribute("voted");
				            		int voting = (Integer)session.getAttribute("voting");
				            		int requests = (Integer)session.getAttribute("request");
						        %>
						        
						        <li class="dropdown">
			                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">${sessionScope.person.username} <span class="caret"></span></a>
			                        <ul class="dropdown-menu">
			                            <li><a href="profile">صفحتى الشخصيه</a></li>
			                  <%  
								     if (person.getType() == 2) {  
						        %>          
			                            <li><a href="control">لوحه التحكم</a></li>
			                    <%
						     		}else if(person.getType()==1){
						     			if(requests ==1 && pending == 0){
						     				%>
						     				 <li><a href="submitRequest">الترشح للانتخابات</a></li>
						     				<%
						     			}
						     			if(voting == 1 && voted == 0){
						     				%>
									        
					     					<%
						     			}
						     			
						     		}
						     		else if(person.getType()==0){
						     			
						     		}
						    	 %>        
						    	 <li><a href="vote">انتخب</a></li>
			                            <li role="separator" class="divider"></li>
			                            <li><a href="logout">تسجيل الخروج</a></li>
			                        </ul>
			                    </li>
						        <%
						        
						     }else{
						    	 
						    	 %>
						         <li>
						         
                        			<a class="page-scroll" href="#" data-toggle="modal" data-target="#login-modal">تسجيل الدخول</a>
                        	
                   				 </li>
						         <%
						     }
						  %>
                   
                    
                    
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container-fluid -->
    </nav>
	
	<div class="modal fade" id="login-modal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
    	  <div class="modal-dialog">
				<div class="loginmodal-container">
					<h1>تسجيل الدخول</h1><br>
				  <form action="login" method="post">
					<input type="text" name="txtName" placeholder="الرقم القومى">
					<input type="password" name="txtPass" placeholder="كلمه السر">
					<input type="submit" name="login" class="login loginmodal-submit" value="تسجيل الدخول">
				  </form>
					
				  <div class="login-help">
					<p>لم تقم بالتسجيل !! يرجى مراجعه أقرب حى</p>
				  </div>
				</div>
			</div>
		  </div>

    <!-- Header -->
    <header>
        <div class="container">
            <div class="intro-text row" dir="rtl">
                <div class="intro-lead-in col-md-6">
                    <h3>للأستعلام عن رقمك السري برجاء ادخال رقمك القومي</h3></div>
                <form class="intro-heading form col-md-6">
                    <input type="text">
                </form>
                <div class="clearfix"></div>
                <buttton href="#services" class="page-scroll btn btn-xl">موافق</buttton>
            </div>
        </div>
    </header>