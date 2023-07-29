<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.overcome.test.Controls" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<script>
var isAdmin = ${not empty isAdmin ? true : false};
var isEmployee = ${not empty isEmployee ? true : false};
var isPartner = ${not empty isPartner ? true : false};
var isReviewer = ${not empty isReviewer ? true : false};
</script>
<script type="text/javascript" src="/js/panel.js?v=<%=Controls.APP_VERSION %>"></script>
<script type="text/javascript" src="/js/sb-admin.js?v=<%=Controls.APP_VERSION %>"></script>
<div id="page-top" class="fixed-nav sticky-footer bg-dark">
	<tiles:insertDefinition name="component.navbar" />
	<div class="content-wrapper">
		<div class="container-fluid">
			<div class="loaderView center-align">
				<div class="spinner">
					<div class="double-bounce1"></div>
					<div class="double-bounce2"></div>
				</div>
			</div>
			<div class="dynamic-content">
			</div>
		</div>
	</div>

	<div id="confirmDialog" class="modal" tabindex="-1" role="dialog">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title"></h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					
				</div>
				<div class="modal-footer">
					<button id="confirmButton" type="button" class="btn btn-danger" data-dismiss="modal">Si</button>
					<button id="cancelButton" type="button" class="btn btn-secondary" data-dismiss="modal">No</button>
				</div>
			</div>
		</div>
	</div>
</div>