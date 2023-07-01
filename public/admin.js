'use strict';

define('admin/plugins/vtubeando', ['settings'], function (Settings) {
	var ACP = {};

	ACP.init = function () {
		Settings.load('vtubeando', $('.vtubeando-settings'));

		$('#save').on('click', function () {
			Settings.save('vtubeando', $('.vtubeando-settings'));
		});
	};

	return ACP;
});
