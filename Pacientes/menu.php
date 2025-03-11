<aside class="menu-lateral" id="menuLateral">
    <ul>
        <li><a href="index.php">Inicio</a></li>
        <li><a href="reserva.php">Reservar Cita</a></li>
        <li><a href="especialidades.php">Especialidades</a></li>
        <li><a href="medicos.php">Medicos</a></li>
        <li><a href="../cerrar-sesion.php">Cerrar Sesion</a></li>
        <li><a href="#">Financiamientos</a></li>
    </ul>
</aside>
<script>
    const menuToggle = document.getElementById("menuToggle");
    const menuLateral = document.getElementById("menuLateral");

    menuToggle.addEventListener("click", () => {
        menuLateral.classList.toggle("activo");
    });
</script>