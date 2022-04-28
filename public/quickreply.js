"use strict";

/*globals $, app, ajaxify, socket*/
define('slick/quickreply', [
	'components',
	'composer/autocomplete',
	'api',
	'alerts'
], function(components, autocomplete, api, alerts) {
	var QuickReply = {};

	QuickReply.init = function() {

		var element = components.get('topic/quickreply/text');
		var data = {
			element: element,
			strategies: [],
			options: {
				style: {
					'z-index': 100,
				},
			}
		};

		$(window).trigger('composer:autocomplete:init', data);
		autocomplete._active['slick_qr'] = autocomplete.setup(data);

		components.get('topic/quickreply/button').on('click', function(e) {
			var replyMsg = components.get('topic/quickreply/text').val();
			var replyData = {
				tid: ajaxify.data.tid,
				handle: undefined,
				content: replyMsg
			};
			api.post(`/topics/${ajaxify.data.tid}`, replyData, function (err, data) {
				if (err) {
					alerts.error(err);
				}
				if (data && data.queued) {
					alerts.success(data.message);
				}
				components.get('topic/quickreply/text').val('');
				autocomplete._active['slick_qr'].hide();
			});
		});
	};

	return QuickReply;
});