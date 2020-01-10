<%@page import="java.util.List"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page pageEncoding="UTF-8" %>
<%@ page import="com.ahmed.entities.Person" %>
<%@ include file="/WEB-INF/views/templates/header.jsp" %>
    <section id="services">
        <div class="container" style="text-align: right;">
        
           
		
		<c:forEach items="${total}" var="element"> 
		  	 ${element.username}
		  	<div class="progress">
				  <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="40"
				  aria-valuemin="0" aria-valuemax="100" style="width:${element.percentage}%;display: block;
    float: right;">
				   ${element.delegates}
				   
				  </div>
			</div>
		</c:forEach>
         
        </div>
    </section>
<%@ include file="/WEB-INF/views/templates/footer.jsp" %>