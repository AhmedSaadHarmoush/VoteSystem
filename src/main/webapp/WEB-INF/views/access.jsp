<%@page import="java.util.List"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page pageEncoding="UTF-8" %>
<%@ page import="com.ahmed.entities.Person" %>
<%@ include file="/WEB-INF/views/templates/header.jsp" %>
    <section id="services">
        <div class="container" style="text-align: right;">
        <h1>عذرا ليس من صلاحياتك الوصول لهذه الصفحه
        <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
        <div style="text-align: left;">
         <a href="index" class="btn btn-default btn-lg">العوده للصفحه الرئيسيه</a>
        </div></h1>
        </div>
    </section>
<%@ include file="/WEB-INF/views/templates/footer.jsp" %>