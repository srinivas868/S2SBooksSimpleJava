<!DOCTYPE html>
<html lang="en">
<head>
	<jsp:include page="/snips/static-assets.jsp" />
	<c:set var="page" value="login"/>
	<%@ include file="/snips/header.jsp" %>
</head>
<body>
	<jsp:include page="/snips/navigation.jsp" />
    <div id="page-wrapper">
        <div class="row">
            <div class="col-md-4 col-md-offset-4" style="margin-left: 0%; width: 100%;">
                <div class="login-panel panel panel-default">
                    <div class="panel-heading">
                        <h3 class="panel-title">S2Sbooks is a beta version of a Student-to-Student website to help connect students who are selling their textbooks and those who are buying them. The connection between students is established by having the seller share their email address (and the details of the book(s) they are selling) so buyers can contact them via email. This website does not establish the connection between the buyer and the seller. If you wish to use this website freely and willingly, and you are a new member, click on
                         <a href="signup.jsp" style="color: blue;">this</a> link to create an account. If you are an existing member, log in below.<br><br>
                         NOTE: This application will work on Chrome and Firefox on the iPhone but may not work with Safari.
                        </h3>
                    </div>
                </div>
            </div>
            <div class="col-md-4 col-md-offset-4">
                <div class="login-panel panel panel-default">
                    <div class="panel-body">
                        <form id="loginForm" role="form" data-toggle="validator">
                            <fieldset>
                                <div class="form-group">
                                    <input class="form-control" id="email" placeholder="E-mail" name="email" type="email" autofocus required">
                                </div>
                                <div class="form-group">
                                    <input class="form-control" id="password" placeholder="Password" name="password" type="password" value="" required>
                                </div>
                                <!-- <div class="checkbox">
                                    <label>
                                        <input name="remember" type="checkbox" value="Remember Me">Remember Me
                                    </label>
                                </div> -->
                                <!-- Change this to a button or input when using this as a form -->
                                <a href="javascript:login()" class="btn btn-lg btn-success btn-block">Login</a>
                                <div class="form-group">
									<button id="loginSubmit" type="submit" class="btn btn-primary"
										style="display: none;">Submit</button>
								</div>
                            </fieldset>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <jsp:include page="/snips/footer.jsp" />
</body>
</html>