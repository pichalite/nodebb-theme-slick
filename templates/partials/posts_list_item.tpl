<div component="post" class="posts-list-item<!-- IF ../deleted --> deleted<!-- ELSE --><!-- IF ../topic.deleted --> deleted<!-- ENDIF ../topic.deleted --><!-- ENDIF ../deleted -->" data-pid="{../pid}" data-uid="{../uid}">
    <div class="post-body">
        <a class="topic-title" href="{config.relative_path}/post/{../pid}">
            <!-- IF !../isMainPost -->RE: <!-- ENDIF !../isMainPost -->{../topic.title}
        </a>

        <div component="post/content" class="content">
            {../content}
        </div>

        <span class="topic-category"><a href="{config.relative_path}/category/{../category.slug}">[[global:posted_in, {../category.name}]]</a></span> &bull; <span class="timeago" title="{../timestampISO}"></span>
    </div>
</div>