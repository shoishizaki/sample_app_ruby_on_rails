<template>
  <div id="app">
    <div v-if = "existUserId">
      <p>Name: {{ user.name }}</p>
      <p>Email: {{ user.email }}</p>
      <h3>Micropost（{{ microposts_count }}）</h3>
      <div v-for="micropost in microposts" :key="micropost.id">
        <p>User: {{ user.name }}</p>
        <p>Post: {{ micropost.content }}</p>
        <br>
        <hr>
        <div v-if = "deleteMicropost">
          <p>Delete</p>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import axios from 'axios';

// あとでuser_id=null、id=null、microposts_count=nullは定義し直す必要あり←バグが起こる可能性あり
  export default {
    computed: {
      existUserId() {
        return this.user_id !== null
      },
      
//投稿を削除できるユーザーかどうかを判定する
      deleteMicropost() {
        return this.user_id === this.user.id
      }
    },
    
    data: function () {
      return {
        user: null,
        user_id: null,
        id : null,
        url: "",
        microposts: [],
        microposts_count: null
    }
  },

// ページを作成する時にユーザーIDとユーザー情報を引き出す
    created() {
      axios.get('/api/v1/microposts.json')
        .then(response => {this.user_id = response.data
                           this.getUrlParam()
                           this.getUser()
                           this.getMicroposts()
        })
        .catch(response => {console.log("Miss")})
    },
    
// ユーザーの情報を引き出す。    
    methods: {
      getUser() {
        if (this.user_id !== null) {
        axios.get(`/api/v1/users/${this.id}.json`)
        .then(response => {
          this.user = response.data
        })
        .catch(response => {console.log("Miss")})
        } else {
          window.location.href ="/login"
        }
      },

//URLパラメーターを取得する
      getUrlParam() {
        this.url = window.location.href.split('/')
        this.id = this.url[4]
      },
      
//このページに掲載するユーザー情報を取得する
      getMicroposts() {
        if (this.user_id !== null) {
          axios.get(`/api/v1/microposts/${this.id}.json`)
          .then(response => {this.microposts = response.data
                            this.microposts_count = response.data.length
          })
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