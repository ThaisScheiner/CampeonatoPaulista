<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Rodadas</title>
</head>
<body>
	<div>
		<jsp:include page="menu.jsp" />
	</div>
	
	<br />
	<br />
	<center>
		<form action="rodada" method="post">
			<input type="submit" name="enviar" id="enviar" value="Rodadas">
		</form>
		
		<br><br>
	
		<c:out value="${mensagem}"> </c:out>
	
		<div class="container-fluid">
			<div class="row">

				<div class="col-md-12">
					<table class="table table-bordered">
						<thead>
							<tr align="center">
								<th>Time A</th>
								
								<th> x </th>
								<br/>
								<th>Time b</th>
								<br/>
								<th>Rodada</th>
								
							</tr>
						</thead>
						<tbody>

							<c:forEach var="jogoN" items="${jogosLista }">
								<tr align="center" class="table-active">
									<td ><c:out value="${jogoN.TimeA }" /></td>
																
									<td> x </td>
									
									<td ><c:out value= "${jogoN.Timeb } "/></td>
									
									<td><c:out value= "${jogoN.Rodada }" /></td>
								
								</tr>	
												
							</c:forEach>
						
						
						</tbody>
					</table>
				</div>
			</div>
		</div>
		<center>
	
</body>
</html>