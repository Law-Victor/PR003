<?php
    // functie: formulier en database insert Kroeg
    // auteur: Victor

    echo "<h1>Insert Bestelling</h1>";

    require_once('functions.php');
	 
    // Test of er op de insert-knop is gedrukt 
    if(isset($_POST) && isset($_POST['btn_ins'])){

        // test of insert gelukt is
        if(insertRecord($_POST) == true){
            echo "<script>alert('Bestelling is toegevoegd')</script>";
        } else {
            echo '<script>alert("Bestelling is NIET toegevoegd")</script>';
        }
    }
?>
<html>
    <body>
        <form method="post">

        <label for="id_klant">Klant:</label>
        <input type="text" id="id_klant" name="id_klant" required><br>

        <label for="id_product">Product:</label>
        <input type="text" id="id_product" name="id_product" required><br>

        <label for="quantity">Quantity:</label>
        <input type="number" id="quantity" name="quantity" required><br>

        <label for="datum">Datum:</label>
        <input type="date" id="datum" name="datum" required><br>

        <input type="submit" name="btn_ins" value="Insert">
        </form>
        
        <br><br>
        <a href='index.php'>Home</a>
    </body>
</html>
