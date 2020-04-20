<template>
  <div id="header">
    <div v-if = "existUserId">
      <div class="nav">
        <ul>
          <li><a @click="goToHome">Home</a></li>
          <li><a @click="goToHelp">Help</a></li>
          <li><a @click="goToUsers">Users</a></li>
          <li><a @click="logout">Logout</a></li>       
        </ul>
      </div>
    </div>
    <div v-else>
      <div class="nav">
        <ul>
          <li><a @click="goToHome">Home</a></li>
          <li><a @click="goToHelp">Help</a></li>
          <li><a @click="goToLogin">Login</a></li>
          <li><a @click="goToSignup">Signup</a></li>       
        </ul>
      </div>
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
        user_id: null
        
      }
    },

//ログイン情報を取得する
    created() {
      axios.get('/api/v1/microposts.json')
        .then(response => {this.user_id = response.data})
        .catch(response => {console.log("Miss")})
    },
    
    methods: {
//ログアウトする
      logout() {
        axios.delete(`/api/v1/sessions/${this.user_id}.json`)
        .then(response => {window.location.href ="/";})
        .catch(response => {console.log("Miss")})
      },
      
//Homeページに移動する
      goToHome() {
        window.location.href ="/";
      },
      
//Helpページを移動する
      goToHelp() {
        window.location.href ="/help";
      },
      
//ユーザー一覧ページに移動する
      goToUsers() {
        window.location.href ="/users";
      },
      
//Loginページに移動する
      goToLogin() {
        window.location.href ="/login";
      },
      
//Singnupページに移動する
      goToSignup() {
        window.location.href ="/signup";
      },
    }
  }
</script>

<style scoped>
  .nav ul li {
    float: left;
    width: 120px;
    height: 50px;
  }
  
  .nav ul {
    list-style-type: none;
    height: 50px;
  }
  
  .nav {
    background-color: #DDFFDD;
    height: 50px;
  }
  
  .nav a {
    display: block;
    padding: 10%;
  }
</style>