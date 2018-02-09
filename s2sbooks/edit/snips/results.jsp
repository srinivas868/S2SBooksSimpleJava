<div id="page-wrapper">
	<div class="row">
		<div class="col-lg-12">
			<h1 class="page-header">Results</h1>
		</div>
		<!-- /.col-lg-12 -->
	</div>
	<div class="row">
		<div class="col-lg-12">
			<!-- /.panel-heading -->
			<c:set var="count" value="0" />
			<c:forEach items="${bookInfoEditItems}" var="item" varStatus="status">
				<div class="panel panel-default">
					<div class="panel-body">
						<div class="row">
							<div class="col-lg-6">
								<c:set var="count" value="${status.count}" />
								<form role="form">
									<div class="form-group">
										<div>
											<label for="sel1">ISBN</label> <span
												class="isbn-editable${status.count}"><fmt:formatNumber
													value="${item.isbn}" type="NUMBER" pattern="#" /></span> 
											<input type="button" value="Edit"
												class="btn btn-primary btn-xs btn_edit"
												id="isbn-edit${status.count}"></input>
										</div>
										<br />
										<div>
											<label for="sel1">Title</label> <span
												class="title-editable${status.count}" class="editable1">${item.title}</span>
											<input type="button" value="Edit"
												class="btn btn-primary btn-xs btn_edit"
												id="title${status.count}"></input>
										</div>
										<br />
										<div>
											<label for="sel1">1<sup>st</sup> Author</label> <span
												class="author-editable${status.count}">${item.firstAuthor}</span>
											<input type="button" value="Edit"
												class="btn btn-primary btn-xs btn_edit"
												id="author${status.count}" ></input>
										</div>
										<br />
										<div>
											<label for="sel1">Condition</label> <select
												class="form-control" style="width: 10%; display: initial;"
												id="condition${status.count}">
												<c:forEach items="${bookConditionItems}" var="cItem">
													<c:choose>
														<c:when test="${cItem.title eq item.condition}">
															<option value="${cItem.title}" selected="selected">${cItem.title}</option>
														</c:when>
														<c:otherwise>
															<option value="${cItem.title}">${cItem.title}</option>
														</c:otherwise>
													</c:choose>
												</c:forEach>
											</select>
										</div>
										<br />
										<div>
											<label for="sel1">Edition</label> <span
												class="edition-editable${status.count}">${item.edition}</span>
											<input type="button" value="Edit"
												class="btn btn-primary btn-xs btn_edit"
												id="edition${status.count}"></input>
										</div>
										<br />
										<div>
											<label for="sel1">Department</label> 
											<select
												class="form-control department" style="width: 15%; display: initial;"
												id="department${status.count}">
												<c:choose>
														<c:when test="${item.department eq ''}">
															<option value="" disabled selected>-- Please Select --</option>
														</c:when>
														<c:otherwise>
															<option value="" disabled>-- Please Select --</option>
														</c:otherwise>
													</c:choose>
												<c:forEach items="${departmentItems}" var="dItem">
													<c:choose>
														<c:when test="${dItem.title eq item.department}">
															<option value="${dItem.title}" selected="selected">${dItem.title}</option>
														</c:when>
														<c:otherwise>
															<option value="${dItem.title}">${dItem.title}</option>
														</c:otherwise>
													</c:choose>
												</c:forEach>
											</select>
										</div>
										<br />
										<input type="hidden" id="subjectName${status.count}" value="${item.subject}"/>
										<div>
											<label for="sel1">Subject</label> 
											<select
												class="form-control subject" style="width: 15%; display: initial;"
												id="subject${status.count}">
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
											</select> <br />
										</div>
										<br />
										<div>
											<label for="sel1">Status</label> <select
												class="form-control" style="width: 15%; display: initial;"
												id="status${status.count}">
												<c:forEach items="${bookStatusItems}" var="stItem">
													<c:choose>
														<c:when test="${stItem.title eq item.status}">
															<option value="${stItem.title}" selected="selected">${stItem.title}</option>
														</c:when>
														<c:otherwise>
															<option value="${stItem.title}">${stItem.title}</option>
														</c:otherwise>
													</c:choose>
												</c:forEach>
											</select>
										</div>
										<br />
										<div>
											<label for="sel1">Price</label> <span
												class="price-editable${status.count}">${item.price}</span> <input
												type="button" value="Edit"
												class="btn btn-primary btn-xs btn_edit"
												id="price${status.count}"></input>
										</div>
									</div>
									<input type="hidden" value="${item.id}" id="id${status.count}" />
									<%-- <a href="javascript:saveBook(${status.count})"
										class="btn btn-lg btn-success btn-block">Save</a> --%>
								</form>
								<br />
							</div>
						</div>
					</div>
				</div>
			</c:forEach>
			<a href="javascript:saveBook()" class="btn btn-lg btn-success btn-block">Save and Submit</a>
			<a href="javascript:cancelSaveBook()" class="btn btn-lg btn-success btn-block">Cancel</a><br/><br/><br/><br/>
			<input type="hidden" value="${count}" id="count" />
		</div>
	</div>
</div>

<script>
	for (i = 1; i <= $('#count').val(); i++) {
		$(".isbn-editable" + i).editable({
			trigger : $("input#isbn-edit" + i),
			action : "click"
		}, function(e) {
		});
		$(".title-editable" + i).editable({
			trigger : $("input#title" + i),
			action : "click"
		}, function(e) {
		});
		$(".author-editable" + i).editable({
			trigger : $("input#author" + i),
			action : "click"
		}, function(e) {
		});
		$(".edition-editable" + i).editable({
			trigger : $("input#edition" + i),
			action : "click"
		}, function(e) {
		});
		$(".price-editable" + i).editable({
			trigger : $("input#price" + i),
			action : "click"
		}, function(e) {
		});

		/* $('select#department' + i).prepend($('<option>', {
			value : '',
			text : '-- Please Select --',
			disabled : 'disabled'
		})); */

		$("select#subject" + i).html(
				$("select#subject" + i + "  option").sort(function(a, b) {
					if (!a.value)
						return;
					return a.text == b.text ? 0 : a.text < b.text ? -1 : 1
				}));
		$('select#subject' + i).append($('<option>', {
			value : 'Other',
			text : 'Other'
		}));
		var subjectName = $('#subjectName'+i).val();
		if(subjectName == ''){
			$('select#subject' + i).prepend($('<option>', {
				value : '',
				text : '-- Please Select --',
				disabled : 'disabled',
				selected : 'selected'
			}));
		}
		else{
			$('select#subject' + i).prepend($('<option>', {
				value : '',
				text : '-- Please Select --',
				disabled : 'disabled'
			}));
		}
		$("select#subject"+i+" option[value='"+subjectName+"']").prop('selected','selected');
		$("select#department"+i).selectpicker({
		    container: 'body'   
		});

		if( /Android|webOS|iPhone|iPad|iPod|BlackBerry/i.test(navigator.userAgent) ) {
		    $("select#department"+i).selectpicker('mobile');
		}
		$("select#condition"+i).selectpicker({
		    container: 'body'   
		});

		if( /Android|webOS|iPhone|iPad|iPod|BlackBerry/i.test(navigator.userAgent) ) {
		    $("select#condition"+i).selectpicker('mobile');
		}
		$("select#subject"+i).selectpicker({
		    container: 'body'   
		});

		if( /Android|webOS|iPhone|iPad|iPod|BlackBerry/i.test(navigator.userAgent) ) {
		    $("select#subject"+i).selectpicker('mobile');
		}
		$("select#status"+i).selectpicker({
		    container: 'body'   
		});

		if( /Android|webOS|iPhone|iPad|iPod|BlackBerry/i.test(navigator.userAgent) ) {
		    $("select#status"+i).selectpicker('mobile');
		}
	}
	
	/* $('select.department').change(function() {
		$('select.department').each(function() {
			var selected = $(this).find(":selected").text();
			console.log("DD" + selected);
			if (selected == 'Business') {
				$(this).closest('select.subject option').show();
			} else {
				$(this).closest('select.subject option').hide();
				$(this).closest("select.subject option[value='Other']").show();
				$(this).closest("select.subject option[value='']").show();
			}
		});
	}); */
</script>