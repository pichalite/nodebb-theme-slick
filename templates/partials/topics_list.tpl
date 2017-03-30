<div component="category" class="topic-list" itemscope itemtype="http://www.schema.org/ItemList" data-nextstart="{nextStart}" data-set="{set}">
    <meta itemprop="itemListOrder" content="descending">
    <!-- IF topics.length -->
    <div class="row topics-header hidden-xs hidden-sm">
        <div class="col-md-8 col-xs-12"><div class="header-title">[[global:topics]]</div></div>
        <div class="col-md-1"><div class="header-title">[[global:posts]]</div></div>
        <div class="col-md-1"><div class="header-title">[[global:views]]</div></div>
        <div class="col-md-2"><div class="header-title">Last Reply</div></div>
    </div>
    <!-- ENDIF topics.length -->
    <!-- BEGIN topics -->
    <div component="category/topic" class="row category-item {function.generateTopicClass}" <!-- IMPORT partials/data/category.tpl -->>
		<meta itemprop="name" content="{function.stripTags, title}">
		<div class="col-md-8 col-xs-12">
			<!-- IF showSelect -->
	        <div class="checkbox pull-left" component="topic/select">
                <label>
                    <div class="select"></div>
                    <i class="input-helper"></i>
                </label>
            </div>
	        <!-- ENDIF showSelect -->
		    <div class="topic-author">
    		    <a href="<!-- IF topics.user.userslug -->{config.relative_path}/user/{topics.user.userslug}<!-- ELSE -->#<!-- ENDIF topics.user.userslug -->" class="pull-left">
    				<!-- IF topics.thumb -->
    				<img src="{topics.thumb}" class="user-img" alt="{topics.user.username}" />
    				<!-- ELSE -->
    				<!-- IF topics.user.picture -->
    				<img class="user-avatar" component="user/picture" data-uid="{topics.user.uid}" src="{topics.user.picture}" alt="{topics.user.username}" />
    				<!-- ELSE -->
    				<div class="user-icon" style="background-color: {topics.user.icon:bgColor};">{topics.user.icon:text}</div>
    				<!-- ENDIF topics.user.picture -->
    				<!-- ENDIF topics.thumb -->
    			</a>
    		</div>
    		<div component="topic/header" class="title">
    			<i component="topic/pinned" class="fa fa-thumb-tack <!-- IF !topics.pinned -->hide<!-- ENDIF !topics.pinned -->" title="[[topic:pinned]]"></i>
				<i component="topic/locked" class="fa fa-lock <!-- IF !topics.locked -->hide<!-- ENDIF !topics.locked -->" title="[[topic:locked]]"></i>
				<i component="topic/moved" class="fa fa-arrow-circle-right <!-- IF !topics.oldCid -->hide<!-- ENDIF !topics.oldCid -->" title="[[topic:moved]]"></i>
    		    <!-- IF !topics.noAnchor -->
				<a href="{config.relative_path}/topic/{topics.slug}<!-- IF topics.bookmark -->/{topics.bookmark}<!-- ENDIF topics.bookmark -->" itemprop="url">{topics.title}</a>
				<!-- ELSE -->
				<span>{topics.title}</span>
				<!-- ENDIF !topics.noAnchor -->

				<small>
					<a href="<!-- IF topics.user.userslug -->{config.relative_path}/user/{topics.user.userslug}<!-- ELSE -->#<!-- ENDIF topics.user.userslug -->">{topics.user.username}</a> &bull; <span class="timeago" title="{topics.timestampISO}"></span>
				</small>
    		</div>
		</div>
		<div class="col-md-1 hidden-xs hidden-sm">
		    <div class="total-post-count human-readable-number" title="{topics.postcount}">
		        {topics.postcount}
		    </div>
		</div>
		<div class="col-md-1 hidden-xs hidden-sm">
		    <div class="total-view-count human-readable-number" title="{topics.viewcount}">
		        {topics.viewcount}
		    </div>
		</div>
		<div class="col-md-2 hidden-xs hidden-sm">
		    <div class="teaser" component="topic/teaser">
		        <!-- IF topics.unreplied -->
				<p>
					[[category:no_replies]]
				</p>
				<!-- ELSE -->
		        <!-- IF topics.teaser.pid -->
				<!-- IF topics.teaser.user.picture -->
				<img title="{topics.teaser.user.username}" class="user-avatar" src="{topics.teaser.user.picture}" alt="{topics.teaser.user.username}" />
				<!-- ELSE -->
				<div title="{topics.teaser.user.username}" class="user-icon" style="background-color: {topics.teaser.user.icon:bgColor};">{topics.teaser.user.icon:text}</div>
				<!-- ENDIF topics.teaser.user.picture -->

				<a href="{config.relative_path}/user/{topics.teaser.user.userslug}">{topics.teaser.user.username}</a>
				<a class="permalink" href="{config.relative_path}/topic/{topics.slug}/{topics.teaser.index}">
					<span class="timeago" title="{topics.teaser.timestampISO}"></span>
				</a>
		        <!-- ENDIF topics.teaser.pid -->
		        <!-- ENDIF topics.unreplied -->
		    </div>
		</div>
	</div>
    <!-- END topics -->
</div>