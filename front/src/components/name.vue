<template>
  <form>
    <div class=fields>
      <input type=text v-model=username>
    </div>
    <button @click=getPosts>Afficher</button>
  </form>
</template>

<script type=text/babel>
  import axios from 'axios'
  import { addPosts } from "src/vuex/actions"
  import { setName } from "src/vuex/actions"
  export default {
    vuex: {
      getters: {

      },
      actions: {
        addPosts: addPosts,
        setName: setName
      }
    },
    data () {
      username: ''
    },
    methods: {
      getPosts () {
        axios.get('/agenda/' + this.username)
          .then(reponse => {
            this.addPosts(response.data)
            this.setName(this.username) // On ajoute le nom que si celui-ci existe
          })
          .catch((e) => console.log(e))
      }
    }
  }
</script>

<style>

</style>
