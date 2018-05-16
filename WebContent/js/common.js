function validateSignUpFields(){
	var valid = true;
	$('#signupSubmit').click();
	$('#signupForm').submit(function(e) {
	    e.preventDefault();
	});
	$('#signupForm input').each(function() {
	    if ( $(this).val() === '' ) {
	    	valid = false;
	    }
	  });
	return valid;
}

function validateLoginFields(){
	var valid = true;
	$('#loginSubmit').click();
	$('#loginForm').submit(function(e) {
	    e.preventDefault();
	});
	$('#loginForm input').each(function() {
	    if ( $(this).val() === '' ) {
	    	valid = false;
	    }
	  });
	return valid;
}

function checkIsbnNumber(isbn){
	var valid = false;
	if(isbn != ''){
		if(isbn.length === 13){
			valid = true;
		}
		else{
			alert("Please enter 13 digit isbn number");
		}
	}
	return valid;
}
function validateSellBookFields(){
	var valid = true;
	var isbn = $('#isbn').val();
	$('#sellSubmit').click();
	$('#sellForm').submit(function(e) {
	    e.preventDefault();
	});
	if(isbn != '')
		valid = checkIsbnNumber(isbn);
	$('#sellForm input').each(function() {
	    if ( $(this).val() === '' ) {
	    	valid = false;
	    }
	  });
	if($('#condition :selected').val() === '-'){
		valid = false;
		alert("Please select any one option in condition");
		e.preventDefault();
	}
	return valid;
}

function validateSearchBookFields(){
	var valid = true;
	/*$('#buySubmit').click();
	$('#buyForm').submit(function(e) {
	    e.preventDefault();
	});
	$('#buyForm input').each(function() {
	    if ( $(this).val() === '' ) {
	    	valid = false;
	    }
	  });*/
	valid = checkIsbnNumber($('#isbn').val());
	return valid;
}

function validateReportFields(){
	var valid = true;
	$('#reportSubmit').click();
	$('#reportForm').submit(function(e) {
	    e.preventDefault();
	});
	$('#reportSubmit input').each(function() {
	    if ( $(this).val() === '' ) {
	    	valid = false;
	    }
	  });
	return valid;
}

function validateSurveyFields(){
	var valid = true;
	$('#surveySubmit').click();
	$('#surveyForm').submit(function(e) {
	    e.preventDefault();
	});
	if($('input[name=question1]:checked', '#surveyForm').val() === undefined)
		valid = false;
	if($('input[name=question2]:checked', '#surveyForm').val() === undefined)
		valid = false;
	if($('input[name=question3]:checked', '#surveyForm').val() === undefined)
		valid = false;
	if($('input[name=question4]:checked', '#surveyForm').val() === undefined)
		valid = false;
	return valid;
}

function submitSurveyForm(){
	var status = false;validateSurveyFields
	if(validateSurveyFields()){
		var input = $('input[name=question1]:checked', '#surveyForm').val()+"&"+$('input[name=question2]:checked', '#surveyForm').val()+"&"
					+$('input[name=question3]:checked', '#surveyForm').val()+"&"+$('input[name=question4]:checked', '#surveyForm').val();
		if($('#question5').val() === ' ' || $('#question5').val() === '')
			input+="&-";
		else
			input+="&"+$('#question5').val();
		$.ajax({
			url : '/s2sbooks/survey/rest/surveyInfoManager/write',
			type : 'GET',
			data: input,
			async : false,
			datatype : "application/json",
			contentType: "application/json; charset=utf-8",
			success : function(data) {
				if(data.code == 'success'){
					alert("Your response has been recorded");
					status = true;
				} else{
					alert(data.message);
					window.location.href="/s2sbooks/survey/";
				}
			}
		});
	}
	return status;
}

function submitSellForm(){
	var status = false;
	if(validateSellBookFields()){
		var input = $('#isbn').val()+"&"+$('#title').val()+"&"+$('#author').val()+"&"+$('#edition').val()+"&"
					+$('#condition').find(":selected").val()+"&"+$('#status').find(":selected").val()+"&"
					+$('#price').val();
		$.ajax({
			url : '/s2sbooks/sell/rest/booksInfoManager/sell',
			type : 'GET',
			data: input,
			async : false,
			datatype : "application/json",
			contentType: "application/json; charset=utf-8",
			success : function(data) {
				if(data.code == 'success'){
					alert("Your response has been recorded");
					status = true;
				} else{
					alert(data.message);
					window.location.href="/s2sbooks/sell/";
				}
			}
		});
	}
	return status;
}

function sellBook(){
	if(submitSellForm()){
		window.location.href = "/s2sbooks/";
	}
}

function sellAndAddBook(){
	if(submitSellForm()){
		window.location.href = "/s2sbooks/sell/";
	}
}

function survey(){
	if(submitSurveyForm()){
		window.location.href = "/s2sbooks/";
	}
}

function searchBook(){
	var status = false;
	if(validateSearchBookFields()){
		//var input = $('#isbn').val()+"&"+$('#department').find(":selected").val()+"&"+$('#subject').find(":selected").val();
		var input = $('#isbn').val();
		$.ajax({
			url : '/s2sbooks/sell/rest/booksInfoManager/search',
			type : 'GET',
			data: input,
			async : false,
			datatype : "application/json",
			contentType: "application/json; charset=utf-8",
			success : function(data) {
				if(data.code == 'success'){
					$("#results").load("/s2sbooks/buy/snips/results.jsp" );
				} else{
					alert(data.message);
				}
			}
		});
	}
	else{
		//alert("Please enter all fields");
	}
	return status;
}

function searchBookWithEdit(){
	var status = false;
	var valid = checkIsbnNumber($('#isbn').val());
	if(valid){
		var input = $('#isbn').val();
		$.ajax({
			url : '/s2sbooks/sell/rest/booksInfoManager/searchwithedit',
			type : 'GET',
			data: input,
			async : false,
			datatype : "application/json",
			contentType: "application/json; charset=utf-8",
			success : function(data) {
				if(data.code == 'success'){
					$("#results").load("/s2sbooks/edit/snips/results.jsp" );
				} else{
					alert(data.message);
				}
			}
		});
	}
	else{
		//alert("Please enter all fields");
	}
	return status;
}

function report(){
	var status = false;
	if(validateReportFields()){
		var input = $('#firstName').val()+"&"+$('#lastName').val()+"&"+$('#email').val();
		$.ajax({
			url : '/s2sbooks/report/rest/auditTrailInfoManager/search',
			type : 'GET',
			data: input,
			async : false,
			datatype : "application/json",
			contentType: "application/json; charset=utf-8",
			success : function(data) {
				if(data.code == 'success'){
					$("#results").load("/s2sbooks/report/snips/results.jsp" );
				} else{
					alert(data.message);
				}
			}
		});
	}
	else{
		//alert("Please enter all fields");
	}
	return status;
}

function createUser(){
	if(validateSignUpFields()){
		var input = $('#firstName').val()+"&"+$('#lastName').val()+"&"+$('#email').val()+"&"+$('#password').val()+"&"+$('#retypePassword').val();
		$.ajax({
			url : '/s2sbooks/account/rest/accountmanager/signup',
			type : 'GET',
			data: input,
			async : false,
			datatype : "application/json",
			contentType: "application/json; charset=utf-8",
			success : function(data) {
				if(data.code == 'success'){
					alert("User creation was successful");
					window.location.href = "/s2sbooks/account/agreement/";
				} else{
					alert(data.message);
					window.location.href = "/s2sbooks/account/signup.jsp";
				}
			}
		});
	}
	else{
		//alert("Please enter all fields");
	}
	return false;
}

function login(){
	if(validateLoginFields()){
		var input = $('#email').val()+"&"+$('#password').val();
		$.ajax({
	        url : '/s2sbooks/account/rest/accountmanager/login',
	        type : 'GET',
	        data: input,
	        async : false,
	        datatype : "application/json",
	        contentType: "application/json; charset=utf-8",
	        success : function(data) {
	        	if(data.code == 'success'){
	        		if(data.termsAgreed == 'true' && data.surveyAnswered == 'true'){
	        			alert("Login Successful");
		        		window.location.href = "/s2sbooks/";
	        		}
	        		else if(data.termsAgreed == 'false' && data.surveyAnswered == 'false'){
		        		window.location.href = "/s2sbooks/account/agreement/";
	        		}
	        		else if(data.termsAgreed == 'true' && data.surveyAnswered == 'false'){
		        		window.location.href = "/s2sbooks/survey/";
	        		}
	        	} else{
	        		alert(data.message);
	        		window.location.href = "/s2sbooks/account/";
	        	}
	        }
		});
	}
	else{
		//alert("Please enter all fields");
	}
	return false;
}

function logout(){
	var response = confirm("Are you sure you want to logout ??");
	if(response){
		$.ajax({
	        url : '/s2sbooks/account/rest/accountmanager/logout',
	        type : 'GET',
	        async : false,
	        datatype : "application/json",
	        contentType: "application/json; charset=utf-8",
	        success : function(data) {
	        	if(data.code == 'success'){
	        		alert("Logout Successful");
	        		window.location.href = "/s2sbooks/account";
	        	} else{
	        		alert(data.message);
	        	}
	        }
		});
	}
	return false;
}

function agreeTerms(status){
	if(status == 1){
		var input = "true";
		var response = confirm("You have choose to accept terms and conditions");
		if(response){
			$.ajax({
		        url : '/s2sbooks/account/rest/accountmanager/terms',
		        type : 'GET',
		        data: input,
		        async : false,
		        datatype : "application/json",
		        contentType: "application/json; charset=utf-8",
		        success : function(data) {
		        	if(data.code == 'success'){
		        		window.location.href = "/s2sbooks/";
		        	} else{
		        		alert(data.message);
		        	}
		        }
			});
		}
	} else{
		var input = "false";
		$.ajax({
	        url : '/s2sbooks/account/rest/accountmanager/terms',
	        type : 'GET',
	        data: input,
	        async : false,
	        datatype : "application/json",
	        contentType: "application/json; charset=utf-8",
	        success : function(data) {
	        	if(data.code == 'success'){
	        		alert("You have choose to disagree. Please visit the site again to agree terms.");
	        		window.location.href = "/s2sbooks/";
	        	} else{
	        		alert(data.message);
	        	}
	        }
		});
	}
	return false;
}

function userFormResponse(data){
	if('success' == data.code){
		window.location.href = "/s2sbooks/pages/login.jsp";
	}
}
function loginUser(){
	var options = {
		success: loginResponse,
		dataType: 'json'
	};
	var form = $("#loginForm");
	form.ajaxForm(options);
	form.submit();
	return false;
}
function loginResponse(data){
	if('success' == data.status){
		window.location.href='/nviz/index.jsp';
	} else{
		$('div.error-message p').empty();
		$('div.error-message p').append(data.message);
	}
}

function saveBook(){
	var status = true;
	var count = $('#count').val();
	for(i =1; i<=count; i++){
		var input = $('.isbn-editable'+i).text()+"&"+$('.title-editable'+i).text()+"&"+$('.author-editable'+i).text()
					+"&"+$('.edition-editable'+i).text()+"&"
					+$('#condition'+i).find(":selected").val()+"&"+$('#status'+i).find(":selected").val()+"&"
					+$('.price-editable'+i).text()+"&"+$('#id'+i).val();
		$.ajax({
		url : '/s2sbooks/sell/rest/booksInfoManager/update',
		type : 'GET',
		data: input,
		async : false,
		datatype : "application/json",
		contentType: "application/json; charset=utf-8",
		success : function(data) {
			if(data.code != 'success'){
				status = false;
				alert(data.message+" : Book with ISBN "+$('.isbn-editable'+i).text());
			}
		}
		});
	}
	if(status){
		alert("Edit book was successful")
		window.location.href = "/s2sbooks/edit/";
	}
	return status;
}

function cancelSaveBook(){
	//searchBookWithEdit();
	window.location.href = "/s2sbooks/edit/";
}

function InputCustomerDetailItem(param1, param2) {
    this.param1 = param1;
    this.param2 = param2;
}

$(document).ready(function(){
	/*$('select.department').change(function(){
		var selected = $('select.department').find(":selected").text();
		if(selected == 'Business'){
			$("select.subject option").show();
		}
		else{
			$("select.subject option").hide();
			$("select.subject option[value='Other']").show();
			$("select.subject option[value='']").show();
		}
	});
	$('select.department').prepend($('<option>', {
	    value: 'empty',
	    text: '-- Please Select --',
	    disabled: 'disabled',
	    selected: 'selected'
	}));
	$("select.subject").html($("select.subject  option").sort(function (a, b) {
	    if(!a.value) return;
	    return a.text == b.text ? 0 : a.text < b.text ? -1 : 1
	    })); 
	$('select.subject').append($('<option>', {
	    value: 'Other',
	    text: 'Other'
	}));
	$('select.subject').prepend($('<option>', {
	    value: 'empty',
	    text: '-- Please Select --',
	    disabled: 'disabled',
	    selected: 'selected'
	}));*/
	$('select#condition').prepend($('<option>', {
	    value: '-',
	    text: '-- Please Select --',
	    disabled: 'disabled',
	    selected: 'selected'
	}));
	$('#loginForm input').on('keypress',function(e){
	    if(e.keyCode == 13)
	    {
	        $('#submit').click();
	        $('#loginForm').submit(function(e) {
	    	    e.preventDefault();
	    	});
	        login();
	    }
	});
	$('#signupForm input').on('keypress',function(e){
	    if(e.keyCode == 13)
	    {
	        $('#signupSubmit').click();
	        $('#signupForm').submit(function(e) {
	    	    e.preventDefault();
	    	});
	        createUser();
	    }
	});
	$('#buyForm input').on('keypress',function(e){
	    if(e.keyCode == 13)
	    {
	        $('#buySubmit').click();
	        $('#buyForm').submit(function(e) {
	    	    e.preventDefault();
	    	});
	        searchBook();
	    }
	});
	$('#sellForm input').on('keypress',function(e){
	    if(e.keyCode == 13)
	    {
	        $('#sellSubmit').click();
	        $('#sellForm').submit(function(e) {
	    	    e.preventDefault();
	    	});
	        sellBook();
	    }
	});
	$('#editForm input').on('keypress',function(e){
	    if(e.keyCode == 13)
	    {
	        $('#editSubmit').click();
	        $('#editForm').submit(function(e) {
	    	    e.preventDefault();
	    	});
	        searchBookWithEdit();
	    }
	});
	$('#reportForm input').on('keypress',function(e){
	    if(e.keyCode == 13)
	    {
	        $('#reportSubmit').click();
	        $('#reportForm').submit(function(e) {
	    	    e.preventDefault();
	    	});
	        report();
	    }
	});
});
