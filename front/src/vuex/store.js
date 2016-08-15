import Vue from 'vue'
import Vuex from 'vuex'

Vue.use(Vuex)

const state = {
  name: '',
  posts: []
}

const mutations = {
  SET_NAME (name) {
    state.name = name
  },
  ADD_POSTS (state, posts) {
    state.posts.push(...posts)
    //posts.forEach(post => state.posts.push(post))
  }
}

export default new Vuex.Store({
  state,
  mutations
})
