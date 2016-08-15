<template>
    <div class="ui action left icon input">
      <i class="search icon" v-if="loading"></i>
      <input type=text placeholder="Nom d'utilisateur..." v-model="username">
      <div class="ui teal button">Rechercher</div>
    </div>
    <button @click="getPosts">Afficher</button>
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
      return {
        loading: false
        username: ''
      }
    },
    methods: {
      getPosts () {
        this.loading = true
        axios.get('/agenda/' + this.username)
          .then(reponse => {
            this.addPosts(response.data)
            this.setName(this.username) // On ajoute le nom que si celui-ci existe
          })
          .catch((e) => console.log(e))
          .then(() => this.loading = false)
      }
    }
  }
</script>

<style>

</style>
