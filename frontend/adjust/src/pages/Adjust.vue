<template>
  <div class="adjust">
    <p>{{ msg }}</p>
    <new-schedule :schedules="schedulesRef"></new-schedule>
    <div>
      <table>
        <thead>
          <tr>
            <th>タイトル</th>
            <th>説明</th>
            <th>日時</th>
            <th>詳細</th>
          </tr>
        </thead>
        <tbody v-for="(schedule, key) in schedules">
          <tr>
            <td>{{schedule.name}}</td>
            <td>{{schedule.description}}</td>
            <td>{{schedule.date}}</td>
            <td><router-link :to="{ name: 'AddMember', params: { value: key }}" >hoge Link</router-link ></td>
          </tr>
        </tbody>
      </table>
    </div>
  </div>
</template>

<script>
import firebase from 'firebase'
import newSchedule from '../components/adjust/NewSchedule'

export default {
  name: 'Adjust',
  components: {
    newSchedule
  },
  data () {
    return {
      msg: 'adjust',
      database: null,
      schedules: null,
      schedulesRef: null
    }
  },
  created () {
    this.database = firebase.database();
    this.schedulesRef = this.database.ref('schedules');
    let _this = this;
    this.schedulesRef.on ('value', (snapshot) => {
      _this.schedules = snapshot.val(); // データに変化が起きたときに再取得する
    });
  },
  methods: {
  }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>
p {
  color: #42b983;
}
</style>
