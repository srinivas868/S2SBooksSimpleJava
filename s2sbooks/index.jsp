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
                                    <p>To use this website, you must have the <b>13 digit ISBN of the book.</b>
                                    If you want to sell a book, click on <b>SELL</b> and enter the details of the book you are selling. 
                                    You can click on <b>EDIT</b> after that to edit the details of any of the books you are selling. 
                                    Buyers will contact you to ask about the book using the email you post in the details. 
                                    After you sell a book, please go to <b>EDIT</b> and <b>change the status of the book to Sold.</b> 
                                    If you want to buy a book, click on <b>BUY</b> and enter the ISBN of the book. 
                                    You will find the different sellers and their email addresses and can contact them directly. </p>
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
