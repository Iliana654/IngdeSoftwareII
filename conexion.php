<?php
class Conexion {
    public function ConexionBD() {
        $host = 'IlianaZuniga\MSSQLSERVER02'; // Nombre de la instancia de SQL Server
        $user = 'user_iliana';
        $password = 'iliana122005';
        $db = 'SistemaCitasMedicas';

        try {
            $conexion = new PDO("sqlsrv:Server=$host;Database=$db", $user, $password);
            // Es recomendable quitar el echo de depuración en producción
            echo "Conexión exitosa";
            return $conexion;
        }
        catch(PDOException $e) {
            echo "Error: " . $e->getMessage();
            echo "Error en la conexión";
        }
    }
}
?>
