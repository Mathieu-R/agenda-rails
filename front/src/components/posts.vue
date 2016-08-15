<template>
  <div>
    <post :post="post" v-for="post in posts"></post> <!-- Post Card -->
  </div>
</template>

<script type=text/babel>
  import post from './post'
  import { posts } from '../vuex/actions'
  export default {
    vuex: {
      getters: {
        posts
      },
      actions: {

      },
      components: { post },
      data () {
        return {

        }
      }
    }
  }
</script>

<style>

</style>
