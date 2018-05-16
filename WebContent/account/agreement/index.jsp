<!DOCTYPE html>
<html lang="en">
<head>
<jsp:include page="/snips/static-assets.jsp" />
<%@ include file="/snips/header.jsp"%>
</head>
<style>
.modal-dialog{
width:80%;
}
</style>
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
						<div class="modal-body">This S2SBooks Website is provided "as is," with all faults, and BOAL expresses no representations or warranties, of any kind related to this Website or the information contained on this Website. Also, nothing contained on this Website shall be interpreted as advising you to take any sort of action (Buy or Sell).
								In no event shall BOAL, nor any of its creators or members, be held liable for anything arising out of or in any way connected with your use of this Website BOAL shall not be held liable for any direct or indirect, consequential or special liability arising out of or in any way related to my use of this Website.
								<br><br>
								<b>I hereby indemnify to the fullest extent BOAL from and against any and/or all liabilities, costs, demands, causes of action, damages and expenses arising from using this Website.</b>
						</div>
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