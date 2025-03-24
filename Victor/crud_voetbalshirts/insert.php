<?php
    // functie: formulier en database insert fiets
    // auteur: Vul hier je naam in

    echo "<h1>Insert shirt</h1>";

    require_once('functions.php');
	 
    // Test of er op de insert-knop is gedrukt 
    if(isset($_POST) && isset($_POST['btn_ins'])){

        // test of insert gelukt is
        if(insertRecord($_POST) == true){
            echo "<script>alert('Shirt is toegevoegd')</script>";
        } else {
            echo '<script>alert("Shirt is NIET toegevoegd")</script>';
        }
    }
?>
<html>
    <body>
        <form method="post">

        <label for="merk">Order:</label>
        <input type="text" id="order" name="order" required><br>

        <label for="type">Klant:</label>
        <input type="text" id="klant" name="klant" required><br>

        <label for="prijs">Product:</label>
        <input type="number" id="product" name="product" required><br>

        <label for="prijs">quantity:</label>
        <input type="number" id="quantity" name="quantity" required><br>

        <label for="prijs">Datum:</label>
        <input type="number" id="datum" name="datum" required><br>

        <input type="submit" name="btn_ins" value="Insert">
        </form>
        
        <br><br>
        <a href='index.php'>Home</a>
    </body>
</html>
