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
      	 	<div class="col-lg-6">
                    <div class="panel panel-default" style="border-color:#ddd;">
                        <div class="panel-body">
                            <!-- Tab panes -->
                            <div class="tab-content">
                                <div class="tab-pane fade in active" id="home-pills">
                                    <p>Currently, this website is only available for business textbooks and 
                                    	only if you live in Wichita, Kansas. If this pilot works, we may expand this to
                                    	other topics and other places.</p>
                                </div>
                            </div>
                        </div>
                        <!-- /.panel-body -->
                    </div>
                    <!-- /.panel -->
                </div>
          </div>
           <div class="row">
                <div class="col-lg-6">
                    <div class="panel panel-default" style="border-color:#ddd;">
                        <!-- /.panel-heading -->
                        <div class="panel-body" style="text-align:center;">
                            <p>
                                <a href="/s2sbooks/buy/" class="btn btn-primary btn-lg">Buy Book</a>
                            </p>
                            <p>
                                <a href="/s2sbooks/sell/" class="btn btn-primary btn-lg">Sell Book</a>
                            </p>
                            <p>
                                <a href="/s2sbooks/edit/" class="btn btn-primary btn-lg">Edit Book</a>
                            </p>
                        </div>
                        <!-- /.panel-body -->
                    </div>
                </div>
              <!-- /.col-lg-12 -->
          </div>
          <!-- /.row -->
      </div>
</body>
<jsp:include page="/snips/footer.jsp" />
</html>
