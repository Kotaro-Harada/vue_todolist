<template>
  <div v-if="errormessages">
    <ul>
      <li v-for="errormessage in errormessages" :key="errormessage">
        {{ errormessage }}
      </li>
    </ul>
  </div>
</template>

<script>
export default {
  props: {
    errormessages: String,
  },
};
</script>
