<div component="posts" class="posts-list" data-nextstart="{nextStart}">

	<!-- BEGIN posts -->
	<div component="post" class="posts-list-item<!-- IF posts.deleted --> deleted<!-- ELSE --><!-- IF posts.topic.deleted --> deleted<!-- ENDIF posts.topic.deleted --><!-- ENDIF posts.deleted -->" data-pid="{posts.pid}" data-uid="{posts.uid}">
		<div class="post-body">
			<a class="topic-title" href="{config.relative_path}/post/{posts.pid}">
				<!-- IF !posts.isMainPost -->RE: <!-- ENDIF !posts.isMainPost -->{posts.topic.title}
			</a>

			<div component="post/content" class="content">
				{posts.content}
			</div>

			<span class="topic-category"><a href="{config.relative_path}/category/{posts.category.slug}">[[global:posted_in, {posts.category.name}]]</a></span> &bull; <span class="timeago" title="{posts.timestampISO}"></span>
		</div>
	</div>
	<!-- END posts -->
</div>
<div component="posts/loading" class="loading-indicator text-center hidden">
	<i class="fa fa-refresh fa-spin"></i>
</div>