<template>
  <main>
    <div class="ui active inverted dimmer" v-if=loading>
      <div class="ui text loader">Chargement...</div>
    </div>
    <section class="agenda" v-for="rdv in agenda">
      <div class="titreEtDate">
        <h1 class=titre>{{rdv.titre}}</h1><h2 class=date>{{rdv.date | format_date}}</h2><h2 class=heure>{{rdv.time}}</h2>
      </div>
      <article class="description">
        <p>
          {{rdv.desc}}
        </p>
      </article>
    </section>
  </main>
</template>

<script type=text/babel>

</script>

<style>

</style>
