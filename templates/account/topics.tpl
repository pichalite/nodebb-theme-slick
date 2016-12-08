<div class="account">
	<!-- IMPORT partials/breadcrumbs.tpl -->
	
	<!-- IMPORT partials/account/menu.tpl -->

	<div class="row">
		<div class="col-xs-12">
			<h1>{title}</h1>
	
			<!-- IF !topics.length -->
				<div class="alert alert-warning text-center">{noItemsFoundKey}</div>
			<!-- ENDIF !topics.length -->
	
			<div class="category">
				<!-- IMPORT partials/topics_list.tpl -->
				<!-- IF config.usePagination -->
					<!-- IMPORT partials/paginator.tpl -->
				<!-- ENDIF config.usePagination -->
			</div>
		</div>
	</div>
</div>
