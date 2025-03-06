<?php
include '../conexion.php';

if (isset($_POST['fecha']) && isset($_POST['especialidad'])) {
    $fecha = $_POST['fecha'];  
    $diaSemana = date('l', strtotime($fecha)); 
    $dias_traduccion = [
        'Monday' => 'Lunes',
        'Tuesday' => 'Martes',
        'Wednesday' => 'Miércoles',
        'Thursday' => 'Jueves',
        'Friday' => 'Viernes',
        'Saturday' => 'Sábado',
        'Sunday' => 'Domingo'
    ];
    $diaSemana = $dias_traduccion[$diaSemana];
    $especialidad = $_POST['especialidad'];

    
    $sql = "
        SELECT h.idHorario, h.horaInicio, h.horaFin, b.nombre AS nombreMedico
        FROM HorariosMedicos h
        JOIN Medicos u ON h.idMedico = u.idMedico
        JOIN Usuarios b ON b.idUsuario = u.idUsuario
        JOIN Especialidades e ON e.idEspecialidad = u.idEspecialidad
        WHERE h.diaSemana = :diaSemana AND e.nombreEspecialidad = :especialidad
    ";

    $consulta = $conn->prepare($sql);
    $consulta->bindParam(':diaSemana', $diaSemana);
    $consulta->bindParam(':especialidad', $especialidad);
    $consulta->execute();
    $horarios = $consulta->fetchAll(PDO::FETCH_ASSOC);

    if (!empty($horarios)) {
        foreach ($horarios as $horario) {
            echo "<li>{$horario['horaInicio']} - {$horario['horaFin']} - Médico: {$horario['nombreMedico']}</li>";
        }
    } else {
        $sqlMedicos = "SELECT * FROM Medicos WHERE idEspecialidad = (SELECT idEspecialidad FROM Especialidades WHERE nombreEspecialidad = :especialidad)";
        $consultaMedicos = $conn->prepare($sqlMedicos);
        $consultaMedicos->bindParam(':especialidad', $especialidad);
        $consultaMedicos->execute();
        $medicos = $consultaMedicos->fetchAll(PDO::FETCH_ASSOC);

        if (empty($medicos)) {
            echo "<li>No hay médicos disponibles para esta especialidad en la fecha seleccionada.</li>";
        } else {
            echo "<li>No hay horarios disponibles para esta fecha.</li>";
        }
    }
}
?>
