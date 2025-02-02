<?php
// Incluir el archivo de conexión
include 'conexion.php';

// Crear una instancia de la clase Conexion
$conexionObj = new Conexion();
$pdo = $conexionObj->ConexionBD();

if ($pdo) {
    try {
        // Consulta para obtener los usuarios
        $sql = "SELECT idUsuario, nombre, correo FROM Usuarios";
        $stmt = $pdo->prepare($sql);
        $stmt->execute();

        // Obtener los resultados
        $usuarios = $stmt->fetchAll(PDO::FETCH_ASSOC);
    } catch (PDOException $e) {
        echo "Error al ejecutar la consulta: " . $e->getMessage();
        $usuarios = [];
    }
} else {
    $usuarios = [];
}
?>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tabla de Usuarios</title>
    <style>
        table {
            width: 100%;
            border-collapse: collapse;
        }
        th, td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }
        th {
            background-color: #f4f4f4;
        }
        tr:hover {
            background-color: #f9f9f9;
        }
    </style>
</head>
<body>
    <h1>Lista de Usuarios</h1>
    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>Nombre</th>
                <th>Correo</th>
            </tr>
        </thead>
        <tbody>
            <?php if (count($usuarios) > 0): ?>
                <?php foreach ($usuarios as $usuario): ?>
                    <tr>
                        <td><?php echo htmlspecialchars($usuario['idUsuario']); ?></td>
                        <td><?php echo htmlspecialchars($usuario['nombre']); ?></td>
                        <td><?php echo htmlspecialchars($usuario['correo']); ?></td>
                    </tr>
                <?php endforeach; ?>
            <?php else: ?>
                <tr>
                    <td colspan="3">No se encontraron usuarios.</td>
                </tr>
            <?php endif; ?>
        </tbody>
    </table>
</body>
</html>