<template>
  <div>
    <div class="ui inverted menu">
      <div class="header item">{{ getName ? getName : 'Agenda' }}</div>
      <div class="right menu">
        <button class="ui black button" @click="showAddUser = !showAddUser">+</button>
      </div>
    </div>
    <div class="addUserBox" v-show="showAddUser">
      <div class="field">
        <div class="ui right action input">
          <i class="search icon" v-if="loading"></i>
          <input type=text placeholder="John..." v-model="newUser">
          <div class="ui teal button" @click="addUser()"><i class="add icon"></i>Ajouter</div>
        </div>
      </div>
    </div>
  </div>
</template>

<script type=text/babel>
  import axios from 'axios'
  import { getName } from 'src/vuex/actions'
  export default {
    vuex: {
      getters: {
        getName
      }
    },
    data () {
      return {
        showAddUser: false,
        newUser: '', // New User to Add
        username: '' // Current User
      }
    },
    methods: {
      addUser () {
        axios.post('/user/', { username: this.newUser.toLowerCase() })
          .then((response) => {
            console.log(response.data.success)
          })
          .catch((e) => {
            console.log(e)
          })
          .then(() => this.newUser = '')
      }
    }
  }
</script>

<style>
  .addUserBox {
    background-color: black;
    padding: 5px;
    margin: 0;
    position: relative;
    top: -17px;
    float: right;
    opacity: 0.8;
  }
</style>
