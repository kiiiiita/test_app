<template>
  <div class="add-member">
    <p>{{ schedule.name }}</p>
    <input type="text" v-model="name">
    <input type="text" v-model="comment">
    ○<input type="radio" value="○" v-model="attend">
    ×<input type="radio" value="×" v-model="attend">
    <action-button :text="'作成'" @click="addMember" />
    <table>
      <thead>
        <tr>
          <th>名前</th>
          <th>コメント</th>
          <th>参加</th>
        </tr>
      </thead>
      <tbody v-for="(member) in member">
        <tr>
          <td>{{member.name}}</td>
          <td>{{member.comment}}</td>
          <td>{{member.attend}}</td>
        </tr>
      </tbody>
    </table>
  </div>
</template>

<script>
import firebase from 'firebase'
import ActionButton from '../components/common/ActionButton'

export default {
  name: 'AddMember',
  components: {
    ActionButton
  },
  computed: {
    scheduleKey () {
      return this.$route.params.value
    },
    schedule() {
      return this.schedules[this.scheduleKey]
    },
    member() {
      let members = []
      for(let key in this.members) {
        if (this.members[key].scheduleKey === this.scheduleKey) {
          members.push(this.members[key]);
        }
      }
      return members
    }
  },
  data () {
    return {
      name: null,
      comment: null,
      attend: null,
      schedules: {},
      members: {}
    }
  },
  created () {
    this.database = firebase.database();
    this.schedulesRef = this.database.ref('schedules');
    this.membersRef = this.database.ref('members');
    let _this = this;
    this.schedulesRef.on ('value', (snapshot) => {
      _this.schedules = snapshot.val(); // データに変化が起きたときに再取得する
    });
    this.membersRef.on ('value', (snapshot) => {
      _this.members = snapshot.val(); // データに変化が起きたときに再取得する
    });
  },
  methods: {
    addMember () {
      this.membersRef.push(
        {
          scheduleKey: this.scheduleKey,
          name: this.name,
          comment: this.comment,
          attend: this.attend,
        }
      )
      this.clear();
    },
    clear () {
      this.name = null;
      this.comment = null;
      this.attend = null;
    }
  }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped>

</style>
