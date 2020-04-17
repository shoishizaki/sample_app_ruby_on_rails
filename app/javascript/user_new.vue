<template>
  <div id="app">
    <h3>Sign Up</h3>
    <label for="name">User Name</label>
    <input id="name" type="text" v-model="name"><br>
    <label for="email">User Email</label>
    <input id="email" type="text" v-model="email"><br>
    <label for="password">Password</label>
    <input id="password" type="password" v-model="password">
    <label for="password_confirmation">Password confirmation</label>
    <input id="password_confirmation" type="password" v-model="password_confirmation">
    <br>
    <button @click="register">Create my account</button>
  </div>
</template>

<script>
  import axios from 'axios';

  export default {
    data: function () {
      return {
        name: "",
        email: "",
        password: "",
        password_confirmation: ""
      }
    },
    
    methods: {
      register() {
        axios.post('api/v1/users', {name: this.name, email: this.email, password: this.password, password_confirmation: this.password_confirmation})
      .then(response => {window.location.href ="/";})
      .catch(response => {console.log("Miss")})}
    }
  }
  
</script>

<style scoped>
  p {
    font-size: 2em;
    text-align: center;
  }
</style>