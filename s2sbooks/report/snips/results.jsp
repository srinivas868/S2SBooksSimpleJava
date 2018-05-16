<c:set var="bookInfoItems" value="${sessionScope.auditTrailItems}" />
<div id="page-wrapper">
	<div class="row">
		<div class="col-lg-12">
			<h1 class="page-header">Results</h1>
		</div>
		<!-- /.col-lg-12 -->
	</div>
	<!-- /.row -->
	
	<c:if test="${not empty auditTrailItems}">
		<div class="row">
			<div class="col-lg-12">
				<div class="panel panel-default">
					<!-- /.panel-heading -->
					<div class="panel-body table-responsive">
						<table width="100%" class="table table-striped table-bordered table-hover"
							id="example">
							<thead>
								<tr>
									<th>Last login</th>
									<th>ISBN</th>
									<th></th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${auditTrailItems}" var="item" varStatus="status">
									<tr class="odd gradeX">
										<td>${item.lastLogin}</td>
										<c:choose>
											<c:when test="${item.isbn eq '0'}">
												<td>-</td>
											</c:when>
											<c:otherwise>
												<td><fmt:formatNumber value = "${item.isbn}" type = "NUMBER" groupingUsed="false"/></td>
											</c:otherwise>
										</c:choose>
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
	  $('#example').DataTable({searching: false});
	});
</script>