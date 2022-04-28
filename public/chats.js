define('slick/chats', ['components', 'forum/chats', 'chat'], function (components, coreChats, chatModule) {
	var Chats = {};

	Chats.init = function () {
		var env = utils.findBootstrapEnvironment();
		if (ajaxify.data.hasOwnProperty('roomId') && (env === 'sm' || env === 'xs')) {
			chatModule.openChat(ajaxify.data.roomId, ajaxify.data.uid);
		}
		components.get('chat/recent').on('click', '[component="chat/recent/room"]', function (e) {
			env = utils.findBootstrapEnvironment();
			if (env === 'xs' || env === 'sm') {
				chatModule.openChat($(this).attr('data-roomid'));
			} else {
				coreChats.switchChat($(this).attr('data-roomid'));
			}
		});
	};

	return Chats;
});
