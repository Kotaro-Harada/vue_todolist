<template>
  <div v-if="successmessage">
    <p>{{ successmessage }}</p>
  </div>
</template>

<script>
export default {
  props: {
    successmessage: String,
  },
};
</script>
