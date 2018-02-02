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
                        <h3 class="panel-title">S2Sbooks is a Student to Student website to help connect students who are selling their textbooks and those who are buying them.
                            If you are a new member, click on <a href="signup.jsp" style="color: blue;">this</a> link to create an account. If you are an existing member, log in below.
                        </h3>
                    </div>
                </div>
            </div>
            <div class="col-md-4 col-md-offset-4">
                <div class="login-panel panel panel-default">
                    <div class="panel-body">
                        <form role="form">
                            <fieldset>
                                <div class="form-group">
                                    <input class="form-control" id="email" placeholder="E-mail" name="email" type="email" autofocus>
                                </div>
                                <div class="form-group">
                                    <input class="form-control" id="password" placeholder="Password" name="password" type="password" value="">
                                </div>
                                <div class="checkbox">
                                    <label>
                                        <input name="remember" type="checkbox" value="Remember Me">Remember Me
                                    </label>
                                </div>
                                <!-- Change this to a button or input when using this as a form -->
                                <a href="javascript:login()" class="btn btn-lg btn-success btn-block">Login</a>
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
