<div id="page-wrapper">
	<div class="row">
		<div class="col-lg-12">
			<h1 class="page-header">Results</h1>
		</div>
		<!-- /.col-lg-12 -->
	</div>
	<div class="row">
		<div class="col-lg-12">
			<div class="panel panel-default">
				<!-- /.panel-heading -->
				<div class="panel-body">
					<div class="row">
						<div class="col-lg-6">
							<c:forEach items="${bookInfoEditItems}" var="item">
								<form role="form">
									<div class="form-group">
										<div>
											<label for="sel1">ISBN:</label> 
											<span class="isbn-editable"><fmt:formatNumber value = "${item.isbn}" type = "NUMBER" pattern="#" /></span>
											<input type="button" value="Edit" class="btn btn-primary btn-xs btn_edit" id="isbn-edit"></input>
										</div><br/>
										<div>
											<label for="sel1">Title:</label> 
											<span class="title-editable" class="editable1">${item.title}</span>
											<input type="button" value="Edit" class="btn btn-primary btn-xs btn_edit" id="title"></input>
										</div><br/>
										<div>
											<label for="sel1">1st Author:</label> 
											<span class="author-editable">${item.firstAuthor}</span>
											<input type="button" value="Edit" class="btn btn-primary btn-xs btn_edit" id="author"></input>
										</div><br/>
										<div>
											<label for="sel1">Condition:</label> 
											<select class="form-control" style="width:10%;display: initial;" id="condition">
												<option value="Fair">Fair</option>
												<option value="Good">Good</option>
												<option value="Very_Good">Very Good</option>
												<option value="Excellent">Excellent</option>
											</select> 
										</div><br/>
										<div>
											<label for="sel1">Edition:</label> 
											<span class="edition-editable">${item.edition}</span>
											<input type="button" value="Edit" class="btn btn-primary btn-xs btn_edit" id="edition"></input>
										</div><br/>
										<div>
											<label for="sel1">Department</label>
											  <select class="form-control" style="width:15%;display: initial;" id="department">
											  	<c:forEach items="${departmentItems}" var="dItem">
											  		<c:choose>
											  			<c:when test="${dItem.title eq item.department}">
											  				<option value="${item.title}" selected="selected">${dItem.title}</option>
											  			</c:when>
											  			<c:otherwise>
											  				<option value="${dItem.title}">${dItem.title}</option>
											  			</c:otherwise>
											  		</c:choose>
											    </c:forEach>
											  </select>
										</div><br/>
										<div>
											<label for="sel1">Subject</label>
											  <select class="form-control" style="width:15%;display: initial;" id="subject">
											  	<c:forEach items="${departmentItems[0].subjects}" var="sItem">
											    	<c:choose>
											  			<c:when test="${sItem.title eq item.subject}">
											  				<option value="${sItem.title}" selected="selected">${sItem.title}</option>
											  			</c:when>
											  			<c:otherwise>
											  				<option value="${sItem.title}">${sItem.title}</option>
											  			</c:otherwise>
											  		</c:choose>
											    </c:forEach>
											  </select>
											  <br/>
										</div><br/>
										<div>
											<label for="sel1">Status:</label> 
											<select class="form-control" style="width:15%;display: initial;" id="status">
												<option value="Available">Available</option>
												<option value="Sold">Sold</option>
											</select>
										</div><br/>
										<div>
											<label for="sel1">Price:</label> 
											<span class="price-editable">${item.price}</span>
											<input type="button" value="Edit" class="btn btn-primary btn-xs btn_edit" id="price"></input>
										</div>
									</div>
									<input type="hidden" value="${item.id}" id="id" /> 
									<a href="javascript:saveBook(1)"
										class="btn btn-lg btn-success btn-block">Save</a>
								</form>
							</c:forEach>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<script>
var option = {trigger : $("input#isbn-edit"), action : "click"};
$(".editable").editable(option, function(e){
});
var option2 = {trigger : $("input#title"), action : "click"};
$(".title-editable").editable(option2, function(e){
});
var option3 = {trigger : $("input#author"), action : "click"};
$(".author-editable").editable(option3, function(e){
});
var option4 = {trigger : $("input#edition"), action : "click"};
$(".edition-editable").editable(option4, function(e){
});
var option5 = {trigger : $("input#subject"), action : "click"};
$(".subject-editable").editable(option5, function(e){
});
var option6 = {trigger : $("input#department"), action : "click"};
$(".department-editable").editable(option6, function(e){
});
var option7 = {trigger : $("input#price"), action : "click"};
$(".price-editable").editable(option7, function(e){
});

</script>