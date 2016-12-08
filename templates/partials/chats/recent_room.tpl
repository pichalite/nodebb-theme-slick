<li component="chat/recent/room" data-roomid="{rooms.roomId}" class="<!-- IF rooms.unread -->unread<!-- ENDIF rooms.unread -->">
	<!-- IF rooms.lastUser.uid -->
	<div class="chat-image" data-username="{rooms.lastUser.username}" data-uid="{rooms.lastUser.uid}">
		<!-- IF rooms.lastUser.picture -->
		<img class="user-avatar" src="{rooms.lastUser.picture}" title="{rooms.lastUser.username}">
		<!-- ELSE -->
		<div class="user-icon" style="background-color: {rooms.lastUser.icon:bgColor};" title="{rooms.lastUser.username}">{rooms.lastUser.icon:text}</div>
		<!-- ENDIF rooms.lastUser.picture -->
	</div>
	<!-- ELSE -->
	[[modules:chat.no-users-in-room]]
	<!-- ENDIF rooms.lastUser.uid -->
	<div class="chat-body">
		<div class="chat-main">
			<div class="chat-room-name">
				<!-- IF rooms.groupChat -->
				<!-- IF rooms.roomName -->{rooms.roomName}<!-- ELSE -->{rooms.usernames}<!-- ENDIF rooms.roomName -->
				<!-- ELSE -->
				{rooms.usernames}
				<!-- ENDIF rooms.groupChat -->
			</div>
			<div class="teaser-timestamp timeago pull-right" title="{rooms.teaser.timestampISO}"></div>
		</div>
		
		<div class="chat-secondary">
			<!-- IF rooms.teaser.content -->
			<div class="teaser-content">{rooms.teaser.user.username}: {rooms.teaser.content}</div>
			<!-- ENDIF rooms.teaser.content -->
			<i class="fa fa-times pull-right leave" component="chat/leave"></i>
		</div>
	</div>
</li>