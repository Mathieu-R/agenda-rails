<template>
  <div class="ui inverted menu">
    <div class="header item">Agenda</div>
    <div class="right menu">
      <button class="ui inverted button">+</button>
    </div>
  </div>
</template>

<script type=text/babel>
  import { getName } from 'src/vuex/actions'
  export default {
    vuex: {
      getters: {
        getName
      }
    },
    data () {
      return {
        username: ''
      }
    }
  }
</script>

<style>

</style>
