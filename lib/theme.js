"use strict";

var	meta = module.parent.require('./meta');
var user = module.parent.require('./user');
var theme = {};

theme.init = function(params, callback) {

	params.router.get('/admin/plugins/slick', params.middleware.admin.buildHeader, renderAdmin);
	params.router.get('/api/admin/plugins/slick', renderAdmin);

	callback();
};

theme.addAdminNavigation = function(header, callback) {
	header.plugins.push({
		route: '/plugins/slick',
		icon: 'fa-paint-brush',
		name: 'Slick Theme'
	});

	callback(null, header);
};

theme.getThemeConfig = function(config, callback) {

	meta.settings.get('slick', function(err, settings) {
		config.hideSubCategories = settings.hideSubCategories === 'on';
	});

	callback(false, config);
};

theme.addUserToTopic = function(data, callback) {
	
	if (data.req.user) {
		user.getUserData(data.req.user.uid, function(err, userdata) {
			if (err) {
				return callback(err);
			}
			
			data.templateData.loggedInUser = userdata;
			callback(null, data);
		});
	} else {
		callback(null, data);
	}
}

function renderAdmin(req, res, next) {
	res.render('admin/plugins/slick', {});
}

module.exports = theme;