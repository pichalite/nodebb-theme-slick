'use strict';
/* globals $, app */

define('admin/plugins/slick', ['settings'], function(Settings) {

	var ACP = {};

	ACP.init = function() {
		Settings.load('slick', $('.slick-settings'));

		$('#save').on('click', function() {
			Settings.save('slick', $('.slick-settings'), function() {
				app.alert({
					type: 'success',
					alert_id: 'slick-saved',
					title: 'Settings Saved',
					message: 'Slick theme settings saved'
				});
			});
		});
	};

	return ACP;
});