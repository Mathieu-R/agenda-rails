<template>
  <div class="ui container">
    <header></header>
    <name></name>
    <post-form></post-form>
    <posts></posts>
  </div>
</template>

<script type=text/babel>
  import header from 'components/header'
  import name from 'components/name'
  import postForm from 'components/post-form'
  import posts from 'components/posts'
  import store from 'vuex/store'

  export default {
    components: { header, name, postForm, posts },
    store
  }
</script>
