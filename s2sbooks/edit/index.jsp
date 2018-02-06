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
								<div class="sidebar-search">
									<label>ISBN (13 digits without dashes)</label>
									<div class="input-group custom-search-form">
										<input type="text" class="form-control" id="isbn" placeholder="Search..."> <span
											class="input-group-btn"><br/>
											<a class="btn btn-default" href="javascript:searchBookWithEdit();">
												<i class="fa fa-search"></i>
											</a>
										</span>
									</div>
									<!-- /input-group -->
								</div>
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
<script>
$('.isbn').editable({
	type: 'text',
    title: 'Enter username',
    success: function(response, newValue) {
        console.log("Done"); //update backbone model
    }
 });
 
$('.title').editable({
	type: 'text',
    title: 'Enter username',
    success: function(response, newValue) {
        console.log("Done"); //update backbone model
    }
 });
 
$('.author').editable({
	type: 'text',
    title: 'Enter username',
    success: function(response, newValue) {
        console.log("Done"); //update backbone model
    }
 });
 
$('.condition').editable({
    value: 2,    
    source: [
          {value: 1, text: 'Active'},
          {value: 2, text: 'Blocked'},
          {value: 3, text: 'Deleted'}
       ]
 });
 
</script>
</html>
