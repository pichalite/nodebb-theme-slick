<div class="account">
	<!-- IMPORT partials/breadcrumbs.tpl -->
	
	<!-- IMPORT partials/account/menu.tpl -->

	<div class="row">
		<div class="col-md-12">
			<form class="form-horizontal edit-form">
				<div class="form-group">
					<label class="col-sm-3 col-lg-2 control-label" for="inputNewEmail">[[user:email]]</label>
					<div class="col-sm-9 col-lg-10">
						<input class="form-control" type="text" id="inputNewEmail" placeholder="[[user:email]]" value="{email}">
					</div>
				</div>
		
				<!-- disables autocomplete on FF --><input type="password" style="display:none">
		
				<!-- IF isSelf -->
				<div class="form-group">
					<label class="col-sm-3 col-lg-2 control-label" for="inputCurrentPassword">[[user:current_password]]</label>
					<div class="col-sm-9 col-lg-10">
						<input autocomplete="off" class="form-control" type="password" id="inputCurrentPassword" placeholder="[[user:current_password]]" value=""<!-- IF !hasPassword --> disabled<!-- ENDIF !hasPassword -->>
					</div>
				</div>
				<!-- ENDIF isSelf -->
		
				<input type="hidden" name="uid" id="inputUID" value="{uid}" />
		
				<br/>
				<div class="form-group form-actions">
					<div class="col-sm-offset-3 col-sm-9 col-lg-offset-2 col-lg-10">
						<a id="submitBtn" href="#" class="btn btn-primary btn-block"><i class="hide fa fa-spinner fa-spin"></i> [[user:change_email]]</a>
					</div>
				</div>
			</form>
		</div>
	</div>
</div>
