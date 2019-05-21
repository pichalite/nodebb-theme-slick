<div class="account">
	<!-- IMPORT partials/breadcrumbs.tpl -->

	<!-- IMPORT partials/account/menu.tpl -->
	<!-- IF sessions.length -->
	<div class="row">
		<div class="col-xs-12 col-md-12">
			<h4>[[user:sessions.description]]</h4>
			<ul class="list-group" component="user/sessions">
				<!-- BEGIN sessions -->
				<li class="list-group-item" data-uuid="{../uuid}">
					<div class="pull-right">
						<!-- IF !../current -->
						<!-- IF isSelfOrAdminOrGlobalModerator -->
						<button class="btn btn-xs btn-default" type="button" data-action="revokeSession">Revoke Session</button>
						<!-- ENDIF isSelfOrAdminOrGlobalModerator -->
						<!-- ENDIF !../current -->
						{function.userAgentIcons}
						<i class="fa fa-circle text-<!-- IF ../current -->success<!-- ELSE -->muted<!-- ENDIF ../current -->"></i>
					</div>
					{../browser} {../version} on {../platform}<br />
					<small class="timeago text-muted" title="{../datetimeISO}"></small>
					<ul>
						<li><strong>[[global:ip_address]]</strong>: {../ip}</li>
					</ul>
				</li>
				<!-- END sessions -->
			</ul>
		</div>
	</div>
	<!-- ENDIF sessions.length -->
</div>