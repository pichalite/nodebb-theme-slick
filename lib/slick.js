"use strict";

/*globals $, app, ajaxify, utils, socket, Slideout*/

$(document).ready(function () {

	var env = utils.findBootstrapEnvironment();
	setupProgressBar();
	setupEditedByIcon();
	setupMobileMenu();
	setupChatsOnMobile();
	setupCheckBox();
	setupQuickReply();

	$(window).on('action:ajaxify.end', function (ev, data) {
		var header_container = $('#header-menu');
		toggleScrolled(header_container);

		$(window).on('scroll', function () {
			toggleScrolled(header_container);
		});
	});

	function setupProgressBar() {
		$(window).on('action:ajaxify.start', function () {
			$('.load-bar').css('height', '2px');
		});

		$(window).on('action:ajaxify.end', function (ev, data) {
			setTimeout(function () {
				$('.load-bar').css('height', '0px');
			}, 1000);

		});
	}

	function toggleScrolled(header_container) {
		if ($(this).scrollTop() > (header_container.outerHeight())) {
			header_container.addClass('scrolled');
		} else {
			header_container.removeClass('scrolled');
		}
	}

	function setupChatsOnMobile() {
		$(window).on('action:ajaxify.end', function (ev, data) {
			if (data.url && data.url.match('^user/.+/chats')) {
				require(['slick/chats'], function (chats) {
					chats.init();
				});
			}
		});
	}

	function setupQuickReply() {
		$(window).on('action:ajaxify.end', function (ev, data) {
			if (data.url && data.url.match('^topic/')) {
				require(['slick/quickreply'], function (quickreply) {
					quickreply.init();
				});
			}
		});
	}

	function setupEditedByIcon() {
		function activateEditedTooltips() {
			$('[data-pid] [component="post/editor"]').each(function () {
				var el = $(this),
					icon;

				if (!el.attr('data-editor')) {
					return;
				}

				icon = el.closest('[data-pid]').find('.edit-icon').first();
				icon.prop('title', el.text()).tooltip('fixTitle').removeClass('hidden');
			});
		}

		$(window).on('action:posts.edited', function (ev, data) {
			var parent = $('[data-pid="' + data.post.pid + '"]');
			var icon = parent.find('.edit-icon').filter(function (index, el) {
				return parseInt($(el).closest('[data-pid]').attr('data-pid'), 10) === parseInt(data.post.pid, 10);
			});
			var el = parent.find('[component="post/editor"]').first();
			icon.prop('title', el.text()).tooltip('fixTitle').removeClass('hidden');
		});

		$(window).on('action:topic.loaded', activateEditedTooltips);
		$(window).on('action:posts.loaded', activateEditedTooltips);
	}

	function setupMobileMenu() {
		if (!window.addEventListener) {
			return;
		}

		$('#menu').removeClass('hidden');

		var slideout = new Slideout({
			'panel': document.getElementById('panel'),
			'menu': document.getElementById('menu'),
			'padding': 256,
			'tolerance': 70,
			'side': 'right'
		});

		if (env !== 'xs') {
			slideout.disableTouch();
		}

		$('#mobile-menu').on('click', function () {
			slideout.toggle();
		});

		$('#menu a').on('click', function () {
			slideout.close();
		});

		$(window).on('resize action:ajaxify.start', function () {
			slideout.close();
			$('.account .cover').css('top', $('[component="navbar"]').height());
		});

		function openingMenuAndLoad() {
			openingMenu();
			loadNotificationsAndChat();
		}

		function openingMenu() {
			$('#header-menu').css({
				'top': $(window).scrollTop() + 'px',
				'position': 'absolute'
			});

			loadNotificationsAndChat();
		}

		function loadNotificationsAndChat() {
			require(['chat', 'notifications'], function (chat, notifications) {
				chat.loadChatsDropdown($('#menu [data-section="chats"] ul'));
				notifications.loadNotifications($('#menu [data-section="notifications"] ul'));
			});
		}

		slideout.on('open', openingMenuAndLoad);
		slideout.on('touchmove', function (target) {
			var $target = $(target);
			if ($target.length && ($target.is('code') || $target.parents('code').length || $target.hasClass('preventSlideOut') || $target.parents('.preventSlideOut').length)) {
				slideout._preventOpen = true;
			}
		});

		slideout.on('close', function () {
			$('#header-menu').css({
				'top': '0px',
				'position': 'fixed'
			});
			$('.slideout-open').removeClass('slideout-open');
		});

		$('#menu [data-section="navigation"] ul').html($('#main-nav').html() + ($('#search-menu').html() || '') + ($('#logged-out-menu').html() || ''));

		$('#user-control-list').children().clone(true, true).appendTo($('#menu [data-section="profile"] ul'));
		$('#menu [data-section="profile"] ul').find('[component="user/status"]').remove();

		socket.on('event:user_status_change', function (data) {
			if (parseInt(data.uid, 10) === app.user.uid) {
				app.updateUserStatus($('#menu [component="user/status"]'), data.status);
				slideout.close();
			}
		});
	}

	function setupCheckBox() {
		$(window).on('action:ajaxify.end', function () {
			if (ajaxify.data.template.name == 'registerComplete') {
				$('#gdpr_agree_data').after('<i class="input-helper"></i>');
				$('#gdpr_agree_email').after('<i class="input-helper"></i>');
				$('#agree-terms').after('<i class="input-helper"></i>');
			}
		});
	}
});
