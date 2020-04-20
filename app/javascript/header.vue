<template>
  <div id="header">
    <div v-if = "existUserId">
      <div class="nav">
        <ul>
          <li><a href="/">Home</a></li>
          <li><a href="/help">Help</a></li>
          <li><a href="/users">Users</a></li>
          <li><a href="">Logout</a></li>       
        </ul>
      </div>
    </div>
    <div v-else>
      <div class="nav">
        <ul>
          <li><a href="/">Home</a></li>
          <li><a href="help">Help</a></li>
          <li><a href="/login">Login</a></li>
          <li><a href="/signup">Signup</a></li>       
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
    
    created() {
      axios.get('/api/v1/microposts.json')
        .then(response => {this.user_id = response.data})
        .catch(response => {console.log("Miss")})
    },
    
    methods: {

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