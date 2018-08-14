/* global Vue, VueRouter, axios */

var HomePage = {
  template: "#home-page",
  data: function() {
    return {
      message: "Welcome to Vue.js!",
      products: [],
      images: []
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

var SignupPage = {
  template: "#signup-page",
  data: function() {
    return {
      name: "",
      email: "",
      password: "",
      passwordConfirmation: "",
      errors: []
    };
  },
  methods: {
    submit: function() {
      var params = {
        name: this.name,
        email: this.email,
        password: this.password,
        password_confirmation: this.passwordConfirmation
      };
      axios
        .post("/api/users", params)
        .then(function(response) {
          router.push("/login");
        })
        .catch(
          function(error) {
            this.errors = error.response.data.errors;
          }.bind(this)
        );
    }
  }
};

var LoginPage = {
  template: "#login-page",
  data: function() {
    return {
      email: "",
      password: "",
      errors: []
    };
  },
  methods: {
    submit: function() {
      var params = {
        email: this.email, password: this.password
      };
      axios
        .post("/api/sessions", params)
        .then(function(response) {
          axios.defaults.headers.common["Authorization"] =
            "Bearer " + response.data.jwt;
          localStorage.setItem("jwt", response.data.jwt);
          router.push("/");
        })
        .catch(
          function(error) {
            this.errors = ["Invalid email or password."];
            this.email = "";
            this.password = "";
          }.bind(this)
        );
    }
  }
};

var LogoutPage = {
  template: "<h1>Logout</h1>",
  created: function() {
    axios.defaults.headers.common["Authorization"] = undefined;
    localStorage.removeItem("jwt");
    router.push("/");
  }
};

var NewProductPage = {
  template: "#new-product-page",
  data: function() {
    return {
      Name: "",
      Price: "",
      Description: "",
      Supplier: "",
      errors: []
    };
  },
  methods: {
    submit: function() {
      var params = {
        input_name: this.name,
        input_price: this.price,
        input_description: this.description,
        supplier_id: this.supplier
      };
      axios
        .post("/api/products", params)
        .then(function(response) {
          router.push("/");
        })
        .catch(
          function(error) {
            this.errors = error.response.data.errors;
          }.bind(this)
        );
    }
  }
};

var CartedProductsPage = {
  template: "#carted-products-page",
  data: function() {
    return {
      message: "Items in Your Cart",
      cartedProducts: [],
      images: []
    };
  },
  created: function() {
    console.log("load when the page loads");
    axios.get("/api/carted_products").then(function(response) {
      console.log(response.data);
      this.cartedProducts = response.data;
    }.bind(this));
  },
  methods: {},
  computed: {}
};

var OrderPage = {
  template: "#order-page",
  data: function() {
    return {
      message: "Order Summary",
      orders: []
    };
  },
  created: function() {
    console.log("load when the page loads");
    axios.get("/api/orders/").then(function(response) {
      console.log(response.data);
      this.orders = response.data;
    }.bind(this));
  },
  methods: {},
  computed: {}
};

var ProductsPage = {
  template: "#products-index-page",
  data: function() {
    return {
      message: "Products",
      products: [],
      images: []
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

var ProductPage = {
  template: "#product-show-page",
  data: function() {
    return {
      message: "Test Product",
      product: {
        name: "",
        description: "",
        id: "",
        supplier: "",
        price: "",
        image: "",
      },
    };
  },
  created: function() {
    console.log("load when the page loads");
    console.log(this.$route.params.id);
    axios.get("/api/products/" + this.$route.params.id).then(function(response) {
      console.log(response.data);
      this.product = response.data;
    }.bind(this));
  },
  methods: {},
  computed: {}
};

var ProductEditPage = {
  template: "#product-edit-page",
  data: function() {
    return {
      message: "Edit Product",
      product: {
        name: "",
        description: "",
        id: "",
        supplier: "",
        price: "",
        image: "",
      },
    };
  },
  created: function() {
    console.log("load when the page loads");
    console.log(this.$route.params.id);
    axios.get("/api/products/" + this.$route.params.id).then(function(response) {
      console.log(response.data);
      this.product = response.data;
    }.bind(this));
  },
  methods: {},
  computed: {}
};

var router = new VueRouter({
  routes: [
    { path: "/", component: HomePage },
    { path: "/test", component: TestPage },
    { path: "/signup", component: SignupPage },
    { path: "/login", component: LoginPage },
    { path: "/logout", component: LogoutPage },
    { path: "/products/new", component: NewProductPage },
    { path: "/carted_products", component: CartedProductsPage },
    { path: "/orders/", component: OrderPage },
    { path: "/products", component: ProductsPage },
    { path: "/products/:id", component: ProductPage },
    { path: "/products/:id/edit", component: ProductEditPage }
  ],
  scrollBehavior: function(to, from, savedPosition) {
    return { x: 0, y: 0 };
  }
});

var app = new Vue({
  el: "#vue-app",
  router: router,
  created: function() {
    var jwt = localStorage.getItem("jwt");
    if (jwt) {
      axios.defaults.headers.common["Authorization"] = jwt;
    }
  }
});