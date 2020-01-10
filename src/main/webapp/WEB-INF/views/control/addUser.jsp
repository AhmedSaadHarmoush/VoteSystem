<%@page import="java.util.List"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page pageEncoding="UTF-8"%>
<%@ page import="com.ahmed.entities.Person"%>
<%@ include file="/WEB-INF/views/templates/control.jsp"%>
	<section id="services">
	<div class="container" >
	
	<form class="form-horizontal" action="register" method="post">
                
                <div class="form-group">
                    <div class="col-sm-8 col-sm-offset-2">
                      <label for="usr">الرقم القومى:</label>
						<input type="text" class="form-control" id="usr" name="nationalId">
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-8 col-sm-offset-2">
                      <label for="usr">الرقم السرى:</label>
						<input type="password" class="form-control" id="usr" name="pass">
                    </div>
                </div>
                
                    <div class="col-sm-6 col-sm-offset-1">
                        <input type="submit" class="page-scroll btn btn-xl" value="سجل"/>
                    </div>
            </form>
	

	</div>
</section>
<%@ include file="/WEB-INF/views/templates/footer.jsp"%>