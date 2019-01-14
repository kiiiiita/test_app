<template>
  <div class="default-button">
    <button type="submit" @click="click">{{ label }}</button>
  </div>
</template>

<script>
export default {
  name: 'DafaultButton',
  props: {
    label: {
      type: String,
      default: "ボタン"
    }
  },
  methods: {
    click () {
      console.log("test");
      this.$emit("click");
    }
  }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>

</style>
