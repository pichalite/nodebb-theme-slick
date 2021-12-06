'use strict';
/* globals $, app */

define('admin/plugins/slick', ['settings'], function(Settings) {

	var ACP = {};

	ACP.init = function() {
		Settings.load('slick', $('.slick-settings'));

		$('#save').on('click', function() {
			Settings.save('slick', $('.slick-settings'));
		});
	};

	return ACP;
});