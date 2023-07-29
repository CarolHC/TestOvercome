<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="js/login.js"></script>
<div class="container">
	<div class="col text-center">
		<img src="/img/logo/logo_overcome.png" class="rounded" alt="Overcome Test" style="width: 120px;">
	</div>
	<div id="loginForm" class="card card-login mx-auto mt-1">
		<div class="card-header text-center h5">Accede a tu cuenta</div>
		<div class="card-body">
			<c:if test="${not empty error}">
				<div class=" col-lg-12 col-md-12 col-sm-12 col-xs-12 errorblock animated shake text-danger">* Nombre de usuario o contraseña no válidos</div>
			</c:if>
			<form id="loginForm" name='f' action="/j_spring_security_check" method='POST' class="">
				<div class="form-group">
					<label for="exampleInputEmail1"><i class="fas fa-at text-secondary"></i> Correo Electrónico:</label> <input class="form-control" id="exampleInputEmail1" type="email" aria-describedby="emailHelp"
						placeholder="Correo Electrónico:" name="j_username" required>
				</div>
				<div class="form-group">
					<label for="exampleInputPassword1"><i class="fas fa-unlock-alt text-secondary"></i> Contraseña:</label> <input class="form-control" id="password" type="password" placeholder="Contraseña"
						name="j_password" required>
				</div>
				<input type="submit" class="btn btn-primary btn-block" value="Comenzar">
			</form>
			<div class="text-center mt-2">
				<a id="forgot-password" class="d-block small text-muted" href="#forgot-password">Recuperar contraseña</a>
			</div>
		</div>
	</div>
	<div id="resetPw" class="card card-login mx-auto mt-1" style="display: none">
		<div class="card-header text-center">Recuperar contraseña</div>
		<div class="card-body">
			<div class="text-center mt-2 mb-4">
				<h4>¿Olvidaste tu constraseña?</h4>
				<p class="text-muted">Escribe tu correo electrónico, y te enviaremos las instrucciones para restaurar tu contraseña.</p>
			</div>
			<form>
				<div class="form-group">
					<input class="form-control" id="email" type="email" aria-describedby="emailHelp" placeholder="ejemplo@dominio.com" style="text-align: center">
				</div>
				<div class="form-group">
					<button id="sendMail" class="btn btn-primary btn-block">Enviar</button>
				</div>
			</form>
			<div class="text-center">
				<a class="d-block small" href=""><i class="fas fa-arrow-left"></i> Regresar al login</a>
			</div>
		</div>
	</div>
</div>