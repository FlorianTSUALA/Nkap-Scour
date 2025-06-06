<?php

    use Core\Routing\URL;
    require_once "partials/head.php";

?>


   <!-- ////////////////////////////////////////////////////////////////////////////-->
   <div class="app-content content">
      <div class="content-wrapper">
        <div class="content-header row">
        </div>
        <div class="content-body"><section class="flexbox-container">
    <div class="col-12 d-flex align-items-center justify-content-center">
        <div class="col-md-4 col-10 p-0">
            <div class="card-header bg-transparent border-0">
                <h2 class="error-code text-center mb-2">404</h2>
                <h3 class="text-uppercase text-center"><?= $message;?> </h3>
            </div>
            <div class="card-content">
                <fieldset class="row py-2">
                    <div class="input-group col-12">
                        <input type="text" class="form-control form-control-xl input-xl border-grey border-lighten-1 " placeholder="Recherche..." aria-describedby="button-addon2">
                        <span class="input-group-append" id="button-addon2">
                           <button class="btn btn-lg btn-secondary border-grey border-lighten-1" type="button"><i class="ft-search"></i></button>
                       </span>
                   </div>
                </fieldset>
                <div class="row py-2">
                    <div class="col-12 col-sm-6 col-md-6">
                        <a href="<?= URL::link('accueil') ?>" class="btn btn-warning btn-block"><i class="ft-home"></i> accueil</a>
                    </div>
                    <div class="col-12 col-sm-6 col-md-6">
                        <a href="<?= URL::link('login') ?>" class="btn btn-danger btn-block"><i class="ft-user"></i>  Connexion</a>
                    </div>
                </div>
            </div>
            <div class="card-footer bg-transparent">
                <div class="row">
                    <p class="text-muted text-center col-12 py-1">© 2020 <a href="#">Les Comilines </a> Notre devise : <i class="ft-heart pink"> </i> by <a href="#" target="_blank">###########</a></p>
                    <div class="col-12 text-center">
                        <a href="#" class="btn btn-social-icon mr-1 mb-1 btn-outline-facebook"><span class="fa fa-facebook"></span></a>
                        <a href="#" class="btn btn-social-icon mr-1 mb-1 btn-outline-twitter"><span class="fa fa-twitter"></span></a>
                        <a href="#" class="btn btn-social-icon mr-1 mb-1 btn-outline-linkedin"><span class="fa fa-linkedin font-medium-4"></span></a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

        </div>
      </div>
    </div>
    <!-- ////////////////////////////////////////////////////////////////////////////-->
<?php
    require_once "partials/footer.php";
?>