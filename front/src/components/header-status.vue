<template>
  <header class="ui header">

  </header>
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
