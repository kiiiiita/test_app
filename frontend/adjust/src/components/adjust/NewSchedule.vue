<template>
  <div class="new-schedule">
    <div>
      <input type="text" v-model="name">
      <input type="text" v-model="description">
      <input type="text" v-model="date">
      <button type="submit" @click="createSchedule()">予定作成</button>
    </div>
  </div>
</template>

<script>
export default {
  name: 'NewSchedule',
  props: {
    schedules: {
      type: Object
    }
  },
  data () {
    return {
      name: null,
      description: null,
      date: null,
    }
  },
  methods: {
    createSchedule () {
      this.schedules.push({
          name: this.name,
          description: this.description,
          date: this.date,
          members: [1]
      });
      this.clear()
    },
    clear () {
      this.name = null
      this.description = null
      this.date = null
    }
  }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>

</style>
