<!-- IF loggedIn -->
<!-- BEGIN posts.reactions -->
<span class="reaction <!-- IF posts.reactions.reacted -->reacted<!-- ENDIF posts.reactions.reacted -->" component="post/reaction" data-pid="{posts.pid}" data-reaction="{posts.reactions.reaction}" title="{posts.reactions.usernames}">
	<img class="reaction-emoji" src="{relative_path}/plugins/nodebb-theme-slick/static/images/{posts.reactions.reaction}.png">
	<span class="reaction-emoji-count" data-count="{posts.reactions.memberCount}"></span>
</span>
<!-- END posts.reactions -->
<!-- ENDIF loggedIn -->