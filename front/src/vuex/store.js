import Vue from 'vue'
import Vuex from 'vuex'

Vue.use(Vuex)

const state = {
  name: false,
  id: '',
  posts: []
}

const mutations = {
  SET_NAME (name) {
    state.name = name
  },
  SET_ID (id) {
    state.id = id
  },
  ADD_POSTS (state, posts) {
    state.posts = posts
  },
  ADD_POST (state, post) {
    state.posts.push(post)
  }
}

export default new Vuex.Store({
  state,
  mutations
})
