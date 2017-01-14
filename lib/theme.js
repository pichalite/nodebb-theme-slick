"use strict";

var meta = module.parent.require('./meta');
var user = module.parent.require('./user');
var db = module.parent.require('./database');
var SocketPlugins = module.parent.require('./socket.io/plugins');
var websockets = module.parent.require('./socket.io/index');
var async = require('async');
var emojiParser = require('../../nodebb-plugin-emoji-extended/lib/parser/main');
var theme = {};

theme.init = function(params, callback) {

	SocketPlugins.slick = {
		addReaction: function(socket, data, callback) {
			data.uid = socket.uid;
			meta.settings.get('slick', function(err, settings) {
				var maximumReactions = settings.maximumReactions || 5;
				
				async.series({
					totalReactions: function(next) {
						db.setCount('pid:' + data.pid + ':reactions', next);
					},
					isMember: function(next) {
						db.isSetMember('pid:' + data.pid + ':reactions', data.reaction, next);
					}
				}, function(err, results) {
					if (!results.isMember && results.totalReactions >= maximumReactions) {
						callback(new Error('Maximum reactions reached'));
					}
					else {
						db.setAdd('pid:' + data.pid + ':reactions', data.reaction, function(err) {
							db.setAdd('pid:' + data.pid + ':reaction:' + data.reaction, socket.uid, function(err) {
								sendEvent(data, 'event:slick.addReaction', callback);
							});
						});
					}
				});
			});
		},
		removeReaction: function(socket, data, callback) {
			data.uid = socket.uid;
			db.setRemove('pid:' + data.pid + ':reaction:' + data.reaction, socket.uid, function(err) {
				db.setCount('pid:' + data.pid + ':reaction:' + data.reaction, function(err, reactionCount) {
					if (reactionCount === 0) {
						db.setRemove('pid:' + data.pid + ':reactions', data.reaction, function(err) {
							sendEvent(data, 'event:slick.removeReaction', callback);
						});
					}
					else {
						sendEvent(data, 'event:slick.removeReaction', callback);
					}
				});
			});
		}
	};

	function sendEvent(data, eventName, callback) {
		async.series({
			reactionCount: function(next) {
				db.setCount('pid:' + data.pid + ':reaction:' + data.reaction, next);
			},
			totalReactions: function(next) {
				db.setCount('pid:' + data.pid + ':reactions', next);
			},
			usernames: function(next) {
				db.getSetMembers('pid:' + data.pid + ':reaction:' + data.reaction, function(err, uids) {
					user.getUsersFields(uids, ['uid', 'username'], function(err, userdata) {
						next(null, userdata.map(function(user) {
							return user.username
						}).join(', '));
					});
				});
			}
		}, function(err, results) {
			if (parseInt(results.reactionCount, 10) === 0) {
				db.setRemove('pid:' + data.pid + ':reactions', data.reaction, function(err) {
					if (err) {
						callback(err);
					}
				});
			}
			websockets.in('topic_' + data.tid).emit(eventName, {
				pid: data.pid,
				uid: data.uid,
				reaction: data.reaction,
				reactionCount: results.reactionCount,
				totalReactions: results.totalReactions,
				usernames: results.usernames,
				reactionImage: emojiParser.parse(':' + data.reaction + ':').replace('title="' + data.reaction + '"', '')
			});
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
		config.maximumReactions = settings.maximumReactions ? parseInt(settings.maximumReactions, 10) : '';
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
	}
	else {
		callback(null, data);
	}
}

theme.getReactions = function(data, callback) {
	var reactionInfo = {};
	async.each(data.posts, function(post, next) {
		post.reactions = [];
		meta.settings.get('slick', function(err, settings) {
			var maximumReactions = settings.maximumReactions || 5;
			db.setCount('pid:' + post.pid + ':reactions', function(err, totalReactions) {
				post.maxReactionsReached = totalReactions >= maximumReactions;
				db.getSetMembers('pid:' + post.pid + ":reactions", function(err, reactions) {
					reactions.forEach(function(reaction, rindex) {
						db.getSetMembers('pid:' + post.pid + ':reaction:' + reaction, function(err, uids) {
							user.getUsersFields(uids, ['uid', 'username'], function(err, userdata) {
								reactionInfo = {
									"reaction": reaction,
									"members": uids,
									"usernames": userdata.map(function(user) {
										return user.username
									}).join(', '),
									"memberCount": uids.length,
									"reacted": uids.indexOf(data.uid.toString()) >= 0,
									"reactionImage": emojiParser.parse(':' + reaction + ':').replace('title="' + reaction + '"', '')
								};

								post.reactions.push(reactionInfo);
							});
						});
					});
				});
			});
		});
		next();
	}, function(err) {
		callback(null, data);
	});
}

theme.deleteReactions = function(pid) {
	db.getSetMembers('pid:' + pid + ":reactions", function(err, reactions) {
		if (reactions.length > 0) {
			async.waterfall([
				function(callback) {
					var keys = reactions.map(function(reaction) {
						return 'pid:' + pid + ':reaction:' + reaction;
					});
					callback(null, keys);
				},
				function(keys, callback) {
					db.deleteAll(keys, callback);
				},
				function(callback) {
					db.deleteAll(['pid:' + pid + ':reactions'], callback);
				}
			], function(err) {
				if (err) {
					console.log(err.message);
				}
			});
		}
	});
}

function renderAdmin(req, res, next) {
	res.render('admin/plugins/slick', {});
}

module.exports = theme;
