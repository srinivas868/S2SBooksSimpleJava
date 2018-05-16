<!DOCTYPE html>
<html lang="en">
<head>
	<jsp:include page="/snips/static-assets.jsp" />
	<%@ include file="/snips/header.jsp" %>
</head>
<body>
	<jsp:include page="/snips/navigation.jsp" />
      <div id="page-wrapper">
          <div class="row">
              <div class="col-lg-12">
                  <h1 class="page-header">All users</h1>
              </div>
              <!-- /.col-lg-12 -->
          </div>
          <!-- /.row -->
          <c:if test="${not empty userItems}">
		<div class="row">
			<div class="col-lg-12">
				<div class="panel panel-default">
					<!-- /.panel-heading -->
					<div class="panel-body table-responsive">
						<table class="table table-striped table-bordered table-hover"
							id="example">
							<thead>
								<tr>
									<th>First Name</th>
									<th>Last Name</th>
									<th>Email</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${userItems}" var="item" varStatus="status">
									<tr class="odd gradeX">
										<td>${item.firstName}</td>
										<td>${item.lastName}</td>
										<td>${item.email}</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</c:if>
      </div>
      
    <!-- /#wrapper -->
	<div id="results"></div>
	<script>
$(document).ready(function() {
	  $('#example').DataTable({searching: false});
	});
</script>
    <jsp:include page="/snips/footer.jsp"/>
</body>
</html>
