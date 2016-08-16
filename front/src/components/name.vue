<template>
    <div class="field center_field">
      <div class="ui action left icon input loading">
        <i class="search icon" v-if="loading"></i>
        <input type=text placeholder="Nom d'utilisateur..." v-model="username">
        <div class="ui teal button" @click="getPosts">Rechercher</div>
      </div>
    </div>
</template>

<script type=text/babel>
  import axios from 'axios'
  import { addPosts } from "src/vuex/actions"
  import { setName } from "src/vuex/actions"
  import { setId } from "src/vuex/actions"

  export default {
    vuex: {
      getters: {

      },
      actions: {
        addPosts,
        setId,
        setName
      }
    },
    data () {
      return {
        loading: false,
        username: ''
      }
    },
    methods: {
      getPosts () {
        this.loading = true
        axios.get('/agenda/' + this.username)
          .then(response => {
            this.addPosts(response.data.posts) // On ajoute les posts
            this.setId(response.data.id) // On ajoute l'id
            this.setName(this.username) // On ajoute le nom au header que si celui-ci existe
            this.$parent.auth = true // On dit que l'utilisateur est connecté
          })
          .catch((e) => {
            console.log(e)
            this.auth = true
          })
          .then(() => {
            this.username = ''
            this.loading = false
          })
      }
    }
  }
</script>

<style>
  .center_field {
    text-align: center;
  }
</style>
