<div class="row post-header">
	<div class="col-xs-12">
		<div class="post-time pull-left">
			<span class="timeago" title="{posts.timestampISO}"></span>
		</div>
		<!-- IF !reputation:disabled -->
		<div class="votes pull-right">
			<a component="post/upvote" href="#" class="<!-- IF posts.upvoted -->upvoted<!-- ENDIF posts.upvoted -->">
				<i class="fa fa-chevron-up"></i>
			</a>

			<span component="post/vote-count" data-votes="{posts.votes}">{posts.votes}</span>

			<!-- IF !downvote:disabled -->
			<a component="post/downvote" href="#" class="<!-- IF posts.downvoted -->downvoted<!-- ENDIF posts.downvoted -->">
				<i class="fa fa-chevron-down"></i>
			</a>
			<!-- ENDIF !downvote:disabled -->
		</div>
		<!-- ENDIF !reputation:disabled -->
	</div>
</div>
<div class="row post">
	<div class="col-sm-2 col-md-2 col-lg-2 post-author">
		<a href="<!-- IF posts.user.userslug -->{config.relative_path}/user/{posts.user.userslug}<!-- ELSE -->#<!-- ENDIF posts.user.userslug -->">
			<!-- IF posts.user.picture -->
			<img component="user/picture" data-uid="{posts.user.uid}" class="user-avatar" src="{posts.user.picture}" align="left" itemprop="image" />
			<!-- ELSE -->
			<div component="user/picture" data-uid="{posts.user.uid}" class="user-icon" style="background-color: {posts.user.icon:bgColor};">{posts.user.icon:text}</div>
			<!-- ENDIF posts.user.picture -->
		</a>
		<div class="author">
		<a href="<!-- IF posts.user.userslug -->{config.relative_path}/user/{posts.user.userslug}<!-- ELSE -->#<!-- ENDIF posts.user.userslug -->">
			{posts.user.username}
		</a>
		</br>
		<!-- IF posts.user.selectedGroup.slug -->
		<a href="{config.relative_path}/groups/{posts.user.selectedGroup.slug}"><small class="label group-label" style="background-color: {posts.user.selectedGroup.labelColor};"><!-- IF posts.user.selectedGroup.icon --><i class="fa {posts.user.selectedGroup.icon}"></i> <!-- ENDIF posts.user.selectedGroup.icon -->{posts.user.selectedGroup.userTitle}</small></a>
		<!-- ENDIF posts.user.selectedGroup.slug -->
		</div>
	</div>
	<div class="col-sm-10 col-md-10 col-lg-10 post-content">
		{posts.content}
	</div>
</div>
<div class="row post-footer">
	<div class="col-xs-12">
		<div class="pull-left">
			<!-- IMPORT partials/topic/reactions.tpl -->
		</div>
		<div class="pull-right">
			<span class="post-tools">
				<a component="post/reply" href="#" class="no-select <!-- IF !privileges.topics:reply -->hidden<!-- ENDIF !privileges.topics:reply -->">[[topic:reply]]</a>
				<a component="post/quote" href="#" class="no-select <!-- IF !privileges.topics:reply -->hidden<!-- ENDIF !privileges.topics:reply -->">[[topic:quote]]</a>
			</span>
			
			<!-- IMPORT partials/topic/post-menu.tpl -->
		</div>
	</div>
</div>
