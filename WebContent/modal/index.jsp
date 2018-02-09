<!DOCTYPE html>
<html lang="en">
<head>
<jsp:include page="/snips/static-assets.jsp" />
<%-- <%@ include file="/snips/header.jsp"%> --%>
</head>
<body>
	<jsp:include page="/snips/navigation.jsp" />
	<div id="page-wrapper">
		<div class="row">
			<div class="col-lg-12">
				<div class="panel panel-default">
					<div class="panel-body">
						<!-- Button trigger modal -->
						<button class="btn btn-primary btn-lg" data-toggle="modal"
							data-target="#myModal">Launch Demo Modal</button>
						<!-- Modal -->
						<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
							aria-labelledby="myModalLabel" aria-hidden="true">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal"
											aria-hidden="true">&times;</button>
										<h4 class="modal-title" id="myModalLabel">Modal title</h4>
									</div>
									<div class="modal-body">Lorem ipsum dolor sit amet,
										consectetur adipisicing elit, sed do eiusmod tempor incididunt
										ut labore et dolore magna aliqua. Ut enim ad minim veniam,
										quis nostrud exercitation ullamco laboris nisi ut aliquip ex
										ea commodo consequat. Duis aute irure dolor in reprehenderit
										in voluptate velit esse cillum dolore eu fugiat nulla
										pariatur. Excepteur sint occaecat cupidatat non proident, sunt
										in culpa qui officia deserunt mollit anim id est laborum.</div>
								</div>
								<!-- /.modal-content -->
							</div>
							<!-- /.modal-dialog -->
						</div>
						<!-- /.modal -->
					</div>
				</div>
			</div>
		</div>
	</div>