<?php
require_once "head.php";
require_once "../app/Helpers/_magic_tools.php";
?><!-- Step 1 -->
<h6><strong>Identification de l'élève</strong></h6>
<fieldset>
    <div class="row">
        <div class="col-md-12">
            <h4 class="form-section text-warning" align="">
                <strong>Identification de l'élève</strong>
            </h4>
        </div>
    </div>

    <div class="row">
        <input type="file" class="inputfile" style="display: none;" name="photo" id="photo" onchange="readURL(this, '.photo_eleve');" />
        <label for="photo" style="  display: block; margin-left: auto; margin-right: auto;">
            <figure>
                <img width="200px" height="200px"  src="app-assets/images/portrait/small/no-photo.jpg" alt="" class="photo_eleve" class="center">
            </figure>
        </label>
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
                <label for="date_naissance_eleve" class="col-4 col-form-label">Date de naissance<?= required_input();?>:</label>
                <div class="col-8">
                    <input type="date" class="form-control required" id="date_naissance_eleve" name="date_naissance_eleve"
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
                <label for="lieu_naissance_eleve" class="col-4 col-form-label">Lieu de naissance<?= required_input();?>:</label>
                <div class="col-8">
                    <input placeholder="Lieu de naissance de l'élève" type="text" class="form-control required" id="lieu_naissance_eleve" name="nomlieu_naissance_eleve_eleve"
                           required="required" />
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
                <label for="pays_eleve" class="col-4 col-form-label">Pays d'origine<?= required_input();?>:</label>
                <div class="col-8">
                    <select id="pays_eleve" class="select2 js-example-programmatic form-control" name="pays_eleve" required>

                        <option value="" disabled>- Choissisez une nationalité -</option>
                        <option value="Gabon">Gabon</option>
                        <option value="Cameroun">Cameroun</option>
                        <option value="France">France</option>
                        <option value="Sud_afrique">Sud Afrique</option>
                        <option value="Senegal">Senegal</option>
                        <option value="Nigeria">Nigeria</option>
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
                <label for="statut_apprenant_eleve" class="col-4 col-form-label">Statut de l'apprenant<?= required_input();?>:</label>
                <div class="col-8">
                    <select id="statut_apprenant_eleve" class="select2 js-example-programmatic form-control" name="statut_apprenant_eleve" required>

                        <option value="" disabled>- Choissisez le statut actuel de l'élève -</option>
                        <option value="Nouveau">Nouveau</option>
                        <option value="Redoublant">Redoublant</option>
                        <option value="Ancien">Ancien</option>
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
                <label for="anciennete_eleve" class="col-4 col-form-label">Ancienneté&nbsp;:</label>
                <div class="col-8">
                    <input placeholder="Nombre d'année" type="number" class="form-control" id="anciennete_eleve" name="anciennete_eleve" />
                </div>
            </div>
        </div>
    </div>
</fieldset>