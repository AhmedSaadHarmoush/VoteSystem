<%@page import="java.util.List"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page pageEncoding="UTF-8"%>
<%@ page import="com.ahmed.entities.Person"%>
<%@ include file="/WEB-INF/views/templates/control.jsp"%>
<section id="services">
	<div class="container">
		<table class="table table-hover" data-row-style="rowStyle" data-height="30">
			<thead>
				<tr>
					<th data-field="check">ازاله</th>
					<th data-field="check">تعديل</th>
					<th data-field="nationalId">الرقم القومى</th>
					<th data-field="name">اسم المرشح</th>
					<th data-field="id">الرقم العام</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${users}" var="element"> 
		  	 		<tr>
		  	 		<td><form action="removeUsers" method="post">
							<input value="${element.id}" name="txt_id" hidden="true">
							<input type="submit" name="login" class="btn btn-danger" value="ازاله">
					 	 </form>
					 	 </td>
					 	 <td>
					 	 <form action="updateUser" method="post">
							<input value="${element.id}" name="txt_id" hidden="true">
							<input type="submit" name="update" class="btn btn-primary" value="تعديل">
					 	 </form>
		  	 		 </td>
		  	 		 <td>${element.nationalId}</td>
		  	 		<td>${element.username}</td>
		  	 		<td>${element.id}</td>
		  	 		 
		  			</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</section>
<%@ include file="/WEB-INF/views/templates/footer.jsp"%>