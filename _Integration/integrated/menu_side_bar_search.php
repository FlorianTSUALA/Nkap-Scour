<!-- main menu-->
<?php include "_header.php"?>

<div class="main-menu menu-fixed menu-light bg-warning menu-accordion menu-shadow" data-scroll-to-active="true">
    <div class="main-menu-content">
        <ul class="navigation navigation-main bg-warningcreated" id="main-menu-navigation" data-menu="menu-navigation">
            <li class=" nav-item">
                <a href="<?= URL::link('accueil') ?>">
                    <i class="icon-home"></i>
                    <span class="menu-title" data-i18n="">Accueil</span>
                </a>
            </li>

            <li class=" nav-item">
                <a href="scolaire.html">
                    <i class="fa fa-graduation-cap"></i>
                    <span class="menu-title" data-i18n="">Scolarite</span>
                </a>

                <ul class="menu-content">
                    <li>
                        <a class="menu-item" href="scolaire.html" data-i18n="nav.starter_kit.1_column">Inscription</a>
                    </li>
                    <li>
                        <a class="menu-item" href="scolaire.html" data-i18n="nav.starter_kit.2_columns">Versement</a>
                    </li>
                    <li>
                        <a class="menu-item" href="scolaire.html" data-i18n="nav.starter_kit.3_columns">Elèves Inscrits</a>
                    </li>
                    <li>
                        <a class="menu-item" href="scolaire.html" data-i18n="nav.starter_kit.4_columns">Gestion des Classes</a>
                    </li>
                </ul>
            </li>

            <li class=" nav-item">
                <a href="">
                    <i class="icon-calendar"></i>
                    <span class="menu-title" data-i18n="">Emploi de temps</span>
                </a>
                <ul class="menu-content">

                </ul>
            </li>

            <li class=" nav-item">
                <a href="">
                    <i class="fa fa-book"></i>
                    <span class="menu-title" data-i18n="">Bibliothèque</span>
                </a>

                <ul class="menu-content">
                    <li>
                        <a class="menu-item" href="" data-i18n="nav.starter_kit.1_column">Emprunt</a>
                    </li>
                    <li>
                        <a class="menu-item" href="" data-i18n="nav.starter_kit.2_columns">Restitution</a>
                    </li>
                    <li>
                        <a class="menu-item" href="" data-i18n="nav.starter_kit.3_column">Enregistrement Livre</a>
                    </li>
                    <li>
                        <a class="menu-item" href="" data-i18n="nav.starter_kit.4_columns">Historique</a>
                    </li>
                </ul>
            </li>

            <li class=" nav-item">
                <a href="">
                    <i class="icon-notebook"></i>
                    <span class="menu-title" data-i18n="">Bulletin</span>
                </a>

                <ul class="menu-content">
                    <li>
                        <a class="menu-item" href="" data-i18n="nav.starter_kit.1_column">Générer Bulletin</a>
                    </li>
                    <li>
                        <a class="menu-item" href="" data-i18n="nav.starter_kit.2_columns">Enregistrer Note</a>
                    </li>
                    <li>
                        <a class="menu-item" href="" data-i18n="nav.starter_kit.3_column">Fiche de Note</a>
                    </li>
                    <li>
                        <a class="menu-item" href="" data-i18n="nav.starter_kit.4_columns">Mofifier Note</a>
                    </li>
                    <li>
                        <a class="menu-item" href="" data-i18n="nav.starter_kit.4_columns">Consulter Note</a>
                    </li>
                </ul>
            </li>

            <li class=" nav-item">
                <a href="">
                    <i class="fa fa-cutlery"></i>
                    <span class="menu-title" data-i18n="">Cantine</span>
                </a>

                <ul class="menu-content">
                    <li>
                        <a class="menu-item" href="" data-i18n="nav.starter_kit.1_column">Abonnement </a>
                    </li>
                    <li>
                        <a class="menu-item" href="" data-i18n="nav.starter_kit.2_columns">Enregistrement des Menus</a>
                    </li>
                    <li>
                        <a class="menu-item" href="" data-i18n="nav.starter_kit.3_column">Liste des Abonnées </a>
                    </li>
                    <li>
                        <a class="menu-item" href="" data-i18n="nav.starter_kit.4_columns">Enregistrement des Consommations</a>
                    </li>
                </ul>
            </li>

            <li class=" nav-item">
                <a href="">
                    <i class="fa fa-trophy"></i>
                    <span class="menu-title" data-i18n="">Club</span>
                </a>

                <ul class="menu-content">
                    <li>
                        <a class="menu-item" href="" data-i18n="nav.starter_kit.1_column">Abonnement</a>
                    </li>
                    <li>
                        <a class="menu-item" href="" data-i18n="nav.starter_kit.2_columns">Création Activités</a>
                    </li>

                </ul>
            </li>

            <li class=" nav-item">
                <a href="">
                    <i class="fa fa-users"></i>
                    <span class="menu-title" data-i18n="">Personnel</span>
                </a>

                <ul class="menu-content">
                    <li>
                        <a class="menu-item" href="" data-i18n="nav.starter_kit.1_column">Enregistrement Personnel</a>
                    </li>

                </ul>
            </li>

            <li class=" nav-item">
                <a href="">
                    <i class="fa fa-graduation-cap"></i>
                    <span class="menu-title" data-i18n="">Enseignement</span>
                </a>

                <ul class="menu-content">
                    <li>
                        <a class="menu-item" href="" data-i18n="nav.starter_kit.1_column">Affectation Matière-Classe</a>
                    </li>
                    <li>
                        <a class="menu-item" href="" data-i18n="nav.starter_kit.1_column">Enseignant-Matière-Classe</a>
                    </li>

                </ul>
            </li>

            <li class=" nav-item">
                <a href="">
                    <i class="ft-search"></i>
                    <span class="menu-title" data-i18n="">Aperçus</span>
                </a>

                <ul class="menu-content">
                    <li>
                        <a class="menu-item" href="" data-i18n="nav.starter_kit.1_column">Paiement Salaire</a>
                    </li>
                    <li>
                        <a class="menu-item" href="" data-i18n="nav.starter_kit.2_columns">Enregistrement Dépense</a>
                    </li>
                    <li>

                    <li class=" nav-item">
                        <a href="">
                            <i class="ft-search"></i>
                            <span class="menu-title" data-i18n="">Etat Paiement</span>
                        </a>

                        <ul class="menu-content">
                            <li>
                                <a class="menu-item" href="" data-i18n="nav.starter_kit.1_column">Versement Scolarité</a>
                            </li>
                            <li>
                                <a class="menu-item" href="" data-i18n="nav.starter_kit.2_columns">Versement Activité</a>
                            </li>
                            <li>
                                <a class="menu-item" href="" data-i18n="nav.starter_kit.3_columns">Versement Cantine</a>
                            </li>

                        </ul>
                    </li>
                </ul>
            </li>
            <li class=" nav-item">
                <a href="">
                    <i class="fa fa-cog"></i>
                    <span class="menu-title" data-i18n="">Paramètrage</span>
                </a>

                <ul class="menu-content">
                    <li>
                        <a class="menu-item" href="" data-i18n="nav.starter_kit.1_column">Versement Scolarité</a>
                    </li>
                </ul>
            </li>
        </ul>
    </div>
</div>
<!-- / main menu-->

<?php include "_footer.php"?>