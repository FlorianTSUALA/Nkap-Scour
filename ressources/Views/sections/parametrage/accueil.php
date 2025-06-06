<?php

use Core\Routing\URL;
use App\Helpers\Helpers;


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


// include 'script-component-init.php';
include 'abonnement_liste-script.php';
$include_footer_script = ob_get_clean();
?>
<!--
    ******  VARIABLES *****

    --- $title

-->

    <div class="app-content content bg-warningcreated22">
      <div class="content-wrapper">
        <div class="content-header row">
        </div>
        <div class="content-body"><!-- Sales stats -->
            <div class="row">
                <div class="col-9">
                    <div class="card">
                        <div class="card-content">
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-lg-3 col-sm-12 border-right-blue-grey border-right-lighten-5">
                                        <div class="pb-1">
                                            <div class="clearfix mb-1">
                                                <i class="ft-users font-large-1 blue-grey float-left mt-1"></i>
                                                <span class="font-large-2 text-bold-300 info float-right">5,879</span>
                                            </div>
                                            <div class="clearfix">
                                                <span class="text-muted">Nombre d'élèves</span>
                                                <span class="info float-right"><i class="ft-arrow-up info"></i> 16.89%</span>
                                            </div>
                                        </div>
                                        <div class="progress mb-0" style="height: 7px;">
                                            <div class="progress-bar bg-info" role="progressbar" style="width: 80%" aria-valuenow="80" aria-valuemin="0" aria-valuemax="100"></div>
                                        </div>
                                    </div>
                                    <div class="col-lg-3 col-sm-12 border-right-blue-grey border-right-lighten-5">
                                    <div class="pb-1">
                                        <div class="clearfix mb-1">
                                            <i class="icon-user-following font-large-1 blue-grey float-left mt-1"></i>
                                            <span class="font-large-2 text-bold-300 success float-right">61%</span>
                                        </div>
                                        <div class="clearfix">
                                            <span class="text-muted"> Ayant déja payés </span>
                                            <span class="success float-right"><i class="ft-arrow-down success"></i> 2.24%</span>
                                        </div>
                                    </div>
                                    <div class="progress mb-0" style="height: 7px;">
                                        <div class="progress-bar bg-success" role="progressbar" style="width: 75%" aria-valuenow="75" aria-valuemin="0" aria-valuemax="100"></div>
                                    </div>
                                </div>
                                    <div class="col-lg-3 col-sm-12 border-right-blue-grey border-right-lighten-5">
                                        <div class="pb-1">
                                            <div class="clearfix mb-1">
                                                <i class="icon-user-unfollow font-large-1 blue-grey float-left mt-1"></i>
                                                <span class="font-large-2 text-bold-300 danger float-right">423</span>
                                            </div>
                                            <div class="clearfix">
                                                <span class="text-muted">N'ayant pas payés </span>
                                                <span class="danger float-right"><i class="ft-arrow-up danger"></i> 5.14%</span>
                                            </div>
                                        </div>
                                        <div class="progress mb-0" style="height: 7px;">
                                            <div class="progress-bar bg-danger" role="progressbar" style="width: 45%" aria-valuenow="45" aria-valuemin="0" aria-valuemax="100"></div>
                                        </div>
                                    </div>
                                    
                                    <div class="col-lg-3 col-sm-12">
                                        <div class="pb-1">
                                            <div class="clearfix mb-1">
                                                <i class="icon-calendar font-large-1 blue-grey float-left mt-1"></i>
                                                <span class="font-large-2 text-bold-150 warning float-right">Fév</span>
                                            </div>
                                            <div class="clearfix">
                                                <span class="text-muted">Entrée Total</span>
                                                <span class="warning float-right"><i class="ft-arrow-up warning"></i> 43.84%</span>
                                            </div>
                                        </div>
                                        <div class="progress mb-0" style="height: 7px;">
                                            <div class="progress-bar bg-warning" role="progressbar" style="width: 60%" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="card">
                    <div class="card-header">
                        <h4 class="card-title">Statistique Scolarité</h4>
                        <a class="heading-elements-toggle"><i class="ft-ellipsis-h font-medium-3"></i></a>
                        
                    </div>
                    <div class="card-content collapse show">
                        <div class="card-body">
                            <div id="axis-timezone"></div>
                        </div>
                    </div>
                </div>
                </div>

                <div class="col-3">
                <div class="card">
                    <div class="card-content">
                        <div class="card-body">
                            <div class="row">
                            
                            </div>
                        </div>
                        <div class="card-body">
                                <button type="button" class="btn mb-1  btn-lg btn-block"> Inscription</button>
                                <button type="button" class="btn mb-1  btn-lg btn-block"> Versement</button>
                                <button type="button" class="btn mb-1  btn-lg btn-block"> Elèves Inscrits</button>
                                <button type="button" class="btn mb-1  btn-lg btn-block"> Gestion classes</button>
                            </div>
                    </div>
                </div>
            </div>
            <div  class="row">
            
            </div>
            </div>
        </div>
      </div>
    </div>