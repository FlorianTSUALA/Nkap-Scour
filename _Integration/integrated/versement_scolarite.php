<?php
    // session_start();
    // session_destroy();
?>
<!DOCTYPE html>

<html class="loaded" data-textdirection="ltr">
    <?php
        // RECUPERATION DES DONNEES VENANT DE L'INSCRIPTION
        // array(
        //       "eleve_id" => $eleve_id,
        //       "classe_id" => $classe_id,
        //       "classe_information" => $classe_information
        // );
    //  $data = $_SESSION["DATA_TRANSPORT"];

        require_once "head.php";
        // require_once "../app/Helpers/_magic_tools.php";
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
                                    Versement de pension
                                </h4>
                            </div>

                            <div class="card-content collapse show">
                                <div class="card-body">
                                    <div class="card-text">
                                        <p >Renseigner toutes les informations concernant le versement.</p>
                                    </div>

                                    <div class="">
                                        <section id="validation">
                                            <div class="row">
                                                <div class="col-12">
                                                    <div class="card">

                                                        <div class="card-content collapse show">
                                                            <div class="card-body">
                                                                <form action="" class="" novalidate>
                                                                    <fieldset>
                                                                        <div class="row">
                                                                            <div class="col-md-12">
                                                                                <h4 class="form-section text-warning" align="">
                                                                                    <strong>Informations utiles</strong>
                                                                                </h4>
                                                                            </div>
                                                                        </div>

                                                                        <div class="row">
                                                                            <div class="col-md-6">
                                                                                <div class="form-group row">
                                                                                    <label for="eleve" class="col-4 col-form-label">Élève:</label>
                                                                                    <div class="col-8">

                                                                                        <input value="BAKITA Florent" readonly type="text" class="form-control" id="eleve" name="eleve" />
                                                                                    </div>
                                                                                </div>

                                                                                <div class="valid-feedback">Valider.</div>
                                                                                <div class="invalid-feedback"> Veuillez remplir ce champ.
                                                                                </div>
                                                                            </div>

                                                                            <div class="col-md-6">
                                                                                <div class="form-group row">
                                                                                    <label for="classe" class="col-4 col-form-label">Salle de classe:</label>
                                                                                    <div class="col-8">
                                                                                        <div class="form-group row">
                                                                                        <select id="classe" class="select2 form-control " name="classe" required>

                                                                                            <!-- <option value="" disabled>- Choissisez la salle de classe de l'élève -</option> -->
                                                                                            <option value="SIL">SIL</option>
                                                                                            <option value="CP">Cours Préparatoire</option>
                                                                                            <option value="CE1">Cours Elémentaire 1</option>
                                                                                            <option value="CE2">Cours Elémentaire 2</option>
                                                                                            <option value="CM1">Cours-Moyen 1</option>
                                                                                            <option value="CM2">Cours-Moyen 2</option>
                                                                                        </select>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>

                                                                                <div class="valid-feedback">Valider.</div>
                                                                                <div class="invalid-feedback">
                                                                                    Veuillez remplir ce champ.
                                                                                </div>
                                                                            </div>
                                                                        </div>

                                                                        <div class="row">
                                                                            <div class="col-md-6">
                                                                                <div class="form-group row">
                                                                                    <label for="tranche_scolaire" class="col-4 col-form-label">Tranche scolaire:</label>
                                                                                    <div class="col-7">

                                                                                        <div class="form-group">
                                                                                            <select class="select2 form-control" multiple="multiple" name="tranche_scolaire" id="tranche_scolaire" required>
                                                                                                <optgroup label="Tranche scolaire">
                                                                                                    <option value="Tranche-01">1ère Tranche</option>
                                                                                                    <option value="Tranche-02">2e Tranche</option>
                                                                                                    <option value="Tranche-03">3e Tranche</option>
                                                                                                    <option value="Tranche-04">4e Tranche</option>
                                                                                                    <option value="Tranche-05">5e Tranche</option>
                                                                                                </optgroup>

                                                                                                <optgroup label="Tranche spécial">
                                                                                                    <option value="Tranche-Inscription" selected>Tranche d'inscription</option>
                                                                                                    <option value="Tranche-Mensuelle">Tranche mensuelle</option>
                                                                                                </optgroup>
                                                                                            </select>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>

                                                                                <div class="valid-feedback">Valider.</div>
                                                                                <div class="invalid-feedback">
                                                                                    Veuillez remplir ce champ.
                                                                                </div>
                                                                            </div>

                                                                            <div class="col-md-6">
                                                                                <div class="form-group row">
                                                                                    <label for="type_pension" class="col-4 col-form-label">Type de pension:</label>
                                                                                    <div class="col-8">
                                                                                        <div class="form-group row">
                                                                                        <select id="type_pension" class="select2  form-control" name="type_pension" required>

                                                                                            <option value="" disabled>- Choissisez le type de pension concerné -</option>
                                                                                            <option value="Scolarite    ">Scolarité</option>
                                                                                            <option value="Tenue_Scolaire">Tenue scolaire (complete)</option>
                                                                                            <option value="Polo">Polo</option>
                                                                                            <option value="Tenue_Sport">Tenue de sport</option>
                                                                                        </select>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>

                                                                                <div class="valid-feedback">Valider.</div>
                                                                                <div class="invalid-feedback">
                                                                                    Veuillez remplir ce champ.
                                                                                </div>
                                                                            </div>
                                                                        </div>

                                                                        <div class="row">
                                                                            <div class="col-md-6">
                                                                                <div class="form-group row">
                                                                                    <label for="type_paiement" class="col-4 col-form-label">Type de paiement:</label>
                                                                                    <div class="col-8">
                                                                                        <div class="form-group row">
                                                                                        <select id="type_paiement" class="select2  form-control" name="type_paiement" required>

                                                                                            <option value="Epèce">En espèce</option>
                                                                                            <option value="Cheque">Par chèque</option>
                                                                                            <option value="VISA">Par carte visa</option>
                                                                                        </select>

                                                                                </div>
                                                                                    </div>
                                                                                </div>

                                                                                <div class="valid-feedback">Valider.</div>
                                                                                <div class="invalid-feedback">
                                                                                    Veuillez remplir ce champ.
                                                                                </div>
                                                                            </div>

                                                                            <div class="col-md-6">
                                                                                <div class="form-group row">
                                                                                    <label for="mois" class="col-4 col-form-label">Mois de paie:</label>
                                                                                    <div class="col-8">
                                                                                        <div class="form-group row">
                                                                                        <select class="select2 form-control" multiple="multiple" id="mois" name="mois" required>
                                                                                            <optgroup label="- Choissisez le mois de paie -">
                                                                                                <option value="01">Janvier</option>
                                                                                                <option value="02">Février</option>
                                                                                                <option value="03">Mars</option>
                                                                                                <option value="04">Avril</option>
                                                                                                <option value="05">Mai</option>
                                                                                                <option value="06">Juin</option>
                                                                                                <option value="07">Juillet</option>
                                                                                                <option value="08">Août</option>
                                                                                                <option value="09">Septembre</option>
                                                                                                <option value="10">Octobre</option>
                                                                                                <option value="11">Novembre</option>
                                                                                                <option value="12">Décembre</option>
                                                                                            </optgroup>
                                                                                        </select>
                                                                                        </div>
                                                                                    </div>
                                                                                </div>

                                                                                <div class="valid-feedback">Valider.</div>
                                                                                <div class="invalid-feedback">
                                                                                    Veuillez remplir ce champ.
                                                                                </div>
                                                                            </div>
                                                                        </div>

                                                                        <div class="row">
                                                                            <div class="col-md-6">
                                                                                <div class="form-group row">
                                                                                    <label for="montant" class="col-4 col-form-label">Montant&nbsp;:</label>
                                                                                    <div class="col-8">
                                                                                        <input placeholder="Saisie le montant" type="number" class="form-control" id="montant" name="montant" />
                                                                                    </div>
                                                                                </div>
                                                                            </div>

                                                                            <div class="col-md-6">
                                                                                <div class="form-group row">
                                                                                    <label for="date_paiement" class="col-4 col-form-label">Date de versement&nbsp;:</label>
                                                                                    <div class="col-8">
                                                                                        <input type="date" class="form-control" value="<?= date("Y-m-d");?>" id="date_paiement" name="date_paiement" />
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>


                                                                        <div class="row">
                                                                            <div class="col-md-12">
                                                                                <h4 class="form-section text-warning" align="">
                                                                                    <strong>Informations complémentaires</strong>
                                                                                </h4>
                                                                            </div>
                                                                        </div>

                                                                        <div class="row">
                                                                            <div class="col-md-6">
                                                                                <div class="form-group row">
                                                                                    <label for="quantite" class="col-4 col-form-label">Quantité (uniquement pour les saccessoires)&nbsp;:</label>
                                                                                    <div class="col-8">
                                                                                        <input value="0" type="number" class="form-control" id="quantite" name="quantite" />
                                                                                    </div>
                                                                                </div>
                                                                            </div>

                                                                            <div class="col-md-6">
                                                                                <div class="form-group row">
                                                                                    <label for="reduction" class="col-4 col-form-label">Montant de réduction&nbsp;:</label>
                                                                                    <div class="col-8">
                                                                                        <input placeholder="Renseigner le montant de la réduction" type="number" class="form-control" id="reduction" name="reduction" />
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>

                                                                        <div class="row">
                                                                            <div class="col-md-6">
                                                                                <div class="form-group row">
                                                                                    <label for="reste" class="col-4 col-form-label">Reste à payer&nbsp;:</label>
                                                                                    <div class="col-8">
                                                                                        <input value="0" type="number" class="form-control" id="reste" name="reste" />
                                                                                    </div>
                                                                                </div>
                                                                            </div>

                                                                            <div class="col-md-6">
                                                                                <div class="form-group row">
                                                                                    <label for="libelle" class="col-4 col-form-label">Libellé&nbsp;:</label>
                                                                                    <div class="col-8">
                                                                                        <input placeholder="Saisir l'objet de ce versement" type="text" class="form-control" id="libelle" name="libelle" />
                                                                                    </div>
                                                                                </div>
                                                                            </div>
                                                                        </div>



                                                                        <div class="row">
                                                                            <div class="col-md-6">
                                                                                <div class="form-group row">
                                                                                    <label for="motif" class="col-4 col-form-label">Motif :</label>
                                                                                    <div class="col-8">
                                                                                        <textarea placeholder="Renseigner le motif du versement" class="form-control" style="min-height: 100px; max-height: 100px;" id="motif" name="motif"></textarea>
                                                                                    </div>
                                                                                </div>
                                                                            </div>

                                                                            <div class="col-md-6">
                                                                                <div class="form-group row">
                                                                                    <label for="autres" class="col-4 col-form-label">Autres informations :</label>
                                                                                    <div class="col-8">
                                                                                        <textarea placeholder="Renseigner toutes autres informations sur ce versement" class="form-control" style="min-height: 100px; max-height: 100px;" id="autres" name="autres"></textarea>
                                                                                    </div>

                                                                                </div>
                                                                            </div>
                                                                        </div>
                                                                        <div class="row">
                                                                            <div class="col-md-8">

                                                                            </div>
                                                                            <div class="col-md-4">
                                                                                <button type="button" class="btn btn-warning my-1"><i class="fa fa-arrow-right"></i> Suivant</button>
                                                                            </div>
                                                                        </div>
                                                                    </fieldset>
                                                                </form>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
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
    <script>
        var elems = document.getElementsByClassName('ajouter-montant');

        var myLength = elems.length,
            total = 0;

        for (var i = 0; i < myLength; ++i) {
            total += elems[i].value;
        }

        document.getElementById('montant').value = total;
    </script>
    </body>
</html>