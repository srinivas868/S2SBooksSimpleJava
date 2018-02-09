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
								<form role="form">
									<div class="form-group">
										<label>ISBN (13 digits without dashes)</label> <input
											id="isbn" class="form-control" placeholder="ISBN"> <br />
										<label>Title</label> 
										<input id="title" class="form-control"
											placeholder="Title of Book"> <br /> 
											<label>1<sup>st</sup> Author </label> 
										<input id="author" class="form-control" placeholder="Author">
										<br /> <label>Edition</label> <input id="edition"
											class="form-control" placeholder="Edition"> <br /> <label
											for="sel1">Condition</label> 
											<select class="form-control" id="condition">
											<option value="" disabled selected>-- Please select --</option>
											<c:forEach items="${bookConditionItems}" var="item">
												<option value="${item.title}">${item.title}</option>
											</c:forEach>
										</select> <br /> <label for="sel1">Status</label> <select
											class="form-control" id="status">
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
										<label for="sel1">Department</label> 
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
										</select> <br /> 
										<label>Selling Price</label> <input id="price"
											class="form-control" placeholder="Selling Price">
									</div>
									<a href="javascript:sellAndAddBook()"
										class="btn btn-lg btn-success btn-block">Submit and Add
										Another Book</a> <a href="javascript:sellBook()"
										class="btn btn-lg btn-success btn-block">Submit</a>
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
