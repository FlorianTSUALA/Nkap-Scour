<!-- Step 1 -->
<h6><strong>Identification du personnel</strong></h6>
<fieldset>
    <div class="row">
        <div class="col-md-12">
            <h4 class="form-section text-warning" align="">
                <strong>Identification du personnel</strong>
            </h4>
        </div>
    </div>

    <div class="row">
        <input type="file" class="inputfile" style="display: none;" name="photo" id="photo" onchange="readURL(this, '.photo');" />
        <label for="photo" style="  display: block; margin-left: auto; margin-right: auto;">
            <figure>
                <img width="200px" height="200px"  src="app-assets/images/portrait/small/no-photo.jpg" alt="" class="photo" class="center">
            </figure>
        </label>
    </div>

    <div class="row">
        <div class="col-md-6">
            <div class="form-group row">
                <label for="nom" class="col-4 col-form-label">Nom<?= required_input();?>:</label>
                <div class="col-8">
                    <input placeholder="Nom du personnel" type="text" class="form-control required" id="nom" name="nom" autofocus
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
                <label for="prenom" class="col-4 col-form-label">Prénom :</label>
                <div class="col-8">
                    <input placeholder="Prénom du personnel" type="text" class="form-control" id="prenom" name="prenom" />
                </div>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-md-6">
            <div class="form-group row">
                <label for="telephone" class="col-4 col-form-label">Téléphone :</label>
                <div class="col-8">
                    <input type="text" placeholder="Numéro de téléphone du personnel" class="form-control" id="telephone" name="telephone" />
                </div>
            </div>
        </div>

        <div class="col-md-6">
            <div class="form-group row">
                <label for="email" class="col-4 col-form-label">Email :</label>
                <div class="col-8">
                    <input type="email" placeholder="Adresse email du personnel" class="form-control" id="email" name="email" />
                </div>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-md-6">
            <div class="form-group row">
                <label for="date_prise_service" class="col-4 col-form-label">Date de prise de service :</label>
                <div class="col-8">
                    <input type="date" value="<?= date("Y-m-D");?>" class="form-control" id="date_prise_service" name="date_prise_service" />
                </div>
            </div>
        </div>

        <div class="col-md-6">
            <div class="form-group row">
                <label for="adresse" class="col-4 col-form-label">Adresse :</label>
                <div class="col-8">
                    <input placeholder="Adresse du personnel" type="text" class="form-control" id="adresse" name="adresse" />
                </div>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-md-6">
            <div class="form-group row">
                <label for="pays" class="col-4 col-form-label">Nationalité :</label>
                <div class="col-8">
                    <select id="pays" class="select2 js-example-programmatic form-control" name="pays" >

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


        </div>

        <div class="col-md-6">
            <div class="form-group row">
                <label for="type_personnel" class="col-4 col-form-label">Type de personnel<?= required_input();?>:</label>
                <div class="col-8">
                    <select id="type_personnel" class="select2 js-example-programmatic form-control" name="type_personnel" required>

                        <option value="" disabled>- Choissisez le type de personnel -</option>
                        <option value="Sécrétaire">Sécrétaire</option>
                        <option value="Instituteur.rice">Instituteur.rice</option>
                        <option value="Opérateur de saisie">Opérateur de saisie</option>
                        <option value="Directeur">Directeur</option>
                        <option value="Administrateur">Administrateur</option>
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
                <label for="login" class="col-4 col-form-label">Login :</label>
                <div class="col-8">
                    <input type="text" placeholder="Pseudonyme de connexion" class="form-control " id="login" name="login"  />
                </div>
            </div>


        </div>

        <div class="col-md-6">
            <div class="form-group row">
                <label class="col-4">Civilité :</label>
                <div class="col-8">
                    <div class="row">
                        <div class="col-5">
                            <input name="sexe" id="sexe-01" type="radio" class="cke_button__radio_icon" value="F">

                            <label for="sexe-01" class="">Madame</label>
                        </div>

                        <div class="col-5">
                            <input name="sexe" id="sexe-02" type="radio" class="cke_button__radio_icon" value="M">
                            <label for="sexe-02" class="">Monsieur</label>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-md-6">
            <div class="form-group row">
                <label for="password" class="col-4 col-form-label">Mot de passe :</label>
                <div class="col-8">
                    <input placeholder="Mot de passe du personnel" type="password" class="form-control required" id="password" name="password" required />
                </div>
            </div>

            <div class="valid-feedback">Valider.</div>
            <div class="invalid-feedback">
                Veuillez remplir ce champ.
            </div>
        </div>

        <div class="col-md-6">
            <div class="form-group row">
                <label for="password_confirme" class="col-4 col-form-label">Confirmer mot de passe :</label>
                <div class="col-8">
                    <input placeholder="Confirmer le mot de passe du personnel" type="password" class="form-control required" id="password_confirme" name="password_confirme"  />
                </div>
            </div>

        </div>
    </div>

    <div class="row">
        <div class="col-md-6">
            <div class="form-group row">
                <label for="fonction" class="col-4 col-form-label">Fonction :</label>
                <div class="col-8">
                    <input placeholder="fonction du personnel" type="text" class="form-control required" id="fonction" name="fonction"  />
                </div>
            </div>

        </div>

        <div class="col-md-6">
            <div class="form-group row">
                <label for="assurance" class="col-4 col-form-label">Assurance :</label>
                <div class="col-8">
                    <input placeholder="Assurance du personnel" type="text" class="form-control" id="assurance" name="assurance" />
                </div>
            </div>
        </div>
    </div>

    <div class="row">
        <input type="file" class="inputfile" style="display: none;" name="photo2" id="photo2" onchange="readURL(this, '.photo');" />
        <label for="photo2" style="  display: block; margin-left: auto; margin-right: auto;">
            <figure>
                <img width="200px" height="200px"  src="app-assets/images/portrait/small/no-photo.jpg" alt="" class="photo " >
            </figure>
        </label>
    </div>


    <div class="row">
        <div class="col-md-6">
            <div class="form-group row">
                <label for="autre" class="col-4 col-form-label">Autres :</label>
                <div class="col-8">
                    <input placeholder="Autres informations du personnel" type="text" class="form-control required" id="autre" name="autre"  />
                </div>
            </div>

        </div>

    </div>
</fieldset>