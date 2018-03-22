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
				<span component="chat/title"><!-- IF rooms.roomName -->{rooms.roomName}<!-- ELSE -->{rooms.usernames}<!-- ENDIF rooms.roomName --></span>
			</div>
		</div>

	</div>
</li>