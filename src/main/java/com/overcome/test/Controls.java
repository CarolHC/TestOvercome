package com.overcome.test;

public interface Controls {

	public static final String APP_VERSION = "0.0.3";
	public static final boolean SANDBOX = true;
	
	public static final String SANDBOX_DOMAIN = "sandbox-cona.appspot.com";
	public static final String DOMAIN = "tareasdeforest.appspot.com";
	
	public static final String APP_OUTCOME_MAIL_NOREPLY = "no-reply";
	public static final String APP_OUTCOME_MAIL_NAME = "CONA";
	public static final String APP_MAIL = ".appspotmail.com";
	
	public static final String ZAPIER_RECOVER_PASSWORD = "https://zapier.com/hooks.....";
	public static final short MAX_USER_LIMIT = 1000;
	public static final short MAX_RECORD_LIMIT = 500;
	public static final short MAX_MOVEMENTS_LIMIT = 500;
	public static final short MAX_DOCUMENT_LIMIT = 500;
	public static final short MAX_TICKET_LIMIT = 500;
	
	public static final String QUEUE_NOTIFY = "queueNotify";
	public static final int DEFAULT_QUERY_LIMIT = 250;
	public static final int DEFAULT_ACCUARACY = 5_000;
	public static final short MAX_SEARCH_LIMIT = 1_000;
	
	public enum Page{
		PANEL("page.panel"),
		LOGIN("page.login"),
		CLIENTS("page.clientsList"),
		CLIENT_DETAILS("page.client"),
		USERS("page.usersList"),
		USER_DETAIL("page.user"),
		CATALOGS("page.catalog"),
		REPORT("page.report"),
		PROFILE("page.profile"),
		RESET_PASSWORD("page.resetPassword"),
		EXPIRED_PAGE("page.expired")
		;
		private String tiles;
		private Page(String tiles) { this.tiles = tiles; }
		public String getTiles() {
			return tiles;
		}
	}

	public enum Component{
		NAV("component.navbar"),
		NEW_USER_FORM("component.partner.newUserForm"),
		CATALOG("component.partner.catalog"),
		PARTNER("component.partner"),
		MASIVE_UPLOAD("component.partner.masiveUpload"),
		USER_DETAIL("component.partner.userDetail"),
		TASKS("component.employee.tasks"),
		CLIENTS("component.clients"),
		NEW_REPORT_FORM("component.employee.tasks"),
		NEW_CLIENT_FORM("component.clients.newClientForm"),
		CLIENT_DETAIL("component.clients.clientDetail"),
		USER_PROFILE("component.userProfile"),
		REPORT_TABLE("component.partner.reportDetailTable"),
		INVOICE_MANGER("component.partner.invoice.manager"),
		ROLES_MANAGER("component.permissions.roles.manager"),
		ROLES_TABLE("component.permissions.roles.roleTable"),
		ROLES_OFFICE("component.permissions.roles.office"),
		ROLES_SYSTEM("component.permissions.roles.system"),
		LIST_PERMISSIONS_SYSTEM("component.permissions.roles.listSystem"),
		LIST_PERMISSIONS_OFFICE("component.permissions.roles.listOffice"),
		SAFEGUARD_DOCUMENTS("component.permissions.safeguard.documents"),
		CONFIG_OFFICE("component.configuration.offices"),
		EMPLOYE_TO_OFFICE_FORM("component.permissions.employe.addToOffice"),
		TEMPLATES("component.permissions.templates"),
		MODAL_SAFEGUARD("component.modal"),
		;
		
		private String tiles;
		private Component(String tiles) {this.tiles = tiles;}
		public String getTiles() {
			return tiles;
		}
	}
	
	public enum Dialog{
		USER("dialog.user"),
		CLIENT("dialog.client"),
		REPORT("dialog.report")
		;
		private String tiles;
		private Dialog(String tiles) { this.tiles = tiles; }
		public String getTiles() {
			return tiles;
		}
	}
	
	public enum Mail {
		RECOVER_PASSWORD("mail.recoverpassword"),
		NOTIFICATION("mail.notification"),
		ALERT_ADMIN("mail.alertAdmin")
		;
		private String tiles;
		private Mail(String tiles) { this.tiles = tiles; }
		public String getTiles() {
			return tiles;
		}
	}
	
	public static String getAppDomain(){
		return SANDBOX ? SANDBOX_DOMAIN : DOMAIN;
	}
}
