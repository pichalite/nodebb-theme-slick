<div class="subcategory">
	<!-- IF children.length --><p>[[category:subcategories]]</p><!-- ENDIF children.length -->

	<div class="categories" itemscope itemtype="http://www.schema.org/ItemList">
		<!-- BEGIN children -->
		<div class="row" component="categories/category" data-cid="{children.cid}" data-numRecentReplies="1">
		    <div class="col-md-8 col-xs-12">
		        <div class="category-info">
		            <div class="category-info-content">
		            	<div class="category-icon">
		                	<i class="fa fa-fw {children.icon}"></i>
		                </div>
		                <a class="category-title" href="{config.relative_path}/category/{children.slug}" title="{children.name}">{children.name}</a>

		                <div class="category-description">
		                    {children.descriptionParsed}
		                </div>
		            </div>
		        </div>
		    </div>
		    <div class="col-md-1 hidden-xs hidden-sm">
		        <div class="total-topic-count human-readable-number" title="{children.totalTopicCount}">
		            {children.totalTopicCount}
		        </div>
		    </div>
		    <div class="col-md-1 hidden-xs hidden-sm">
		        <div class="total-post-count human-readable-number" title="{children.totalPostCount}">
		            {children.totalPostCount}
		        </div>
		    </div>
		    <div class="col-md-2 hidden-xs hidden-sm">
		        <div class="teaser" component="topic/teaser">
		            <!-- BEGIN posts -->
		    	    <!-- IF @first -->

		    		<!-- IF ../user.picture -->
		    		<img class="user-avatar" title="{../user.username}" alt="{../user.username}" src="{../user.picture}" title="{../user.username}"/>
		    		<!-- ELSE -->
		    		<div class="user-icon" title="{../user.username}" style="background-color: {../user.icon:bgColor};">{../user.icon:text}</div>
		    		<!-- ENDIF ../user.picture -->

		    		<a href="{config.relative_path}/user/{../user.userslug}">{../user.username}</a>

		    		<a class="permalink" href="{config.relative_path}/topic/{../topic.slug}<!-- IF ../index -->/{../index}<!-- ENDIF ../index -->">
		    			<small class="timeago" title="{../timestampISO}"></small>
		    		</a>
		    		<!-- ENDIF @first -->
		    	    <!-- END posts -->

		    	    <!-- IF !../posts.length -->
					[[category:no_new_posts]]
			        <!-- ENDIF !../posts.length -->
			    </div>
		    </div>
		</div>
		<!-- END children -->
	</div>
</div>