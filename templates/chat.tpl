<div id="chat-modal" class="chat-modal hide" tabindex="-1" role="dialog" aria-labelledby="Chat" aria-hidden="true" data-backdrop="none">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button id="chat-close-btn" type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true"><i class="fa fa-times"></i></span></button>
				<button type="button" class="close hidden-xs hidden-sm" data-action="maximize"><span aria-hidden="true"><i class="fa fa-expand"></i></span><span class="sr-only">[[modules:chat.maximize]]</span></button>
				<!-- IMPORT partials/chats/options.tpl -->

				<h4 component="chat/room/name"><!-- IF roomName -->{roomName}<!-- ELSE -->{usernames}<!-- ENDIF roomName --></h4>
			</div>

			<div class="modal-body">
				<ul class="chat-content" component="chat/messages">
					<!-- IMPORT partials/chats/messages.tpl -->
				</ul>

				<div component="chat/composer">
					<textarea component="chat/input" placeholder="[[modules:chat.placeholder]]" class="form-control chat-input mousetrap" rows="1"></textarea>
					<button class="btn btn-primary" type="button" data-action="send"><i class="fa fa-fw fa-2x fa-paper-plane"></i></button>
					<span component="chat/message/remaining">{maximumChatMessageLength}</span>
				</div>
			</div>
		</div>
	</div>
</div>
