<aside class="menu-lateral" id="menuLateral">
    <ul>
        <li><a href="index.php">Inicio</a></li>
        <li><a href="especialidades.php">Especialidades</a></li>
        <li><a href="../login/login.php">Iniciar Sesion</a></li>
        <li><a href="#">Citas</a></li>
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