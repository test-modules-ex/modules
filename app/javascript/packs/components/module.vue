<template>
  <v-data-table :headers="headers" :items="learning_modules" sort-by="popularity" :sort-desc="true" class="elevation-1" :key="reloadKey">
    <template v-slot:top>
      <v-toolbar flat color="white">
        <v-toolbar-title>Learning modules</v-toolbar-title>
        <v-divider class="mx-4" inset vertical></v-divider>
        <v-spacer></v-spacer>
      </v-toolbar>
    </template>
  </v-data-table>
</template>

<script>
import axios from "axios";

export default {
  props: ['reloadKey'],
  data: () => ({
    headers: [
      { text: "Name", value: "name" },
      { text: "Module type", value: "module_type" },
      { text: "Description", value: "description" },
      { text: "Popularity", value: "popularity" }
    ],
    learning_modules: [],
    defaultItem: {
      name: "",
      calories: "",
      fat: "",
      carbs: "",
      protein: ""
    }
  }),
  watch: {
    reloadKey: function() {
      this.initialize();
    }
  },
  created() {
    this.initialize();
  },

  methods: {
    initialize() {
      return axios
        .get(Routes.learning_modules_path())
        .then(response => {
          this.learning_modules = response.data;
        })
        .catch(e => {
          console.log(e);
        });
    }
  }
};
</script>