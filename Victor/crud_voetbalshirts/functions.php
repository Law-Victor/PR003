<?php
// auteur: Victor
// functie: algemene functies tbv hergebruik

include_once "config.php";

 function connectDb(){
    $servername = SERVERNAME;
    $username = USERNAME;
    $password = PASSWORD;
    $dbname = DATABASE;
   
    try {
        $conn = new PDO("mysql:host=$servername;dbname=$dbname", $username, $password);
        // set the PDO error mode to exception
        $conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        $conn->setAttribute(PDO::ATTR_DEFAULT_FETCH_MODE, PDO::FETCH_ASSOC);
        //echo "Connected successfully";
        return $conn;
    } 
    catch(PDOException $e) {
        echo "Connection failed: " . $e->getMessage();
    }

 }

 function crudMain(){

    // Menu-item   insert
    $txt = "
    <h1></h1>
    <nav>
		<a href='insert.php'>Toevoegen nieuwe Bestelling</a>
    </nav><br>";
    echo $txt;

    // Haal alle fietsen record uit de tabel 
    $result = getData(CRUD_TABLE);

    //print table
    printCrudTabel($result);
    
 }

 // selecteer de data uit de opgeven table
 function getData($table){
    // Connect database
    $conn = connectDb();

    // Select data uit de opgegeven table methode query
    // query: is een prepare en execute in 1 zonder placeholders
    // $result = $conn->query("SELECT * FROM $table")->fetchAll();

    // Select data uit de opgegeven table methode prepare
    $sql = "SELECT * FROM $table";
    $query = $conn->prepare($sql);
    $query->execute();
    $result = $query->fetchAll();

    return $result;
 }

 // selecteer de rij van de opgeven id uit de table fietsen
 function getRecord($id_order){
    // Connect database
    $conn = connectDb();

    // Select data uit de opgegeven table methode prepare
    $sql = "SELECT * FROM " . CRUD_TABLE . " WHERE id_order = :id_order";
    $query = $conn->prepare($sql);
    $query->execute([':id_order'=>$id_order]);
    $result = $query->fetch();

    return $result;
 }


// Function 'printCrudTabel' print een HTML-table met data uit $result 
// en een wzg- en -verwijder-knop.
function printCrudTabel($result){
    // Zet de hele table in een variable en print hem 1 keer 
    $table = "<table>";

    // Print header table

    // haal de kolommen uit de eerste rij [0] van het array $result mbv array_keys
    $headers = array_keys($result[0]);
    $table .= "<tr>";
    foreach($headers as $header){
        $table .= "<th>" . $header . "</th>";   
    }
    // Voeg actie kopregel toe
    $table .= "<th colspan=2>Actie</th>";
    $table .= "</th>";

    // print elke rij
    foreach ($result as $row) {
        
        $table .= "<tr>";
        // print elke kolom
        foreach ($row as $cell) {
            $table .= "<td>" . $cell . "</td>";  
        }
        
        // Wijzig knopje
        $table .= "<td>
            <form method='post' action='update.php?id_order=$row[id_order]' >       
                <button>Wzg</button>	 
            </form></td>";

        // Delete knopje
        $table .= "<td>
            <form method='post' action='delete.php?id_order=$row[id_order]' >       
                <button>Verwijder</button>	 
            </form></td>";

        $table .= "</tr>";
    }
    $table.= "</table>";

    echo $table;
}


function updateRecord($row){

    // Maak database connectie
    $conn = connectDb();

    // Maak een query 
    $sql = "UPDATE " . CRUD_TABLE .
    " SET 
        id_klant = :id_klant, 
        id_product = :id_product, 
        quantity = :quantity,
        datum = :datum
    WHERE id_order = :id_order
    ";

    // Prepare query
    $stmt = $conn->prepare($sql);
    // Uitvoeren
    $stmt->execute([
        ':id_klant'=>$row['id_klant'],
        ':id_product'=>$row['id_product'],
        ':quantity'=>$row['quantity'],
        ':datum'=>$row['datum'],
        ':id_order'=>$row['id_order']
    ]);

    // test of database actie is gelukt
    $retVal = ($stmt->rowCount() == 1) ? true : false ;
    return $retVal;
}

function insertRecord($post){
    // Maak database connectie
    $conn = connectDb();

    // Maak een query 
    $sql = "
        INSERT INTO " . CRUD_TABLE . " (id_klant, id_product, quantity, datum)
        VALUES (:id_klant, :id_product, :quantity, :datum) 
    ";

    // Prepare query
    $stmt = $conn->prepare($sql);
    // Uitvoeren
    $stmt->execute([
        ':id_klant'=>$_POST['id_klant'],
        ':id_product'=>$_POST['id_product'],
        ':quantity'=>$_POST['quantity'],
        ':datum'=>$_POST['datum']
    ]);

    
    // test of database actie is gelukt
    $retVal = ($stmt->rowCount() == 1) ? true : false ;
    return $retVal;  
}

function deleteRecord($id_order){

    // Connect database
    $conn = connectDb();
    
    // Maak een query 
    $sql = "
    DELETE FROM " . CRUD_TABLE . 
    " WHERE id_order = :id_order";

    // Prepare query
    $stmt = $conn->prepare($sql);

    // Uitvoeren
    $stmt->execute([
    ':id_order'=>$_GET['id_order']
    ]);

    // test of database actie is gelukt
    $retVal = ($stmt->rowCount() == 1) ? true : false ;
    return $retVal;
}


?>

