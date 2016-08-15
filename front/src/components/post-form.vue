<template>
  <main>
    <form class="form" @submit.prevent=addPost>
      <fieldset>
        <input type="text" v-model="newRdv.titre" placeholder="Titre..." required=true>
        <textarea  v-model="newRdv.desc" placeholder="Description..." rows="4" cols="100" required=true></textarea>
        <article class="datetimes">
          <p>
            <label for="date">Date/Echéance: </label>
            <datepicker v-model="newRdv.date" format="YYYY-MM-DD" ></datepicker>
            <input v-model="newRdv.time" type="time" id="time">
          </p>
        </article>
        <input type="submit" value="AJOUTER">
      </fieldset>
    </form>
  </main>
</template>

<script type=text/babel>
  import datepicker from 'vue-date-picker'
  export default {
    vuex: {
      getters: {

      },
      actions: {

      }
    },
    data () {

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
