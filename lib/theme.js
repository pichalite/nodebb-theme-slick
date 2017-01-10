"use strict";

var	meta = module.parent.require('./meta');
var user = module.parent.require('./user');
var db = module.parent.require('./database');
var SocketPlugins = module.parent.require('./socket.io/plugins');
var websockets = module.parent.require('./socket.io/index');
var async = require('async');
var theme = {};

theme.init = function(params, callback) {

	SocketPlugins.slick = {
 		addReaction: function(socket, data, callback) {
 			db.setAdd('pid:' + data.pid + ':' + data.reaction, socket.uid, function (err) {
 				sendEvent(data, 'event:slick.addReaction', callback);
 			});
 		},
 		removeReaction: function(socket, data, callback) {
 			db.setRemove('pid:' + data.pid + ':' + data.reaction, socket.uid, function (err) {
 				sendEvent(data, 'event:slick.removeReaction', callback);
 			});
 		}
 	};
 	
 	function sendEvent(data, eventName, callback) {
 		async.series({
			reactionCount: function (next) {
				db.setCount('pid:' + data.pid + ':' + data.reaction, next);
			},
			usernames: function (next) {
				db.getSetMembers('pid:' + data.pid + ':' + data.reaction, function(err, uids) {
				    user.getUsersFields(uids, ['uid', 'username'], function(err, userdata) {
				        next(null, userdata.map(function (user) { return user.username }).join(', '));
				    });
				});
			}
		}, function(err, results) {
			websockets.in('topic_' + data.tid).emit(eventName, {pid: data.pid, reaction: data.reaction, reactionCount: results.reactionCount, usernames: results.usernames});
 			callback();
		});
 	}
 	
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

theme.getReactions = function(data, callback) {
	var availableReactions = ["smile", "wink", "rage"];
	var reactionInfo = {};
	
	data.topic.posts.forEach(function (post, index) {
		data.topic.posts[index].reactions = [];
		availableReactions.forEach(function (reaction, rindex) {
			db.getSetMembers('pid:' + post.pid + ':' + reaction, function(err, uids) {
				user.getUsersFields(uids, ['uid', 'username'], function (err, userdata) {
					reactionInfo = {
						"reaction": reaction,
						"members": uids,
						"usernames": userdata.map(function (user) { return user.username }).join(', '),
						"memberCount": uids.length,
						"reacted": uids.indexOf(data.uid.toString()) >= 0
					};
	
					data.topic.posts[index].reactions.push(reactionInfo);	
				});
			});
		});
	});

	callback(null, data);
}

function renderAdmin(req, res, next) {
	res.render('admin/plugins/slick', {});
}

module.exports = theme;
