<template>
  <div id="app">
    <v-app>
      <v-main>
        <category v-on:moduleActivated="incrementReloadKey"/>
        <module :reloadKey="reloadKey"/>
      </v-main>
    </v-app>
  </div>
</template>

<script>
import module from "./packs/components/module.vue";
import category from "./packs/components/category.vue";
export default {
   data() {
    return {
        reloadKey: 0
    }
  },
  components: {
    category: category,
    module: module
  },
  methods: {
    incrementReloadKey() {
      this.reloadKey += 1;
    }
  }
};
</script>