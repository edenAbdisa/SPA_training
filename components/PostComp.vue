<template>
    <div class="container">
        <div class="container__card">
            <div class="container__card__user-ID">
                <span>User ID: {{ userID }}</span>
                <div class="container__card__content__buttons">
                    <div class="fab" @click="show = !show" v-if="show">
                        <span class="edit"></span>
                    </div>
                    <div class="fab " @click="$emit('deleteItem')" v-if="show">
                        <span class="delete"></span>
                    </div>
                    <div class="fab " @click="show = !show" v-if="!show">
                        <span class="close"></span>
                    </div>
                </div>
            </div>
            <div class="container__card__content" v-if="show">
                <h3 class="container__card__content__title">{{ capitalized(title) }}</h3>
                <p class="container__card__content__body">{{ capitalized(body) }}</p>
            </div>
            <form class="container__card__edit-form" v-else>
                <input class="container__card__edit-form__title" v-model="titleUpdated"
                    :placeholder=capitalized(title) />
                <textarea class="container__card__edit-form__body" v-model="bodyUpdated"
                    :placeholder=capitalized(body)></textarea>
                <p class="container__card__edit-form_error">{{ this.error }}</p>
                <div class="save" @click="edit(id, index)">Save</div>
            </form>
        </div>
    </div>
</template>
<script>
import axios from 'axios'

export default {
    name: 'PostComp',
    data: () => ({
        show: true,
        error: "",
        titleUpdated: "",
        bodyUpdated: ""
    }),
    props: {
        id: {
            type: Number
        },
        userID: {
            type: Number
        },
        title: {
            default: '',
            type: String
        },
        body: {
            default: '',
            type: String
        },
        index: {
            type: Number
        }
    },
    methods: {
        edit(id, index) {
            this.$emit('editItem', this.titleUpdated, this.bodyUpdated, id, index)
            axios.put('https://jsonplaceholder.typicode.com/posts/' + id, {
                title: this.titleToBeUpdated,
                body: this.bodyToBeUpdated
            })
                .then((response) => {
                    this.show = true
                }).catch(err => {
                    this.show = true
                    this.error = err;
                });
        },
        capitalized(sentence) {
            const capitalizedFirst = sentence[0].toUpperCase();
            const rest = sentence.slice(1);
            return capitalizedFirst + rest;
        }
    }

}
</script>

<style>
.container__card {
    width: 100%;
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
    background: #1e704f;
    -webkit-transition: -webkit-transform .2s ease-in-out;
    transition: transform .2s ease-in-out;
}

.edit {
    content: url("~assets/icons/white-edit-icon.png");
    padding: 4px 4px;
    width: 40px;
    height: 40px;
}

.delete {
    content: url("~assets/icons/white-delete-icon.png");
    padding: 4px 4px;
    width: 40px;
    height: 40px;
}

.close {
    padding: 4px 4px;
    width: 40px;
    height: 40px;
}

.container__card__edit-form {
    padding: 20px;
    min-height: 200px;
    display: grid;
    gap: 40px;
    width: 100%;
}

.save {
    width: 200px;
    background: #1e704f;
    box-shadow: 0 8px 16px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
    margin: auto;
    text-align: center;
    font-size: 20px;
    color: white;
    border-radius: 5px;

}

.container__card__edit-form__body {
    height: 150px;
}
</style>