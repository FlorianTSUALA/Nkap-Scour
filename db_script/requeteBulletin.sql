 select  
                InfoEleve.libelle_cours as libelle_cours, InfoEleve.nom_personnel as nom_personnel, InfoEleve.prenom_personnel as prenom_personnel, InfoEleve.note as note,
                 InfoEleve.libelle_periode as libelle_periode,InfoEleve.periode_debut as periode_debut, InfoEleve.periode_fin, InfoEleve.nom_eleve as nom_eleve, InfoEleve.prenom_eleve as prenom_eleve,
                 InfoEleve.sexe as sexe, InfoEleve.date_naissance, InfoEleve.lieu_naissance as lieu_naissance,InfoMatiere.libelle_matiere as libelle_matiere,
                 InfoMatiere.libelle_discipline AS libelle_discipline, InfoMatiere.libelle_salle_classe AS libelle_salle_classe    
           from (
              select cours.salle_classe_id as id, cours.libelle as libelle_cours, personnel.nom AS nom_personnel, personnel.prenom AS prenom_personnel, composer.note AS note,
                periode.libelle as libelle_periode, periode.date_debut AS periode_debut, periode.date_fin  AS periode_fin, eleve.nom AS nom_eleve,
                eleve.prenom AS prenom_eleve, eleve.sexe AS sexe, eleve.date_naissance AS date_naissance, eleve.lieu_naissance
                from cours
                left join personnel on cours.personnel_id = personnel.id
                left join composer on composer.cours_id = cours.id
                LEFT JOIN periode on composer.periode_id = periode.id
                LEFT JOIN eleve on composer.eleve_id = eleve.id

            ) InfoEleve,
            
            (
                select  salle_classe.id as id, matiere.libelle AS libelle_matiere, discipline.libelle as libelle_discipline,
                salle_classe.libelle as libelle_salle_classe
                from salle_classe
                left join affectation_classe_matiere on affectation_classe_matiere.classe_id = salle_classe.classe_id
                left join matiere on matiere.id = affectation_classe_matiere.matiere_id
                LEFT JOIN discipline on matiere.discipline_id = discipline.id
                LEFT JOIN parcours on parcours.salle_classe_id = salle_classe.id
                LEFT JOIN annee_scolaire on annee_scolaire.id = salle_classe.id
                
            )  InfoMatiere 
           
            where InfoEleve.id = InfoMatiere.id 