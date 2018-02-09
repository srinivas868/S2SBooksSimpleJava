function validateSignUpFields(){
	if($('#firstName').val() == '')
		return false;
	if($('#lastName').val() == '')
		return false;
	if($('#email').val() == '')
		return false;
	if($('#password').val() == '')
		return false;
	if($('#retypePassword').val() == '')
		return false;
	return true;
}

function validateLoginFields(){
	if($('#firstName').val() == '')
		return false;
	if($('#lastName').val() == '')
		return false;
	return true;
}

function validateSellBookFields(){
	if($('#isbn').val() == '')
		return false;
	if($('#condition').find(":selected").val() == '')
		return false;
	if($('#price').val() == '')
		return false;
	return true;
}

function validateSearchBookFields(){
	/*if($('#department').find(":selected").text() == '')
		return false;
	if($('#subject').find(":selected").text() == '')
		return false;*/
	if($('#isbn').val() == '')
		return false;
	return true;
}

function submitSellForm(){
	var status = false;
	if(validateSellBookFields()){
		var input = $('#isbn').val()+"&"+$('#title').val()+"&"+$('#author').val()+"&"+$('#edition').val()+"&"
					+$('#condition').find(":selected").val()+"&"+$('#status').find(":selected").val()+"&"
					+$('#department').find(":selected").val()+"&"+$('#subject').find(":selected").val()+"&"
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
				}
			}
		});
	}
	else{
		alert("Please enter all fields");
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
		alert("Please enter all fields");
	}
	return status;
}

function searchBookWithEdit(){
	var status = false;
	if($('#isbn').val() != ''){
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
		alert("Please enter all fields");
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
				}
			}
		});
	}
	else{
		alert("Please enter all fields");
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
	        		if(data.termsAgreed == 'true'){
	        			alert("Login Successful");
		        		window.location.href = "/s2sbooks/";
	        		}
	        		else{
		        		window.location.href = "/s2sbooks/account/agreement/";
	        		}
	        	} else{
	        		alert(data.message);
	        	}
	        }
		});
	}
	else{
		alert("Please enter all fields");
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
					+$('#department'+i).find(":selected").val()+"&"+$('#subject'+i).find(":selected").val()+"&"
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
	$('select.department').change(function(){
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
	}));
});
