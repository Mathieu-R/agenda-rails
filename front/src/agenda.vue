<template>
  <div class="ui container">
    <header-status></header>
    <name></name>
    <post-form></post-form>
    <posts></posts>
  </div>
</template>

<script type=text/babel>
  import headerStatus from './components/header-status'
  import name from './components/name'
  import postForm from './components/post-form'
  import posts from './components/posts'
  import store from './vuex/store'

  export default {
    components: { headerStatus, name, postForm, posts },
    store
  }
</script>
