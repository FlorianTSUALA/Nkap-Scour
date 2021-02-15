<!DOCTYPE html>

<html class="loaded" data-textdirection="ltr">
	<?php
		require_once "head.php";
		require_once "../app/Helpers/_magic_tools.php";
	?>

	<body class="vertical-layout vertical-menu 2-columns menu-expanded fixed-navbar" data-open="click" data-menu="vertical-menu" data-col="2-columns">
	<?php
		require_once "navbar.php";
	?>
	<div class="app-content content bg-warningcreated22">
		<div class="content-wrapper">

			<div class="content-body">

				<section class="row">
					<div class="col-sm-12">
						<!-- ESPACE DE TRAVAIL -->
						<div id="kick-start" class="border-2 border-warning card box-shadow-2">
							<div class="card-header border-bottom-2 border-bottom-warning card-header-inverse ">
								<h4 class="card-title center text-uppercase">
									Processus d'inscription
								</h4>
							</div>

							<div class="card-content collapse show">
								<div class="card-body">
									<div class="card-text">
										<p >Renseigner toutes les informations concernant l'élève.</p>
									</div>

									<div class="">
										<section id="validation">
											<div class="row">
												<div class="col-12">
													<div class="card">

														<div class="card-content collapse show">
															<div class="card-body">
																<form action="" class="steps-validation wizard-circle needs-validation" novalidate>
																	<div class="container">
																		<div class="row">
																			<div class="col-md-12">
																				<h4 class="form-section text-warning" align="">
																					<strong>Abonnement Cantine</strong>
																				</h4>
																			</div>
																		</div>



																		<div class="row">

																			<div class="col-md-6">
																				<div class="form-group row">
																					<label for="nom_eleve" class="col-4 col-form-label">Nom<?= required_input();?>:</label>
																					<div class="col-8">
																						<input placeholder="Nom de l'élève" type="text" class="form-control required" id="nom_eleve" name="nom_eleve" autofocus
																							   required="required" />
																					</div>
																				</div>

																				<div class="valid-feedback">Valider.</div>
																				<div class="invalid-feedback">
																					Veuillez remplir ce champ.
																				</div>
																			</div>

																			<div class="col-md-6">
																				<div class="form-group row">
																					<label for="prenom_eleve" class="col-4 col-form-label">Prénom :</label>
																					<div class="col-8">
																						<input placeholder="Prénom de l'élève" type="text" class="form-control" id="prenom_eleve" name="prenom_eleve" />
																					</div>
																				</div>
																			</div>
																		</div>

																		<div class="row">
																			<div class="col-md-6">
																				<div class="form-group row">
																					<label class="col-4">Sexe<?= required_input();?>:</label>
																					<div class="col-8">
																						<div class="row">
																							<div class="col-4">
																								<input name="sexe_eleve" id="sexe_eleve-01" type="radio" class="cke_button__radio_icon" value="F"
																									   required="required">

																								<label for="sexe_eleve-01" class="">Féminin</label>
																							</div>

																							<div class="col-6">
																								<input name="sexe_eleve" id="sexe_eleve-02" type="radio" class="cke_button__radio_icon" value="M"
																									   required="required">
																								<label for="sexe_eleve-02" class="">Masculin</label>
																							</div>
																						</div>
																					</div>
																				</div>
																			</div>


																			<div class="col-md-6">
																				<div class="form-group row">
																					<label for="classe_eleve" class="col-4 col-form-label">Salle de classe<?= required_input();?>:</label>
																					<div class="col-8">
																						<select id="classe_eleve" class="select2 js-example-programmatic form-control" name="classe_eleve" required>

																							<option value="" disabled>- Choissisez la salle de classe de l'élève -</option>
																							<option value="SIL">SIL</option>
																							<option value="CP">Cours Préparatoire</option>
																							<option value="CE1">Cours Elémentaire 1</option>
																							<option value="CE2">Cours Elémentaire 2</option>
																							<option value="CM1">Cours-Moyen 1</option>
																							<option value="CM2">Cours-Moyen 2</option>
																						</select>
																					</div>
																				</div>



																				<div class="valid-feedback">Valider.</div>
																				<div class="invalid-feedback">
																					Veuillez remplir ce champ.
																				</div>
																			</div>
																		</div>





																		<div id="form-repeater">
																			<div class="row">
																				<div class="col-12">


																						<div class="card-content collapse show">

																								<div class="repeater-default">
																									<div data-repeater-list="car">
																										<div data-repeater-item>
																											<div class=" row">
																												<div class="form-group mb-1 col-sm-12 col-md-2">
																													<label for="email-addr">Email address</label>
																												</div>
																												<div class="form-group mb-1 col-sm-12 col-md-3">
																													<input type="date" class="form-control" id="email-addr" placeholder="Enter email">

																													<br>

																												</div>
																												<div class="form-group mb-1 col-sm-12 col-md-1">
																													<label for="pass">Période</label>
																												</div>
																												<div class="form-group mb-1 col-sm-12 col-md-2">
																													<select class="form-control" id="jour">
																														<option>Jour</option>
																														<option>semaine</option>
																														<option>Mois</option>
																														<option>Année</option>
																													</select>
																												</div>
																												<div class="form-group mb-1 col-sm-12 col-md-1">
																													<label for="profession">durée</label>
																																																					</div>
																													<div class="form-group mb-1 col-sm-12 col-md-2">
																														<select class="form-control" id="profession">
																															<option>1</option>
																															<option>2</option>
																															<option>3</option>
																															<option>4</option>
																															<option>5</option>
																														</select>
																												</div>
																												<div class="form-group col-sm-12 col-md-1 ">
																													<button type="button" class="btn btn-danger" data-repeater-delete><i class="ft-trash-2"></i> </button>
																												</div>
																											</div>
																											<hr>
																										</div>
																									</div>
																									<div class="form-group overflow-hidden">
																										<div class="col-12">
																											<button data-repeater-create class="btn btn-primary">
																												<i class="ft-plus"></i> Add
																											</button>
																										</div>
																									</div>

                                                                                                    <div class="row">

                                                                                                        <div class="col-3 ">
                                                                                                            <fieldset class="mb-1">
                                                                                                                <h5>Prix Unitaire</h5>
                                                                                                                <div class="form-group">
                                                                                                                    <select class="select2 form-control" multiple="multiple"  id="Prix_unitaire"  name="Prix_unitaire"   required>
                                                                                                                    </select>
                                                                                                                </div>
                                                                                                            </fieldset>
                                                                                                        </div>


                                                                                                        <div id="" class="col-4">
                                                                                                            <fieldset class="mb-1">
                                                                                                                <h5>Multiplicateur</h5>
                                                                                                                <div class="form-group">
                                                                                                                    <select class="select2 form-control" multiple="multiple"  id="Multiplicateur"  name="Multiplicateur"   required>

                                                                                                                    </select>
                                                                                                                </div>
                                                                                                            </fieldset>
                                                                                                        </div>

                                                                                                        <div class="col-2">
                                                                                                            <fieldset class="mb-1">
                                                                                                                <h5>Reduction</h5>
                                                                                                                <div class="form-group">
                                                                                                                    <input type="number" class="form-control "  id="reduction" value="0"  name="reduction"   placeholder="" />
                                                                                                                </div>
                                                                                                            </fieldset>
                                                                                                        </div>


                                                                                                        <div class="col-3">
                                                                                                            <fieldset class="mb-1">
                                                                                                                <h5>Prix Total</h5>
                                                                                                                <div class="form-group">
                                                                                                                    <input type="text" class="form-control "  id="Prix_total" value="0"  name="Prix_total"   placeholder="" readonly/>
                                                                                                                </div>
                                                                                                            </fieldset>
                                                                                                        </div>
                                                                                                    </div>

																								</div>


																						</div>



																				</div>
																			</div>


																		</div>
																	</div>

																</form>
															</div>
														</div>
													</div>
												</div>
											</div>

                                            <!-- Invoice Footer -->
                                            <div id="invoice-footer">
                                                <div class="row">
                                                    <div class="col-md-6 col-sm-12">
                                                        <h6>Conditions générales</h6>
                                                        <p>Après paiement, votre argent est non-remboursable.</p>
                                                    </div>
                                                    <div class="col-md-6 col-sm-12 text-right">

                                                        <div class="loader-container">
                                                            <div id="loading" class="line-scale-party loader-warning" style="display:  none;">
                                                                <div></div>
                                                                <div></div>
                                                                <div></div>
                                                                <div></div>
                                                            </div>
                                                        </div>


                                                        <a href="#"  id="btn_annuler" class="btn btn-danger my-1"> Annuler</a>
                                                        <a href="http://127.0.0.1/nkap-scour/public/accueil" id="btn_valider" class="btn btn-warning my-1">Valider</a>

                                                    </div>
                                                </div>
                                            </div>
                                            <!--/ Invoice Footer -->

										</section>
									</div>
								</div>
							</div>

							<div class="card-footer border-top-2 border-top-warning">
								<span>Les Comelines</span>
							</div>
						</div>
					</div>
				</section>
			</div>
		</div>
	</div>
	<?php
		require_once "footer.php";
	?>
	<script src="app-assets/vendors/js/forms/repeater/jquery.repeater.min.js"></script>
	<script src="app-assets/js/scripts/forms/form-repeater.js"></script>
	</body>
</html>