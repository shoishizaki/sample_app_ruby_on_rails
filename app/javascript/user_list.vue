<template>
  <div id="app">
    <div v-if = "existUserId">
      <h1>All Users</h1>
      <div v-for="user in users" :key="user.id">
        <p>User Nema: {{ user.name}}</p>
        <p>User Email: {{ user.email}}</p>
      </div>
    </div>
  </div>
</template>

<script>
import axios from 'axios';

// あとでuser_id=nullは定義し直す必要あり←バグが起こる可能性あり
  export default {
    computed: {
      existUserId() {
        return this.user_id !== null
      }
    },
    
    data: function () {
      return {
        users: [],
        user_id: null
    }
  },

// ページを作成する時にユーザーIDとユーザー情報を引き出す
    created() {
      axios.get('/api/v1/microposts.json')
        .then(response => {this.user_id = response.data
                           this.getUsers()
        })
        .catch(response => {console.log("Miss")})
    },
    
// ユーザーの情報を引き出す。    
    methods: {
      getUsers() {
        if (this.user_id !== null) {
        axios.get('/api/v1/users.json')
        .then(response => {this.users = response.data})
        .catch(response => {console.log("Miss")})
        } else {
          window.location.href ="/login"
        }
      }
    }
  }
</script>

<style scoped>

  /*p {*/
  /*  font-size: 2em;*/
  /*  text-align: center;*/
  /*}*/
</style>