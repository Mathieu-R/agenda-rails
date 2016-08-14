import Vue from 'vue'
import name from 'components/name'
import agendaForm from 'components/agenda-form'
import agenda from 'components/agenda'

/* eslint-disable no-new */
new Vue({
  el: 'body',
  components: { name, agendaForm, agenda }
})
