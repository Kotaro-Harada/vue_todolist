<template>
  <div>
    <h1>Task Form</h1>
    <success_message :successmessage="successmessage" />
    <error_messages :errormessages="errormessages" />
    <form @submit.prevent="submitTask">
      <div>
        <label for="name">Task Name</label>
        <input type="text" v-model="task.name" id="name" />
      </div>
      <div>
        <label for="description">Description</label>
        <textarea v-model="task.description" id="description"></textarea>
      </div>
      <div>
        <label for="start_datetime">Start Datetime</label>
        <input type="datetime-local" v-model="task.start_datetime" id="start_datetime" />
      </div>
      <div>
        <label for="end_datetime">End Datetime</label>
        <input type="datetime-local" v-model="task.end_datetime" id="end_datetime" />
      </div>
      <button type="submit">Create Task</button>
    </form>
  </div>
</template>

<script>
import success_message from "../success_message.vue";
import error_messages from "../error_messages.vue";

export default {
  components: {
    success_message,
    error_messages,
  },
  data() {
    return {
      task: {
        name: "",
        description: "",
        start_datetime: "",
        end_datetime: "",
      },
      errormessages: [],
      successmessage: ""
    };
  },
  methods: {
    async submitTask() {
      try {
        const response = await this.$axios.post(`${window.location.origin}/api/tasks`, this.task );
        debugger;
        if (response.ok) {
          const message = await response.json();

          this.successmessage = Object.values(message).flat().join("");
          this.errormessages = [];
          this.task = { name: "", description: "", start_datetime: "", end_datetime: "" };
        } else {
          const errors = await response.json();
          this.errormessages = Object.entries(errors)
            .map(([key, message]) => `${key}: ${message.join(", ")}`);
          this.successmessage = "";
        };
      } catch (error) {
        console.log("Error:", error);
      }
    },
  },
};
</script>
