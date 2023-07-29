$(initUtils);
$(validForms);

function validMail(mailField) {
	var mail = mailField.val().toLowerCase(), re = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
	mailField.val(mail);
	return mail ? re.test(mail) : true;
}
var Alert = function() {
	var al = this;
	al.e = function(text) {
		var diag = $("<div class='alertMsg alert alert-danger' style='display:none; z-index:999999'>" + text + "</div>");
		$("body").append(diag);
		diag.show("fade");
		setTimeout(function() {
			diag.fadeOut(1000, function() {
				diag.remove();
			})
		}, 3500);
	}
	al.i = function(text) {
		var diag = $("<div class='alertMsg alert  alert-info' style='display:none;'>" + text + "</div>");
		$("body").append(diag);
		diag.show("fade");
		setTimeout(function() {
			diag.fadeOut(1000, function() {
				diag.remove();
			})
		}, 3500);
	}
	al.w = function(text) {
		var diag = $("<div class='alertMsg alert alert-warning' style='display:none;'>" + text + "</div>");
		$("body").append(diag);
		diag.show("fade");
		setTimeout(function() {
			diag.fadeOut(1000, function() {
				diag.remove();
			})
		}, 3500);
	}
	al.d = function(text) {
		var diag = $("<div class='alertMsg alert alert-success' style='display:none;'>" + text + "</div>");
		$("body").append(diag);
		diag.show("fade");
		setTimeout(function() {
			diag.fadeOut(1000, function() {
				diag.remove();
			})
		}, 3500);
	}
	al.s = al.d; 
	return al;
}
var alert = new Alert();

/**
 * Obtener un JSON a partir de un formulario
 * 
 * @param form
 *            {jQuery Object} Donde se encuentran los input
 * @param _selectors
 *            {array o string} tags donde buscar el valor del campo
 * @param _dataAttr
 *            {string} attibuto 'DATA' que usar como nombre del campo
 * @returns {JSON}
 */
function getFormJson(form, _selectors, _dataAttr) {
	if (form.length == 0) {
		console.warn("IllegalParameterException: form was " + form);
		return;
	}
	var json = {}, selectors = _selectors || "input", dataAttr = _dataAttr || "name", i, selector, field, key, holder, tmpArr = [], tmpObj = {}, add = false;
	;
	if (typeof selectors == "string") {
		selectors = [ selectors ];
	}
	for (i = 0; i < selectors.length; i++) {
		selector = selectors[i];
		form.find(selector).each(function(index, element) {
			field = $(element);
			if (field.closest(".array").length) {
				return;
			}
			key = field.data(dataAttr);
			if (key) {
				json[key] = field.val();
			}
		});
	}
	if (form.find(".array").length) {
		form.find(".array").each(function(index, element) {
			holder = $(element);
			if (holder.data("name")) {
				tmpArr.length = 0;
				for (i = 0; i < selectors.length; i++) {
					selector = selectors[i];
					holder.find(".arrayItem").each(function(itemIndex, item) {
						tmpObj = {};
						add = false;
						$(item).find(selector).each(function(index, element) {
							field = $(element);
							key = field.data(dataAttr);
							if (key && field.val()) {
								add = true;
								tmpObj[key] = field.val();
							}
						});
						if (add) {
							tmpArr[tmpArr.length] = tmpObj;
						}
					});
				}
				json[holder.data("name")] = tmpArr;
			}
		});
	}
	return json;
}

function isValidForm(form) {
	var validForm = true, input, text, type;
	form.find(":input,select").each(function(index, element) {
		var validField = true;
		input = $(element);

		try {
			text = input.val().trim();
		} catch (e) {
			text = "";
		}
		type = input.prop("type");
		if (input.prop("required")) {
			validField = text != "";
			if (validField && type == "email") {
				validField = validMail(input);
			}
//			if (validField && type == "tel") {
//				validField = /\d{10}/.test(text);
//			}
		}
		if (text && type == "email") {
			validField = validMail(input);
		}
//		if (text && type == "tel") {
//			validField = /\d{10}/.test(text);
//		}

		if (!validField) {
			input.addClass("is-invalid");
		} else {
			input.removeClass("is-invalid");
		}

		validForm = validForm && validField;
	});
	return validForm;
}

function omitirAcentos(text) {
	var acentos = "ÃÀÁÄÂÈÉËÊÌÍÏÎÒÓÖÔÙÚÜÛãàáäâèéëêìíïîòóöôùúüûÑñÇç", original = "AAAAAEEEEIIIIOOOOUUUUaaaaaeeeeiiiioooouuuunncc", re = null;
	for (var i = 0; i < acentos.length; i++) {
		re = new RegExp(acentos.charAt(i), "g")
		text = text.replace(re, original.charAt(i));
	}
	return text;
}

function allowNumbersOnly(event) {
	var key = event.charCode || event.keyCode || 0, value = $(this).val(), control = window.event.ctrlKey || event.ctrlKeyasdad;
	if (control || (key == 9 || key == 8 || key == 37 || key == 39 || key == 46 || ((key == 190 || key == 110) && value
			.indexOf('.') == -1))) {
		return true;
	} else if ((key < 48 || key > 57) && (key < 96 || key > 105)) {
		event.preventDefault();
	}
}

$(document).ajaxStart(function() {
	showLoader();
});
$(document).ajaxStop(function() {
	hideLoader();
	initUtils();
});

function showLoader() {
  $(".dynamic-content").hide();
	$(".loaderView").show();
}

function hideLoader() {
  $(".dynamic-content").show();
	$(".loaderView").hide();
}

function downloadCSV(csv, filename) {
	var csvFile;
	var downloadLink;

	// CSV file
	csvFile = new Blob([ csv ], {
		type : "text/csv"
	});

	var universalBOM = "\uFEFF";
	
	// Download link
	downloadLink = document.createElement("a");

	if(!filename.includes(".csv")){
		filename += ".csv";
	}
	// File name
	downloadLink.download = filename;

	// Create a link to the file
	//downloadLink.href = window.URL.createObjectURL(csvFile);
	downloadLink.setAttribute('href', 'data:text/csv; charset=utf-8,' + encodeURIComponent(universalBOM+csv));

	// Hide download link
	downloadLink.style.display = "none";

	// Add the link to DOM
	document.body.appendChild(downloadLink);

	// Click download link
	downloadLink.click();
}
$.fn.select2.defaults.set("theme", "bootstrap");
function exportTablesorterToCSV(table, fileName) {
	var csv = [];
	var headers = $("#" + table + " > thead > tr.tablesorter-headerRow th").not(".actions");
	var rowHeader = [];
	for (var i = 0; i < headers.length; i++) {
		var title = $(headers[i]);
		rowHeader.push(title.text());
	}
	csv.push(rowHeader.join(","));

	var rows = $("#" + table + " > tbody > tr:visible").not(".template");
	for (var i = 0; i < rows.length; i++) {
		var rowTable = $(rows[i]);
		var cols = rowTable.find("th, td").not(".actions");
		var row = [];
		for (x = 0; x < cols.length; x++) {
			var item = $(cols[x]);
			var data = item.data();
			if (data.hour) {
				row.push("\"" + data.hour + "\"");
			} else if(data.url){
				row.push("\"" + data.url + "\"");
			}else {
				row.push("\"" + item.text().trim() + "\"");
			}

		}
		csv.push(row.join(","));
	}
	downloadCSV(csv.join("\n"), fileName);
}
$(function() {
	$("body").on("click", ".exportTablesorterCSV", function() {
		var data = $(this).data();
		exportTablesorterToCSV(data.table, data.documenttitle);
	});
});

function myprint(toPrint, css, inline) {
	var win = window.open("", "Imprimir", "toolbar=no, location=no, directories=no, status=no, menubar=no, scrollbars=no, resizable=no, top=0, left=0"),
		doc = [];
	doc.push("<!DOCTYPE html><html><head>");
	doc.push("<meta charset='UTF-8'>");
	doc.push("<meta http-equiv='Content-Type' content='text/html; charset=UTF-8' />");
	if (css ) {
		if (inline) {
			doc.push("<style media='print'>");
			doc.push(css);
			doc.push("</style>");			
		} else {
			if (Array.isArray(css)) {
				for (f in css) {
					doc.push("<link href='/css/");
					doc.push(css[f]);
					doc.push("' rel='stylesheet' media='all' />")
				}
			} else {
				doc.push("<link href='/css/");
				doc.push(css);
				doc.push("' rel='stylesheet' media='all' />");
			}
		}
	}
	doc.push("<script>");
	doc.push("function printPage(){ window.print(); window.onfocus=function(){ window.close(); } }");
	doc.push("</script>")
	doc.push("</head><body>");
	doc.push(toPrint);
	doc.push("<script> setTimeout(printPage, 500); </script>");
	doc.push("</body></html>");
	win.document.write(doc.join(""));	
}
function showConfirmDialog(title,description,confirmCallback, cancelCallback){
	var dialogConfirm = $("#confirmDialog");
	dialogConfirm.find(".modal-title").html(title ? title: "");
	dialogConfirm.find(".modal-body").html(description ? description: "");
	dialogConfirm.find("#confirmButton").unbind().click(confirmCallback);
	dialogConfirm.find("#cancelButton").unbind().click(cancelCallback);
	dialogConfirm.modal();
}

function getIdExpedientTemplate(idExpedient){
	return '<div id="idExpedientRow" class="form-group col-xs-12 col-sm-12 col-md-2 col-lg-2 mb-1"><div><label for="idExpedient">ID Expediente</label><input type="text" class="form-control" data-name="idExpedient" required="" value="' + (idExpedient ? idExpedient : '') + '"></div></div>'; 
}



function numberWithCommas(n) {
	return n.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}

function initUtils(){
	var optionName,selectValue, sIndex;
	$('[data-toggle="tooltip"]').not('.inited').addClass('inited').tooltip();
	$('.ui.accordion').not('.inited').addClass('inited').accordion();
	
	 optionName = $('#selecOffice').find('option:selected').text();
	  $("#nmOffice,.nmOffice").html(optionName);
	  sIndex = $('#selecOffice').find('option:selected').val();
	  $(".listOffices").find(".result-selected").removeClass("result-selected active");
	    $('a[data-option-array-index="' + (sIndex) + '"]').addClass("result-selected active");
	  

	$('#selecOffice').on('change', function() {
		   selectValue = $(this).val();
		   optionName = $(this).find(":selected").text();
		   $("#nmOffice,.nmOffice").html(optionName);
		    sIndex = this.selectedIndex;
		    $(".listOffices").find(".result-selected").removeClass("result-selected active");
		    $('a[data-option-array-index="' + (sIndex) + '"]').addClass("result-selected active");
	});
	
	$(".listOffices").on('click','a',function(){
		var optionIndex= $(this).data("option-array-index");
		console.log(optionIndex);
		$("#selecOffice").val(optionIndex).trigger("change");
	});
	
	

	$("[data-toggle=popover]").popover({
	        container: 'body' // body width
	    });
	
}

function validForms(){
	$("body").on("submit", "form.needs-validation", function(event) {
	        if (this.checkValidity() === false) {
	          event.preventDefault();
	          event.stopPropagation();
	        }
	        $(this).addClass('was-validated');
	      })

} 