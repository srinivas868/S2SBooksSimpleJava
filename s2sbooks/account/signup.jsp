<!DOCTYPE html>
<html lang="en">

<head>
	<jsp:include page="/snips/static-assets.jsp" />
	<c:set var="page" value="signup" />
	<%@ include file="/snips/header.jsp" %>
</head>
<body>
	<jsp:include page="/snips/navigation.jsp" />
    <div id="page-wrapper">
        <div class="row">
            <div class="col-md-4 col-md-offset-4">
                <div class="login-panel panel panel-default-signup">
                    <div class="panel-body">
                        <form id="signupForm" role="form" data-toggle="validator">
                                <div class="form-group">
                                    <input class="form-control" id= "firstName" required placeholder="First Name" name="firstName" autofocus>
                                </div>
                                <div class="form-group">
                                    <input class="form-control" id= "lastName" placeholder="Last Name" name="lastName" value="" required>
                                </div>
                                <div class="form-group">
                                    <input class="form-control" id= "email" placeholder="E-mail" name="email" type="email" autofocus required>
                                </div>
                                <div class="form-group">
                                    <input class="form-control" id= "password" placeholder="Password" name="password" type="password" value="" required>
                                </div>
                                <div class="form-group">
                                    <input class="form-control" id= "retypePassword" placeholder="Re-type password" name="retypePassword" type="password" value="" required>
                                </div>
                                <!-- Change this to a button or input when using this as a form -->
                                <a href="javascript:createUser();" 
                                	class="btn btn-lg btn-success btn-block">Sign Up</a>
                                <div class="form-group">
									<button id="signupSubmit" type="submit" class="btn btn-primary"
										style="display: none;">Submit</button>
								</div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
<jsp:include page="/snips/footer.jsp" />
</html>
