<?php session_start(); ?>
<?php require_once(".." . DIRECTORY_SEPARATOR .".." . DIRECTORY_SEPARATOR . "ressources" . DIRECTORY_SEPARATOR . "config" . DIRECTORY_SEPARATOR . "kgs_invariants.php"); ?>
<?php require_once(KGS_COMPONENTS_DIRECTORY . DIRECTORY_SEPARATOR ."kgs_magic_tools.php"); ?>
<?php require_once(KGS_MODELS_DIRECTORY . DIRECTORY_SEPARATOR ."kgs.table.php"); ?>
<?php require_once(".." . DIRECTORY_SEPARATOR ."controller_common.php"); ?>
<?php require_once("datatableModel.php"); ?>


<script>
    function getRandromBootstrapColor(){
        const arrX = ["warning", "info","success", "danger", "primary", "light", "dark"];
        return arrX[Math.floor(Math.random() * arrX.length)];
    }
</script>


<?php
    /**
     * KGS ~ SECURITY TIMELESS
     */
    $_SESSION[Session::AVOID_ACTION] = false;
    $_SESSION[Session::PAGE_ACTION] = Page::Proprietaire_TRANSACTION;
    $arrayKGStimeSession = [Session::CONNECTED];

    timeoutSession($arrayKGStimeSession, Page::Proprietaire_TRANSACTION);
?>

<?php
if(!empty($_SESSION[Session::CONNECTED]))
{
    //TABLE
    $table_service = getTableName(Table::SERVICE);
    $table_transaction_assurance = getTableName(Table::TRANSACTION_ASSURANCE);
    $table_transaction_commerciale = getTableName(Table::TRANSACTION_COMMERCIALE);
    $table_transaction_education = getTableName(Table::TRANSACTION_EDUCATION);
    $table_transaction_financiere = getTableName(Table::TRANSACTION_FINANCIERE);
    $table_point_marchand = getTableName(Table::POINT_MARCHAND);
    $table_service = getTableName(Table::SERVICE);
    $table_compte_connexion = getTableName(Table::COMPTE);

    $page_dashboard = $_SESSION[Session::PAGE_ACTION];
    $account = $_SESSION[Session::ACCOUNT];
    $username = $_SESSION[Session::CONNECTED];
    $title = "Tableau de bord";

    ?>
    <?php require_once(KGS_MODELS_DIRECTORY . DIRECTORY_SEPARATOR .Model::DB_CONNEXION); ?>
    <?php require_once(KGS_MODELS_DIRECTORY . DIRECTORY_SEPARATOR .Model::DB_DELETE); ?>
    <?php require_once(KGS_MODELS_DIRECTORY . DIRECTORY_SEPARATOR .Model::DB_FIND); ?>
    <?php
    $compte_id = $_SESSION[Session::USER_ID_CONNECTED];
    $clause = array();
    array_push($clause, makeClause(PointMarchand::COMPTE_ID, Query::OPERATOR_EQUAL, $compte_id));
    array_push($clause, makeClause(PointMarchand::VISIBILITE, Query::OPERATOR_EQUAL, UN));
    $point_marchand = getAllByFilter($table_point_marchand, $clause, SELECT_ALL, PointMarchand::DATE_CREATION . " DESC");
    $service_code = $point_marchand->service_code;
    /**
     * KGS ~ GET PAGINATION VARIABLE
     */
    $nbre_total_transaction = 0;
    $table_transaction = "";
    //ToDo use associative array to assoc hearder_columns to columns
    // And then whrite one function who return each of them
    $header_columns =  "<th>Reférence</th>
                        <th>Motif</th>
                        <th>Montant</th>
                        <th>Remise</th>
                        <th>Date</th>";
                        //<th>Téléphone</th>
    $columns = '{ "data": "Ref" },
                { "data": "Motif" },
                { "data": "Montant" },
                { "data": "Remise" },
                { "data": "DateP" },';
    //                { "data": "TEL" },

    switch ($service_code)
    {
        case Service::CODE_ASSURANCE:
            $table_transaction = $table_transaction_assurance;
            $header_columns .= "<th>Police Assurance</th>";
            $columns .= '{ "data": "'. DatatableAtribute::TRAN_NUM_POL_ASS.'" },';
        break;

        case Service::CODE_COMMERCIAL:
            $table_transaction = $table_transaction_commerciale;
            $header_columns .= "";
            $columns .= '';
        break;

        case Service::CODE_EDUCATION:
            $table_transaction = $table_transaction_education;
            $header_columns .= "<th>Nom Eleve</th>";
            $header_columns .= "<th>Nom Tuteur</th>";
            $header_columns .= "<th>Prenom Eleve</th>";
            $header_columns .= "<th>Prenom tuteur</th>";
            $header_columns .= "<th>Periode</th>";
            $header_columns .= "<th>Année Academique</th>";
            $header_columns .= "<th>Matricule</th>";
            $header_columns .= "<th>Classe</th>";
            $columns .= '{ "data": "'. DatatableAtribute::TRAN_NOM_ELEVE.'" },';
            $columns .= '{ "data": "'. DatatableAtribute::TRAN_NOMTUTEUR.'" },';
            $columns .= '{ "data": "'. DatatableAtribute::TRAN_PRENOM_ELEVE.'" },';
            $columns .= '{ "data": "'. DatatableAtribute::TRAN_PRENOM_TUTEUR.'" },';
            $columns .= '{ "data": "'. DatatableAtribute::TRAN_PERIODE.'" },';
            $columns .= '{ "data": "'. DatatableAtribute::TRAN_ANNEE_ACADEMIQUE.'" },';
            $columns .= '{ "data": "'. DatatableAtribute::TRAN_MATRICULE.'" },';
            $columns .= '{ "data": "'. DatatableAtribute::TRAN_CLASSE.'" },';

        break;

        case Service::CODE_FINANCE:
            $table_transaction = $table_transaction_financiere;
            $header_columns .= "<th>Numero Compte</th>";
            $columns .= '{ "data": "'. DatatableAtribute::TRAN_NUM_COMP.'" },';

            $header_columns .= "<th>Intitulé Compte</th>";
            $columns .= '{ "data": "'. DatatableAtribute::TRAN_INT_COMP.'" },';
        break;

        default:
            setKGSLog($account, $username, "Une erreur est survenue dans l'enregistrement des paiements.");
    }

    $clause = array();
    array_push($clause, makeClause(Transaction::POINT_MARCHAND_ID, Query::OPERATOR_EQUAL, $point_marchand->id));
    array_push($clause, makeClause(Transaction::VISIBILITE, Query::OPERATOR_EQUAL, UN));

    $nbre_total_transaction = getValueByFucntionSQL($table_transaction , $clause);

    ?>


    <?php require_once(KGS_COMPONENTS_DIRECTORY . DIRECTORY_SEPARATOR ."_header.begin.php"); ?>
    <?php require_once(KGS_COMPONENTS_DIRECTORY . DIRECTORY_SEPARATOR ."_datatable_css.php"); ?>
    <?php require_once(KGS_COMPONENTS_DIRECTORY . DIRECTORY_SEPARATOR ."_header.end.php"); ?>

    <body class="text-left">

    <?php require_once(KGS_COMPONENTS_DIRECTORY . DIRECTORY_SEPARATOR . "_message_flash.php"); ?>

    <?php require_once(KGS_COMPONENTS_BACKEND_DIRECTORY . DIRECTORY_SEPARATOR . "_backend_loadscreen.html"); ?>

    <div class="app-admin-wrap layout-sidebar-large clearfix">
        <?php require_once(KGS_COMPONENTS_BACKEND_DIRECTORY . DIRECTORY_SEPARATOR . "_backend_header_menu.php"); ?>

        <?php require_once(KGS_COMPONENTS_BACKEND_DIRECTORY . DIRECTORY_SEPARATOR . "_backend_sidebar_proprietaire.php"); ?>

        <div class="main-content-wrap sidenav-open d-flex flex-column">
            <div class="main-content">
                <?php
                    //LOG SYSTEM
                    $actionlog = " consulte la liste des transactions.";
                    setKGSLog($account, $username,$actionlog);

                    $urlPosition = "Liste des transactions";
                    require_once(KGS_COMPONENTS_BACKEND_DIRECTORY . DIRECTORY_SEPARATOR . "_backend_breadcrumb.php");
                    require_once(KGS_VIEWS_PROPRIETAIRE_DIRECTORY . DIRECTORY_SEPARATOR . $page_dashboard);
                ?>
            </div>
            <?php require_once(KGS_COMPONENTS_BACKEND_DIRECTORY . DIRECTORY_SEPARATOR . "_backend_footer.php"); ?>
        </div>
    </div>

    <?php require_once(KGS_COMPONENTS_DIRECTORY . DIRECTORY_SEPARATOR ."_footer.begin.php"); ?>

    <?php require_once(KGS_COMPONENTS_DIRECTORY . DIRECTORY_SEPARATOR ."_datatable_js.php"); ?>

    <!-- Datatable include required -->
    <?php



    ?>

    <!-- Datatable initialization table -->
    <script type="text/javascript">
        $(document).ready(function() {
            var printCounter = 0;

            // Append a caption to the table before the DataTables initialisation
            $('#tab-trans-pm').append('<caption style="caption-side: bottom">SUMBA REPORT DASHBOARD.</caption>');

            $('#tab-trans-pm').DataTable( {
                "processing": true,
                //"serverSide": true,
                //Server-side processing is useful when working with large data sets (typically >50'000 records) as it means a database engine can be used to perform the sorting etc calculations - operations that modern database engines are highly optimised for, allowing use of DataTables with massive data sets (millions of rows).

               "ajax": " <?php echo KGS_APPS_URL ?>api/transaction/transaction_point_marchand_read_all.php?compte_id=<?php echo $compte_id?>",
                "columns": [  <?php echo $columns ?> ],
                "createdRow": function ( row, data, index ) {
                    if ( data[2] * 1 < 9000 ) {
                        console.log(data[2]);
                        $('td', row).eq(2).addClass('highlight');
                    }
                },
                dom: 'Bfrtip',
                stateSave: true,
                buttons: [
                    //'columnsToggle',
                    {
                        extend: 'colvis',
                        collectionLayout: 'fixed two-column'
                    },
                    'copyHtml5',
                    {
                        extend: 'excel',
                        messageTop: 'Informations sur les transaction point marchand <?php $point_marchand->denomination ?>.',
                        exportOptions: {
                            columns: ':visible'
                        }
                    },
                    {
                        extend: 'pdf',
                        messageBottom: null,
                        exportOptions: {
                            columns: ':visible'
                        }
                    },
                    {
                        extend: 'print',
                        autoPrint: false,
                        messageTop: function () {
                            printCounter++;

                            if ( printCounter === 1 ) {
                                return 'Bien joué !!! Votre premiere impression de document.';
                            }
                            else {
                                return 'ôh, super !!! C\'est la '+printCounter+' imporession.';
                            }
                        },

                        customize: function ( win ) {
                            $(win.document.body)
                                .css( 'font-size', '10pt' )
                                .prepend(
                                    '<img src="<?php echo KGS_APPS_URL . DIRECTORY_SEPARATOR . "ressources" . DIRECTORY_SEPARATOR . "img_pm" . DIRECTORY_SEPARATOR . $point_marchand->logo; ?>" style="position:absolute; top:0; left:0;" />'
                                );

                            $(win.document.body).find( 'table' )
                                .addClass( 'compact' )
                                .css( 'font-size', 'inherit' );
                        },
                        messageBottom: null,
                        exportOptions: {
                            columns: ':visible'
                        }
                    }
                ],
                columnDefs: [ {
                    targets: -1,
                    visible: false
                } ],
                language: {
                    "scrollY": "1000px",
                    "scrollCollapse": true,
                    "scrollX": true,
                    //"lengthMenu": [[10, 25, 50, 100, -1], [10, 25, 50, 100, "Tout"]],
                    "iDisplayLength": -1,
                    "lengthMenu": "Afficher _MENU_ éléments par page",
                    "zeroRecords": "Oups... Aucune transaction depuis votre point marchand",
                    "info": "Page _PAGE_ sur _PAGES_",
                    "infoEmpty": "Aucun enregistrement disponible",
                    "infoFiltered": "(filtre appliquer sur _MAX_ éléments au total du tableau actuel)",
                    "decimal": ",",
                    "thousands": " ",
                    "paginate": {
                        "first": "Premier",
                        "last": "Dernier",
                        "next": "Suiv.",
                        "previous": "Préc."
                    },
                    "search": "Mini-Recherche (sur les éléments visibles ci-dessous)  :",
                    buttons: {
                        colvis: '<i class="fa fa-eye" aria-hidden="true"></i>Visibilité',
                        copy: '<span class="i-Stamp-1">Copiez</span>',
                        print: '<span class="i-Stamp-1">Imprimez</span>',
                        copyTitle: 'Ajouté au presse-papiers',
                            copyKeys: 'Appuyez sur <i>ctrl</i> ou <i>\u2318</i> + <i>C</i> pour copier les données du tableau à votre presse-papiers. <br><br>Pour annuler, cliquez sur ce message ou appuyez sur Echap.',
                            copySuccess: {
                                _: '%d lignes copiées',
                                1: '1 ligne copiée'
                        },
                    }
                },
            });
        } );
    </script>

    <?php require_once(KGS_COMPONENTS_DIRECTORY . DIRECTORY_SEPARATOR ."_footer.end.php"); ?>
    <?php
}
else
{
    setKGSLog("HACKEUR", Log::NO_NAME, "essaye de pertuber notre système.", true);
    session_destroy();
    go_back_to(".");
    die();
}
?>