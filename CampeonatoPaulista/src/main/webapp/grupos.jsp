<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<title>Insert title here</title>
</head>
<body style="background-color: #1D5959;">
	<div id="container"
		style="margin: 0% 8.5% 0% 8.5%; padding: 40px; background-color: white;">
		<a href="/CampeonatoPaulista/"><button
				style="position: absolute; margin-left: -20px; margin-top: -30px; border-radius: 5px; font-size: 20px;">Voltar
				para p�gina principal</button></a>
		<h1 style="text-align: center; margin-bottom: 30px;">Grupos
			do Campeonato Paulista</h1>

		<c:if test="${database != null}">
			<div class="alert alert-danger" role="alert">${database}</div>
		</c:if>

		<c:if test="${grupos.size() != 0}">
			<div class="row">

				<div class="col-6">
					<h3 style="text-align: center;">Grupo A</h3>
					<table class="table table-striped">
						<thead>
							<tr>
								<th scope="col">NOME</th>
								<th scope="col">PT</th>
								<th scope="col">J</th>
								<th scope="col">V</th>
								<th scope="col">E</th>
								<th scope="col">D</th>
								<th scope="col">GP</th>
								<th scope="col">GC</th>
								<th scope="col">SG</th>
							</tr>
						</thead>
						<tbody>


							<c:forEach var="time" items="${grupoA}" varStatus="contador">

								<c:choose>
									<c:when test="${contador.count <= 2}">
										<tr class="table-success">
											<td scope="row"><c:out value="${time.nome_time}" /></td>
											<td><c:out value="${time.pontos}" /></td>
											<td><c:out value="${time.num_jogos_disputados}" /></td>
											<td><c:out value="${time.vitorias}" /></td>
											<td><c:out value="${time.empates}" /></td>
											<td><c:out value="${time.derrotas}" /></td>
											<td><c:out value="${time.gols_marcados}" /></td>
											<td><c:out value="${time.gols_sofridos}" /></td>
											<td><c:out value="${time.saldo_gols}" /></td>
										</tr>
									</c:when>
									<c:otherwise>
										<tr>
											<td scope="row"><c:out value="${time.nome_time}" /></td>
											<td><c:out value="${time.pontos}" /></td>
											<td><c:out value="${time.num_jogos_disputados}" /></td>
											<td><c:out value="${time.vitorias}" /></td>
											<td><c:out value="${time.empates}" /></td>
											<td><c:out value="${time.derrotas}" /></td>
											<td><c:out value="${time.gols_marcados}" /></td>
											<td><c:out value="${time.gols_sofridos}" /></td>
											<td><c:out value="${time.saldo_gols}" /></td>

										</tr>
									</c:otherwise>
								</c:choose>

							</c:forEach>
							<c:forEach var="time" items="${grA}">
								<tr class="table-danger">
									<td scope="row"><c:out value="${time.nome_time}" /></td>
									<td><c:out value="${time.pontos}" /></td>
									<td><c:out value="${time.num_jogos_disputados}" /></td>
									<td><c:out value="${time.vitorias}" /></td>
									<td><c:out value="${time.empates}" /></td>
									<td><c:out value="${time.derrotas}" /></td>
									<td><c:out value="${time.gols_marcados}" /></td>
									<td><c:out value="${time.gols_sofridos}" /></td>
									<td><c:out value="${time.saldo_gols}" /></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>

				<div class="col-6">
					<h3 style="text-align: center;">Grupo B</h3>
					<table class="table table-striped">
						<thead>
							<tr>
								<th scope="col">NOME</th>
								<th scope="col">PT</th>
								<th scope="col">J</th>
								<th scope="col">V</th>
								<th scope="col">E</th>
								<th scope="col">D</th>
								<th scope="col">GP</th>
								<th scope="col">GC</th>
								<th scope="col">SG</th>
							</tr>
						</thead>
						<tbody>

							
							<c:forEach var="time" items="${grupoB}" varStatus="contador">

								<c:choose>
									<c:when test="${contador.count <= 2}">
										<tr class="table-success">
											<td scope="row"><c:out value="${time.nome_time}" /></td>
											<td><c:out value="${time.pontos}" /></td>
											<td><c:out value="${time.num_jogos_disputados}" /></td>
											<td><c:out value="${time.vitorias}" /></td>
											<td><c:out value="${time.empates}" /></td>
											<td><c:out value="${time.derrotas}" /></td>
											<td><c:out value="${time.gols_marcados}" /></td>
											<td><c:out value="${time.gols_sofridos}" /></td>
											<td><c:out value="${time.saldo_gols}" /></td>
										</tr>
									</c:when>
									<c:otherwise>
										<tr>
											<td scope="row"><c:out value="${time.nome_time}" /></td>
											<td><c:out value="${time.pontos}" /></td>
											<td><c:out value="${time.num_jogos_disputados}" /></td>
											<td><c:out value="${time.vitorias}" /></td>
											<td><c:out value="${time.empates}" /></td>
											<td><c:out value="${time.derrotas}" /></td>
											<td><c:out value="${time.gols_marcados}" /></td>
											<td><c:out value="${time.gols_sofridos}" /></td>
											<td><c:out value="${time.saldo_gols}" /></td>

										</tr>
									</c:otherwise>
								</c:choose>

							</c:forEach>
							<c:forEach var="time" items="${grB}">
								<tr class="table-danger">
									<td scope="row"><c:out value="${time.nome_time}" /></td>
									<td><c:out value="${time.pontos}" /></td>
									<td><c:out value="${time.num_jogos_disputados}" /></td>
									<td><c:out value="${time.vitorias}" /></td>
									<td><c:out value="${time.empates}" /></td>
									<td><c:out value="${time.derrotas}" /></td>
									<td><c:out value="${time.gols_marcados}" /></td>
									<td><c:out value="${time.gols_sofridos}" /></td>
									<td><c:out value="${time.saldo_gols}" /></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>

				<div class="col-6">
					<h3 style="text-align: center;">Grupo C</h3>
					<table class="table table-striped">
						<thead>
							<tr>
								<th scope="col">NOME</th>
								<th scope="col">PT</th>
								<th scope="col">J</th>
								<th scope="col">V</th>
								<th scope="col">E</th>
								<th scope="col">D</th>
								<th scope="col">GP</th>
								<th scope="col">GC</th>
								<th scope="col">SG</th>
							</tr>
						</thead>
						<tbody>

							
							<c:forEach var="time" items="${grupoC}" varStatus="contador">

								<c:choose>
									<c:when test="${contador.count <= 2}">
										<tr class="table-success">
											<td scope="row"><c:out value="${time.nome_time}" /></td>
											<td><c:out value="${time.pontos}" /></td>
											<td><c:out value="${time.num_jogos_disputados}" /></td>
											<td><c:out value="${time.vitorias}" /></td>
											<td><c:out value="${time.empates}" /></td>
											<td><c:out value="${time.derrotas}" /></td>
											<td><c:out value="${time.gols_marcados}" /></td>
											<td><c:out value="${time.gols_sofridos}" /></td>
											<td><c:out value="${time.saldo_gols}" /></td>
										</tr>
									</c:when>
									<c:otherwise>
										<tr>
											<td scope="row"><c:out value="${time.nome_time}" /></td>
											<td><c:out value="${time.pontos}" /></td>
											<td><c:out value="${time.num_jogos_disputados}" /></td>
											<td><c:out value="${time.vitorias}" /></td>
											<td><c:out value="${time.empates}" /></td>
											<td><c:out value="${time.derrotas}" /></td>
											<td><c:out value="${time.gols_marcados}" /></td>
											<td><c:out value="${time.gols_sofridos}" /></td>
											<td><c:out value="${time.saldo_gols}" /></td>

										</tr>
									</c:otherwise>
								</c:choose>

							</c:forEach>
							<c:forEach var="time" items="${grC}">
								<tr class="table-danger">
									<td scope="row"><c:out value="${time.nome_time}" /></td>
									<td><c:out value="${time.pontos}" /></td>
									<td><c:out value="${time.num_jogos_disputados}" /></td>
									<td><c:out value="${time.vitorias}" /></td>
									<td><c:out value="${time.empates}" /></td>
									<td><c:out value="${time.derrotas}" /></td>
									<td><c:out value="${time.gols_marcados}" /></td>
									<td><c:out value="${time.gols_sofridos}" /></td>
									<td><c:out value="${time.saldo_gols}" /></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>

				<div class="col-6">
					<h3 style="text-align: center;">Grupo D</h3>
					<table class="table table-striped">
						<thead>
							<tr>
								<th scope="col">NOME</th>
								<th scope="col">PT</th>
								<th scope="col">J</th>
								<th scope="col">V</th>
								<th scope="col">E</th>
								<th scope="col">D</th>
								<th scope="col">GP</th>
								<th scope="col">GC</th>
								<th scope="col">SG</th>
							</tr>
						</thead>
						<tbody>

							<c:forEach var="time" items="${grupoD}" varStatus="contador">

								<c:choose>
									<c:when test="${contador.count <= 2}">
										<tr class="table-success">
											<td scope="row"><c:out value="${time.nome_time}" /></td>
											<td><c:out value="${time.pontos}" /></td>
											<td><c:out value="${time.num_jogos_disputados}" /></td>
											<td><c:out value="${time.vitorias}" /></td>
											<td><c:out value="${time.empates}" /></td>
											<td><c:out value="${time.derrotas}" /></td>
											<td><c:out value="${time.gols_marcados}" /></td>
											<td><c:out value="${time.gols_sofridos}" /></td>
											<td><c:out value="${time.saldo_gols}" /></td>
										</tr>
									</c:when>
									<c:otherwise>
										<tr>
											<td scope="row"><c:out value="${time.nome_time}" /></td>
											<td><c:out value="${time.pontos}" /></td>
											<td><c:out value="${time.num_jogos_disputados}" /></td>
											<td><c:out value="${time.vitorias}" /></td>
											<td><c:out value="${time.empates}" /></td>
											<td><c:out value="${time.derrotas}" /></td>
											<td><c:out value="${time.gols_marcados}" /></td>
											<td><c:out value="${time.gols_sofridos}" /></td>
											<td><c:out value="${time.saldo_gols}" /></td>

										</tr>
									</c:otherwise>
								</c:choose>

							</c:forEach>
							<c:forEach var="time" items="${grD}">
								<tr class="table-danger">
									<td scope="row"><c:out value="${time.nome_time}" /></td>
									<td><c:out value="${time.pontos}" /></td>
									<td><c:out value="${time.num_jogos_disputados}" /></td>
									<td><c:out value="${time.vitorias}" /></td>
									<td><c:out value="${time.empates}" /></td>
									<td><c:out value="${time.derrotas}" /></td>
									<td><c:out value="${time.gols_marcados}" /></td>
									<td><c:out value="${time.gols_sofridos}" /></td>
									<td><c:out value="${time.saldo_gols}" /></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>

			</div>
		</c:if>
		<c:if test="${grupos.size() == 0}">

			<form style="text-align: center;"
				action="http://localhost:8080/CampeonatoPaulista/grupos"
				method="post">
				<input type="submit" value="Gerar Grupos"
					style="font-weight: bolder; font-size: 26px; border-radius: 5px; background-color: red;" />
			</form>
		</c:if>
	</div>
	
		<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
		integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
		integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
		integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
		crossorigin="anonymous"></script>
	
</body>
</html>