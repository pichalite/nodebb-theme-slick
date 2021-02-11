<div class="account semitransparent-card">
	<!-- IMPORT partials/breadcrumbs.tpl -->

	<div class="profile  row">
		<div class="col-xs-12">
			<div class="user-info" data-uid="{uid}">
				<!-- IF picture -->
				<img id="user-current-picture" class="user-avatar" src="{picture}" alt="{username}" />
				<!-- ELSE -->
				<div class="user-icon" style="background-color: {icon:bgColor};">{icon:text}</div>
				<!-- ENDIF picture -->
				<i component="user/status" class="fa fa-circle status {status}" title="[[global:{status}]]"></i>
				<h1 class="fullname">
					<!-- IF fullname -->{fullname}
					<!-- ELSE -->{username}
					<!-- ENDIF fullname -->
				</h1>
				<h4 class="username">
					<!-- IF !banned -->@{username}
					<!-- ELSE -->[[user:banned]]
					<!-- ENDIF !banned -->
				</h4>

				<!-- IF isAdminOrGlobalModeratorOrModerator -->
				<!-- IF banned -->
				<div class="text-center">
				<!-- IF banned_until -->
				[[user:info.banned-until, {banned_until_readable}]]
				<!-- ELSE -->
				[[user:info.banned-permanently]]
				<!-- ENDIF banned_until -->
				</div>
				<!-- ENDIF banned -->
				<!-- ENDIF isAdminOrGlobalModeratorOrModerator -->

				<!-- IF loggedIn -->
				<!-- IF !isSelf -->
				<!-- IF !banned -->
				<!-- IF !config.disableChat -->
				<a component="account/chat" href="#" class="btn btn-primary btn-sm"><i class="fa fa-fw fa-comment-o"></i> Chat</a>
				<!-- ENDIF !config.disableChat -->
				<a id="follow-btn" component="account/follow" href="#" class="btn btn-success btn-sm <!-- IF isFollowing -->hide<!-- ENDIF isFollowing -->">[[user:follow]]</a>
				<a id="unfollow-btn" component="account/unfollow" href="#" class="btn btn-warning btn-sm <!-- IF !isFollowing -->hide<!-- ENDIF !isFollowing -->">[[user:unfollow]]</a>
				<!-- ENDIF !banned -->
				<!-- ENDIF !isSelf -->
				<!-- ENDIF loggedIn -->
			</div>

			<!-- IF aboutme -->
			<span component="aboutme" class="text-center aboutme">{aboutmeParsed}</span>
			<!-- ENDIF aboutme -->

			<div class="account-stats">
				<!-- IF !reputation:disabled -->
				<div class="stat">
					<div class="human-readable-number" title="{reputation}">{reputation}</div>
					<span class="stat-label">[[global:reputation]]</span>
				</div>
				<!-- ENDIF !reputation:disabled -->

				<div class="stat">
					<div class="human-readable-number" title="{postcount}">{postcount}</div>
					<span class="stat-label">[[global:posts]]</span>
				</div>

				<div class="stat">
					<div class="human-readable-number" title="{profileviews}">{profileviews}</div>
					<span class="stat-label">[[user:profile_views]]</span>
				</div>

				<div class="stat">
					<div class="human-readable-number" title="{followerCount}">{followerCount}</div>
					<span class="stat-label">[[user:followers]]</span>
				</div>

				<div class="stat">
					<div class="human-readable-number" title="{followingCount}">{followingCount}</div>
					<span class="stat-label">[[user:following]]</span>
				</div>
			</div>

			<div class="text-center profile-meta">
				<span>[[user:joined]]</span>
				<strong class="timeago" title="{joindateISO}"></strong>

				<span>[[user:lastonline]]</span>
				<strong class="timeago" title="{lastonlineISO}"></strong><br />

				<!-- IF email -->
				<span>[[user:email]]</span>
				<strong><i class="fa fa-eye-slash {emailClass}" title="[[user:email_hidden]]"></i> {email}</strong>
				<!-- ENDIF email -->

				<!-- IF websiteName -->
				<span>[[user:website]]</span>
				<strong><a href="{websiteLink}" rel="nofollow noopener noreferrer">{websiteName}</a></strong>
				<!-- ENDIF websiteName -->

				<!-- IF location -->
				<span>[[user:location]]</span>
				<strong>{location}</strong>
				<!-- ENDIF location -->

				<!-- IF age -->
				<span>[[user:age]]</span>
				<strong>{age}</strong>
				<!-- ENDIF age -->
			</div>
		</div>
	</div>

	<hr />
	<!-- IMPORT partials/account/menu.tpl -->

	<div class="row">
		<div class="col-xs-12 account-block hidden">
			<div class="account-picture-block text-center">
				<span>
					<span class="account-username"> {username}</span>
				</span>

				<!-- IF !isSelf -->
				<!-- IF isFollowing -->
				<a component="account/unfollow" href="#" class="btn btn-warning btn-sm">[[user:unfollow]]</a>
				<!-- ELSE -->
				<a component="account/follow" href="#" class="btn btn-success btn-sm">[[user:follow]]</a>
				<!-- ENDIF isFollowing -->
				<!-- ENDIF !isSelf -->
			</div>
		</div>
	</div>
<!--
        <div class="row">
            <div class="col-xs-6">
            <div class="panel panel-default">
                    <div class="panel-heading">
                            <h3 class="panel-title">

                                    [[user:info.ban-history]]

                                    <!-- IF isAdminOrGlobalModerator -->
                                    <!-- IF !banned -->
                                    <!-- IF !isSelf -->
                                    <button class="btn btn-xs pull-right btn-danger" component="account/ban">[[user:ban_account]]</button>
                                    <!-- ENDIF !isSelf -->
                                    <!-- ELSE -->
                                    <!-- IF !isSelf -->
                                    <button class="btn btn-xs pull-right btn-success" component="account/unban">[[user:unban_account]]</button>
                                    <!-- ENDIF !isSelf -->
                                    <!-- ENDIF !banned -->
                                    <!-- ENDIF isAdminOrGlobalModerator -->
                            </h3>
                    </div>
                    <div class="panel-body">
                            <!-- IF history.bans.length -->
                            <ul class="ban-history">
                                    <!-- BEGIN history.bans -->
                                    <li>
                                            <p>
                                                    <span class="timestamp timeago" title="{../timestampISO}"></span> &mdash; {../timestampReadable}<br />
                                                    <!-- IF ../until -->
                                                    <span class="expiry">[[user:info.banned-until, {../untilReadable}]]</span><br />
                                                    <!-- ELSE -->
                                                    <span class="expiry">[[user:info.banned-permanently]]</span><br />
                                                    <!-- ENDIF ../until -->
                                                    <span class="reason"><strong>[[user:info.banned-reason-label]]</strong>: {../reason}</span>
                                            </p>
                                    </li>
                                    <!-- END history.bans -->
                            </ul>
                            <!-- ELSE -->
                            <div class="alert alert-success">[[user:info.no-ban-history]]</div>
                            <!-- ENDIF history.bans.length -->
                    </div>
                </div>
                <div class="col-xs-6">
                </div>
            </div>
            
        </div>
-->
	<div class="row">
		<div class="col-xs-6">
			<h1 class="section-title">[[pages:account/best, {username}]]</h1>

			<!-- IF !bestPosts.length -->
			<div class="alert alert-warning">[[user:has_no_posts]]</div>
			<!-- ENDIF !bestPosts.length -->

			<div component="posts" class="posts-list">
			{{{each bestPosts}}}
			<!-- IMPORT partials/posts_list_item.tpl -->
			{{{end}}}
			</div>
		</div>
		<div class="col-xs-6">
			<h1 class="section-title">[[pages:account/latest-posts, {username}]]</h1>

			<!-- IF !latestPosts.length -->
			<div class="alert alert-warning">[[user:has_no_posts]]</div>
			<!-- ENDIF !latestPosts.length -->
			<div component="posts" class="posts-list">
			{{{each latestPosts}}}
			<!-- IMPORT partials/posts_list_item.tpl -->
			{{{end}}}
			</div>
		</div>
	</div>

	<div id="user-action-alert" class="alert alert-success hide"></div>
</div>
