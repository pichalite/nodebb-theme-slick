<!-- IMPORT partials/breadcrumbs.tpl -->

<div class="row chats-page">
	<div class="col-md-4" component="chat/nav-wrapper">
		<div class="chat-search hidden-xs">
			<input class="form-control" type="text" component="chat/search" placeholder="[[users:enter_username]]" />
		</div>
		<ul component="chat/search/list" class="chat-search-list">

		</ul>
		<ul component="chat/recent" class="chats-list" data-nextstart="{nextStart}">
			<!-- BEGIN rooms -->
			<!-- IMPORT partials/chats/recent_room.tpl -->
			<!-- END rooms -->
		</ul>
	</div>

	<div class="col-md-8 hidden-sm hidden-xs" component="chat/main-wrapper">
		<!-- IF roomId -->
		<div component="chat/messages" class="expanded-chat" data-roomid="{roomId}">

			<button type="button" class="close" data-action="pop-out"><span aria-hidden="true"><i class="fa fa-compress"></i></span><span class="sr-only">[[modules:chat.pop-out]]</span></button>

			<!-- IF showUserInput -->
			<div class="users-tag-container">
				<input class="users-tag-input" type="text" class="form-control" placeholder="[[modules:chat.add-users-to-room]]" tabindex="4"/>
			</div>
			<!-- ENDIF showUserInput -->

			<!-- IF groupChat -->
			<input class="form-control" component="chat/room/name" value="{roomName}" <!-- IF !isOwner -->disabled<!-- ENDIF !isOwner -->/>
			<!-- ENDIF groupChat -->

			<ul class="chat-content">
				<!-- IMPORT partials/chats/messages.tpl -->
			</ul>
			<div class="input-group">
				<textarea component="chat/input" placeholder="[[modules:chat.placeholder]]" class="form-control chat-input mousetrap" rows="1" <!-- IF !canReply -->readonly<!-- ENDIF !canReply -->></textarea>
				<span class="input-group-btn">
					<button class="btn btn-primary" type="button" data-action="send" <!-- IF !canReply -->disabled<!-- ENDIF !canReply -->><i class="fa fa-fw fa-2x fa-paper-plane"></i></button>
				</span>
			</div>
		</div>
		<!-- ELSE -->
		<div class="alert alert-info">
			[[modules:chat.no-messages]]
		</div>
		<!-- ENDIF roomId -->
	</div>
</div>
