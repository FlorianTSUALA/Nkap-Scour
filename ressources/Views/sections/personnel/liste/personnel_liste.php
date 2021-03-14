    <?php

use Core\Routing\URL;
use App\Helpers\Helpers;


$include_res_header = '<link rel="stylesheet" type="text/css" href="' . URL::base() . 'assets/vendors/css/tables/datatable/dataTables.bootstrap4.min.css">' . "\n";
$include_res_header .= '<link rel="stylesheet" type="text/css" href="' . URL::base() . 'assets/vendors/css/tables/extensions/rowReorder.dataTables.min.css">' . "\n";
$include_res_header .= '<link rel="stylesheet" type="text/css" href="' . URL::base() . 'assets/vendors/css/tables/extensions/responsive.dataTables.min.css">' . "\n";
$include_res_header .= '<link rel="stylesheet" type="text/css" href="' . URL::base() . 'assets/app-assets/vendors/css/pickers/daterange/daterangepicker.css">' . "\n";
$include_res_header .= '<link rel="stylesheet" type="text/css" href="' . URL::base() . 'assets/vendors/css/ui/jquery-ui.min.css">' . "\n";
$include_res_header .= '<link rel="stylesheet" type="text/css" href="' . URL::base() . 'assets/vendors/css/forms/selects/select2.min.css">' . "\n";
// $include_res_header .= Helpers::dataTableResponsibleSearchBar() . "\n";
$include_res_header .= '' . "\n";

$include_res_footer = '' . "\n";
$include_res_footer .= '<script src="' . URL::base() . 'assets/app-assets/vendors/js/tables/jquery.dataTables.min.js"></script>' . "\n";
$include_res_footer .= '<script src="' . URL::base() . 'assets/app-assets/vendors/js/tables/datatable/dataTables.bootstrap4.min.js"></script>' . "\n";
$include_res_footer .= '<script src="' . URL::base() . 'assets/app-assets/vendors/js/filesaver/FileSaver.min.js"></script>' . "\n";
// $include_res_footer .= '<script src="' . URL::base() . 'assets/app-assets/vendors/js/tables/datatable/dataTables.responsive.min.js"></script>' . "\n";
// $include_res_footer .= '<script src="' . URL::base() . 'assets/app-assets/vendors/js/tables/datatable/dataTables.rowReorder.min.js"></script>' . "\n";
$include_res_footer .= "";

ob_start();
    include 'personnel_liste-script.php';
    include 'personnel_info_modal-script.php';
    include 'personnel_info_modal.php';
$include_footer_script = ob_get_clean();


$table_header = "
                    <tr>
                        <th style=\"width: 5px;\">N°</th>
                        <th class=\"word-wrap;\">Nom des enseignants</th>
                        <th>Fonction</th>
                        <th>Téléphone</th>
                        <th style=\"width: 5px;\">Action</th>
                    </tr>
";
?>
<!--
    ******  VARIABLES *****

    --- $title

-->

<div class="app-content content">
    <div class="content-wrapper">

        <div class="content-header row">
            <div class="content-header-left col-md-8 col-12 mb-2 breadcrumb-new">
                <h3 class="content-header-title mb-0 d-inline-block">Gestion du personnel</h3>
                <div class="row breadcrumbs-top d-inline-block">
                    <div class="breadcrumb-wrapper col-12">
                        <ol class="breadcrumb">
                            <li class="breadcrumb-item"><a href="<?= URL::link('accueil') ?>">Accueil</a>
                            </li>
                            <li class="breadcrumb-item"><a href="<?= URL::link('personnel_accueil') ?>">Personnel</a>
                            </li>
                            <li class="breadcrumb-item"><a href="#">En service</a>
                            </li>

                        </ol>
                    </div>
                </div>
            </div>
            <div class="content-header-right col-md-4 col-12">
                <div class="btn-group float-md-right">
                    <button class="btn btn-info dropdown-toggle" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="icon-settings mr-1"></i>Action</button>
                    <div class="dropdown-menu arrow"><a class="dropdown-item" href="#"><i class="fa fa-calendar mr-1"></i> Calender</a><a class="dropdown-item" href="#"><i class="fa fa-cart-plus mr-1"></i> Cart</a><a class="dropdown-item" href="#"><i class="fa fa-life-ring mr-1"></i> Support</a>
                        <div class="dropdown-divider"></div><a class="dropdown-item" href="#"><i class="fa fa-cog mr-1"></i> Settings</a>
                    </div>
                </div>
            </div>
        </div>

        <div class="content-detached content-right">
            <div class="content-body">
                <section class="row">
                    <div class="col-12">
                        <div class="card">
                            <div class="card-header">
                                <div class="d-flex">
                                    <div class="p-0  col-md-3 mr-auto ">
                                        <h4 class="card-title" id="heading-prev-next">Enregistrement personnel</h4><small class="text-muted">Consultation, modification et suppression du personnel.</small>
                                    </div>

                                    <div class="p-0 mr-1 ">
                                        <fieldset class="input-group">
                                            <!-- <div class="input-group-prepend">
                            <span class="input-group-text">L &nbsp; <span class="fa fa-calendar"></span></span>
                            </div> -->

                                            <!-- <small class="text-muted">Allows you to provide.</small> -->
                                        </fieldset>
                                    </div>

                                    <div class="p-0   ">
                                        <span class="dropdown">
                                            <button disabled class="btn btn-info dropdown-toggle" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="icon-settings mr-1"></i>Rapport</button>
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
                                        <span id='resume_filtre'> listes des enseignants.</span>
                                    </div>
                                </div>
                            </div>

                            <div class="card-content collapse show" >
                                <div class="card-body">
                                    <!-- Task List table -->
                                    <div class="table-responsive-sm" >
                                        <table id="table-personnel"  class="table table-white-space table-bordered  table-sm" style="width: 100%;">

                                        <!-- <table id="table-personnel" class="table table-white-space table-bordered row-grouping display no-wrap icheck table-middle"> -->
                                            <thead> <?= $table_header ?> </thead>
                                            <tbody> </tbody>
                                            <tfoot> <?= $table_header ?> </tfoot>
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
                            <h4 class="card-title">Liste de fonctions</h4>
                            <div class="heading-elements">
                                <ul class="list-inline mb-0">
                                    <li><a data-action="collapse"><i class="ft-plus"></i></a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="card-content">
                            <div class="card-body">
                                <div id="menu" class="navigation navigation-main">
                                    <div class="list-group">
                                        <a href="<?= "#"; ?>" class="list-group-item active"> Voir tout</a>
                                        <?php foreach ($personnels as $item) { ?>
                                            <a href="#" id="ID_<?= $item['type_personnel_id'] ?>" class="list-group-item" data-toggle="collapse" data-target="#ID_<?= $item['type_personnel_id'] ?>" data-parent="#menu"><?= $item['type_personnel']; ?> <span class="badge  badge-pill bg-<?= Helpers::getRandromBootstrapColor() ?> float-right mr-2 badge-glow"><?= count($item['personnels']) ?></span></a>
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