<!-- Step 3 -->
<h6><strong>Renseignement du dossier parental (partie 2)</strong></h6>
<fieldset>
    <div class="row">
        <div class="col-md-12">
            <h4 class="form-section text-warning" align="">
                <strong>Renseignement du dossier parental (partie 2)</strong>
            </h4>
        </div>
    </div>

    <div class="row">
        <div class="col-md-6">
            <div class="form-group row">
                <label for="nom_mere" class="col-4 col-form-label">Nom du mère<?= required_input();?>:</label>
                <div class="col-8">
                    <input placeholder="Nom de la mère" type="text" class="form-control required" id="nom_mere" name="nom_mere" autofocus
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
                <label for="prenom_mere" class="col-4 col-form-label">Prénom du mère :</label>
                <div class="col-8">
                    <input placeholder="Prénom de la mère" type="text" class="form-control" id="prenom_mere" name="prenom_mere" />
                </div>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-md-6">
            <div class="form-group row">
                <label for="profession_mere" class="col-4 col-form-label">Profession du mère:</label>
                <div class="col-8">
                    <input placeholder="Profession dde la mère" type="text" class="form-control" id="profession_mere" name="profession_mere" />
                </div>
            </div>
        </div>

        <div class="col-md-6">
            <div class="form-group row">
                <label for="employeur_mere" class="col-4 col-form-label">Employeur du mère :</label>
                <div class="col-8">
                    <input placeholder="Employeur de la mère" type="text" class="form-control" id="employeur_mere" name="employeur_mere" />
                </div>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-md-6">
            <div class="form-group row">
                <label for="lieu_travail_mere" class="col-4 col-form-label">Lieu de travail&nbsp;:</label>
                <div class="col-8">
                    <input placeholder="Lieu de travail du mère" type="text" class="form-control" id="lieu_travail_mere" name="lieu_travail_mere" />
                </div>
            </div>
        </div>

        <div class="col-md-6">
            <div class="form-group row">
                <label for="quartier_mere" class="col-4 col-form-label">Quartier du mère :</label>
                <div class="col-8">
                    <input placeholder="Quartier de résidence du mère" type="text" class="form-control" id="quartier_mere" name="quartier_mere" />
                </div>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-md-6">
            <div class="form-group row">
                <label for="telephone_mere" class="col-4 col-form-label">Téléphone&nbsp;:</label>
                <div class="col-8">
                    <input placeholder="Numéro de téléphone du mère" type="text" class="form-control" id="telephone_mere" name="telephone_mere" />
                </div>
            </div>
        </div>

        <div class="col-md-6">
            <div class="form-group row">
                <label for="ville_mere" class="col-4 col-form-label">Ville du mère :</label>
                <div class="col-8">
                    <input placeholder="Ville de résidence du mère" type="text" class="form-control" id="ville_mere" name="ville_mere" />
                </div>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-md-6">
            <div class="form-group row">
                <label for="email_mere" class="col-4 col-form-label">Adresse email&nbsp;:</label>
                <div class="col-8">
                    <input placeholder="Adresse du mère" type="email" class="form-control" id="email_mere" name="email_mere" />
                </div>
            </div>
        </div>


    </div>

    <div class="row">
        <div class="col-md-6">
            <div class="form-group row">
                <label for="pays_mere" class="col-4 col-form-label">Pays du mère<?= required_input();?>:</label>
                <div class="col-8">
                    <select id="pays_mere" class="select2 js-example-programmatic form-control" name="pays_mere" required>

                        <option value="" disabled>- Choissisez une nationalité -</option>
                        <option value="Gabon">Gabon</option>
                        <option value="Cameroun">Cameroun</option>
                        <option value="France">France</option>
                        <option value="Senegal">Senegal</option>
                        <option value="Niger">Niger</option>
                        <option value="Nigeria">Nigeria</option>
                    </select>
                </div>
            </div>

            <div class="valid-feedback">Valider.</div>
            <div class="invalid-feedback">
                Veuillez remplir ce champ.
            </div>
        </div>
    </div>
</fieldset>