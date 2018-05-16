<c:set var="bookInfoItems" value="${sessionScope.bookInfoItems}" />
<div id="page-wrapper">
	<div class="row">
		<div class="col-lg-12">
			<h1 class="page-header">Results</h1>
			<p>You can sort by any of the headers (Price,Condition etc.). 
			Once you find the book you like, and it is available, contact the seller for further steps.</p>
		</div>
		<!-- /.col-lg-12 -->
	</div>
	<!-- /.row -->
	
	<c:if test="${not empty bookInfoItems}">
		<div class="row">
			<div class="col-lg-12">
				<div class="panel panel-default">
					<!-- /.panel-heading -->
					<div class="panel-body table-responsive">
						<table width="100%" class="table table-striped table-bordered table-hover"
							id="example">
							<thead>
								<tr>
									<th class="sorting">Status</th>
									<th>Price</th>
									<th>Condition</th>
									<th></th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${bookInfoItems}" var="item" varStatus="status">
									<tr class="odd gradeX">
										<td>${item.status}</td>
										<td><fmt:formatNumber value = "${item.price}" type = "CURRENCY" /></td>
										<td>${item.condition}</td>
										<td><button class="btn btn-primary btn-xs" data-toggle="modal"
											data-target="#modal${status.count}">Details</button></td>
									</tr>
									<div class="modal fade" id="modal${status.count}" tabindex="-1" role="dialog"
										aria-labelledby="myModalLabel" aria-hidden="true">
										<div class="modal-dialog" width="200px;">
											<div class="modal-content">
												<div class="modal-header">
													<button type="button" class="close" data-dismiss="modal"
														aria-hidden="true">&times;</button>
													<h4 class="modal-title" id="myModalLabel">Details</h4>
												</div>
												<div class="modal-body">
													<fmt:formatNumber value = "${item.isbn}" type = "NUMBER" pattern="#"/><br/>
													${item.title}<br/>
													${item.firstAuthor}<br/>
													${item.edition}<br/>
													${item.user.email}
												</div>
											</div>
											<!-- /.modal-content -->
										</div>
										<!-- /.modal-dialog -->
									</div>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</c:if>
	<!-- /#page-wrapper -->
</div>

<script>
$(document).ready(function() {
	  $('#example').DataTable({searching: false});
	});
</script>