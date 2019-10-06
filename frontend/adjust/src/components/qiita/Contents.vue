<template>
  <section class="Contents">
    <table>
      <thead>
        <th>タイトル</th>
        <th>いいね数</th>
        <th>タグ</th>
      </thead>
      <tbody v-if="datas.length > 0" v-for="data in datas" :key="data.id">
        <td>{{ data.title }}</td>
        <td>{{ data.likes }}</td>
        <td>{{ data.tags }}</td>
      </tbody>
    </table>
  </section>
</template>

<script>
export default {
  name: 'Contents',
  props: {
    datas: {
      type: Array
    }
  }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped lang="scss">

</style>
