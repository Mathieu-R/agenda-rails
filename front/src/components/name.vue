<template>
  <div class="field">
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

  export default {
    vuex: {
      getters: {

      },
      actions: {
        addPosts,
        setName,
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
            this.addPosts(response.data)
            this.setName(this.username) // On ajoute le nom que si celui-ci existe
            this.$parent.auth = true
          })
          .catch((e) => {
            console.log(e)
            this.$parent.auth = true
          })
          .then(() => this.loading = false)
      }
    }
  }
</script>

<style>

</style>
