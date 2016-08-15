export const getName = function ({dispatch, state}) {
  return state.name
}

export const setName = function ({dispatch, state}, name) {
  dispatch('SET_NAME', name)
}

export const posts = function ({dispatch, state}) {
  return state.posts
}

export const addPosts = function ({dispatch, state}, posts) {
  dispatch('ADD_POSTS', posts)
}
