<template>
  <header class="ui header">

  </header>
</template>

<script type=text/babel>
  import { getName } from '../vuex/action'
  export default {
    vuex: {
      getters: {
        getName: getName
      }
    }
    data () {
      username: ''
    }

  }
</script>

<style>

</style>
