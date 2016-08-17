<template>
  <div class="ui segment">
    <h3 class="ui dividing header">Ajouter un rendez-vous</h3>
    <form class="ui form" action="" @submit.prevent="addPost()">
      <div class="four field">
        <div class="field">
          <label>Titre</label>
          <input type="text" v-model="title" placeholder="Titre...">
        </div>
        <div class="field">
          <label for="date">Date</label>
          <datepicker format="YYYY-MM-DD" ></datepicker>
        </div>
        <div class="field">
          <label>Heure</label>
          <input v-model="time" type="time" id="time">
        </div>
        <div class="field">
          <label>Importance</label>
          <select v-model="importance" class="ui dropdown">
            <option :value="key" v-for="(key, level) in levels">{{level}}</option>
          </select>
        </div>
      </div>
      <div class="field">
        <label>Description</label>
        <textarea v-model="desc" placeholder="Description..."></textarea>
      </div>
      <button type="submit" class="ui big blue labeled icon button">
        <i class="icon edit"></i>
        Ajouter
      </button>
    </form>
  </div>
</template>

<script type=text/babel>
  import datepicker from 'vue-date-picker'
  import axios from 'axios'
  import { getName } from 'src/vuex/actions'
  import { id } from 'src/vuex/actions'
  import { addPost as addPostAction } from 'src/vuex/actions'
  export default {
    vuex: {
      getters: {
        getName, // Nom de l'utilisateur
        id // ID de l'utilisateur
      },
      actions: {
        addPostAction
      }
    },
    components: { datepicker },
    data () {
        return {
          title: '',
          desc: '',
          time: '',
          importance: '',
          levels: {
            "1": "Peu important",
            "2": "Normal",
            "3": "Important",
            "4": "Urgent"
          }
        }
    },
    computed: {
      getDate: function () {
        return document.getElementsByClassName('datetime-picker')[0].getElementsByTagName('input')[0].value // Récupérer la date du datepicker
      }
    },
    methods: {
      addPost () {
        let id = this.id
        let title = this.title
        let datetime = this.getDate + " " + this.time
        let level = this.importance
        let desc = this.desc
        console.log({user_id: id, title: title, date: datetime, level: level, description: desc})
        axios.post('/agenda/', {user_id: id, title: title, date: datetime, level: level, description: desc})
          .then(response => {
            this.addPostAction(response.data.post)
          })
          .catch((e) => {
            console.log(e)
          })
          .then(() => {
            this.title = ''
            this.desc = ''
            this.time = ''
            this.importance = ''
          })
      }
    }
  }
</script>

<style>

</style>
