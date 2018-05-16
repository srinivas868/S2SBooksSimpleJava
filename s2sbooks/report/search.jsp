<!DOCTYPE html>
<html lang="en">
<head>
<jsp:include page="/snips/static-assets.jsp" />
<%@ include file="/snips/header.jsp"%>
</head>
<body>
	<jsp:include page="/snips/navigation.jsp" />
	<div id="page-wrapper">
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">Report</h1>
			</div>
			<div class="row">
              <div class="col-lg-12">
                  <div class="panel panel-default">
                      <div class="panel-body">
                          <div class="row">
                              <div class="col-lg-6">
                                  <form role="form" id="reportForm" data-toggle="validator">
                                      <div class="form-group">
                                      	<label class="control-label-required">First name</label>
                                        <input type="text" id="firstName" class="form-control" placeholder="First name"><br>
                                        <label class="control-label-required">Last name</label>
                                        <input type="text" id="lastName" class="form-control" placeholder="Last name"><br>
                                        <label class="control-label-required">Email</label>
                                        <input type="text" id="email" class="form-control" placeholder="Email"><br>
                                      	 <a href="javascript:report()" class="btn btn-lg btn-success btn-block">Find report</a>
                                      </div>
                                      <!-- <div class="form-group">
										<button id="reportSubmit" type="submit" class="btn btn-primary"
											style="display: none;">Submit</button>
									</div> -->
                                   </form>
                              </div>
                          </div>
                      </div>
                   </div>
               </div>
            </div>
		</div>
		<!-- /.row -->
	</div>
	<div id="results"></div>
	<!-- /#wrapper -->
	<jsp:include page="/snips/footer.jsp" />
</body>
</html>
