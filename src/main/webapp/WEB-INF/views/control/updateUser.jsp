<%@page import="java.util.List"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page pageEncoding="UTF-8"%>
<%@ page import="com.ahmed.entities.Person"%>
<%@ include file="/WEB-INF/views/templates/control.jsp"%>
<section id="services">
	<div class="container">
		<form class="form-horizontal"  action="updateUsers" method="post">
				<div class="form-group">
                    <div class="col-sm-8 col-sm-offset-2">
                      <label for="usr">الاسم الشخصى:</label>
						<input type="text" name="txt_name" value=${user.username}>
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-8 col-sm-offset-2">
                      <label for="usr">الرقم القومى:</label>
						<input type="text" name="txt_national" value=${user.nationalId}>
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-8 col-sm-offset-2">
                      <label for="usr">كلمه السر:</label>
						<input type="text" name="txt_pass" value=${user.password}>
                    </div>
                </div>
					<input type="text" name="txt_id"hidden="true" value=${user.id} >
					 <div class="col-sm-6 col-sm-offset-1">
                        <input type="submit" class="page-scroll btn btn-xl" value="تعديل"/>
                    </div>
		  </form>
	</div>
</section>
<%@ include file="/WEB-INF/views/templates/footer.jsp"%>