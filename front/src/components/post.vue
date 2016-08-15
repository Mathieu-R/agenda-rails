<template>
  <div class="ui card">
    <div class="content">
      <div class="header">{{ post.title }}</div>
      <div class="meta">
        <span class="category">{{ post.date }}</span>
      </div>
      <div class="description">
        <p>{{ post.description }}</p>
      </div>
    </div>
    <div class="extra content">
      <div class="extra">Importance: <span :class="'level' + post.level">{{levels[post.level]}}</span></div> <!-- 1: Peu important 2: Normal 3: Très important 4: Urgent  || Vert clair / Vert foncé / Orange / Rouge -->
    </div>
  </div>
</template>

<script type=text/babel>
  export default {
    props: {
      post: Object
    },
    vuex: {
      getters: {

      },
      actions: {

      },
    },
    data () {
      return {
        levels: {
          "1": "Pas important",
          "2": "Normal",
          "3": "Très important",
          "4": "Urgent"
        }
      }
    }
  }
</script>

<style>
  .level1 {
    color: #1E824C;
  }

  .level2 {
    color: #016936;
  }

  .level3 {
    color: #FE9A76;
  }

  .level4 {
    color: #B03060;
  }
</style>
