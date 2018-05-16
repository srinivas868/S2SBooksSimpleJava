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
                  <h1 class="page-header">Survey Report</h1>
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
						<table width="100%" class="table table-striped table-bordered table-hover"
							id="example">
							<thead>
								<tr>
									<th>First Name</th>
									<th>Last Name</th>
									<th>Question 1</th>
									<th>Question 2</th>
									<th>Question 3</th>
									<th>Question 4</th>
									<th>Question 5</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${userItems}" var="item" varStatus="status">
									<tr class="odd gradeX">
										<td>${item.firstName}</td>
										<td>${item.lastName}</td>
										<td>${item.question1}</td>
										<td>${item.question2}</td>
										<td>${item.question3}</td>
										<td>${item.question4}</td>
										<td>${item.question5}</td>
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
    <script>
	$(document).ready(function() {
		  $('#example').DataTable({searching: false});
		});
	</script>
    <!-- /#wrapper -->
	<div id="results"></div>
    <jsp:include page="/snips/footer.jsp"/>
</body>
</html>
