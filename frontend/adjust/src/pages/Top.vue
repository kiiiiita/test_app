<template>
  <div class="top">
    <p>{{ msg }}</p>
    <router-link :to="{ name: 'Adjust'}">adjust</router-link>
    <router-link :to="{ name: 'Qiita'}">qiita</router-link>
  </div>
</template>

<script>
export default {
  name: 'Top',
  data () {
    return {
      msg: 'top'
    }
  }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
p {
  color: #42b983;
}
</style>
