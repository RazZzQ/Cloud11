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
        
        function createRecord($conn) {
            $sql = "INSERT INTO login (id, usuario, password, created_at, created_by, modified_at, modified_by) VALUES (1233, 'Wasaaaa', 325, 14, 123, 12, 41)";
            
            if ($conn->query($sql) === TRUE) {
                echo "Nuevo Wasaaaa incluido";
            } else {
                echo "Error: " . $sql . "<br>" . $conn->error;
            }
        }
        // Función para leer los registros
        function readRecords($conn) {
            $sql = "SELECT id, usuario, password, created_at, created_by, modified_at, modified_by FROM login";
            $result = $conn->query($sql);

            if ($result->num_rows > 0) {
                while($row = $result->fetch_assoc()) {
                    echo "ID: " . $row["id"]. " - Usuario: " . $row["usuario"]. " - Password: " . $row["password"]. "<br>";
                }
            } else {
                echo "0 resultados";
            }
        }

        // Función para actualizar un registro
        function updateRecord($conn, $id) {
            $sql = "UPDATE login SET usuario='WasaaInfiltrado', password='TUmamatepega123456' WHERE id=$id";
            
            if ($conn->query($sql) === TRUE) {
                echo "Registro actualizado exitosamente";
            } else {
                echo "Error actualizando el registro: " . $conn->error;
            }
        }

        // Función para eliminar un registro
        function deleteRecord($conn, $id) {
            $sql = "DELETE FROM login WHERE id=$id";
            
            if ($conn->query($sql) === TRUE) {
                echo "Registro eliminado exitosamente";
            } else {
                echo "Error eliminando el registro: " . $conn->error;
            }
        }

        // Llamada a las funciones CRUD según sea necesario
        if ($_SERVER['REQUEST_METHOD'] == 'POST') {
            if (isset($_POST['create'])) {
                createRecord($conn);
            } elseif (isset($_POST['read'])) {
                readRecords($conn);
            } elseif (isset($_POST['update'])) {
                $id = $_POST['id'];
                updateRecord($conn, $id);
            } elseif (isset($_POST['delete'])) {
                $id = $_POST['id'];
                deleteRecord($conn, $id);
            }
        }
        
        $conn->close();
        ?>
        <form method="post">
            <button type="submit" name="create">Crear</button>
            <button type="submit" name="read">Leer</button>
            <input type="number" name="id" placeholder="ID para actualizar o eliminar">
            <button type="submit" name="update">Actualizar</button>
            <button type="submit" name="delete">Eliminar</button>
        </form>
    </body>
</html>