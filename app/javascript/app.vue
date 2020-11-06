<template>
  <div id="app">
    <v-app>
      <v-main>
        <flash :message="message" v-if="message"/>
        <category v-on:moduleActivated="incrementReloadKey" v-on:flash="flashMessage"/>
        <module :reloadKey="reloadKey" v-on:flash="flashMessage"/>
      </v-main>
    </v-app>
  </div>
</template>

<script>
import module from "./packs/components/module.vue";
import category from "./packs/components/category.vue";
import flash from "./packs/components/flash.vue";
export default {
   data() {
    return {
        reloadKey: 0,
        message: null
    }
  },
  components: {
    category: category,
    module: module,
    flash: flash
  },
  methods: {
    incrementReloadKey() {
      this.reloadKey += 1;
    },
    flashMessage(message) {
      this.message = message;
      setTimeout(() => this.message = null, 4000);
    }
  }
};
</script>