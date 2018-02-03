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
                  <h1 class="page-header">Edit</h1>
              </div>
              <!-- /.col-lg-12 -->
          </div>
          <!-- /.row -->
          <c:forEach items="${bookInfoItems}" var="item" varStatus="count">
          	<div class="row">
              <div class="col-lg-12">
                  <div class="panel panel-default">
                      <div class="panel-body">
                          <div class="row">
                              <div class="col-lg-6">
                                  <form role="form">
                                      <div class="form-group">
										  <label for="sel1">Book ${count}:</label>
										  <a href="#" id="isbn">${item.isbn}</a>
										  <a href="#" id="title">${item.title}</a>
										  <a href="#" id="author">${item.firstAuthor}</a>
										  <a href="#" id="condition">${item.condition}</a>
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
          </c:forEach>
          <!-- /.row -->
      </div>
      
    <!-- /#wrapper -->
	<div id="results"></div>
    <jsp:include page="/snips/footer.jsp"/>

</body>

</html>
