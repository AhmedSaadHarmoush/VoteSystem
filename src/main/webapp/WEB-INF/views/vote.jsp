<%@page import="java.util.List"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page pageEncoding="UTF-8" %>
<%@ page import="com.ahmed.entities.Person" %>
<%@ include file="/WEB-INF/views/templates/header.jsp" %>
    <section id="services">
        <div class="container" style="text-align: left;">
         <div class="row">
        <c:forEach items="${users}" var="element">
         <div class="col-sm-3">
            <div class="card">
                <canvas class="header-bg" width="250" height="70" id="blur-effect-1"></canvas>
                <div class="avatar">
                    <img src="<c:url value="/resources/img/profile.jpg"/>" alt="" />
                </div>
                <div class="content">
                    <p>${element.username}<br></p>
                    <p>
                    	<form action="getCandidateUserData" method="post">
							<input value="${element.id}" name="txt_id" hidden="true">
							<input type="submit" name="update" class="btn btn-primary" value="اعرف">
					 	 </form>
                    </p>
                </div>
            </div>
        </div>
        </c:forEach>
        </div >
        <br><br><br><br>
         <form method="post" action="setVote">
         	<div class="form-group">
			  <label for="sel1"><h3>Select Candidate:</h3></label>
			  <select class="form-control" id="sel1" name="selected">
		         	<c:forEach items="${users}" var="element">
		         		<option value='${element.id}'>${element.username}</option>
		         	</c:forEach>
			  </select>
			</div>
         	<input type="submit" class="btn btn-info btn-lg col-sm-offset-6" value="Vote">
         </form>
         
        </div>
    </section>
<%@ include file="/WEB-INF/views/templates/footer.jsp" %>