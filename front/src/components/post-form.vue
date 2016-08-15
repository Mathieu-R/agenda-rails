<template>
  <div>
    <h3 class="ui header">Ajouter un rendez-vous</h3>
    <form class="ui form" action="" @submit.prevent="addPost">
      <div class="four field">
        <div class="field">
          <input type="text" v-model="titre" placeholder="Titre...">
        </div>
        <div class="field">
          <label for="date">Date: </label>
          <datepicker v-model="date" format="YYYY-MM-DD" ></datepicker>
        </div>
        <div class="field">
          <input v-model="time" type="time" id="time">
        </div>
        <div class="field">
          <select class="ui dropdown">
            <option value="">Gender</option>
            <option v-model="importance" value="key" v-for="(key, level) in levels">level</option>
          </select>
        </div>
      </div>
      <div class="field">
        <label>Description</label>
        <textarea v-model="desc" placeholder="Description..."></textarea>
      </div>
      <button type="submit" >
        <i class="icon edit"></i>
        Ajouter
      </button>
    </form>
  </div>
</template>

<script type=text/babel>
  import datepicker from 'vue-date-picker'
  import { getName } from 'src/vuex/actions'
  export default {
    vuex: {
      getters: {
        getName // Nom de l'utilisateur
      },
      actions: {

      }
    },
    data () {
        return {
          titre: '',
          desc: '',
          date: '',
          time: '',
          importance: '',
          levels: {
            "1": "Peu important",
            "2": "Normal"
            "3": "Important",
            "4": "Urgent"
          }
        }
    },
    computed: {
      getDate: function () {
        return document.getElementsByClassName('datetime-picker')[0].getElementsByTagName('input')[0].value // Récupérer la date du datepicker
      }
    }
  }
</script>

<style>

</style>
