<template>
  <main>
    <div class="ui active inverted dimmer" v-if=loading>
      <div class="ui text loader">Chargement des rendez-vous...</div>
    </div>
    <section class="agenda" v-for="post in posts">
      <div class="titreEtDate">
        <h1 class=titre>{{post.titre}}</h1><h2 class=date>{{post.date}}</h2><h2 class=heure>{{post.time}}</h2>
      </div>
      <article class="description">
        <p>
          {{post.desc}}
        </p>
      </article>
    </section>
  </main>
</template>

<script type=text/babel>
  import { posts } from 'src/vuex/actions'
  export default {
    vuex: {
      getters: {
        posts
      },
      actions: {

      },
      data () {
        return {

        }
      }
    }
  }
</script>

<style>

</style>
