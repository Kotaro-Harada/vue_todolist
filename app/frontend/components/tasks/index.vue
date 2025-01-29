<template>
  <div>
  </div>
</template>

<script>

import TaskCard from './card.vue';

export default {
  components: {
    TaskCard,
  },

  data() {
    return {
      tasks: [],
    };
  },
  created() {
    this.fetchTasks();
  },
};
