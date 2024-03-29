<div class="account">
	<!-- IMPORT partials/breadcrumbs.tpl -->

	<!-- IMPORT partials/account/menu.tpl -->

	<div class="row">
		<div class="col-md-2 col-sm-4">
			<div class="account-picture-block text-center">
				<div class="row">
					<div class="col-xs-12">
						<!-- IF picture -->
						<img id="user-current-picture" class="user-avatar" src="{picture}" />
						<!-- ELSE -->
						<div class="user-icon" style="background-color: {icon:bgColor};">{icon:text}</div>
						<!-- ENDIF picture -->
					</div>
				</div>
				<ul class="list-group">
					<!-- IF allowProfilePicture -->
					<a id="changePictureBtn" href="#" class="list-group-item">[[user:change_picture]]</a>
					<!-- ENDIF allowProfilePicture -->
					<!-- IF !username:disableEdit -->
					<a href="{config.relative_path}/user/{userslug}/edit/username" class="list-group-item">[[user:change_username]]</a>
					<!-- ENDIF !username:disableEdit -->
					<!-- IF !email:disableEdit -->
					<a href="{config.relative_path}/user/{userslug}/edit/email" class="list-group-item">[[user:change_email]]</a>
					<!-- ENDIF !email:disableEdit -->
					<!-- IF canChangePassword -->
					<a href="{config.relative_path}/user/{userslug}/edit/password" class="list-group-item">[[user:change_password]]</a>
					<!-- ENDIF canChangePassword -->
					<!-- BEGIN editButtons -->
					<a href="{config.relative_path}{editButtons.link}" class="list-group-item">{editButtons.text}</a>
					<!-- END editButtons -->
				</ul>

				<!-- IF config.requireEmailConfirmation -->
				<!-- IF email -->
				<!-- IF isSelf -->
				<a id="confirm-email" href="#" class="btn btn-warning <!-- IF email:confirmed -->hide<!-- ENDIF email:confirmed -->">[[user:confirm_email]]</a><br/><br/>
				<!-- ENDIF isSelf -->
				<!-- ENDIF email -->
				<!-- ENDIF config.requireEmailConfirmation -->

				<!-- IF allowAccountDelete -->
				<!-- IF isSelf -->
				<a id="deleteAccountBtn" href="#" class="btn btn-danger">[[user:delete_account]]</a><br/><br/>
				<!-- ENDIF isSelf -->
				<!-- ENDIF allowAccountDelete -->

			</div>
		</div>

		<div class="col-md-10 col-sm-8">
			<div class="row">
				<div class="<!-- IF !sso.length -->col-md-12 col-sm-12<!-- ELSE -->col-md-7 col-sm-12<!-- ENDIF !sso.length -->">
					<form component="profile/edit/form">

						<div class="form-group">
							<label class="control-label" for="inputFullname">[[user:fullname]]</label>
							<div class="controls">
								<input class="form-control" type="text" id="inputFullname" placeholder="[[user:fullname]]" value="{fullname}" name="fullname">
							</div>
						</div>
						<!-- IF allowWebsite -->
						<div class="form-group">
							<label class="control-label" for="inputWebsite">[[user:website]]</label>
							<div class="controls">
								<input class="form-control" type="text" id="inputWebsite" placeholder="http://..." value="{website}" name="website">
							</div>
						</div>
						<!-- ENDIF allowWebsite -->

						<div class="form-group">
							<label class="control-label" for="inputLocation">[[user:location]]</label>
							<div class="controls">
								<input class="form-control" type="text" id="inputLocation" placeholder="[[user:location]]" value="{location}" name="location">
							</div>
						</div>

						<div class="form-group">
							<label class="control-label" for="inputBirthday">[[user:birthday]]</label>
							<div class="controls">
								<input class="form-control" id="inputBirthday" value="{birthday}" placeholder="mm/dd/yyyy" name="birthday>
							</div>
						</div>

						<div class="form-group">
							<label class="control-label" for="grouptitle">[[user:grouptitle]]</label>
							<div class="controls">
								<select class="form-control" id="groupTitle" data-property="groupTitle" name="groupTitle" <!-- IF allowMultipleBadges --> multiple<!-- ENDIF allowMultipleBadges -->>
									<option value="">[[user:no-group-title]]</option>
									<!-- BEGIN groups -->
									<!-- IF groups.userTitleEnabled -->
									<option value="{groups.name}" <!-- IF groups.selected -->selected<!-- ENDIF groups.selected -->>{groups.userTitle}</option>
									<!-- ENDIF groups.userTitleEnabled -->
									<!-- END groups -->
								</select>
							</div>
						</div>
						<!-- IF allowAboutMe -->
						<div class="form-group">
							<label class="control-label" for="inputAboutMe">[[user:aboutme]]</label> <small><label id="aboutMeCharCountLeft"></label></small>
							<div class="controls">
								<textarea class="form-control" id="inputAboutMe" rows="5" name="aboutme">{aboutme}</textarea>
							</div>
						</div>
						<!-- ENDIF allowAboutMe -->

						<!-- IF allowSignature -->
						<!-- IF !disableSignatures -->
						<div class="form-group">
							<label class="control-label" for="inputSignature">[[user:signature]]</label> <small><label id="signatureCharCountLeft"></label></small>
							<div class="controls">
								<textarea class="form-control" id="inputSignature" rows="5" name="signature">{signature}</textarea>
							</div>
						</div>
						<!-- ENDIF !disableSignatures -->
						<!-- ENDIF allowSignature -->

						<input type="hidden" id="inputUID" value="{uid}"><br />

						<div class="form-actions">
							<a id="submitBtn" href="#" class="btn btn-primary">[[global:save_changes]]</a>
						</div>

					</form>
				</div>

				<!-- IF sso.length -->
				<div class="col-md-5 col-sm-12">
					<hr class="visible-xs visible-sm" />
					<label class="control-label">[[user:sso.title]]</label>
					<div class="list-group">
						<!-- BEGIN sso -->
						<div class="list-group-item">
							<!-- IF ../deauthUrl -->
							<a class="btn btn-default btn-xs pull-right" href="{../deauthUrl}">[[user:sso.dissociate]]</a>
							<!-- END -->
							<a href="{../url}" target="<!-- IF ../associated -->_blank<!-- ELSE -->_top<!-- ENDIF ../associated -->">
								<!-- IF ../icon --><i class="fa {../icon}"></i><!-- ENDIF ../icon -->
								<!-- IF ../associated -->[[user:sso.associated]]<!-- ELSE -->[[user:sso.not-associated]]<!-- ENDIF ../associated -->
								{../name}
							</a>
						</div>
						<!-- END sso -->
					</div>
				</div>
				<!-- ENDIF sso.length -->
			</div>
		</div>
	</div>
</div>

