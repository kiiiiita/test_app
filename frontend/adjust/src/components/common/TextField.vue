<template>
  <input
    class="text-filed"
    type="text"
    v-model="input"
    :placeholder="text" />
</template>

<script>
export default {
  name: 'TextField',
  props: {
    text: {
      type: String,
      default: "placeholder"
    }
  },
  computed: {
    input: {
      get () {
        return this.value
      },

      set (input) {
        this.$emit('input', input)
      }
    }
  }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped lang="scss">
  .text-filed {
    border-radius: 2px;
    font-size: 16px;
    width: 100%;
    height: 100%;
  }
</style>
