<!-- BARRE DE NAVIGATION -->
<nav class="header-navbar navbar-expand-md navbar navbar-with-menu fixed-top navbar-light navbar-shadow">
    <div class="navbar-wrapper">
        <div class="navbar-header">
            <ul class="nav navbar-nav flex-row">
                <li class="nav-item mobile-menu d-md-none mr-auto">
                    <a class="nav-link nav-menu-main menu-toggle hidden-xs" href="">
                        <i class="ft-menu font-large-1"></i>
                    </a>
                </li>
                <li class="nav-item">
                    <a class="navbar-brand" href=""><img class="brand-logo" alt="robust admin logo" src="app-assets/images/logo/logo-dark-sm.png">
                        <h3 class="brand-text">Les comelines</h3>
                    </a>
                </li>
                <li class="nav-item d-md-none">
                    <a class="nav-link open-navbar-container" data-toggle="collapse" data-target="#navbar-mobile">
                        <i class="fa fa-ellipsis-v"></i>
                    </a>
                </li>
            </ul>
        </div>

        <div class="navbar-container content">
            <div class="collapse navbar-collapse" id="navbar-mobile">
                <ul class="nav navbar-nav mr-auto float-left">
                    <li class="nav-item d-none d-md-block">
                        <a class="nav-link nav-menu-main menu-toggle hidden-xs" href="">
                            <i class="ft-menu"></i>
                        </a>
                    </li>

                    <li class="nav-item d-none d-md-block">
                        <fieldset class="form-group position-relative  has-icon-left mt-1 mb-0">
                            <input type="search" name="recherche" placeholder="Recherche" class="form-control">
                            <div class="form-control-position">
                                <i class="ficon ft-search"></i>
                            </div>
                        </fieldset>
                    </li>
                </ul>

                <ul class="nav navbar-nav float-right">
                    <li class="dropdown dropdown-notification nav-item">
                        <a class="nav-link nav-link-label" href="" data-toggle="dropdown">
                            <i class="ficon ft-bell"></i>
                            <span class="badge badge-pill badge-default badge-danger badge-default badge-up">3</span>
                        </a>

                        <ul class="dropdown-menu dropdown-menu-media dropdown-menu-right">
                            <li class="dropdown-menu-header">
                                <h6 class="dropdown-header m-0">
                                    <span class="grey darken-2">Messages</span>
                                </h6>
                                <span class="notification-tag badge badge-default badge-danger float-right m-0">3 nouveaux</span>
                            </li>

                            <li class="scrollable-container media-list w-100">
                                <a href="">
                                    <div class="media">
                                        <div class="media-left">
												<span class="avatar avatar-sm avatar-online rounded-circle">
													<img src="app-assets/images/portrait/small/avatar-s-1.png" alt="avatar">
													<i></i>
												</span>
                                        </div>

                                        <div class="media-body">
                                            <h6 class="media-heading">Stéphane KAMGA</h6>
                                            <p class="notification-text font-small-3 text-muted">Bientôt la fin d'année...</p>
                                            <small>
                                                <time class="media-meta text-muted" datetime="2020-06-11T18:29:20+08:00">Aujourd'hui</time>
                                            </small>
                                        </div>
                                    </div>
                                </a>
                                <a href="">
                                    <div class="media">
                                        <div class="media-left">
												<span class="avatar avatar-sm avatar-away rounded-circle">
													<img src="app-assets/images/portrait/small/avatar-s-1.png" alt="avatar">
													<i></i>
												</span>
                                        </div>

                                        <div class="media-body">
                                            <h6 class="media-heading">Didier FOTSO</h6>
                                            <p class="notification-text font-small-3 text-muted">Le trimestre dernier était ...</p><small>
                                                <time class="media-meta text-muted" datetime="2020-06-11T18:29:20+08:00">Mois dernier</time></small>
                                        </div>
                                    </div>
                                </a>
                            </li>

                            <li class="dropdown-menu-footer">
                                <a class="dropdown-item text-muted text-center" href="">Lire tout...</a>
                            </li>
                        </ul>
                    </li>

                    <li class="dropdown dropdown-user nav-item">
                        <a class="dropdown-toggle nav-link dropdown-user-link" href="#" data-toggle="dropdown">
								<span class="avatar avatar-online">
									<img src="app-assets/images/portrait/small/fff.png" alt="avatar">
									<i></i>
								</span>
                            <span class="user-name">Kakambi Franck</span>
                        </a>

                        <div class="dropdown-menu dropdown-menu-right">
                            <a class="dropdown-item" href="">
                                <i class="ft-user"></i>&nbsp;Mon compte
                            </a>

                            <div class="dropdown-divider"></div>

                            <a class="dropdown-item" href="login.html">
                                <i class="ft-power"></i>&nbsp;Déconnexion
                            </a>
                        </div>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</nav>

<div class="main-menu menu-fixed menu-light bg-warningcreated menu-accordion menu-shadow" data-scroll-to-active="true">
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