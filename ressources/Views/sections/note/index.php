<?php

use Core\Routing\URL;

$include_res_header = '';
$include_res_header .= '<link rel="stylesheet" type="text/css" href="' . URL::base() . 'assets/app-assets/vendors/css/tables/jsgrid/jsgrid-theme.min.css">';
$include_res_header .= '<link rel="stylesheet" type="text/css" href="' . URL::base() . 'assets/app-assets/vendors/css/tables/jsgrid/jsgrid.min.css">';
$include_res_header .= '<link rel="stylesheet" type="text/css" href="' . URL::base() . 'assets/app-assets/css/plugins/animate/animate.css">';
$include_res_header .= '<link rel="stylesheet" type="text/css" href="' . URL::base() . 'assets/app-assets/css/core/colors/palette-callout.css">';

$include_res_header .= '
                        <style>
                            #menu .list-group a.list-group-item:hover{
                                background-color: #3bafda;
                                color: white;
                            }
                        </style>

                        <style>
                            /* html, body {
                                height: 100%;
                                width: 100%;
                                position: absolute,
                            } */
                            /* #page-content-wrapper, .container-fluid, .row, .another-fluid { height: inherit; }
                            #page-content-wrapper, .principal {padding:0;}
                            #page-content-wrapper {padding-top:5px;}
                            .fill {
                                //height:95vh;
                                min-height: 100%;
                                height: 100%;
                            } */
                            .jsontotable table, .jsontotable th, .jsontotable td {
                                border: 1px solid black;
                                margin: 10px;
                            }
                            /* code {
                                white-space: normal;
                            } */
                            /* #jsGrid, #jsGrid2 {
                                margin: 0px;
                                width: 100%;
                                height: 95%;
                                min-height: 95%;
                                display: block;
                                font-size: 11.5px;
                            } */
                            .jsgrid-cell {padding:0 !important; }
                            /* .bg-green { background-color:#88A23D !important; border-color:#72843e; }
                            .bg-yellow { background-color:#f5c62b !important;  border-color:#b99315;  }
                            .bg-orange { background-color:#ef611a !important;  border-color:#bb450a; }
                            .bg-red { background-color:#ce2e2e !important;  border-color:#a91616; } */
                    
                            /* remove scrollbar */
                            .principal #jsGrid { margin-top:0px; }
                            /*
                            #jsGrid .jsgrid-grid-header,
                            #jsGrid .jsgrid-grid-body{
                                overflow: auto;
                            }
                            */
                            #jsGrid .jsgrid-grid-body{
                                
                                max-height: 80vh;
                                
                            }
                    
                            .jsgrid-selected-row>.jsgrid-cell {
                                background: #ddd !important;
                                border-color: #aaa !important;
                            }
                            .jsgrid-header-row>.jsgrid-header-cell {
                                white-space: nowrap;
                                transform: translate(0%,100%) rotate(-90deg);
                                transform-origin: 0 0;
                                height: 100px;
                                text-align: left !important;
                                padding: 0 !important;
                                margin: 0;
                            }
                    
                            /* .btn-config {padding:4px 12px; margin-top:8px;} */
                    
                            /* view-source:https://www.dapio.com.br/inet/dashboard/grid.html */
                        </style>

' . "\n";
$include_res_header .= '' . "\n";

$include_res_footer = '' . "\n";
$include_res_footer .= '<script src="' . URL::base() . 'assets/app-assets/vendors/js/tables/jsgrid/jsgrid.min.js"></script>';
$include_res_footer .= '<script src="' . URL::base() . 'assets/app-assets/vendors/js/tables/jsgrid/griddata.js"></script>';
$include_res_footer .= '<script src="' . URL::base() . 'assets/app-assets/js/scripts/tables/jsgrid/jsgrid.js"></script>';

$include_res_footer .= '<script src="' . URL::base() . 'assets/app-assets/vendors/js/animation/jquery.appear.js"></script>';
$include_res_footer .= '<script src="' . URL::base() . 'assets/app-assets/js/scripts/animation/animation.js"></script>';
$include_res_footer .= "";
$include_res_footer .= '' . "\n";

ob_start();
// include 'listener.php';
// include 'buiderHtml.php';
// include 'affectation-script.php';

$include_footer_script = ob_get_clean();


//TENIR COMPTE DU NOMBRE D'ELEVE NON AFFECTE PAR SALLE DANS LE MENU LATERALE

?>
<!--
    ******  VARIABLES *****

    --- $title

-->


<div class="app-content content">
    <div class="sidebar-right sidebar-sticky">
        <div class="sidebar">
            <div class="sidebar-content card d-none d-lg-block">
                <div class="card-body">
                    <div class="category-title pb-1">
                        <h6>Liste des Salles de Classes</h6>
                    </div>
                    <!-- Card sample -->
                    <div class="text-center">
                        <img class="card-img-top mb-1 img-fluid" data-src="holder.js/100px180/" src="../../../app-assets/images/portfolio/portfolio-1.jpg" alt="Card image cap">
                    </div>
                    <h4 class="card-title">Salle de classe</h4>
                        <div id="menu" class="navigation navigation-main">
                            <div class="list-group">
                                <a href="<?= "#"; ?>"  id="ID_ALL" class="list-group-item"> Voir tout</a>
                                <?php
                                    foreach (json_decode($classes) as $item) { ?>
                                    <a href="#" id="ID_<?= $item->id ?>"  data-id="ID_<?= $item->id ?>" 
                                        class="list-group-item" data-toggle="collapse" 
                                        data-parent="#menu">
                                        <?= $item->value ?> 
                                    </a>
                                <?php } ?>
                            </div>
                        </div>
                    <a href="#" class="btn btn-primary">Actualisaiton</a>
                    <!-- /Card sample -->
                    <hr>
                    <!-- Striped Progress sample -->
                    <div class="category-title pb-1">
                        <h6>Progress example</h6>
                    </div>
                    <div>
                        <div class="progress progress-sm mt-1 mb-0">
                            <div class="progress-bar bg-success" role="progressbar" style="width: 40%" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
                        </div>
                        <div class="progress progress-sm mt-1 mb-0">
                            <div class="progress-bar bg-danger" role="progressbar" style="width: 60%" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
                        </div>
                        <div class="progress progress-sm mt-1 mb-0">
                            <div class="progress-bar bg-info" role="progressbar" style="width: 100%" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100"></div>
                        </div>
                    </div>
                    <!-- /Striped Progress sample -->
                    
                    <hr>
                    <!-- /Ratings sample -->
                    <div class="category-title pb-1">
                        <h6>Ratings example</h6>
                    </div>
                    <div>
                        <p class="card-text">This is the most basic example of ratings.</p>
                        <div id="score-rating"></div>
                    </div>
                    <!-- /Ratings sample -->
                </dv>
            </div>

        </div>
    </div>

    <div class="content-left">
        <div class="content-wrapper">
            <div class="content-header row">
                <div class="content-header-left col-md-6 col-12">
                    <h3 class="content-header-title">Bulletin de note </h3>
                    <div class="row breadcrumbs-top">
                        <div class="breadcrumb-wrapper col-12">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="<?= URL::link('accueil') ?>">Accueil</a>
                                </li>
                                <li class="breadcrumb-item"><a href="<?= URL::link('enseignement_accueil') ?>">Enseignement</a>
                                </li>
                                <li class="breadcrumb-item active">Bulletin de notes
                                </li>
                            </ol>
                        </div>
                    </div>
                </div>
                <div class="content-header-right col-md-6 col-12">
                    <div class="btn-group float-md-right" role="group" aria-label="Button group with nested dropdown">
                        <div class="btn-group" role="group">
                            <a class="btn btn-outline-info" href="calendars-clndr.html"><i class="fa fa-calendar"></i>&nbsp;&nbsp;Matiere</a>
                            <a class="btn btn-outline-info" href="timeline-center.html"><i class="fa fa-bar-chart"></i>&nbsp;&nbsp;SalleClasse</a>
                        </div>
                    </div>
                </div>
                <div class="content-header-lead col-12 mt-2">
                    <p class="lead">Cette page vous permet de d'enregistrer et de mettre à jour les notes des élèves obtenues dans differentes matieres par salle de classe.</p>
                </div>
            </div>
            <div class="content-body">
                <!-- Description -->
                <section id="description" class="card">
                    <div class="card-header">
                        <h4 class="card-title">Opion d'enregistrement</h4>
                    </div>
                    <div class="card-content">
                        <div class="card-body">
                            <div class="card-text">
                                <p>Tout ce qui concerne les outils de selection de la salle ou bien encore de la classe.</p>
                            </div>
                        </div>
                    </div>
                </section>
                <!--/ Description -->
                <!-- CSS Classes -->
                <section id="css-classes" class="card">
                    <div class="card-header">
                        <h4 class="card-title">Bulletin de note de la salle de classe</h4>
                    </div>
                    <div class="card-content collapse show">
                        <div class="card-body card-dashboard ">
                            <p>Grid with filtering, editing, inserting, deleting, sorting and paging. Data provided by controller.</p>
                            <div id="basicScenario"></div>
                        </div>
                    </div>
                </section>
                <!--/ CSS Classes -->
                
            </div>
        </div>
    </div>
</div>