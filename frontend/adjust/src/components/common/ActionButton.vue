<template>
  <button
    class="action-button"
    type="submit"
    @click="$emit('click')">{{ text }}
  </button>
</template>

<script>
export default {
  name: 'ActionButton',
  props: {
    text: {
      type: String,
      default: "ボタン"
    }
  }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped lang="scss">
  .action-button {
    color: #ffffff;
    background-color: #28a745;
    border-color: #28a745;
    border-radius: 2px;
    width: 100%;
    height: 100%;
    cursor: pointer;
    &:hover {
      background-color: black
    }
  }
</style>
