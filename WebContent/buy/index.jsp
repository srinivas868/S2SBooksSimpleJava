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
                  <h1 class="page-header">Buy Book</h1>
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
										  <label for="sel1">Department:</label>
										  <select class="form-control" id="departments">
										  	<c:forEach items="${departmentItems}" var="item">
										    	<option value="${item.title}">${item.title}</option>
										    </c:forEach>
										  </select>
											<br/>
										<label for="sel1">Subject:</label>
										  <select class="form-control" id="subjects">
										  	<c:forEach items="${departmentItems[0].subjects}" var="item">
										    	<option value="${item.title}">${item.title}</option>
										    </c:forEach>
										  </select>
										  <br/>
                                         <label>Enter ISBN of text book</label>
                                         <input class="form-control" placeholder="Enter ISBN">
                                      </div>
                                      <button type="submit" class="btn btn-default">Submit</button>
                                      <button type="reset" class="btn btn-default">Reset</button>
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
      
       <div id="page-wrapper" style="display:none;">
          <div class="row">
              <div class="col-lg-12">
                  <h1 class="page-header">Results</h1>
              </div>
              <!-- /.col-lg-12 -->
          </div>
          <!-- /.row -->
          <div class="row">
              <div class="col-lg-12">
                  <div class="panel panel-default">
                      <!-- /.panel-heading -->
                      <div class="panel-body">
                          <table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example">
                              <thead>
                                  <tr>
                                      <th>Seller</th>
                                      <th>Status</th>
                                      <th>Price</th>
                                      <th>Contact</th>
                                  </tr>
                              </thead>
                              <tbody>
                                  <tr class="odd gradeX">
                                      <td>Student 1</td>
                                      <td>Active</td>
                                      <td>$10</td>
                                      <td></td>
                                  </tr>
                                  <tr class="odd gradeX">
                                      <td>Student 2</td>
                                      <td>Sold</td>
                                      <td>$9</td>
                                      <td></td>
                                  </tr>
                              </tbody>
                          </table>
                      </div>
                    </div>
            </div>
          </div>
       <!-- /#page-wrapper -->

    </div>
    <!-- /#wrapper -->

    <jsp:include page="/snips/footer.jsp"/>

</body>

</html>
