<title>S2S Books</title>
<c:set var="user" value="${sessionScope.user}" />
<c:choose>
	<c:when test="${empty user && page ne 'login' && page ne 'signup'}">
		<script>
		window.location.href="/s2sbooks/account/";
		</script>
	</c:when>
	<c:otherwise>
	</c:otherwise>
</c:choose>

<!-- <script>
	$.ajax({
	    url : '/s2sbooks/account/rest/accountmanager/validatelogin',
	    type : 'GET',
	    async : false,
	    datatype : "application/json",
	    contentType: "application/json; charset=utf-8",
	    success : function(data) {
	    	if(data.status != 'success'){
				window.location.href="/s2sbooks/account";
	    	}
	    }
	});
</script> -->