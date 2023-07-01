<div class="acp-page-container">
	<!-- IMPORT admin/partials/settings/header.tpl -->

	<div class="row m-0">
		<div id="spy-container" class="col-12 col-md-8 px-0 mb-4" tabindex="0">
			<form role="form" class="vtubeando-settings">
				<div class="form-check form-switch">
					<input type="checkbox" class="form-check-input" id="enableQuickReply" name="enableQuickReply" />
					<label for="enableQuickReply" class="form-check-label">[[themes/vtubeando:settings.enableQuickReply]]</label>
				</div>
				<div class="form-check form-switch">
					<input type="checkbox" class="form-check-input" id="centerHeaderElements" name="centerHeaderElements" />
					<label for="centerHeaderElements" class="form-check-label">[[themes/vtubeando:settings.centerHeaderElements]]</label>
				</div>
				<div class="form-check form-switch">
					<input type="checkbox" class="form-check-input" id="mobileTopicTeasers" name="mobileTopicTeasers" />
					<label for="mobileTopicTeasers" class="form-check-label">[[themes/vtubeando:settings.mobileTopicTeasers]]</label>
				</div>
				<div class="form-check form-switch">
					<input type="checkbox" class="form-check-input" id="stickyToolbar" name="stickyToolbar" />
					<div for="stickyToolbar" class="form-check-label">
						[[themes/vtubeando:settings.stickyToolbar]]
						<p class="form-text">
							[[themes/vtubeando:settings.stickyToolbar.help]]
						</p>
					</div>
				</div>
				<div class="form-check form-switch">
					<input type="checkbox" class="form-check-input" id="autohideBottombar" name="autohideBottombar" />
					<div for="autohideBottombar" class="form-check-label">
						[[themes/vtubeando:settings.autohideBottombar]]
						<p class="form-text">
							[[themes/vtubeando:settings.autohideBottombar.help]]
						</p>
					</div>
				</div>
				<div class="form-check form-switch">
					<input type="checkbox" class="form-check-input" id="chatModals" name="chatModals" />
					<div for="chatModals" class="form-check-label">
						[[themes/vtubeando:settings.chatModals]]
					</div>
				</div>
			</form>
		</div>

		<!-- IMPORT admin/partials/settings/toc.tpl -->
	</div>
</div>
