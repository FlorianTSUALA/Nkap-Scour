<!DOCTYPE html>

<html class="loaded" data-textdirection="ltr">
<?php
		require_once "head.php";
		require_once "../app/Helpers/_magic_tools.php";
	?>

<body class="vertical-layout vertical-menu 2-columns menu-expanded fixed-navbar" data-open="click"
    data-menu="vertical-menu" data-col="2-columns">
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
                                        <p>Renseigner toutes les informations concernant l'élève.</p>
                                    </div>

                                    <div class="">
                                        <section id="validation">
                                            <div class="row">
                                                <div class="col-12">
                                                    <div class="card">

                                                        <div class="card-content collapse show">
                                                            <div class="card-body">
                                                                <div action=""
                                                                    class="steps-validation wizard-circle needs-validation"
                                                                    novalidate>
                                                                    <div class="container">
                                                                        <div class="row">
                                                                            <div class="col-md-12">
                                                                                <h4 class="form-section text-warning"
                                                                                    align="">
                                                                                    <strong>Abonnement Cantine</strong>
                                                                                </h4>
                                                                            </div>
                                                                        </div>



                                                                        <div class="row">
																			<div class="col-md-6">
																				<div class="form-group row">
																					<label for="eleve_nom_complet" class="col-4 col-form-label">Nom Complet<?= required_input();?>:</label>
																					<div class="col-8">
																						<select id="eleve_nom_complet" class="select2 form-control" name="eleve_nom_complet" required>
																							<?php foreach($eleves as $item){?>
																									<option data-matricule="<?= $item['matricule']; ?>" data-id="<?= $item['id']; ?>" title="<?= "Né ".$item['date_naissance']." à ".$item['lieu_naissance']; ?>" value="<?= $item['id']; ?>"><?= $item['libelle']; ?></option>
																							<?php } ?>
																						</select>
																					</div>

																				</div>

																				<div class="valid-feedback">Valider.</div>
																				<div class="invalid-feedback">
																					Veuillez remplir ce champ.
																				</div>
																			</div>

																			<div class="col-md-6">
																				<div class="form-group row">
																					<label for="classe" class="col-1 col-form-label"></label>
																					<label for="classe" class="col-3 col-form-label">Classe<?= required_input();?>:</label>
																					<div class="col-8">

																						<select id="classe" class="select2 form-control" name="classe" required>
																							<!-- <option value="-----------">---------------</option> -->
																							<?php foreach($classes as $item){?>
																									<option data-id="<?= $item['id']; ?>" value="<?= $item['id']; ?>"><?= $item['libelle']; ?></option>
																							<?php } ?>
																						</select>
																					</div>
																				</div>

																				<div class="valid-feedback">Valider.</div>
																				<div class="invalid-feedback">
																					Veuillez remplir ce champ.
																				</div>
																			</div>
                                                                        </div>

																		<br   >
																		<hr>
                                                                        <div id="form-repeater">
                                                                            <div class="row">
                                                                                <div class="col-12">


                                                                                    <form>
                                                                                    	<div
                                                                                        class="card-content collapse show">

                                                                                        <div class="repeater-default">
                                                                                            <div
                                                                                                data-repeater-list="group-a">
                                                                                                <div data-repeater-item>
                                                                                                    <div class=" row">
                                                                                                        <div
                                                                                                            class="form-group mb-1 col-sm-12 col-md-2">
                                                                                                            <label
                                                                                                                for="email-addr">Date
                                                                                                                de
                                                                                                                paiement</label>
                                                                                                        </div>
                                                                                                        <div
                                                                                                            class="form-group mb-1 col-sm-12 col-md-3">
                                                                                                            <input
                                                                                                                type="date"
                                                                                                                class="form-control"
                                                                                                                id="date_paiement"
                                                                                                                name="date_paiement">
                                                                                                            <br>
                                                                                                        </div>
                                                                                                        <div
                                                                                                            class="form-group mb-1 col-sm-12 col-md-1">
                                                                                                            <label
                                                                                                                for="pass">Période</label>
                                                                                                        </div>
                                                                                                        <div
                                                                                                            class="form-group mb-1 col-sm-12 col-md-2">
                                                                                                            <select
                                                                                                                class="form-control"
                                                                                                                id="periode"
                                                                                                                name="periode">
                                                                                                                <option
                                                                                                                    value="Jour">
                                                                                                                    Jour
                                                                                                                </option>
                                                                                                                <option
                                                                                                                    value="semaine">
                                                                                                                    semaine
                                                                                                                </option>
                                                                                                                <option
                                                                                                                    value="Mois">
                                                                                                                    Mois
                                                                                                                </option>
                                                                                                                <option
                                                                                                                    value="Année">
                                                                                                                    Année
                                                                                                                </option>
                                                                                                            </select>
                                                                                                        </div>
                                                                                                        <div
                                                                                                            class="form-group mb-1 col-sm-12 col-md-1">
                                                                                                            <label
                                                                                                                for="profession">durée</label>
                                                                                                        </div>
                                                                                                        <div
                                                                                                            class="form-group mb-1 col-sm-12 col-md-2">
                                                                                                            <select
                                                                                                                class="form-control"
                                                                                                                id="duree"
                                                                                                                name="duree">
                                                                                                                <option
                                                                                                                    value="1">
                                                                                                                    1
                                                                                                                </option>
                                                                                                                <option
                                                                                                                    value="2">
                                                                                                                    2
                                                                                                                </option>
                                                                                                                <option
                                                                                                                    value="3">
                                                                                                                    3
                                                                                                                </option>
                                                                                                                <option
                                                                                                                    value="4">
                                                                                                                    4
                                                                                                                </option>
                                                                                                                <option
                                                                                                                    value="5">
                                                                                                                    5
                                                                                                                </option>
                                                                                                            </select>
                                                                                                        </div>
                                                                                                        <div
                                                                                                            class="form-group col-sm-12 col-md-1 ">
                                                                                                            <button
                                                                                                                type="button"
                                                                                                                class="btn btn-danger"
                                                                                                                data-repeater-delete><i
                                                                                                                    class="ft-trash-2"></i>
                                                                                                            </button>
                                                                                                        </div>
                                                                                                    </div>
                                                                                                   
                                                                                                </div>
                                                                                            </div>
																					</form>
                                                                                            <div
                                                                                                class="form-group row overflow-hidden">
                                                                                                <div class="col-2"></div>
                                                                                                <div class="col-6">
                                                                                                    <button
                                                                                                        data-repeater-create
                                                                                                        class="btn btn-primary">
                                                                                                        <i
                                                                                                            class="ft-plus"></i>
                                                                                                        Ajouter
                                                                                                    </button>
																								</div>
																								
																								<div class="col-2">
                                                                                                    <button
                                                                                                        id="save"
                                                                                                        class="btn btn-success">
                                                                                                        <i
                                                                                                            class="ft-save"></i>
                                                                                                        Sauvegarder
                                                                                                    </button>
																								</div>
																								
                                                                                            </div>
																							<hr>

                                                                                            <div class="row">

                                                                                                <div class="col-3 ">
                                                                                                    <fieldset
                                                                                                        class="mb-1">
                                                                                                        <h5>Prix
                                                                                                            Unitaire
                                                                                                        </h5>
                                                                                                        <div
                                                                                                            class="form-group">
                                                                                                            <select
                                                                                                                class="select2 form-control"
                                                                                                                multiple="multiple"
                                                                                                                id="Prix_unitaire"
                                                                                                                name="Prix_unitaire"
                                                                                                                required>
                                                                                                            </select>
                                                                                                        </div>
                                                                                                    </fieldset>
                                                                                                </div>


                                                                                                <div id=""
                                                                                                    class="col-4">
                                                                                                    <fieldset
                                                                                                        class="mb-1">
                                                                                                        <h5>Multiplicateur
                                                                                                        </h5>
                                                                                                        <div
                                                                                                            class="form-group">
                                                                                                            <select
                                                                                                                class="select2 form-control"
                                                                                                                multiple="multiple"
                                                                                                                id="Multiplicateur"
                                                                                                                name="Multiplicateur"
                                                                                                                required>

                                                                                                            </select>
                                                                                                        </div>
                                                                                                    </fieldset>
                                                                                                </div>

                                                                                                <div class="col-2">
                                                                                                    <fieldset
                                                                                                        class="mb-1">
                                                                                                        <h5>Reduction
                                                                                                        </h5>
                                                                                                        <div
                                                                                                            class="form-group">
                                                                                                            <input
                                                                                                                type="number"
                                                                                                                class="form-control "
                                                                                                                id="reduction"
                                                                                                                value="0"
                                                                                                                name="reduction"
                                                                                                                placeholder="" />
                                                                                                        </div>
                                                                                                    </fieldset>
                                                                                                </div>


                                                                                                <div class="col-3">
                                                                                                    <fieldset
                                                                                                        class="mb-1">
                                                                                                        <h5>Prix Total
                                                                                                        </h5>
                                                                                                        <div
                                                                                                            class="form-group">
                                                                                                            <input
                                                                                                                type="text"
                                                                                                                class="form-control "
                                                                                                                id="Prix_total"
                                                                                                                value="0"
                                                                                                                name="Prix_total"
                                                                                                                placeholder=""
                                                                                                                readonly />
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

																</div>
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
                                                            <div id="loading" class="line-scale-party loader-warning"
                                                                style="display:  none;">
                                                                <div></div>
                                                                <div></div>
                                                                <div></div>
                                                                <div></div>
                                                            </div>
                                                        </div>


                                                        <a href="#" id="btn_annuler" class="btn btn-danger my-1">
                                                            Annuler</a>
                                                        <a href="http://127.0.0.1/nkap-scour/public/accueil"
                                                            id="btn_valider" class="btn btn-warning my-1">Valider</a>

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