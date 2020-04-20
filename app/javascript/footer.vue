<template>
  <div id="footer">
    <hr>
    <div class="nav">
      <ul>
        <li><a @click="goToAbout">About</a></li>
        <li><a @click="goToContact">Contact</a></li>
        <li><a href="https://jp.vuejs.org/index.html">News</a></li>
        <li><a href="https://jp.vuejs.org/index.html">Vue.jsについて</a></li>       
      </ul>
    </div>
  </div>
</template>

<script>

  export default {
    methods: {

//Aboutページに移動する
      goToAbout() {
        window.location.href ="/about";
      },
      
//Contactページに移動する
      goToContact() {
        window.location.href ="/contact";
      },
    }
  }
</script>

<style scoped>
  .nav ul li {
    float: right;
    width: 120px;
    height: 50px;
  }
  
  .nav ul {
    list-style-type: none;
    height: 50px;
  }
  
  .nav {
    height: 50px;
  }
  
  .nav a {
    display: block;
    padding: 10%;
  }
</style>