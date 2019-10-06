<template>
  <div class="search">
    <label-field text="tag" />
    <text-field @input="input" />
    <action-button
      text="検索"
      @click="$emit('click', 'aa')" />
  </div>
</template>

<script>
import ActionButton from '../common/ActionButton'
import TextField from '../common/TextField'
import LabelField from '../common/LabelField'

export default {
  name: 'Search',
  components: {
    ActionButton,
    TextField,
    LabelField
  },
  data () {
    return {
      input: ''
    }
  }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped lang="scss">
  .search {
    display: flex;
  }
</style>
