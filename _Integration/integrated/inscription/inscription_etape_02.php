<!-- Step 2 -->
<h6><strong>Renseignement du dossier parental (partie 1)</strong></h6>
<fieldset>
    <div class="row">
        <div class="col-md-12">
            <h4 class="form-section text-warning" align="">
                <strong>Renseignement du dossier parental (partie 1)</strong>
            </h4>
        </div>
    </div>

    <div class="row">
        <div class="col-md-6">
            <div class="form-group row">
                <label for="nom_pere" class="col-4 col-form-label">Nom du père<?= required_input();?>:</label>
                <div class="col-8">
                    <input placeholder="Nom du père" type="text" class="form-control required" id="nom_pere" name="nom_pere" autofocus
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
                <label for="prenom_pere" class="col-4 col-form-label">Prénom du père :</label>
                <div class="col-8">
                    <input placeholder="Prénom du père" type="text" class="form-control" id="prenom_pere" name="prenom_pere" />
                </div>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-md-6">
            <div class="form-group row">
                <label for="profession_pere" class="col-4 col-form-label">Profession du père:</label>
                <div class="col-8">
                    <input placeholder="Profession du père" type="text" class="form-control" id="profession_pere" name="profession_pere" />
                </div>
            </div>
        </div>

        <div class="col-md-6">
            <div class="form-group row">
                <label for="employeur_pere" class="col-4 col-form-label">Employeur du père :</label>
                <div class="col-8">
                    <input placeholder="Employeur du père" type="text" class="form-control" id="employeur_pere" name="employeur_pere" />
                </div>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-md-6">
            <div class="form-group row">
                <label for="lieu_travail_pere" class="col-4 col-form-label">Lieu de travail&nbsp;:</label>
                <div class="col-8">
                    <input placeholder="Lieu de travail du père" type="text" class="form-control" id="lieu_travail_pere" name="lieu_travail_pere" />
                </div>
            </div>
        </div>

        <div class="col-md-6">
            <div class="form-group row">
                <label for="quartier_pere" class="col-4 col-form-label">Quartier du père :</label>
                <div class="col-8">
                    <input placeholder="Quartier de résidence du père" type="text" class="form-control" id="quartier_pere" name="quartier_pere" />
                </div>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-md-6">
            <div class="form-group row">
                <label for="telephone_pere" class="col-4 col-form-label">Téléphone&nbsp;:</label>
                <div class="col-8">
                    <input placeholder="Numéro de téléphone du père" type="text" class="form-control" id="telephone_pere" name="telephone_pere" />
                </div>
            </div>
        </div>

        <div class="col-md-6">
            <div class="form-group row">
                <label for="ville_pere" class="col-4 col-form-label">Ville du père :</label>
                <div class="col-8">
                    <input placeholder="Ville de résidence du père" type="text" class="form-control" id="ville_pere" name="ville_pere" />
                </div>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-md-6">
            <div class="form-group row">
                <label for="email_pere" class="col-4 col-form-label">Adresse email&nbsp;:</label>
                <div class="col-8">
                    <input placeholder="Adresse du père" type="email" class="form-control" id="email_pere" name="email_pere" />
                </div>
            </div>
        </div>

        <div class="col-md-6">
            <div class="form-group row">
                <label class="col-4">Est tuteur ?<?= required_input();?>:</label>
                <div class="col-8">
                    <div class="row">
                        <div class="col-4">
                            <input name="est_tuteur_pere" id="est_tuteur_pere-01" type="radio" class="cke_button__radio_icon" value="N"
                                   required="required">

                            <label for="est_tuteur_pere-01" class="">OUI</label>
                        </div>

                        <div class="col-6">
                            <input name="est_tuteur_pere" id="est_tuteur_pere-02" type="radio" class="cke_button__radio_icon" value="N"
                                   required="required">
                            <label for="est_tuteur_pere-02" class="">NON</label>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-md-12">
            <h4 class="form-section text-warning" align="">
                <strong>Personne à contacter en cas d'urgence</strong>
            </h4>
        </div>
    </div>

    <div class="row">
        <div class="col-md-6">
            <div class="form-group row">
                <label for="pays_pere" class="col-4 col-form-label">Pays du père<?= required_input();?>:</label>
                <div class="col-8">
                    <select id="pays_pere" class="select2 js-example-programmatic form-control" name="pays_pere" required>

                        <option value="" disabled>- Choissisez une nationalité -</option>
                        <option value="Gabon">Gabon</option>
                        <option value="Cameroun">Cameroun</option>
                        <option value="Tchad">Tchad</option>
                        <option value="Togo">Togo</option>
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
        
        <div class="col-md-6">
            <div class="form-group row">
                <label for="nom_personne_urgence" class="col-4 col-form-label">Nom :</label>
                <div class="col-8">
                    <input placeholder="Nom personne urgence" type="text" class="form-control" id="nom_personne_urgence" name="nom_personne_urgence" />
                </div>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-md-6">
            <div class="form-group row">
                <label for="prenom_personne_urgence" class="col-4 col-form-label">Prénom :</label>
                <div class="col-8">
                    <input placeholder="Prénom personne urgence" type="text" class="form-control" id="prenom_personne_urgence" name="prenom_personne_urgence" />
                </div>
            </div>
        </div>

        <div class="col-md-6">
            <div class="form-group row">
                <label for="telephone_personne_urgence" class="col-4 col-form-label">Téléphone :</label>
                <div class="col-8">
                    <input placeholder="Téléphone personne urgence" type="text" class="form-control" id="telephone_personne_urgence" name="telephone_personne_urgence" />
                </div>
            </div>
        </div>
    </div>
</fieldset>