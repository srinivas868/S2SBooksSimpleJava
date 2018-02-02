<!DOCTYPE html>
<html lang="en">

<head>
	<jsp:include page="/snips/header.jsp" />
</head>
<body>
	<jsp:include page="/snips/navigation.jsp" />
      <div id="page-wrapper">
          <div class="row">
              <div class="col-lg-12">
                  <h1 class="page-header">Search</h1>
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
                                          <label>Search here to buy or sell text books</label>
                                          <input class="form-control" placeholder="Enter ISBN">
                                      </div>
                                      <button type="submit" class="btn btn-default">Submit Button</button>
                                      <button type="reset" class="btn btn-default">Reset Button</button>
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
      
       <div id="page-wrapper">
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

    <!-- jQuery -->
    <script src="../vendor/jquery/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="../vendor/bootstrap/js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="../vendor/metisMenu/metisMenu.min.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="../dist/js/sb-admin-2.js"></script>

</body>

</html>
