<?php
require_once "head.php";
require_once "../app/Helpers/_magic_tools.php";
?><!-- Step 1 -->


<div class="container">
<fieldset>
    <div class="row">
        <div class="col-md-12">
            <h4 class="form-section text-warning" align="center">
                <strong>Information supplementaire</strong></h4><br><br><br>
            </h4>
        </div>
    </div>

    <div class="row">
        <div class="col-md-6">
            <div class="form-group row">
                <label for="logo" class="col-4 col-form-label">Logo:</label>
                <div class="col-8">
                <input type="file" class="inputfile" style="display: none;" name="photo" id="photo" onchange="readURL(this, '.photo_eleve');" />
        <label for="photo" style="  display: block; margin-left: auto; margin-right: auto;">
            <figure>
                <img width="150px" height="150px"  src="app-assets/images/portrait/small/logo.png" alt="" class="photo_eleve" class="center">
            </figure>
        </label>
                </div>
            </div>
        </div>
        <div class="col-md-6">
            <div class="form-group row">
                <label for="signature" class="col-4 col-form-label">Signature:</label>
                <div class="col-8">
                <input type="file" class="inputfile" style="display: none;" name="photo" id="photo" onchange="readURL(this, '.photo_eleve');" />
        <label for="photo" style="  display: block; margin-left: auto; margin-right: auto;">
            <figure>
                <img width="150px" height="150px"  src="app-assets/images/portrait/small/signature.png" alt="" class="photo_eleve" class="center">
            </figure>
        </label>
                </div>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-md-6">
            <div class="form-group row">
                <label for="nom_etablissement" class="col-4 col-form-label">Nom de l'etablissement:</label>
                <div class="col-8">
                    <input placeholder="Nom de l'etablissement" type="text" class="form-control " id="nom_etablissement" name="nom_etablissement" autofocus />
                </div>
            </div>
        </div>

        <div class="col-md-6">
            <div class="form-group row">
                <label for="slogan" class="col-4 col-form-label">Slogan:</label>
                <div class="col-8">
                    <input placeholder="slogan" type="text" class="form-control" id="slogan" name="slogan" />
                </div>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-md-6">
            <div class="form-group row">
                <label for="droit_reserve" class="col-4 col-form-label">Droit reservé:</label>
                <div class="col-8">
                    <input placeholder="Droit reservé" type="text" class="form-control" id="droit_reserve" name="droit_reserve" autofocus/>
                </div>
            </div>

        </div>

        <div class="col-md-6">
            <div class="form-group row">
                <label for="slogan" class="col-4 col-form-label">Lieu:</label>
                <div class="col-8">
                    <input placeholder="lieu" type="text" class="form-control" id="lieu" name="lieu" />
                </div>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-md-6">
            <div class="form-group row">
                <label for="devise" class="col-4 col-form-label">Devise:</label>
                <div class="col-8">
                    <input placeholder="Devise" type="text" class="form-control required" id="devise" name="devise" autofocus/>
                </div>
            </div>

        </div>

        <div class="col-md-6">
            <div class="form-group row">
                <label for="signataire" class="col-4 col-form-label">Signataire:</label>
                <div class="col-8">
                    <input placeholder="signataire" type="text" class="form-control" id="signataire" name="signataire" />
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-md-6">
            <div class="form-group row">
                <label for="situe" class="col-4 col-form-label">Situé:</label>
                <div class="col-8">
                    <input placeholder="situe" type="text" class="form-control required" id="situe" name="situe" autofocus/>
                </div>
            </div>

        </div>

        <div class="col-md-6">
            <div class="form-group row">
                <label for="ville" class="col-4 col-form-label">Ville:</label>
                <div class="col-8">
                    <input placeholder="ville" type="text" class="form-control" id="ville" name="ville" />
                </div>
            </div>
        </div>
    </div>

    <section id="loaders-with-icons">
        <div class="row">

            <div class="col-xl-3 col-xl-4 col-lg-6 col-md-12">

                <div class="loader-wrapper">
                    <div class="loader-container">
                        <div class="fading-circle loader-blue-grey">
                            <div class="circle1 circle"></div>
                            <div class="circle2 circle"></div>
                            <div class="circle3 circle"></div>
                            <div class="circle4 circle"></div>
                            <div class="circle5 circle"></div>
                            <div class="circle6 circle"></div>
                            <div class="circle7 circle"></div>
                            <div class="circle8 circle"></div>
                            <div class="circle9 circle"></div>
                            <div class="circle10 circle"></div>
                            <div class="circle11 circle"></div>
                            <div class="circle12 circle"></div>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </section>
</fieldset>
    </div>