<?php
include 'conexion.php';

try {
    $consulta = "SELECT * FROM Especialidades";
    $statement = $conn->prepare($consulta);
    $statement->execute();
    $resultset = $statement->fetchAll();

    if (!$resultset) {
        echo '<option value="">No hay especialidades disponibles</option>';
    } else {
        foreach ($resultset as $especialidad) {
            $isselected = isset($_SESSION['form_data']['idespecialidad']) &&
                $_SESSION['form_data']['idespecialidad'] == $especialidad['idEspecialidad']
                ? 'selected' : '';

            echo '<option value="' . htmlspecialchars($especialidad['idEspecialidad']) . '" ' . $isselected . '>' .
                htmlspecialchars($especialidad['nombreEspecialidad']) . '</option>';
        }
    }
} catch (PDOException $e) {
    echo '<option value="">Error al cargar especialidades</option>';
    error_log("Error en la consulta: " . $e->getMessage()); // Guarda el error en el log del servidor
}
?>