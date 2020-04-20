<template>
  <div id="app">
    <div v-if = "existUserId">
      <p>{{ my_information.name }}</p>
      <p>{{ my_information.email }}</p>
      <a v-bind:href= "'/users/' + my_information.id">view my profile</a>
    </div>
    <div v-else>
      <h1>Welcome to the Sample App</h1>
      <h2>
        This is the home page for the
        <a href="https://railstutorial.jp/">Ruby on Rails Tutorial</a>
        and
        <a href="https://v1-jp.vuejs.org/">Vue.js</a>
        sample application.
      </h2>
      <button @click="goToSignup">Sign Up now!</button>
    </div>
  </div>
</template>

<script>
import axios from 'axios';

  export default {
//ログインしているユーザーかどうか確認する
    computed: {
      existUserId() {
        return this.user_id !== null
      }
    },
    
//user_id=nullは変更する必要あり←バグを起こす可能性あり
    data: function () {
      return {  
        microposts: [],
        user_id: null,
        my_information: null
        
      }
    },
    
    created() {
      axios.get('/api/v1/microposts.json')
        .then(response => {this.user_id = response.data
                           this.getMyInfomation()
        })
        .catch(response => {console.log("Miss")})
    },
    
    methods: {
//Micropostsを取得する
      getMicroposts() {
        if (this.user_id !== null) {
          axios.get('/api/v1/static_pages.json')
          .then(response => {this.microposts = response.data})
          .catch(response => {console.log("Miss")})
        } else {
          console.log("Please login")
        }
      },
      
//自分のユーザー情報を取得する
      getMyInfomation() {
        axios.get(`/api/v1/users/${this.user_id}.json`)
        .then(response => {this.my_information = response.data})
        .catch(response => {console.log("No data")})
      },

//signupページへ移動する
      goToSignup() {
        window.location.href ="/signup"
      }
    }
  }
</script>

<style scoped>
  button {
    text-align:center;
  }
  /*p {*/
  /*  font-size: 2em;*/
  /*  text-align: center;*/
  /*}*/
</style>