

<template>
  <div id="categories">
    <v-expansion-panels>
      <v-toolbar flat color="white">
      <v-toolbar-title>Categories</v-toolbar-title>
      <v-divider class="mx-4" inset vertical></v-divider>
      <v-spacer></v-spacer>
      </v-toolbar>
      <v-expansion-panel v-for="category in categories" v-bind:key="category.id">
        <v-expansion-panel-header>
          <h2>{{ category.name }}</h2>
        </v-expansion-panel-header>
        <v-expansion-panel-content>
          {{ category.description }}
          <v-expansion-panels>
            <br>
            <v-expansion-panel v-for="course in category.courses" v-bind:key="course.id">
              <v-expansion-panel-header>
                <h3>{{ course.name }}</h3>
              </v-expansion-panel-header>
              <v-expansion-panel-content>
                <div>
                  <p>{{ course.description }}</p>
                  <hr>
                  <v-expansion-panels>
                    <br>
                    <v-expansion-panel v-for="module in course.learning_modules" v-bind:key="module.id">
                      <v-expansion-panel-header>
                        <h3>{{ module.name }}</h3>
                      </v-expansion-panel-header>
                      <v-expansion-panel-content>
                        <div v-if="module.difficulty">
                          Difficulty:
                          <v-rating
                            full-icon="star"
                            empty-icon="star_outline"
                            hover
                            readonly
                            :length="5"
                            :size="15"
                            :value= module.difficulty
                          ></v-rating>
                        </div>
                        <hr>
                        <div class="module-contents">
                          <p class="module-description">{{ module.description }}</p>
                          <v-btn
                            depressed
                            elevation="2"
                            outlined
                            v-on:click="updatePopularity(module.id)"
                          >Activate</v-btn>
                        </div>
                      </v-expansion-panel-content>
                    </v-expansion-panel>
                  </v-expansion-panels>
                </div>
              </v-expansion-panel-content>
            </v-expansion-panel>
          </v-expansion-panels>
        </v-expansion-panel-content>
      </v-expansion-panel>
    </v-expansion-panels>
  </div>
</template>

<script>
import axios from "axios";
axios.defaults.headers.common['X-CSRF-Token'] = document.querySelector("meta[name=csrf-token]").content
export default {
  data: () => ({
    categories: []
  }),
  created() {
    this.initialize();
  },
  methods: {
    initialize() {
      return axios
        .get(Routes.categories_path())
        .then(response => {
          this.categories = response.data;
        })
        .catch(e => {
          this.$emit('flash', e);
        });
    },
    updatePopularity(moduleId) {
      axios
        .post(Routes.learning_module_update_popularity_path(moduleId))
      return this.$emit('moduleActivated');
    }
  }
};
</script>
