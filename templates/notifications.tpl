<div class="notifications">

	<!-- IMPORT partials/breadcrumbs.tpl -->

	<div class="dropdown pull-right hidden">
		<button class="btn btn-default dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown" aria-expanded="true">
			<i class="fa fa-eye"></i>
			<span class="caret"></span>
		</button>
		<ul class="dropdown-menu dropdown-menu-right" role="menu" aria-labelledby="dropdownMenu1">
			<li role="presentation"><a role="menuitem" tabindex="-1" href="#" data-ajaxify="false" component="notifications/mark_all">[[notifications:mark_all_read]]</a></li>
		</ul>
	</div>

	<hr />

	<div class="alert alert-info <!-- IF notifications.length -->hidden<!-- ENDIF notifications.length -->">
		[[notifications:no_notifs]]
	</div>

	<div class="notifications-list" data-nextstart="{nextStart}">
	<!-- BEGIN notifications -->
		<div data-nid="{notifications.nid}" class="{notifications.readClass}" component="notifications/item">
			<div class="notification-image">
				<!-- IF notifications.image -->
				<!-- IF notifications.from -->
				<a class="pull-left" href="{config.relative_path}/user/{notifications.user.userslug}"><img class="user-avatar" src="{notifications.image}" /></a>
				<!-- ENDIF notifications.from -->
				<!-- ELSE -->
				<a class="pull-left" href="{config.relative_path}/user/{notifications.user.userslug}"><div class="user-icon" style="background-color: {notifications.user.icon:bgColor};">{notifications.user.icon:text}</div></a>
				<!-- ENDIF notifications.image -->
			</div>
			<div class="notification-msg">
				<a component="notifications/item/link" href="{config.relative_path}{notifications.path}">{notifications.bodyShort}</a>
				
				<span class="timeago" title="{notifications.datetimeISO}"></span>
			</div>
		</div>
	<!-- END notifications -->
	</div>
</div>