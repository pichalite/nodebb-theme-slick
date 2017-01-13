<!-- IF config.loggedIn -->
<span class="reactions" component="post/reactions" data-pid="{posts.pid}">
	<span class="reaction-add <!-- IF posts.maxReactionsReached -->max-reactions<!-- ENDIF posts.maxReactionsReached -->" component="post/reaction/add" data-pid="{posts.pid}" title="Add reaction">
		<i class="fa fa-plus-square-o"></i>
	</span>
	<!-- BEGIN posts.reactions -->
	<!-- IMPORT partials/topic/reaction.tpl -->
	<!-- END posts.reactions -->
</span>
<!-- ENDIF config.loggedIn -->
