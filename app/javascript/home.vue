<template>
  <div id="app">
    <div v-if = "existUserId">
      <div v-for="micropost in microposts" :key="micropost.id">
        <p>User ID: {{ micropost.user_id}}</p>
        <p>Post: {{ micropost.content}}</p>
        <a v-bind:href = "'/users/' + micropost.user_id">Go to user page</a>
        <br>
        <hr>
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
        .then(response => {this.user_id = response.data
                           this.getMicroposts()
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