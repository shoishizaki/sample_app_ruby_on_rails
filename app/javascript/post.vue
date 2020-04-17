<template>
  <div id="app">
    <div v-if = "existUserId">
      <h3>MicroPost</h3>
      <labal for="micropost"></labal>
      <textarea id="micropost" v-model="micropost"></textarea>
      <br><br>
      <button @click="createPost">Post</button>
    </div>
  </div>
</template>

<script>
  import axios from 'axios';

 // nullはバグを引き起こしやすい
 // コードで人がわかりやすいように書く
 // バグが無いコードが書けることが大切　＝　可読性が高い+チェックをする
 //          ↑
 // goとかいいかも（go テイレイヤー)
 //人の書いたコードを見る
  export default {
    computed: {
      existUserId() {
        return this.user_id !== ""
      }
    },
  
  data: function () {
    return {
      micropost: "",
      user_id: 0
    }
  },
  
  methods: {
    createPost() {
      axios.post('/api/v1/microposts', {micropost:this.micropost, user_id:this.user_id})
      .then(response => {window.location.href ="/";})
      .catch(response => {console.log("Miss")})
    }
  },
  
  created() {
    axios.get('/api/v1/microposts.json')
    .then(response => {this.user_id = response.data})
    .catch(response => {console.log("Miss")})
  }
  
}
</script>

<style scoped>
  p {
    font-size: 2em;
    text-align: center;
  }
</style>