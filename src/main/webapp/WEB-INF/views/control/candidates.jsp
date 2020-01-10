<%@page import="java.util.List"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page pageEncoding="UTF-8"%>
<%@ page import="com.ahmed.entities.Person"%>
<%@ include file="/WEB-INF/views/templates/control.jsp"%>
<section id="services">
	<div class="container">
	<h1>الطلبات المقدمه</h1>
		<table class="table table-hover" data-row-style="rowStyle" data-height="30">
			<thead>
				<tr>
					
					<th data-field="check">قبول/رفض</th>
					<th data-field="nationalId">الرقم القومى</th>
					<th data-field="name">اسم المرشح</th>
					<th data-field="id">الرقم العام</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${users}" var="element"> 
		  	 		<tr>
		  	 		<td>
		  	 		 	<form action="acceptCandidate" method="post">
							<input value="${element.id}" name="txt_id" hidden="true">
							<input type="submit" name="login" class="btn btn-success" value="قبول">
					 	 </form>
					 	 <form action="rejectCandidate" method="post">
							<input value="${element.id}" name="txt_id" hidden="true">
							<input type="submit" name="login" class="btn btn-danger" value="رفض">
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