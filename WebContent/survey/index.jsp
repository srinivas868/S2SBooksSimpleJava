<!DOCTYPE html>
<html lang="en">
<head>
<jsp:include page="/snips/static-assets.jsp" />
<%@ include file="/snips/header.jsp"%>
</head>
<body>
	<jsp:include page="/snips/navigation.jsp" />
	<div id="page-wrapper">
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">Survey</h1>
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
								<form id="surveyForm" role="form" data-toggle="validator">
									<div class="form-group">
										<label for="sel1" class="control-label-required">So far, I have used this website to</label><br> 
											<input type="radio" name="question1" value="Buy a book" required>&nbsp; Buy a book<br/>
											<input type="radio" name="question1" value="Sell a book" required>&nbsp; Sell a book<br>
											<input type="radio" name="question1" value="Buy and sell a book" required>&nbsp; Buy and sell a book<br>
											<input type="radio" name="question1" value="View what it offers" required>&nbsp; View what it offers<br>
											<input type="radio" name="question1" value="None of the above" required>&nbsp; None of the above<br><br>
											
										<label for="sel1" class="control-label-required">In the future, I intend to use this website to </label><br> 
											<input type="radio" name="question2" value="Buy a book" required>&nbsp; Buy a book<br/>
											<input type="radio" name="question2" value="Sell a book" required>&nbsp; Sell a book<br>
											<input type="radio" name="question2" value="Buy and sell a book" required>&nbsp; Buy and sell a book<br>
											<input type="radio" name="question2" value="View what it offers" required>&nbsp; View what it offers<br>
											<input type="radio" name="question2" value="None of the above" required>&nbsp; None of the above<br><br>
											
										<label for="sel1" class="control-label-required">I think having such a website for students is a</label><br> 
											<input type="radio" name="question3" value="Good idea" required>&nbsp; Good idea<br/>
											<input type="radio" name="question3" value="Very Good idea" required>&nbsp; Very Good idea<br>
											<input type="radio" name="question3" value="Excellent Idea" required>&nbsp; Excellent Idea<br>
											<input type="radio" name="question3" value="Do not see the use for it" required>&nbsp; Do not see the use for it<br>
											<input type="radio" name="question3" value="None of the above" required>&nbsp; None of the above<br><br>
											
										<label for="sel1" class="control-label-required">On a scale of 1 star (bad) to 5 starts (great), the website ease of use is</label><br> 
											<input type="radio" name="question4" value="One star" required>&nbsp; One star<br/>
											<input type="radio" name="question4" value="Two stars" required>&nbsp; Two stars<br>
											<input type="radio" name="question4" value="Three stars" required>&nbsp; Three stars<br>
											<input type="radio" name="question4" value="Four stars" required>&nbsp; Four stars<br>
											<input type="radio" name="question4" value="Five stars" required>&nbsp; Five stars<br><br>
											
										<label for="sel1" class="control-label">Please enter any feedback about the website</label><br> 
											<textarea  id="question5" name="question5" class="form-control"
											placeholder="Your response ..."> </textarea><br /> 
									</div>
									<a href="javascript:survey()"
										class="btn btn-lg btn-success btn-block">Submit Suvey</a>
									<div class="form-group">
										<button id="surveySubmit" type="submit" class="btn btn-primary"
											style="display: none;">Submit</button>
									</div>
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
	<jsp:include page="/snips/footer.jsp" />
</body>
</html>
