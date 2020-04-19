<template>
  <div id="app">
    <div v-for="micropost in microposts" :key="micropost.id">
      <p>User ID: {{ micropost.user_id}}</p>
      <p>Post: {{ micropost.content}}</p>
    </div>
  </div>
</template>

<script>
import axios from 'axios';

export default {
  data: function () {
    return {
      microposts: []
    }
  },
  created() {
      axios.get('/api/v1/static_pages.json')
      .then(response => {this.microposts = response.data})
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