<template>
  <div>
    <div class="card">
      <div class="card-header">
	      <p>title:{{ task.title }}</p>
      </div>
      <div class="card-body">
	      <p class="card-text">description:{{ task.description }}</p>
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

  }
};
</script>
