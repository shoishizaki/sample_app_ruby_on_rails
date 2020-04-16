<template>
  <div id="app">
    <div v-if = "isUserId">
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

export default {
  computed: {
    isUserId() {
      return this.user_id !== null
    }
  },
  data: function () {
    return {
      micropost: "",
      user_id: null
    }
  },
  methods: {
    createPost() {
      axios.post('/api/v1/microposts', {micropost:this.micropost, user_id:this.user_id})
      .then(response => {
        window.location.href ="/";
      })
      .catch(response => {
        console.log("Miss")
      })
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