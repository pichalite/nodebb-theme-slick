<!-- IF rooms.length -->
<!-- BEGIN rooms -->
<a data-ajaxify="false" data-roomid="{rooms.roomId}" class="<!-- IF ../unread -->unread<!-- ENDIF ../unread -->">
	<!-- IF lastUser -->
	<div class="chat-image">
		<!-- IF rooms.lastUser.picture -->
		<img class="user-avatar" src="{rooms.lastUser.picture}" title="{rooms.lastUser.username}" />
		<!-- ELSE -->
		<div class="user-icon" style="background-color: {rooms.lastUser.icon:bgColor}">{rooms.lastUser.icon:text}</div>
		<!-- ENDIF rooms.lastUser.picture -->
	</div>
	
	<div class="chat-room-name">
		<!-- IF rooms.groupChat -->
		<!-- IF rooms.roomName -->{rooms.roomName}<!-- ELSE -->{rooms.usernames}<!-- ENDIF rooms.roomName -->
		<!-- ENDIF rooms.groupChat -->
		<!-- IF !rooms.groupChat -->
		{rooms.usernames}
		<!-- ENDIF !rooms.groupChat -->
	</div>
	<!-- ENDIF lastUser -->
</a>
<!-- END rooms -->
<!-- ELSE -->
<a href="#" class="no_active">No active chats</a>
<!-- ENDIF rooms.length -->