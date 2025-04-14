<?php
    // functie: update Kroeg
    // auteur: Victor

    require_once('functions.php');

    // Test of er op de wijzig-knop is gedrukt 
    if(isset($_POST['btn_wzg'])){

        // test of update gelukt is
        if(updateRecord($_POST) == true){
            echo "<script>alert('Bestelling is gewijzigd')</script>";
        } else {
            echo '<script>alert("Bestelling is NIET gewijzigd")</script>';
        }
    }

    // Test of id is meegegeven in de URL
    if(isset($_GET['id_order'])){  
        // Haal alle info van de betreffende id $_GET['id']
        $id_order = $_GET['id_order'];
        $row = getRecord($id_order);
    
?>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="style.css">
  <title>Wijzig Bestelling</title>
</head>
<body>
  <h2>Wijzig Bestelling</h2>
  <form method="post">
    
    <input type="hidden" id="id_order" name="id_order" required value="<?php echo $row['id_order']; ?>"><br>
    <label for="id_klant">Klant:</label>
    <input type="text" id="id_klant" name="id_klant" required value="<?php echo $row['id_klant']; ?>"><br>

    <label for="id_product">Product:</label>
    <input type="text" id="id_product" name="id_product" required value="<?php echo $row['id_product']; ?>"><br>

    <label for="quantity">Quantity:</label>
    <input type="text" id="quantity" name="quantity" required value="<?php echo $row['quantity']; ?>"><br>

    <label for="datum">Datum:</label>
    <input type="text" id="datum" name="datum" required value="<?php echo $row['datum']; ?>"><br>


    <input type="submit" name="btn_wzg" value="Wijzig">
  </form>
  <br><br>
  <a href='index.php'>Home</a>
</body>
</html>

<?php
    } else {
        echo "Geen id opgegeven<br>";
    }
?>