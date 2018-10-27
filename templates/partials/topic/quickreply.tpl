<!-- IF privileges.topics:reply -->
<div class="row quick-reply">
    <div class="col-sm-2 hidden-xs reply-user">
    	<a href="<!-- IF loggedInUser.userslug -->{config.relative_path}/user/{loggedInUser.userslug}<!-- ELSE -->#<!-- ENDIF loggedInUser.userslug -->">
			<!-- IF loggedInUser.picture -->
			<img component="user/picture" data-uid="{loggedInUser.uid}" class="user-avatar" src="{loggedInUser.picture}" align="left" itemprop="image" />
			<!-- ELSE -->
			<div component="user/picture" data-uid="{loggedInUser.uid}" class="user-icon" style="background-color: {loggedInUser.icon:bgColor};">{loggedInUser.icon:text}</div>
			<!-- ENDIF loggedInUser.picture -->
		</a>
		<div class="author">
			<a href="<!-- IF loggedInUser.userslug -->{config.relative_path}/user/{loggedInUser.userslug}<!-- ELSE -->#<!-- ENDIF loggedInUser.userslug -->">
				{loggedInUser.username}
			</a>
		</div>
	</div>
	<div class="col-xs-12 col-sm-10 quickreply-message">
		<textarea component="topic/quickreply/text" class="form-control" rows="5"></textarea>
	</div>
	<button component="topic/quickreply/button" class="btn btn-primary">Post quick reply</button>
</div>
<!-- ENDIF privileges.topics:reply -->