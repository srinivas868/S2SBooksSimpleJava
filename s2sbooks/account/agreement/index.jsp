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
			<div class="col-lg-6">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal"
								aria-hidden="true">&times;</button>
							<h4 class="modal-title" id="myModalLabel">Terms and
								Conditions</h4>
						</div>
						<div class="modal-body">This is an agreement content. Please
							read carefully and proceed.</div>
						<div class="modal-footer">
							<a class="btn btn-primary" href="javascript:agreeTerms(1);">
								Agree</a> <a class="btn btn-default"
								href="javascript:agreeTerms(0);"> Disagree</a>
						</div>
					</div>
					<!-- /.modal-content -->
				</div>
			</div>
		</div>
		<!-- /.row -->
		<div class="row">
			<div class="col-lg-12"></div>
		</div>
	</div>
</body>
<jsp:include page="/snips/footer.jsp" />
</html>