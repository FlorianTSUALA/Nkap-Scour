<?php ?>
<!-- 
    ******  VARIABLES *****
        
    --- $title 
	id="create-form"
	id="modal-create"
	id="button-form-create"
-->

<div class="modal animated fadeInDownBig text-left" id="modal-update" tabindex="-1" role="dialog" aria-labelledby="myModalLabel41" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h4 class="modal-title" id="myModalLabel41">Modification d'un pays</h4>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>

			<form  class="needs-validation" id="update-form" method="POST"  action="" novalidate>
				<div class="modal-body">
					<label>Libelle : </label>
					<div class="form-group position-relative has-icon-left">
						<input type="text" name="libelle" id="upd-libelle" placeholder="..........." class="form-control" required/>
						<div class="invalid-feedback">
							Veuillez indiquer le libelle
						</div>
						<div class="form-control-position">
							<i class="fa fa-edit font-medium-5 line-height-1 text-muted icon-align"></i>
						</div>
					</div>

					<label>Description: </label>
					<div class="form-group position-relative has-icon-left">
						<input type="text" id="upd-description" name="description" placeholder="..........." class="form-control" required>
						<div class="invalid-feedback">
							Veuillez indiquer la desciption
						</div>
						<div class="form-control-position">
							<i class="fa fa-code font-medium-5 line-height-1 text-muted icon-align"></i>
						</div>
					</div>
				</div>
				<div id="upt-loading" class="spinner-grow text-warning" role="status"> <span class="sr-only">Loading...</span></div>
				<div class="modal-footer" id="button-form-update">
					<input type="reset" class="btn btn-danger" data-dismiss="modal" value="Annuler">
					<input type="submit"  id="button-update"  class="btn btn-warning btn-darken-2" value="Sauvegarder">
				</div>
				<input type="hidden" name="id" id="upd-id" />
			</form>
		</div>
	</div>
</div>
