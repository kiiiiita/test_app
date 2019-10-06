<template>
  <label class="label-filed">{{ text }}</label>
</template>

<script>
export default {
  name: 'LabelField',
  props: {
    text: {
      type: String,
      default: "label"
    }
  }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped lang="scss">
  .label-filed {
    border-radius: 2px;
    font-size: 16px;
  }
</style>
