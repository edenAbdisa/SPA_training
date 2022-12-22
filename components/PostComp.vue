<template>
    <div class="container">
        <div class="container__card">
            <div class="container__card__user-ID">
                <span>{{ userId }}</span>
                <div class="container__card__content__buttons">
                    <div class="fab edit">&#43;</div>
                    <div class="fab delete">&#43;</div>
                </div>
            </div>
            <div class="container__card__content">
                <h3 class="container__card__content__title">Descrição da funcionalidade deve vir abaixo do título do
                    caso de uso.</h3>
                <p class="container__card__content__body">Mussum ipsum cacilds, vidis litro abertis. Consetis
                    adipiscings elitis. Pra lá ,
                    depois divoltis porris, paradis. Paisis, filhis, espiritis santis. Mé faiz elementum
                    girarzis, nisi eros vermeio, in elementis mé pra quem é amistosis quis leo.</p>
            </div>
        </div>
    </div>
</template>
<script>
export default {
    name: 'PostComp'
}
</script>

<style>
.container__card {
    display: inline-block;
    box-shadow: 0 1px 2px 0 rgba(0, 0, 0, .15);
    margin: 20px;
    position: relative;
    margin-bottom: 50px;
    background-color: #f5f5dc63;
}

.container__card:hover {
    box-shadow: 0 10px 20px rgba(0, 0, 0, 0.19), 0 6px 6px rgba(0, 0, 0, 0.23);
    margin-bottom: 54px;
}

.container__card__user-ID {
    line-height: 38px;
    padding: 20px;
    display: flex;
}

.container__card__content {
    padding: 20px;
    min-height: 200px;
}

.container__card__content__body {
    margin-bottom: 0px;
}

.container__card__content__buttons {
    display: flex;
    position: absolute;
    right: 20px;
    gap: 20px;
}

.fab {
    width: 40px;
    height: 40px;
    border-radius: 50%;
    box-shadow: 0px 2px 6px rgba(0, 0, 0, .3);
    color: #fff;
    font-size: 28px;
    line-height: 28px;
    text-align: center;
    background: #0066A2;
    -webkit-transition: -webkit-transform .2s ease-in-out;
    transition: transform .2s ease-in-out;
}
</style>