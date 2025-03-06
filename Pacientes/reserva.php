<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>MediCitas - Citas Médicas</title>
    <link rel="stylesheet" href="../css/estilo.css">
    <link rel="stylesheet" href="../css/estilo-admin.css">
    <link rel="stylesheet" href="../css/tabla.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.2.0/fullcalendar.min.css"/>
</head>
<body>
    <?php include 'header.php'; ?>
    <?php include 'menu.php'; ?>

    <main class="contenido">
        <div class="table-container">
            <h2>Selecciona una Especialidad Para Tu Cita</h2>
            <div class="table-responsive">
                <table>
                    <thead>
                        <tr>
                            <th>Nombre</th>
                            <th>Descripción</th>
                            <th>Seleccionar</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php
                        include '../conexion.php';
                        $sql = "SELECT * FROM Especialidades";
                        $consulta = $conn->prepare($sql);
                        $consulta->execute();
                        $especialidades = $consulta->fetchAll(PDO::FETCH_ASSOC);
                        foreach ($especialidades as $row) {
                            echo "<tr>";
                            echo "<td>" . $row["nombreEspecialidad"] . "</td>";
                            echo "<td>" . $row["descripcion"] . "</td>";
                            echo '<td><button class="btn-seleccionar" data-especialidad="' . $row["nombreEspecialidad"] . '">Seleccionar</button></td>';
                            echo "</tr>";
                        }
                        ?>
                    </tbody>
                </table>
            </div>
        </div>

        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

        <div class="contenido">                
            <div id="calendario-container" style="display:none;">
                <button id="btn-regresar" class="btn-regresar">Regresar</button>
                <h3>Selecciona una Fecha Para Tu Cita</h3>
                <div id="calendar"></div>
                <div id="horarios-disponibles" style="display:none;">
                    <h3>Horarios Disponibles</h3>
                    <ul id="horarios-list"></ul>
                </div>
            </div>
        </div>
    </main>

    
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.2.0/fullcalendar.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.2.0/locale-all.js"></script>

    <script>
    $(document).ready(function() {
        $(".btn-seleccionar").click(function() {
            var especialidad = $(this).data("especialidad");
            $("#calendario-container").show();
            $("table").hide();
            $('#calendar').fullCalendar({
                locale: 'es',
                selectable: true,
                select: function(startDate, endDate) {
                    var selectedDate = startDate.format("YYYY-MM-DD");
                    loadAvailableHours(selectedDate, especialidad); 
                }
            });
        });
        $("#btn-regresar").click(function() {
            $("#calendario-container").hide();
            $("table").show();

            $('#calendar').fullCalendar('destroy'); 
            $('#calendar').fullCalendar('render');  
        });
    });
    function loadAvailableHours(selectedDate, especialidad) {
        $.ajax({
            url: 'obtenerHorarios.php', 
            method: 'POST',
            data: {
                fecha: selectedDate,
                especialidad: especialidad
            },
            success: function(response) {
                if (response) {
                    $("#horarios-disponibles").show();
                    $("#horarios-list").html(response); 
                } else {
                    $("#horarios-disponibles").hide();
                    alert("No hay horarios disponibles para este día.");
                }
            }
        });
    }
</script>

</body>
</html>