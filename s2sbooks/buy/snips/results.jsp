<c:set var="bookInfoItems" value="${sessionScope.bookInfoItems}" />
<div id="page-wrapper">
	<div class="row">
		<div class="col-lg-12">
			<h1 class="page-header">Results</h1>
		</div>
		<!-- /.col-lg-12 -->
	</div>
	<!-- /.row -->
	
	<c:if test="${not empty bookInfoItems}">
		<div class="row">
			<div class="col-lg-12">
				<div class="panel panel-default">
					<!-- /.panel-heading -->
					<div class="panel-body">
						<table width="100%" class="table table-striped table-bordered table-hover"
							id="example">
							<thead>
								<tr>
									<th class="sorting">Status</th>
									<th>ISBN</th>
									<th>Title</th>
									<th>First Author</th>
									<th>Edition</th>
									<th>Condition</th>
									<th>Selling Price</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${bookInfoItems}" var="item">
									<tr class="odd gradeX">
										<td>${item.status}</td>
										<td>${item.isbn}</td>
										<td>${item.title}</td>
										<td>${item.firstAuthor}</td>
										<td>${item.edition}</td>
										<td>${item.condition}</td>
										<td>$${item.price}</td>
									</tr>
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
	  $('#example').DataTable();
	});
</script>