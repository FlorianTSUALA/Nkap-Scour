
<?php

use Core\Routing\URL;
use App\Helpers\Helpers;

$include_res_header = '';
$include_res_header .=  '<style>
                        ul, li {list-style-type: none;}

                        #menu div div li a{ 
                            font-size: 1.3rem !important;
                        }

                        #menu li a:hover { 
                            background-color: aliceblue;
                        }

                        #menu li :active:hover { 
                            background-color: #fff; 
                            color: #3BAFDA;
                        }

                        #menu li a:active { 
                            background-color: #3BAFDA;
                            color: #fff;
                        }
                        </style>';
    $include_res_header = '<link rel="stylesheet" type="text/css" href="'.URL::base().'assets/vendors/css/tables/datatable/dataTables.bootstrap4.min.css">'. "\n";
    $include_res_header .= '<link rel="stylesheet" type="text/css" href="'.URL::base().'assets/vendors/css/tables/extensions/rowReorder.dataTables.min.css">'. "\n";
    $include_res_header .= '<link rel="stylesheet" type="text/css" href="'.URL::base().'assets/vendors/css/tables/extensions/responsive.dataTables.min.css">'. "\n";
    // $include_res_header .= '<link rel="stylesheet" type="text/css" href="'.URL::base().'assets/vendors/css/forms/icheck/icheck.css">'. "\n";
    $include_res_header .= '<link rel="stylesheet" type="text/css" href="'.URL::base().'assets/app-assets/vendors/css/pickers/daterange/daterangepicker.css">'. "\n";
    $include_res_header .= '<link rel="stylesheet" type="text/css" href="'.URL::base().'assets/vendors/css/ui/jquery-ui.min.css">'. "\n";
    $include_res_header .= '<link rel="stylesheet" type="text/css" href="'.URL::base().'assets/vendors/css/forms/selects/select2.min.css">'. "\n";
    $include_res_header .= ''. "\n";
    
    
    $include_res_footer = ''. "\n";
    $include_res_footer .= '<script src="'.URL::base().'assets/app-assets/vendors/js/tables/jquery.dataTables.min.js"></script>'. "\n";
    $include_res_footer .= '<script src="'.URL::base().'assets/app-assets/vendors/js/tables/datatable/dataTables.bootstrap4.min.js"></script>'. "\n";
    $include_res_footer .= '<script src="'.URL::base().'assets/app-assets/vendors/js/tables/datatable/dataTables.responsive.min.js"></script>'. "\n";
    $include_res_footer .= '<script src="'.URL::base().'assets/app-assets/vendors/js/tables/datatable/dataTables.rowReorder.min.js"></script>'. "\n";
    // $include_res_footer .= '<script src="'.URL::base().'assets/app-assets/vendors/js/charts/echarts/echarts.js"></script>'. "\n";
    // $include_res_footer .= '<script src="'.URL::base().'assets/app-assets/vendors/js/forms/icheck/icheck.min.js"></script>'. "\n";
    
    // <!-- BEGIN DATE PICKER VENDOR JS-->
    $include_res_footer .= '<script src="'.URL::base().'assets/app-assets/vendors/js/pickers/dateTime/moment-with-locales.min.js"></script>'. "\n";
    $include_res_footer .= '<script src="'.URL::base().'assets/app-assets/vendors/js/pickers/daterange/daterangepicker.js"></script>'. "\n";
    // <!-- END DATE PICKER VENDOR JS-->
    
$include_res_footer .= "";

ob_start();
include 'emprunt_exemplaire-script.php';
$include_footer_script = ob_get_clean();
?>
<!--
    ******  VARIABLES *****

    --- $title

-->

<div class="app-content content">
    <div class="content-wrapper">
        <div class="content-header row">
            <div class="content-header-left col-md-6 col-12">
            <h3 class="content-header-title">Bibliothèque	</h3>
            <div class="row breadcrumbs-top">
                <div class="breadcrumb-wrapper col-12">
                <ol class="breadcrumb">
                    </li>
                    <li class="breadcrumb-item"><a href="<?= URL::link('accueil') ?>">Accueil</a>
                    <li class="breadcrumb-item"><a href="<?= URL::link('biblio_accueil') ?>">Bibliothèque</a> </a>
                    </li>
                    <li class="breadcrumb-item active">Emprunt de documents
                    </li>
                </ol>
                </div>
            </div>
            </div>
            <div class="content-header-right col-md-6 col-12">
            <div class="btn-group float-md-right" role="group" aria-label="Button group with nested dropdown">
                <div class="btn-group" role="group"><a class="btn btn-outline-info" href="calendars-clndr.html"><i class="fa fa-calendar"></i></a><a class="btn btn-outline-info" href="timeline-center.html"><i class="fa fa-bar-chart"></i></a>
                <button class="btn btn-outline-info dropdown-toggle dropdown-menu-right" id="btnGroupDrop1" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="fa fa-settings icon-left"></i> Settings</button>
                <div class="dropdown-menu" aria-labelledby="btnGroupDrop1"><a class="dropdown-item" href="card-bootstrap.html">Bootstrap Cards</a><a class="dropdown-item" href="component-buttons-extended.html">Buttons Extended</a></div>
                </div>
            </div>
            </div>
            <div class="content-header-lead col-12 mt-2">
            <p class="lead"></p>
            </div>
        </div>

        <div class="content-detached content-right">
            <div class="content-body">
                <section class="row">
                <div class="col-12">
                    <div class="card">

                        <div class="card-header">
                            <div class="d-flex">
                                <div class="p-0  col-md-3 mr-auto "><h4 class="card-title" id="heading-prev-next">Liste des livres empruntés</h4><small class="text-muted">Allows you to provide.</small></div>
                                <div class="p-0 mr-1   ">
                                    <button class="btn btn-primary "><i class="ft-plus white"></i> Emprunter un live</button>
                                </div>
                                <div class="p-0 mr-1 ">
                                    <fieldset class="input-group">
                                        <!-- <div class="input-group-prepend">
                                        <span class="input-group-text">L &nbsp; <span class="fa fa-calendar"></span></span>
                                        </div> -->
                                        <input id="localization" type='text' class="form-control form-control-sm localeRange" />
                                        <div class="input-group-append">
                                        <span class="input-group-text">Date &nbsp; <span class="fa fa-calendar"></span></span>
                                        </div>
                                        <!-- <small class="text-muted">Allows you to provide.</small> -->
                                    </fieldset>
                                </div>

                                
                                <div class="p-0   ">
                                    <span class="dropdown">
                                        <button class="btn btn-info dropdown-toggle" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="icon-settings mr-1"></i>Rapport</button>
                                        <span class="dropdown-menu arrow  dropdown-menu-left">
                                            <a href="#" class="dropdown-item"><i class="fa fa-file-excel-o"></i> Excel </a>                       
                                            <a href="#" class="dropdown-item"><i class="fa fa-file-word-o"></i> Word</a>
                                            <a href="#" class="dropdown-item"><i class="fa fa-file-pdf-o"></i> PDF </a>
                                        </span>
                                    </span>
                                </div>
                            </div>
                            <div class="d-flex  mt-1">
                                    <div class="alert bg-success alert-icon-left" role="alert">
                                        <span class="alert-icon"><i class="fa fa-pencil-square"></i></span>
                                        <span class="alert-icon"><i class="fa fa-pencil-square"></i></span>
                                        <span id='resume_filtre' >Robust Admin Template default layout is 2 columns. If you do not define pageConfig block on padefault.</span>
                                    </div>
                            </div>
                         
                        </div>
                        
                        <div class="card-content">
                            <div class="card-body">
                                <!-- Task List table -->
                                <div class="table-responsive">
                                    <table id="project-bugs-list" class="table table-white-space table-bordered row-grouping display no-wrap icheck table-middle">
                                        <thead>
                                            <tr>
                                                <th>ID</th>
                                                <th>Bug</th>
                                                <th>Asignee</th>
                                                <th>Status</th>
                                                <th>Actions</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td><a href="#" class="text-bold-600">#101</a></td>
                                                <td>
                                                    <a href="#" class="text-bold-600">Vertical menu issue on iPad</a>
                                                    <p class="text-muted font-small-2">Phasellus vel elit volutpat, egestas urna a.</p>
                                                </td>
                                                <td class="text-center">
                                                    <span class="avatar avatar-busy">
                                                        <img src="../../../app-assets/images/portrait/small/avatar-s-3.png" alt="avatar" data-toggle="tooltip" data-placement="right" title="John Doe"><i class=""></i>
                                                    </span>
                                                </td>
                                                <td><span class="badge badge-info">In Progress</span></td>
                                                
                                                <td>
                                                    <span class="dropdown">
                                                        <button id="btnSearchDrop2" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" class="btn btn-info dropdown-toggle"><i class="fa fa-cog"></i></button>
                                                        <span aria-labelledby="btnSearchDrop2" class="dropdown-menu mt-1 dropdown-menu-right">
                                                            <a href="#" class="dropdown-item action-voir"><i class="ft-eye"></i> voir</a>
                                                            <a href="#" class="dropdown-item action-modifier"><i class="ft-edit-2"></i> modifier</a>
                                                            <a href="#" class="dropdown-item action-restituer"><i class="ft-check"></i> restituer</a>
                                                            <a href="#" class="dropdown-item action-reemprunter"><i class="ft-upload"></i> re-emprunter</a>
                                                            <a href="#" class="dropdown-item action-supprimer"><i class="ft-trash"></i> supprimer</a>
                                                        </span>
                                                    </span>
                                                </td>
                                            </tr>
                                            
                                        </tbody>
                                        <tfoot>
                                            <tr>
                                                <th>N°</th>
                                                <th>Nom</th>
                                                <th>Classe</th>
                                                <th>Livre</th>				                
                                                <th>Actions</th>
                                            </tr>
                                        </tfoot>
                                    </table>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </section>
            </div>
        </div>

        <div class="sidebar-detached sidebar-left">
            <div class="sidebar">
                <div class="bug-list-sidebar-content">
                
                    <!-- Predefined Views -->
                    <div class="card">
                        <div class="card-header">
                            <h4 class="card-title">Recherche par livre</h4>
                            <a class="heading-elements-toggle"><i class="ft-ellipsis-h font-medium-3"></i></a>
                            <div class="heading-elements">
                                <ul class="list-inline mb-0">
                                    <li><a data-action="collapse"><i class="ft-minus"></i></a></li>
                                    <li><a data-action="close"><i class="ft-x"></i></a></li>
                                </ul>
                            </div>
                        </div>
                        <!-- bug-list search -->
                        <div class="card-content">
                            <div class="card-body border-top-blue-grey border-top-lighten-5">
                                <div class="bug-list-search">
                                    <div class="bug-list-search-content">
                                        <form action="#">
                                            <div class="position-relative">
                                                <input type="search" class="form-control menu-search"  placeholder="Liste des livres...">
                                                <div class="form-control-position">
                                                    <i class="ft-search text-size-base text-muted"></i>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                            <!-- /bug-list search -->

                            <div class="card-body">
                            <div id="menu">
                                <div class="list-group">
                                    <li><a href="#" class="list-group-item blockquote pl-1 border-left-primary border-left-3 text-bold-600 active" data-toggle="collapse" data-target="#sm" data-parent="#menu">Voir tout <span class="badge badge-pill badge-primary float-right"><?= count($domaines); ?></span></a> </li>
                                    <?php foreach($domaines as $domaine){ ?>
                                            <li><a href="#" class="list-group-item blockquote pl-1 border-left-primary border-left-3 text-bold-600 " data-toggle="collapse" data-target="#ID_<?= $domaine['domaine_id']?>" data-parent="#menu"><?= $domaine['domaine']; ?> <span class="badge  badge-pill bg-<?= Helpers::getRandromBootstrapColor() ?> float-right mr-2 badge-glow"><?= count($domaine['documents']); ?></span> </a> </li>
                                            <div id="ID_<?= $domaine['domaine_id']?>" class="collapse ">
                                                <?php foreach($domaine['documents'] as $document){ ?>
                                                    <li><a id="ID_<?= $document['document_id']?>"  class="list-group-item text-bold-400 font-large-1"><i class="fa fa-chevron-circle-right"></i>  <?= $document['document']; ?> </a></li>
                                                <?php } ?>
                                            </div>
                                    <?php } ?>
                                </div>
                            </div>
                            </div>

                      
                        </div>
                    </div>
                    <!--/ Predefined Views -->
                    
                </div>
            </div>
        </div>
    </div>
</div>