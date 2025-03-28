<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>MediCitas - Especialidades</title>
    <link rel="stylesheet" href="../css/estilo.css">
    <link rel="stylesheet" href="../css/estilo-admin.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"/>
    <style>
        .especialidades-container {
            max-width: 800px;
            margin: 60px auto;
            background-color: #f9f9f9;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1);
            padding: 30px;
        }
        .especialidad-item {
            padding: 20px;
            border-bottom: 1px solid #ddd;
            text-align: center;
        }
        .especialidad-item:last-child {
            border-bottom: none;
        }
        .especialidad-item h3 {
            margin: 0;
            color: #333;
            font-size: 1.5em;
        }
        .especialidad-item p {
            margin: 10px 0 0 0;
            color: #555;
            font-size: 1.1em;
        }
        h2 {
            text-align: center;
            color: #444;
            font-size: 2em;
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
    <?php include 'header.php'; ?>

    <main class="contenido">
        <div class="especialidades-container">
            <h2>Especialidades Médicas</h2>

            <?php
            include '../conexion.php';
            $sql = "SELECT DISTINCT nombreEspecialidad, descripcion FROM Especialidades";
            $consulta = $conn->prepare($sql);
            $consulta->execute();
            $especialidades = $consulta->fetchAll(PDO::FETCH_ASSOC);

            foreach ($especialidades as $row) {
                echo '<div class="especialidad-item">';
                echo '<h3>' . htmlspecialchars($row["nombreEspecialidad"]) . '</h3>';
                echo '<p>' . htmlspecialchars($row["descripcion"]) . '</p>';
                echo '</div>';
            }
            ?>

        </div>
    </main>
</body>
</html>