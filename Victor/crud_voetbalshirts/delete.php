<?php
// auteur: Victor
// functie: verwijder een Kroeg op basis van de kroegcode
include 'functions.php';

// Haal bier uit de database
if(isset($_GET['id_order'])){

    // test of insert gelukt is
    if(deleteRecord($_GET['id_order']) == true){
        echo '<script>alert("id_order: ' . $_GET['id_order'] . ' is verwijderd")</script>';
        echo "<script> location.replace('index.php'); </script>";
    } else {
        echo '<script>alert("Bestelling is NIET verwijderd")</script>';
    }
}
?>

