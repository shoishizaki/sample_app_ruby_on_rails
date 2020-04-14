<template>
  <div id="app">
    <h3>Login</h3>
    <label for="email">User Email</label>
    <input id="email" type="text" v-model="email"><br>
    <label for="password">Password</label>
    <input id="password" type="password" v-model="password">
    <br>
    <button @click="login">Login</button>
  </div>
</template>

<script>
import axios from 'axios';

export default {
  data: function () {
    return {
         email: "",
      password: "",
      remember_me: 0
    }
  },
  methods: {
    login() {
      axios.post('/api/v1/sessions', {email:this.email, password:this.password, remember_me:this.remember_me})
      .then(response => {
        window.history.pushState(null, null, '/');
        window.location.reload(false);
        console.log("OK")
      })
      .catch(response => {
        console.log("Miss")
      })
    }
  }
}
</script>

<style scoped>
p {
  font-size: 2em;
  text-align: center;
}
</style>
