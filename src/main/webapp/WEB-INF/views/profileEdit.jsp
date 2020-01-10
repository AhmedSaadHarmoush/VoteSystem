<%@page import="java.util.List"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page pageEncoding="UTF-8" %>
<%@ page import="com.ahmed.entities.Person" %>
<%@ include file="/WEB-INF/views/templates/header.jsp" %>
    <section id="services">
        <div class="container" style="text-align: right;">
         	<form class="form-horizontal" action="setUser" method="post"> 
			       <div class="form-group">
	                    <div class="col-sm-8 col-sm-offset-2">
	                      <label for="usr">الاسم الاول:</label>
							<input type="text" class="form-control" id="usr" name="fname">
	                    </div>
		           </div>
		           <div class="form-group">
	                    <div class="col-sm-8 col-sm-offset-2">
	                      <label for="usr">اسم العائله:</label>
							<input type="text" class="form-control" id="usr" name="lname">
	                    </div>
		           </div>
		           <div class="form-group">
	                    <div class="col-sm-8 col-sm-offset-2">
	                      <label for="usr">الايميل:</label>
							<input type="text" class="form-control" id="usr" name="mail">
	                    </div>
		           </div>
		           <div class="form-group">
	                    <div class="col-sm-8 col-sm-offset-2">
	                      <label for="usr">العنوان:</label>
							<input type="text" class="form-control" id="usr" name="address">
	                    </div>
		           </div>
		           <div class="form-group">
	                    <div class="col-sm-8 col-sm-offset-2">
	                      <label for="usr">تاريخ الولاده:</label>
							<input type="date" class="form-control" id="usr" name="bday">
	                    </div>
		           </div>
		           <div class="col-sm-6 col-sm-offset-1">
                        <input type="submit" class="page-scroll btn btn-xl" value="سجل البيانات"/>
                   </div>
           	</form>
        </div>
    </section>
<%@ include file="/WEB-INF/views/templates/footer.jsp" %>