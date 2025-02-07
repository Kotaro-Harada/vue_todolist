<template>
  <div>
    <h1>Tasks</h1>
    <div class="row">
      <div class="col-md-4" v-for="task in tasks" :key="task.id">
	      <TaskCard :task="task" />
      </div>
    </div>
  </div>
</template>

<script>

import TaskCard from './TaskCard.vue';

export default {
  components: {
    TaskCard,
  },

  data() {
    return {
      tasks: [],
    };
  },

  async created() {
    try {
      const response = await this.$axios.get('api/tasks');
      this.tasks = response.data
      console.log(this.tasks);
    } catch (error) {
      console.error(error);
    }
  },
};
</script>
