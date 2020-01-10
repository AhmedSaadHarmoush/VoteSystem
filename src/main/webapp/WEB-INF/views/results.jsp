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
		 <%  
                    Person thisPerson =(Person)session.getAttribute("person");
            		
						     if (thisPerson != null) {  
						    	 if(thisPerson.getType()==2){
						        %>
         <table class="table table-hover" data-row-style="rowStyle" data-height="30">
         	<thead>
         		<th>الصوت المتوقع</th>
         		<th>الصوت الحقيقى</th>
         		<th>اسم الناخب</th>
         	</thead>
         	<tbody>
         		<c:forEach items="${countedVotes}" var="element">
         		<tr>
         			<td>${element.expected.username}</td>
         			<td>${element.candidate.username}</td>
         			<td>${element.user.username}</td>
         		</tr>
         		</c:forEach>
         	</tbody>
         </table >
         <h2>تعلم من النتائج<h2>
         <table class="table table-hover" data-row-style="rowStyle" data-height="30">
         <tr><td>
         <form method="post" action="learn">
         	<div class="form-group">
			  
			</div>
         	<input type="submit" class="btn btn-info btn-lg " value="تعلم">
         </form>
         </td>
         <td>
         <form method="post" action="endSystem">
         	<input type="submit" class="btn btn-danger btn-lg " value="انهاء">
         </form>
         </td></tr>
         </table>
         <%
						    	 }}
         %>
        </div>
    </section>
<%@ include file="/WEB-INF/views/templates/footer.jsp" %>