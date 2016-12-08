<div class="account">
	<!-- IMPORT partials/breadcrumbs.tpl -->
	
	<!-- IMPORT partials/account/menu.tpl -->

	<div class="row">
		<div class="col-xs-12">
			<h1>{title}</h1>
	
			<!-- IF !posts.length -->
				<div class="alert alert-warning text-center">{noItemsFoundKey}</div>
			<!-- ENDIF !posts.length -->
		
			<!-- IMPORT partials/posts_list.tpl -->

			<!-- IF config.usePagination -->
				<!-- IMPORT partials/paginator.tpl -->
			<!-- ENDIF config.usePagination -->
		</div>
	</div>
</div>