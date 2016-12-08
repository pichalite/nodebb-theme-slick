<div class="account">
	<!-- IMPORT partials/breadcrumbs.tpl -->
	
	<!-- IMPORT partials/account/menu.tpl -->

	<div class="row">
		<div class="col-md-12">
			<form class="form-horizontal edit-form">
				<!-- disables autocomplete on FF --><input type="password" style="display:none">
		
				<!-- IF isSelf -->
				<div class="form-group">
					<label class="col-sm-3 col-lg-2 control-label" for="inputCurrentPassword">[[user:current_password]]</label>
					<div class="col-sm-9 col-lg-10">
						<input autocomplete="off" class="form-control" type="password" id="inputCurrentPassword" placeholder="[[user:current_password]]" value=""<!-- IF !hasPassword --> disabled<!-- ENDIF !hasPassword -->>
					</div>
				</div>
				<!-- ENDIF isSelf -->
		
				<div class="form-group">
					<label class="col-sm-3 col-lg-2 control-label" for="inputNewPassword">[[user:password]]</label>
					<div class="col-sm-9 col-lg-10">
						<input class="form-control" type="password" id="inputNewPassword" placeholder="[[user:password]]" value="">
						<span class="form-feedback" id="password-notify">
					</div>
				</div>
		
				<div class="form-group">
					<label class="col-sm-3 col-lg-2 control-label" for="inputNewPasswordAgain">[[user:confirm_password]]</label>
					<div class="col-sm-9 col-lg-10">
						<input class="form-control" type="password" id="inputNewPasswordAgain" placeholder="[[user:confirm_password]]" value="">
						<span class="form-feedback" id="password-confirm-notify">
					</div>
				</div>
				
				<div class="form-group form-actions">
					<div class="col-sm-offset-3 col-sm-9 col-lg-offset-2 col-lg-10">
						<a id="changePasswordBtn" href="#" class="btn btn-primary btn-block"><i class="hide fa fa-spinner fa-spin"></i> [[user:change_password]]</a>
					</div>	
				</div>
			</form>
		</div>
	</div>
</div>