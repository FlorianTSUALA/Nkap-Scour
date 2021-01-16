

<!-- <link rel="stylesheet" type="text/css" href="http://127.0.0.1/nkap-scour/public/assets/app-assets/images/logo/cantineList2.css"> -->
<style type="text/css">
table, th, td {
  border: 0px solid black;
  border-collapse: collapse;
}
th, td {
  padding: 8px;
  text-align: left;    
}
</style>
<page>

<table  style="width:100%">
    <tr>
        <td  rowspan="4"  style="width: 13%"><img src="http://127.0.0.1/nkap-scour/public/assets/app-assets/images/logo/logo-80x80.png"> </td>
        <td style="text-align: left;    width: 22%"><b>Les comelines</b></td>
        <td style="text-align: right;    width: 65%">  <b>REÇU DE VERSEMENT</b> </td>
    </tr>
  
    <tr>
        <td></td>
       
        <td  style="text-align: right;">  <?= $reference ?></td>
    </tr>    
   
    <tr>
        <td>Batterie 4</td>
    </tr>    
    <tr>
        <td>Libreville, Gabon</td>
    </tr>
    <tr>
        <td colspan="3" style="text-align: right;">Solde à payer</td>
    </tr>
    <tr>
        <td colspan="3" style="text-align: right;"><strong class="text-danger" ><?= $solde_paye ?></strong></td>
    </tr> 
    <tr>
        <td colspan="3" style="text-align: right;"> </td>
    </tr> 
    <tr>
        <td colspan="3" style="text-align: right;"> </td>
    </tr> 
    <tr>
        <td colspan="2" style="text-align: left;"><strong class="text-danger" >Facture de</strong></td>
        <td  style="text-align: right;">Date de facturation :<strong class="text-danger" > <?= $date_facturation ?> </strong></td>
    </tr> 
    <tr>
        <td colspan="3" style="text-align: left;">Elève : <strong class="text-danger" > <?= $eleve ?></strong></td>
    </tr> 
    <tr>
        <td colspan="3" style="text-align: left;">Classe : <strong class="text-danger" > <?= $classe ?></strong></td>
    </tr> 
    <tr>
        <td colspan="3" style="text-align: right;"> </td>
    </tr> 
</table>

           
<table cellspacing='0'>
    <colgroup>
        <col style="width: 8%">
        <col style="width: 47%">
        <col style="width: 15%">
        <col style="width: 15%">
        <col style="width: 15%">
    </colgroup>
    <thead>
        <tr>
            <th>Numero</th>
            <th>Object et description</th>
            <th>Montant</th>
            <th>Quantité</th>
            <th>Montant total</th>
        </tr>
    </thead>
    <tbody>

    <?php $i = 1; foreach($items as $item){  ?>
            <tr>   
                <th scope="row"><?= $i++ ?></th>       
                <td> 
                    <p>Periode : <?= $periode ?> </p>  
                    <em class="text-muted"> <?= $resume ?> </em>       
                </td>       
                <td class="text-right"><?= $prix_unitaire ?> Fcfa</td>       
                <td class="text-right"><?= $quantite ?></td>       
                <td class="text-right"><?= $sous_total ?> Fcfa</td>
            </tr>
    <?php } ?>

    </tbody>
    
</table>



<table  style="width:100%">
    <tr>
        <td style="text-align: left;    width: 65%"></td>
        <td style="text-align: left;    width: 15%"></td>
        <td style="text-align: right;    width: 20%"></td>
    </tr>
    <tr>
        <td style="text-align: left;"></td>
        <td style="text-align: left;" colspan="2" >Montant total du versement</td>
    </tr>
    <tr>
        <td style="text-align: left;"></td>
        <td style="text-align: left; padding: 5px 10px 5px 5px;">Sous-Total</td>
        <td style="text-align: right;"><?= $sous_total ?></td>
    </tr>
    <tr>
        <td style="text-align: left;"></td>
        <td style="text-align: left; padding: 5px 10px 5px 5px;">Remise</td>
        <td style="text-align: right;"><?= $remise ?></td>
    </tr>
    <tr>
        <td style="text-align: left;"></td>
        <td style="text-align: left; padding: 5px 10px 5px 5px;">Reste</td>
        <td style="text-align: right;"><?= $reste ?></td>
    </tr>
    <tr>
        <td style="text-align: left;"></td>
        <td style="text-align: left; padding: 5px 10px 5px 5px;">Solde à payer</td>
        <td style="text-align: right;"><?= $solde_paye ?></td>
    </tr>


</table>



<page_footer>
    <table style="width: 100%; border: solid 1px black;">
        <tr>
            <td style="text-align: left;     width: 60%"></td>
            <td style="text-align: center;    width: 40%" colspan="2" >Personne habilitée</td>
        </tr>
        <tr>
            <td style="text-align: left;"></td>
            <td style="text-align: center;" colspan="2" >Charbonnier LaRose</td>
        </tr>
        <tr>
            <td style="text-align: left;"></td>
            <td style="text-align: center;" colspan="2" >Le Sécrétariat</td>
        </tr>
        <tr>
            <td style="text-align: left;"></td>
            <td style="text-align: right;" colspan="2" ></td>
        </tr>

        <tr>
            <td style="text-align: left;"><b>Conditions générales</b></td>
            <td style="text-align: right;" colspan="2" ></td>
        </tr>
        <tr>
            <td style="text-align: left;">Après paiement, votre argent est non-remboursable.</td>
            <td style="text-align: right;" colspan="2" ></td>
        </tr>

        <!-- <tr>
            <td style="text-align: left;    width: 50%">Facture de paiement</td>
            <td style="text-align: right;    width: 50%">page [[page_cu]]/[[page_nb]]</td>
        </tr> -->
    </table>
</page_footer>

</page>