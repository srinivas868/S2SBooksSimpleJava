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
	if($('#conditions').find(":selected").text() == '')
		return false;
	if($('#price').val() == '')
		return false;
	return true;
}

function validateSearchBookFields(){
	if($('#departments').find(":selected").text() == '')
		return false;
	if($('#subjects').find(":selected").text() == '')
		return false;
	if($('#isbn').val() == '')
		return false;
	return true;
}

function submitSellForm(){
	var status = false;
	if(validateSellBookFields()){
		var input = $('#isbn').val()+"&"+$('#title').val()+"&"+$('#author').val()+"&"+$('#edition').val()+"&"
					+$('#conditions').find(":selected").text()+"&"+$('#status').find(":selected").text()+"&"
					+$('#departments').find(":selected").text()+"&"+$('#subjects').find(":selected").text()+"&"
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
		var input = $('#isbn').val()+"&"+$('#departments').find(":selected").text()+"&"+$('#subjects').find(":selected").text();
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
					alert("User creation was successful. Please try signing in with new email/password");
					window.location.href = "/s2sbooks/account/";
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
	        		alert("Login Successful");
	        		window.location.href = "/s2sbooks/";
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
	var status = false;
	var input = $('.isbn-editable').text()+"&"+$('.title-editable').text()+"&"+$('.author-editable').text()+"&"+$('.edition-editable').text()+"&"
				+$('#condition').find(":selected").text()+"&"+$('#status').find(":selected").text()+"&"
				+$('#department').find(":selected").text()+"&"+$('#subject').find(":selected").text()+"&"
				+$('.price-editable').text()+"&"+$('#id').val();
	$.ajax({
		url : '/s2sbooks/sell/rest/booksInfoManager/update',
		type : 'GET',
		data: input,
		async : false,
		datatype : "application/json",
		contentType: "application/json; charset=utf-8",
		success : function(data) {
			if(data.code == 'success'){
				alert("Edit book was successful")
				window.location.href = "/s2sbooks/edit/";
			} else{
				alert(data.message);
			}
		}
	});
	return status;
}

/*$(document).ready(function(){
	$.ajax({
        url : '/nviz/account/rest/usermanager/validateLogin',
        type : 'GET',
        async : false,
        datatype : "application/json",
        contentType: "application/json; charset=utf-8",
        success : function(data) {
        	if(data.status != 'Success'){
        		console.log("User is not logged in");
        		var loginPage = $('#loginPage').val();
        		if(loginPage == undefined){
        			$("#body").load( "/nviz/account/login.jsp" );
        		}
        	}
        }
	});
});*/

function clicked() {
	alert('I want this');
	document.getElementById('isbn1').click();
	}

function InputCustomerDetailItem(param1, param2) {
    this.param1 = param1;
    this.param2 = param2;
}