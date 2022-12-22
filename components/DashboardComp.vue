<template>
    <div>

        <PostComp v-for="n in user" :userId="n.userId" :key="n.userId"
            :class="{ 'red': n % 2 == 0, 'gray': n % 2 != 0 }" />
    </div>
</template>
<script>
import axios from 'axios'
export default {
    name: 'DashboardComp',
    data() {
        return {
            user: ""
        }
    },
    mounted() {
        axios
            .get('https://jsonplaceholder.typicode.com/posts')
            .then(
                (response) => {
                    (this.user = response.data)
                    console.log(response.data)
                }
            )
    }

}
</script>

<style>

</style>