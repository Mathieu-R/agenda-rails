<template>
  <div class="ui card">
    <div class="ui inverted active dimmer" v-show=removing>
      <div class="ui text loader">Suppression...</div>
    </div>
    <div class="content">
      <i class="right floated remove icon removeCard" @click="removeCard"></i>
      <i class="right floated write icon editCard" @click="editCard"></i>
      <div class="header">{{ post.title }}</div>
      <div class="meta">
        <span class="category">{{ getDayName }} {{ getDayNumber }} {{ getMonthName }} {{ getYear }}</span>
        <span class="category">{{ getHours }}:{{ getMinutes }} </span>
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
  import axios from 'axios'
  import { removePost } from '../vuex/actions'
  export default {
    props: {
      post: Object
    },
    vuex: {
      getters: {

      },
      actions: {
        removePost
      },
    },
    data () {
      return {
        removing: false,
        levels: {
          "1": "Peu important",
          "2": "Normal",
          "3": "Très important",
          "4": "Urgent"
        }
      }
    },
    computed: {
      getDayName() {
        const days = ["Lundi", "Mardi", "Mercredi", "Jeudi", "Vendredi", "Samedi", "Dimanche"]
        return days[new Date(this.post.date).getDay() - 1]
      },
      getDayNumber() {
        return new Date(this.post.date).getDate()
      },
      getMonthName() {
        const months = ["Janvier", "Février", "Mars", "Avril", "Mai", "Juin", "Juillet", "Août", "Septembre", "Octobre", "Novembre", "Décembre"]
        return months[new Date(this.post.date).getMonth()]
      },
      getYear() {
        return new Date(this.post.date).getFullYear()
      },
      getHours() {
        return new Date(this.post.date).getUTCHours()
      },
      getMinutes() {
        let min = new Date(this.post.date).getMinutes()
        min < 10 ? min = "0" + min : ''
        return min
      }
    },
    methods: {
      editCard () {
        axios.patch("/agenda/" + post.id)
          .then((response) => {
            console.log(response.data.success)
          })
          .catch((e) => {
            console.log(e.data.errors)
          })
      },
      removeCard () {
        this.removing = true
        axios.delete("/agenda/" + this.post.id)
          .then((response) => {
            console.log(response.data.success)
            this.removePost(response.data.post)
          })
          .catch((e) => {
            console.log(e)
        })
          .then(() => this.removing = false)
      }
    }
  }
</script>

<style>
  .editCard, .removeCard {
    cursor: pointer;
  }

  .editCard:hover {
    color: midnightblue;
    transition: color .2s linear;
  }

  .removeCard:hover {
    color: red;
    transition: color .2s linear;
  }

  .level1 {
    color: limegreen;
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
