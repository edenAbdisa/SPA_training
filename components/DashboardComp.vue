<template>
    <div class="dashboard container">
        <div>
            <div class="dashboard__button__add" @click="show = !show" v-if="show">
                <span class="btn add"> </span>
            </div>
            <div class="container__card" v-else>
                <span class="btn close" @click="show = !show"> </span>
                <form class="container__card__new-item-form">
                    <input class="container__card__new-item-userid" v-model.number="newItemUserId" type="number"
                        placeholder="Enter user ID" />
                    <input class="container__card__new-item-title" v-model="newItemTitle" placeholder="Title " />
                    <textarea class="container__card__new-item-body" v-model="newItemBody"
                        placeholder="Body"></textarea>
                    <p class="container__card__new-item-error">{{ this.error }}</p>
                    <button class="save" @click="addItem()"
                        :disabled='newItemUserId == 0 || newItemTitle === "" || newItemBody === ""'>Add
                        Item</button>
                </form>
            </div>
        </div>
        <PostComp v-for="(n, index) in users" :key="n.id" :userID="n.userId" :title="n.title" :body="n.body" :id="n.id"
            v-on:deleteItem="deleteItem(n.id, index)" v-on:editItem="editItem" :index="index" />
    </div>
</template>
<script>
import axios from 'axios'
export default {
    name: 'DashboardComp',
    data: () => ({
        users: [],
        show: true,
        newItemUserId: 0,
        newItemTitle: "",
        newItemBody: "",
        error: "All fields are required."

    }),
    methods: {
        fetchItem() {
            axios
                .get('https://jsonplaceholder.typicode.com/posts')
                .then(
                    (response) => {
                        (this.users = response.data)
                        console.log(response.data[0])
                    }
                ).catch(err => {
                    console.error(err);
                })
        },
        addItem() {
            this.users.push({
                userId: this.newItemUserId,
                title: this.newItemTitle,
                body: this.newItemBody
            })
            axios.post('https://jsonplaceholder.typicode.com/posts/', {
                userId: this.newItemUserId,
                title: this.titleToBeUpdated,
                body: this.bodyToBeUpdated
            })
                .then((response) => {
                    this.show = true
                    this.resetVal()
                }).catch(err => {
                    this.error = err
                })
        },
        deleteItem(id, index) {
            this.users.splice(index, 1);
            axios.delete('https://jsonplaceholder.typicode.com/posts/' + id)
        },
        editItem(titleToBeUpdated, bodyToBeUpdated, id, index) {
            this.users[index].body = bodyToBeUpdated
            this.users[index].title = titleToBeUpdated
        },
        resetVal() {
            this.newItemUserId = 0
            this.newItemTitle = ""
            this.newItemBody = ""
            this.error = ""
        }
    },
    mounted() {
        this.fetchItem();
    }
}
</script>

<style>
.container__card_add-item {
    width: 100%;
    display: inline-block;
    box-shadow: 0 1px 2px 0 rgba(0, 0, 0, .15);
    margin: 20px;
    position: relative;
    margin-bottom: 50px;
    background-color: #f5f5dc63;

}

.dashboard__button__add {
    width: 40px;
    height: 40px;
    margin-left: auto;
    margin-top: 30px;
    margin-bottom: 30px;
}

.container__card__new-item-form {
    padding: 20px;
    min-height: 200px;
    display: grid;
    gap: 40px;
    width: 100%;
}

.container__card__new-item-body {
    height: 150px;
}

.btn {
    padding: 4px 4px;
    width: 40px;
    height: 40px;
}

.add {
    content: url("~assets/icons/plus-black.png");

}

.close {
    content: url("~assets/icons/close-black.png");

}
</style>