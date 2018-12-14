<!-- IMPORT partials/breadcrumbs.tpl -->
<div class="row">
	<div class="category col-lg-12 col-sm-12">
		<!-- IMPORT partials/category/subcategory.tpl -->

		<!-- IF children.length --><hr class="hidden-xs"/><!-- ENDIF children.length -->

		<div class="clearfix">
			<!-- IF privileges.topics:create -->
			<button component="category/post" id="new_topic" class="btn btn-primary">[[category:new_topic_button]]</button>
			<!-- ELSE -->
				<!-- IF !loggedIn -->
				<a component="category/post/guest" href="{config.relative_path}/login" class="btn btn-primary">[[category:guest-login-post]]</a>
				<!-- ENDIF !loggedIn -->
			<!-- ENDIF privileges.topics:create -->

			<a href="{url}" class="inline-block">
				<div class="alert alert-warning hide" id="new-topics-alert"></div>
			</a>

			<span class="pull-right" component="category/controls">
				<!-- IMPORT partials/category/watch.tpl -->
				<!-- IMPORT partials/category/sort.tpl -->
				<!-- IMPORT partials/category/tools.tpl -->
			</span>
		</div>

		<hr class="hidden-xs" />

		<h4 class="hidden-xs">{name}</h4>

		<!-- IF !topics.length -->
		<div class="alert alert-warning" id="category-no-topics">
			[[category:no_topics]]
		</div>
		<!-- ENDIF !topics.length -->

		<!-- IMPORT partials/topics_list.tpl -->

		<!-- IF config.usePagination -->
			<!-- IMPORT partials/paginator.tpl -->
		<!-- ENDIF config.usePagination -->
	</div>
</div>

<!-- IMPORT partials/move_thread_modal.tpl -->

<!-- IF !config.usePagination -->
<noscript>
	<!-- IMPORT partials/paginator.tpl -->
</noscript>
<!-- ENDIF !config.usePagination -->
