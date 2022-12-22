<template>
    <footer class="footer">
        <p class="footer__text__copyright">
            Copyright ©2023
        </p>
    </footer>
</template>
<script>
export default {
    name: 'FooterComp'

}
</script>

<style>
.footer {
    background-color: #a0a5a3;
    height: 2rem;
    position: relative;
    bottom: 0;
    width: 100%;
}

.footer__text__copyright {
    font-size: 15px;
    margin: auto;
    width: fit-content;
}
</style>