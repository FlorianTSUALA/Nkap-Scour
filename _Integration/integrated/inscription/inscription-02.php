<!DOCTYPE html>

<html class="loaded" data-textdirection="ltr">
    <?php
        require_once "head.php";
        require_once "../app/Helpers/_magic_tools.php";
    ?>

    <body class="vertical-layout vertical-mmenu content-detached-left-sidebar   menu-expanded fixed-navbar" data-open="click" data-menu="vertical-mmenu" data-col="content-detached-left-sidebar">
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
                                                                    <?php
                                                                    //ETAPE IDENTIFICATION ELEVE
                                                                        require_once "inscription_etape_01.php";

                                                                    //ETAPE DOSSIER PARENTAL - PERE
                                                                        require_once "inscription_etape_02.php";

                                                                    //ETAPE DOSSIER PARENTAL - MERE
                                                                        require_once "inscription_etape_03.php";

                                                                    //ETAPE DOSSIER MEDICAL
                                                                        require_once "inscription_etape_04.php";

                                                                    //ETAPE ANTECEDENT SCOLAIRE
                                                                        require_once "inscription_etape_05.php";

                                                                    //ETAPE VERIFICATION DES INFORMATIONS
                                                                        require_once "inscription_etape_06.php";
                                                                    ?>
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