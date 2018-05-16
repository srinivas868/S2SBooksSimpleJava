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
				<h1 class="page-header">Sell Book</h1>
				<p>Please fill all the required details about each book you want to sell</p>
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
								<form id="sellForm" role="form" data-toggle="validator">
									<div class="form-group">
										<label class="control-label-required">ISBN (13 digits without dashes)</label> 
										<input id="isbn" name="isbn" type="number" class="form-control" placeholder="ISBN"
											data-error="Error" required> <br /> <label class="control-label-required">Title</label>
										<input id="title" name="title" class="form-control"
											placeholder="Title of Book" required> <br /> 
											<label class="control-label-required">1<sup>st</sup>
											Author
										</label> 
										<input id="author" class="form-control" placeholder="Author"
											required> <br /> <label class="control-label-required">Edition</label> <input
											id="edition" name="edition" class="form-control"
											placeholder="Edition" required> <br /> 
											<label for="sel1" class="control-label-required">Condition</label> <select name="condition"
											class="form-control" id="condition" required>
											<c:forEach items="${bookConditionItems}" var="item">
												<option value="${item.title}">${item.title} &nbsp;:&nbsp; ${item.description}</option>
											</c:forEach>
										</select> <br /> 
										<label for="sel1" class="control-label-required">Status</label> <select
											name="status" class="form-control" id="status" required>
											<c:forEach items="${bookStatusItems}" var="item">
												<c:choose>
													<c:when test="${item.title eq 'Sold'}">
														<option value="${item.title}" disabled="disabled">${item.title}</option>
													</c:when>
													<c:otherwise>
														<option value="${item.title}">${item.title}</option>
													</c:otherwise>
												</c:choose>
											</c:forEach>
										</select> <br />
										<%-- <label for="sel1">Department</label> 
										<select class="form-control department" id="department">
											<c:forEach items="${departmentItems}" var="item" varStatus="status">
												<option value="${item.title}">${item.title}</option>
											</c:forEach>
										</select> <br /> 
										<label for="sel1">Subject</label> 
										<select class="form-control subject" id="subject">
											<c:forEach items="${departmentItems[0].subjects}" var="item">
												<option value="${item.title}" style="display: none;">${item.title}</option>
											</c:forEach>
										</select> <br />  --%>
										<label class="control-label-required">Selling Price</label> 
										<input id="price" type="number" class="form-control" placeholder="Selling Price" data-error="Error" required>
									</div>
									<a href="javascript:sellAndAddBook()"
										class="btn btn-lg btn-success btn-block">Submit and Add
										Another Book</a> <a href="javascript:sellBook()"
										class="btn btn-lg btn-success btn-block">Submit</a>
									<div class="form-group">
										<button id="sellSubmit" type="submit" class="btn btn-primary"
											style="display: none;">Submit</button>
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
	<jsp:include page="/snips/footer.jsp" />
</body>
</html>
