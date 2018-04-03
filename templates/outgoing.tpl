<div class="outgoing">

	<!-- IMPORT partials/breadcrumbs.tpl -->

	<div>
		<h3>
			[[notifications:outgoing_link_message, {title}]]
		</h3>
		
		<a href="{outgoing}" rel="nofollow noopener noreferrer">[[notifications:continue_to, {outgoing}]]</a>
		</br>
		<a id="return-btn" href="#" class="btn btn-lg btn-warning">[[notifications:return_to, {title}]]</a>
	</div>
</div>

<script>
	$('#return-btn').on('click', function() {
		history.back();
		return false;
	});
</script>
