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
                                         <input id="isbn" class="form-control" placeholder="Enter ISBN">
                                      </div>
                                      <a href="javascript:searchBook()" class="btn btn-lg btn-success btn-block">Search</a>
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
	<div id="results"></div>
    <jsp:include page="/snips/footer.jsp"/>

</body>

</html>
