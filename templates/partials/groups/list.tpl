	<!-- BEGIN groups -->
	<div class="col-lg-4 col-md-6 col-sm-12" component="groups/summary" data-slug="{groups.slug}">
		<div class="panel panel-default">
			<a href="{config.relative_path}/groups/{groups.slug}" class="panel-heading list-cover" style="<!-- IF groups.cover:thumb:url -->background-image: url({groups.cover:thumb:url});<!-- ENDIF groups.cover:thumb:url -->">
				<h3 class="panel-title">{groups.displayName} <small>{groups.memberCount}</small></h3>
			</a>
			<div class="panel-body">
				<ul class="members">
					{{{each groups.members}}}
					<li>
						<a href="{config.relative_path}/user/{groups.members.userslug}">
							<!-- IF groups.members.picture -->
							<img class="user-avatar" src="{groups.members.picture}" alt="{groups.members.username}" title="{groups.members.username}" />
							<!-- ELSE -->
							<div class="user-icon" style="background-color: {groups.members.icon:bgColor};" title="{groups.members.username}">{groups.members.icon:text}</div>
							<!-- ENDIF groups.members.picture -->
						</a>
					</li>
					{{{end}}}
					<!-- IF groups.truncated -->
					<li class="truncated"><i class="fa fa-ellipsis-h"></i></li>
					<!-- ENDIF groups.truncated -->
				</ul>
			</div>
		</div>
	</div>
	<!-- END groups -->