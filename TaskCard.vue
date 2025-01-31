<template>
  <div>
    <div class="card">
      <div class="card-header">
	{{ task.title }}
      </div>
      <div class="card-body">
	<p class="card-text">{{ task.description }}</p>
      </div>
      <div>
	<p>{{ task.start_datetime }}</p>
	<p>〜</p>
	<p>{{ task.end_datetime }}</p>
      </div>
    </div>
  </div>
</template>

<script>

export default {
  props: {
    task: Object,
  },
  created() {
    try {
      axios.get('/tasks/index')
    } catch(error) {
      console.log('エラー:', error);
    }
  }
};
</script>
