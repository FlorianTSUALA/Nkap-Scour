<!DOCTYPE html>

<html class="loaded" data-textdirection="ltr">
    <?php
        require_once "head.php";
        require_once "../app/Helpers/_magic_tools.php";
    ?>

    <body class="vertical-layout vertical-mmenu 2-columns menu-expanded fixed-navbar" data-open="click" data-menu="vertical-mmenu" data-col="2-columns">
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
                                                                                    <strong>Inscription dans un club</strong>
                                                                                </h4>
                                                                            </div>
                                                                        </div>

                                                                        <div class="row">
                                                                            <div class="col-md-6">
                                                                                <div class="form-group row">
                                                                                    <label for="nom_eleve" class="col-4 col-form-label">Matricule<?= required_input();?>:</label>
                                                                                    <div class="col-8">
                                                                                        <input placeholder="Nom de l'élève" type="text" class="form-control required" id="nom_eleve" name="nom_eleve" autofocus
                                                                                               required="required" />
                                                                                    </div>
                                                                                </div>



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


                                                                        <div class="row">

                                                                            <div class="col-md-6">
                                                                                <div class="form-group row">
                                                                                    <label for="nom_eleve" class="col-4 col-form-label">Mois :</label>
                                                                                    <div class="col-8">


                                                                                        <div class="form-group row">

                                                                                            <select class="select2 form-control" multiple="multiple" id="id_h5_multi">
                                                                                                <optgroup label="Alaskan/Hawaiian Time Zone">
                                                                                                    <option value="janvier" >Janvier</option>
                                                                                                    <option value="fevrier">Février</option>
                                                                                                    <option value="mars" >Mars</option>
                                                                                                    <option value="avril">Avril</option>
                                                                                                    <option value="mai" >Mai</option>
                                                                                                    <option value="juin">Juin</option>
                                                                                                    <option value="juillet" >Juillet</option>
                                                                                                    <option value="aout">Aout</option>
                                                                                                    <option value="septembre" >Septembre</option>
                                                                                                    <option value="octobre">Octobre</option>
                                                                                                    <option value="novembre" >Novembre</option>
                                                                                                    <option value="decembre">Décembre</option>
                                                                                                </optgroup>


                                                                                            </select>
                                                                                        </div>


                                                                                    </div>


                                                                                </div>



                                                                            </div>

                                                                            <div class="col-md-6">
                                                                                <div class="form-group row">
                                                                                    <label for="nom_eleve" class="col-4 col-form-label">Discipline :</label>
                                                                                    <div class="col-8">


                                                                                        <div class="form-group row">

                                                                                            <select class="select2 form-control" multiple="multiple" id="id_multi">
                                                                                                <optgroup label="Alaskan/Hawaiian Time Zone">
                                                                                                    <option value="janvier" >Judo</option>
                                                                                                    <option value="fevrier">Informatique</option>
                                                                                                    <option value="mars" >Natation</option>
                                                                                                    <option value="avril">Volley</option>
                                                                                                    <option value="decembre">Football   </option>
                                                                                                </optgroup>


                                                                                            </select>
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
    </body>
</html>