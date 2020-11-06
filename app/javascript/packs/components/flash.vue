<template>
  <div>
    <v-alert
      border="top"
      color="blue-grey"
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