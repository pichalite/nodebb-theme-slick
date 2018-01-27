<div class="categories" itemscope itemtype="http://www.schema.org/ItemList">
    <div class="row categories-header hidden-xs hidden-sm">
        <div class="col-md-8 col-xs-12"><div class="header-title">[[category:category]]</div></div>
        <div class="col-md-1"><div class="header-title">[[global:topics]]</div></div>
        <div class="col-md-1"><div class="header-title">[[global:posts]]</div></div>
        <div class="col-md-2"><div class="header-title">Last Post</div></div>
    </div>
    <!-- BEGIN categories -->
    <div class="row" component="categories/category" data-cid="{categories.cid}" data-numRecentReplies="1">
        <div class="col-md-8 col-xs-12">
            <div class="category-info">
                <div class="category-info-content">
                    <div class="category-icon">
                        <i class="fa fa-fw {categories.icon}"></i>
                    </div>
                    <!-- IMPORT partials/categories/link.tpl -->

                    <div class="category-description">
                        {categories.descriptionParsed}
                    </div>
                </div>

                <!-- IF !config.hideSubCategories -->
                <div class="subcategories">
                    <!-- BEGIN categories.children -->
                    <div class="subcategory">
                        <i class="fa fa-fw {categories.children.icon} subcategory-icon"></i>
                        <!-- IF categories.children.link -->
                        <a class="subcategory-title" href="{categories.children.link}" title="{categories.children.name}">{categories.children.name}</a>
                        <!-- ELSE -->
                        <a class="subcategory-title" href="{config.relative_path}/category/{categories.children.slug}" title="{categories.children.name}">{categories.children.name}</a>
                        <!-- ENDIF categories.children.link -->
                    </div>
                    <!-- END categories.children -->
                </div>
                <!-- ENDIF !config.hideSubCategories -->
            </div>
        </div>
        <div class="col-md-1 hidden-xs hidden-sm">
            <div class="total-topic-count human-readable-number" title="{categories.totalTopicCount}">
                {categories.totalTopicCount}
            </div>
        </div>
        <div class="col-md-1 hidden-xs hidden-sm">
            <div class="total-post-count human-readable-number" title="{categories.totalPostCount}">
                {categories.totalPostCount}
            </div>
        </div>
        <div class="col-md-2 hidden-xs hidden-sm">
            <div class="teaser" component="topic/teaser">
                <!-- BEGIN posts -->
        	    <!-- IF @first -->
                <div component="category/posts">
                    <a href="{config.relative_path}/user/{../user.userslug}">
                		<!-- IF ../user.picture -->
                		<img class="user-avatar" title="{../user.username}" alt="{../user.username}" src="{../user.picture}" />
                		<!-- ELSE -->
                		<div class="user-icon" title="{../user.username}" style="background-color: {../user.icon:bgColor};">{../user.icon:text}</div>
                		<!-- ENDIF ../user.picture -->
            		</a>

            		<a class="permalink" href="{config.relative_path}/topic/{../topic.slug}<!-- IF ../index -->/{../index}<!-- ENDIF ../index -->">
            		    {../user.username}
            			<small class="timeago" title="{../timestampISO}"></small>
            		</a>
        		</div>
        		<!-- ENDIF @first -->
        	    <!-- END posts -->

        	    <!-- IF !../posts.length -->
    			[[category:no_new_posts]]
    	        <!-- ENDIF !../posts.length -->
            </div>
        </div>
    </div>
    <!-- END categories -->
</div>