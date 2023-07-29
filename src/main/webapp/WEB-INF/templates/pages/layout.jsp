<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.overcome.test.Controls" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="t" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="te" uri="http://tiles.apache.org/tags-tiles-extras" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<te:useAttribute id="scripts" name="scripts" classname="java.util.List" ignore="true" />
<te:useAttribute id="styles" name="styles" classname="java.util.List" ignore="true" />
<te:useAttribute id="sections" name="sections" classname="java.util.List" ignore="true" />
<te:useAttribute id="titles" name="titles" classname="java.util.List" ignore="true" />
<te:useAttribute id="subtitles" name="subtitles" classname="java.util.List" ignore="true" />
<te:useAttribute id="images" name="images" classname="java.util.List" ignore="true" />
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		
		<title><t:getAsString name="title" ignore="true" /></title>
		<!-- Estilos para JQuery -->
		<meta charset="utf-8">
		
		
		<meta name="viewport" content="width=device-width initial-scale=1.0">
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="apple-mobile-web-app-capable" content="yes">
		<meta name="mobile-web-app-capable" content="yes">
		<meta name="theme-color" content="#ffffff">
		
		<link rel="apple-touch-icon" sizes="180x180" href="/apple-touch-icon.png">
		<link rel="icon" type="image/png" sizes="32x32" href="/favicon-32x32.png">
		<link rel="icon" type="image/png" sizes="16x16" href="/favicon-16x16.png">
		<link rel="mask-icon" href="/safari-pinned-tab.svg" color="#5bbad5">
		<meta name="apple-mobile-web-app-title" content="Overcome">
		<meta name="application-name" content="Overcome">
		<meta name="msapplication-TileColor" content="#da532c">
		<meta name="theme-color" content="#364757">
		
		<link rel="manifest" href="/manifest.json">
		
		
		
		
		<link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/smoothness/jquery-ui.css" />
		<!-- ESTILOS -->
		<link href='//fonts.googleapis.com/css?family=Roboto' rel='stylesheet' type='text/css' />
		<link href='//fonts.googleapis.com/css?family=Roboto+Condensed' rel='stylesheet' type='text/css' />
		<link href="//fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css" />
		<link href="//fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet"/>
<!-- 		<link href="/vendor/bootstrap/css/bootstrap.css" rel="stylesheet"/> -->
		<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.13/css/all.css" integrity="sha384-DNOHZ68U8hZfKXOrtjWvjxusGo9WQnrNx2sqG0tfsghAvtVlRW3tvkXWZh58N9jp" crossorigin="anonymous">
		<link href="/vendor/select2/css/select2.min.css" rel="stylesheet" />
		<link href="/vendor/select2/css/select2-bootstrap.css" rel="stylesheet" />
		<link href="/css/loader.css" rel="stylesheet" />
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.8.0/css/bootstrap-datepicker.css" integrity="sha256-9w7XtQnqRDvThmsQHfLmXdDbGasYsSjF6FSXrDh7F6g=" crossorigin="anonymous" />
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.8.0/css/bootstrap-datepicker3.css" />
		<link href="/css/sb-admin.css?v=<%=Controls.APP_VERSION %>" rel="stylesheet"/>
		<link href="/css/base.css?v=<%=Controls.APP_VERSION %>" rel="stylesheet"/>
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" rel="stylesheet"/>
		<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css" rel="stylesheet" />
		<link href="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.4.1/semantic.min.css"  rel="stylesheet"/>
		
	
		<!-- SCRIPTS -->
		<script src="/vendor/addToHomeScreen/addtohomescreen.js"></script>
		<script src="/vendor/jquery/jquery.js"></script>
		<script src="/vendor/jquery-easing/jquery.easing.js"></script>
		<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>    
		<script src="https://www.gstatic.com/firebasejs/4.2.0/firebase.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
		<script src="/vendor/select2/js/select2.js"></script>
<!-- 		<script src="/vendor/bootstrap/js/bootstrap.js"></script> -->
		<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.8.0/js/bootstrap-datepicker.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.8.0/locales/bootstrap-datepicker.es.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" />
		<script src="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.4.1/semantic.min.js" />
		<script src="/vendor/momentjs/moment.js"></script>
		<script src="/js/base.js?v=<%=Controls.APP_VERSION %>" ></script>
		<script src="/vendor/jquery-form/jquery.form.min.js"></script>

		<!-- Libreria de datatable de Control de documentos -->
		<script src="/vendor/momentjs/moment.js" type="text/javascript" ></script>
		<script src="/vendor/datatables/jquery.dataTables.min.js" type="text/javascript" ></script>
		<script src="/vendor/datatables/dataTables.bootstrap4.min.js" type="text/javascript" ></script>
		<script src="/vendor/datatables/spanish.js"></script>
		<link rel="stylesheet" type="text/css" href="/vendor/datatables/dataTables.bootstrap4.css">
		
	</head>
	<body data-s="${ sessionScope.sandbox }" class="fixed-nav bg-dark" >
		<t:insertAttribute name="body" ignore="true" />
	</body>
</html>