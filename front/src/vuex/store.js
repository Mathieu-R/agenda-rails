import Vue from 'vue'
import Vuex from 'vuex'

Vue.use(Vuex)

const state = {
  name: false,
  id: '',
  posts: []
}

const mutations = {
  SET_NAME (state, name) {
    state.name = name
  },
  SET_ID (state, id) {
    state.id = id
  },
  ADD_POSTS (state, posts) {
    state.posts = posts
  },
  ADD_POST (state, post) {
    state.posts.push(post)
  },
  REMOVE_POST (state, post) {
    let index = state.posts.findIndex(p => p.id == post.id)
    state.posts.splice(index, 1)
  }
}

export default new Vuex.Store({
  state,
  mutations
})
