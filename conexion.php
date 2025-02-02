<?php

class Conexion{

    public function ConexionBD(){
    $host='IlianaZuniga\MSSQLSERVER02';//aquí pone nombre que sale en SQL Server Management Studio
    $user='user_iliana';
    $password='iliana122005'; //contraseña con la que se mete a sql
    $db='SistemaCitasMedicas';

    try{
        $conexion = new PDO("sqlsrv:Server=$host;Database=$db",$user,$password);
        echo "Conexión exitosa";
        return $conexion;
    }
    catch(PDOException $e){
        echo "Error: ".$e->getMessage();
        echo "Error en la conexión";
    }
    }
}
?>