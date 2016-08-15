<template>
  <div class="ui four cards">
    <post :post="post" v-for="post in posts" transition:"showPosts"></post> <!-- Post Card -->
  </div>
</template>

<script type=text/babel>
  import post from './post'
  import { posts } from '../vuex/actions'
  import { id } from '../vuex/actions'
  export default {
    components: { post },
    vuex: {
      getters: {
        posts,
        id
      },
      actions: {

      },
    },
    data () {
      return {

      }
    }
  }
</script>

<style>
  .showPosts-transition {
    opacity: 1;
    transition: opacity .3s linear;
  }

  .showPosts-enter, .showPosts-leave {
    opacity: 0;
  }
</style>
