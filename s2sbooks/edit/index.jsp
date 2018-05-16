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
				<h1 class="page-header">Edit</h1>
				<p>Please enter the 13 digit ISBN of the book you wish to buy</p>
			</div>
			<!-- /.col-lg-12 -->
		</div>
		<!-- /.row -->
		<div class="row">
			<div class="col-lg-12">
				<div class="panel panel-default">
					<div class="panel-body">
						<div class="row">
							<div class="col-lg-6">
								<form role="form" id="editForm" data-toggle="validator">
									<div class="sidebar-search">
										<label class="control-label-required">ISBN (13 digits without dashes)</label>
										<div class="input-group custom-search-form">
											<input type="number" class="form-control" id="isbn" placeholder="Search..." required> <span
												class="input-group-btn"><br/>
												<a class="btn btn-default" href="javascript:searchBookWithEdit();">
													<i class="fa fa-search"></i>
												</a>
											</span>
										</div>
										<div class="form-group">
										<button id="editSubmit" type="submit" class="btn btn-primary"
											style="display: none;">Submit</button>
									</div>
										<!-- /input-group -->
									</div>
								</form>
							</div>
							<!-- /.col-lg-6 (nested) -->
						</div>
						<!-- /.row (nested) -->
					</div>
					<!-- /.panel-body -->
				</div>
				<!-- /.panel -->
			</div>
			<!-- /.col-lg-12 -->
		</div>
		<!-- /.row -->
	</div>
	<!-- /#wrapper -->
	<div id="results"></div>
	<jsp:include page="/snips/footer.jsp" />

</body>
</html>
