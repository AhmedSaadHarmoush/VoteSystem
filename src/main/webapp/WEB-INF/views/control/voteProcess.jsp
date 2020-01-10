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
			        <th data-halign="right" data-align="right"></th>
			        <th data-halign="right" data-align="right"></th>
		        </tr>
    		</thead>
			<tbody>
				<tr>
					<c:choose>
					    <c:when test="${request == 0}">
					        <td> <a href="turnRequest" class="btn btn-success" role="button">turn on</a></td>
					    </c:when>    
					    <c:otherwise>
					        <td> <a href="turnRequest" class="btn btn-danger" role="button">turn off</a></td>
					    </c:otherwise>
					</c:choose>
					
					<td >الترشح للانتخابات </td>
				</tr>
				<tr>
					<c:choose>
					    <c:when test="${voting == 0}">
					       <td> <a href="turnVoting" class="btn btn-success" role="button">turn on</a></td>
					    </c:when>    
					    <c:otherwise>
					        <td> <a href="turnVoting" class="btn btn-danger" role="button">turn off</a></td>
					    </c:otherwise>
					</c:choose>
					<td>التصويت للانتخابات </td>
				</tr>
			</tbody>
		</table>
	</div>
</section>
<%@ include file="/WEB-INF/views/templates/footer.jsp"%>