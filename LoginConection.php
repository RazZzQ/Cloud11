<!DOCTYPE html>
<html>
    <body>
        <h1>Prueba Insana Para Insanos</h1>
        <?php
        $servername = "localhost";
        $username = "root";
        $password = "";
        $dbname = "login";
        
        $conn = new mysqli($servername, $username, $password, $dbname);

        if($conn -> connect_error){
            die("Fallo la conexion: ".$conn->connect_error);
        }
        
        $sql = "INSERT INTO login (id,  usuario, password, created_at, created_by, modified_at, modified_by) VALUES (1321, 'Wasaa', 123, 14, 123, 12, 41)";
        //$sql = "INSERT INTO game (gameid,  userid, score, created_at, created_by, modified_at, modified_by) VALUES (0, 1321, 3412, 14, 123, 12, 41)";

        if($conn->query($sql) == TRUE){
            echo "Nuevo Wasaaaa incluido";
        }else{
            echo "Error: " . $sql . "<br>".$conn ->error;
        }

        $conn->close();
        ?>
    </body>
</html>