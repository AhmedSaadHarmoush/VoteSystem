<%@page import="java.util.List"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page pageEncoding="UTF-8"%>
<%@ page import="com.ahmed.entities.Person"%>
<%@ include file="/WEB-INF/views/templates/header.jsp"%>
<section id="services">
	<div class="row">
		<div class="col-sm-12">
            <div class="card">
                <canvas class="header-bg" width="250" height="70" id="blur-effect-1"></canvas>
                <div class="avatar">
                    <img src="<c:url value="/resources/img/profile.jpg"/>" alt="" />
                </div>
                <div class="content">
                	<c:choose>
				            <c:when test="${set}">
				            </c:when>
				            <c:otherwise>
                				<p>User Data are not set</p>
            				</c:otherwise>
				        </c:choose> 
                    <p>${user.lastName} ${user.firstName} <br></p>
                    <p>${user.mail}</p>
                    <p>${user.address}</p>
                    <p>${user.birthdate}
                    <c:if test="${somecondition}">
				        <c:choose>
				            <c:when test="${editable}">
				                <p><button type="button" class="btn btn-primary">Edit</button></p>
				            </c:when>
				        </c:choose> 
				    </c:if>
                    
                </div>
            </div>
        </div>
    </div>
</section>
<%@ include file="/WEB-INF/views/templates/footer.jsp"%>