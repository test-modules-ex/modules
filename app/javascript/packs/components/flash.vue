<template>
  <div>
    <v-alert
      border="top"
      color="red lighten-2"
      dark
    >
      {{ message }}
    </v-alert>
  </div>
</template>

<script>
export default {
  props: ['message']
}
</script>