/* global Vue, VueRouter, axios */

var HomePage = {
  template: "#home-page",
  data: function() {
    return {
      message: "Welcome to Vue.js!",
      products: []
    };
  },
  created: function() {
    console.log("load when the page loads");
    axios.get("/api/products").then(function(response) {
      console.log(response.data);
      this.products = response.data;
    }.bind(this));
  },
  methods: {},
  computed: {}
};

var TestPage = {
  template: "#test-page",
  data: function() {
    return {
      message: "Welcome to the Test Page"
    };
  },
  created: function() {},
  methods: {},
  computed: {}
};

var router = new VueRouter({
  routes: [
    { path: "/", component: HomePage },
    { path: "/test", component: TestPage }
  ],
  scrollBehavior: function(to, from, savedPosition) {
    return { x: 0, y: 0 };
  }
});

var app = new Vue({
  el: "#vue-app",
  router: router
});