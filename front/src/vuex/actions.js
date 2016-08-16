export const getName = function (state) {
  return state.name
}

export const setName = function ({dispatch, state}, name) {
  dispatch('SET_NAME', name)
}

export const setId = function ({dispatch, state}, id) {
  dispatch('SET_ID', id)
}

export const id = function (state) {
  return state.id
}

export const posts = function (state) {
  return state.posts
}

export const addPosts = function ({dispatch, state}, posts) {
  dispatch('ADD_POSTS', posts)
}

export const addPost = function ({dispatch, state}, post) {
  dispatch('ADD_POST', post)
}

export const removePost = function ({dispatch, state}, post) {
  dispatch('REMOVE_POST', post)
}
