<template>
  <div class="qiita">
    <search
      @click="hadleSearchContents "/>
    <contents></contents>
  </div>
</template>

<script>
import Search from '../components/qiita/Search'
import Contents from '../components/qiita/Contents'

export default {
  name: 'Qiita',
  components: {
    Search,
    Contents
  },
  data: {
  },
  methods: {
    hadleSearchContents (tags) {
      console.log(tags);
    }
  }
}
</script>

<style scoped lang="scss">
</style>
