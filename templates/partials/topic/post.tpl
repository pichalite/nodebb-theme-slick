<div class="row post-header">
	<div class="col-xs-12">
		<div class="post-time pull-left">
			<span class="timeago" title="{posts.timestampISO}"></span>
		</div>
		<div class="post-editor pull-left">
			<i component="post/edit-indicator" class="fa fa-pencil-square pointer edit-icon <!-- IF !posts.editor.username -->hidden<!-- ENDIF !posts.editor.username -->"></i>
			<small data-editor="{posts.editor.userslug}" component="post/editor" class="hidden">[[global:last_edited_by, {posts.editor.username}]] <span class="timeago" title="{posts.editedISO}"></span></small>
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
			<img component="user/picture" data-uid="{posts.user.uid}" class="user-avatar" src="{posts.user.picture}" alt="{posts.user.username}" itemprop="image" />
			<!-- ELSE -->
			<div component="user/picture" data-uid="{posts.user.uid}" class="user-icon" style="background-color: {posts.user.icon:bgColor};">{posts.user.icon:text}</div>
			<!-- ENDIF posts.user.picture -->
		</a>
		<div class="author">
			<a href="<!-- IF posts.user.userslug -->{config.relative_path}/user/{posts.user.userslug}<!-- ELSE -->#<!-- ENDIF posts.user.userslug -->">
			{posts.user.username}
		</a>
		<!-- BEGIN posts.user.selectedGroups -->
			<br>
			<!-- IF posts.user.selectedGroups.slug -->
			<a href="{config.relative_path}/groups/{posts.user.selectedGroups.slug}"><small class="label group-label" style="color:{posts.user.selectedGroups.textColor}; background-color: {posts.user.selectedGroups.labelColor};"><!-- IF posts.user.selectedGroups.icon --><i class="fa {posts.user.selectedGroups.icon}"></i> <!-- ENDIF posts.user.selectedGroups.icon -->{posts.user.selectedGroups.userTitle}</small></a>
			<!-- ENDIF posts.user.selectedGroups.slug -->
		<!-- END posts.user.selectedGroups -->
		</div>
	</div>
	<div class="col-sm-10 col-md-10 col-lg-10 post-content" component="post/content">
		{posts.content}
	</div>
	<!-- IF posts.user.signature -->
	<div class="col-sm-10 col-md-10 col-lg-10">
		<div class="post-signature" component="post/signature" data-uid="{posts.user.uid}">
			{posts.user.signature}
		</div>
	</div>
	<!-- ENDIF posts.user.signature -->
</div>
<div class="row post-footer">
	<div class="col-xs-12">
		<div class="pull-left">
			{posts.reactions}
		</div>
		<div class="pull-right">
			<div class="post-tools">
				<a component="post/reply" href="#" class="no-select <!-- IF !privileges.topics:reply -->hidden<!-- ENDIF !privileges.topics:reply -->">[[topic:reply]]</a>
				<a component="post/quote" href="#" class="no-select <!-- IF !privileges.topics:reply -->hidden<!-- ENDIF !privileges.topics:reply -->">[[topic:quote]]</a>
			</div>

			<!-- IMPORT partials/topic/post-menu.tpl -->
		</div>
	</div>
</div>
