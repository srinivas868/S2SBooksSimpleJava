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
          <c:forEach items="${bookInfoItems}" var="item" varStatus="status">
          	<div class="row">
              <div class="col-lg-12">
                  <div class="panel panel-default">
                      <div class="panel-body">
                          <div class="row">
                              <div class="col-lg-6">
                              		<div class="sidebar-search">
			                            <div class="input-group custom-search-form">
			                                <input type="text" class="form-control" placeholder="Search...">
			                                <span class="input-group-btn">
			                                <button class="btn btn-default" type="button">
			                                    <i class="fa fa-search"></i>
			                                </button>
			                            </span>
			                            </div>
			                            <!-- /input-group -->
			                        </div>
                                  <form role="form">
                                      <div class="form-group">
										  <label for="sel1">Book ${status.count}:</label><br/>
										  ISBN: <a href="#" id="isbn${status.count}" class="isbn">${item.isbn}</a>
										  Title: <a href="#" id="title${status.count}" class="title">${item.title}</a><br/>
										  First Author: <a href="#" id="author${status.count}" class="author">${item.firstAuthor}</a><br/>
										  Condition:
										  <select class="form-control" id="condition${status.count}">
										    <option value="Fair">Fair</option>
										    <option value="Good">Good</option>
										    <option value="Very_Good">Very Good</option>
										    <option value="Excellent">Excellent</option>
										  </select>
										  Edition: <a href="#" id="edition${status.count}" class="edition">${item.edition}</a><br/>
										  Price: <a href="#" id="price${status.count}" class="price">${item.price}</a><br/>
										  Subject: <a href="#" id="subject${status.count}" class="subject">${item.subject}</a><br/>
										  Department: <a href="#" id="department${status.count}" class="department">${item.department}</a><br/>
										  Status: <a href="#" id="status${status.count}" class="status">${item.status}</a><br/>
                                      </div>
                                      <a href="javascript:saveBook(1)" class="btn btn-lg btn-success btn-block">Save</a>
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
<script>
$('.isbn').editable({
	type: 'text',
    title: 'Enter username',
    success: function(response, newValue) {
        console.log("Done"); //update backbone model
    }
 });
 
$('.title').editable({
	type: 'text',
    title: 'Enter username',
    success: function(response, newValue) {
        console.log("Done"); //update backbone model
    }
 });
 
$('.author').editable({
	type: 'text',
    title: 'Enter username',
    success: function(response, newValue) {
        console.log("Done"); //update backbone model
    }
 });
 
$('.condition').editable({
    value: 2,    
    source: [
          {value: 1, text: 'Active'},
          {value: 2, text: 'Blocked'},
          {value: 3, text: 'Deleted'}
       ]
 });
 
</script>
</html>
