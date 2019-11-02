
<!-- IF !notifications.length -->
<li class="no-notifs">[[notifications:no_notifs]]</li>
<!-- ENDIF !notifications.length -->

<!-- BEGIN notifications -->
<li class="{notifications.readClass}" data-nid="{notifications.nid}" data-path="{notifications.path}" <!-- IF notifications.pid --> data-pid="{notifications.pid}"<!-- ENDIF notifications.pid --><!-- IF notifications.tid --> data-tid="{notifications.tid}"<!-- ENDIF notifications.tid -->>
	<div class="mark-read" aria-label="Mark Read"></div>
	<span class="relTime">{notifications.timeago}</span>

	<div class="notification-image">
		<!-- IF notifications.image -->
		<!-- IF notifications.from -->
		<a href="{config.relative_path}/user/{notifications.user.userslug}"><img class="pull-left user-avatar"src="{notifications.image}" /></a>
		<!-- ENDIF notifications.from -->
		<!-- ELSE -->
		<a href="{config.relative_path}/user/{notifications.user.userslug}"><div class="pull-left user-icon" style="background-color: {notifications.user.icon:bgColor};">{notifications.user.icon:text}</div></a>
		<!-- ENDIF notifications.image -->
	</div>

	<div class="notification-msg">
		<a href="{notifications.path}">
			{notifications.bodyShort}
		</a>
	</div>

</li>
<!-- END notifications -->
