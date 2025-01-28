<template>
  <div>
    <h1>Task Form</h1>
    <p v-if="successmessage">{{ successmessage }}</p>
    <div v-if="errormessages">
      <ul>
        <!-- v-forディレクティブを使用してエラーメッセージをリスト表示 -->
        <!-- :key="error"は各エラーメッセージに一意のキーを与える -->
        <li v-for="error in errormessages" :key="error">{{ error }}</li>
      </ul>
    </div>
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
export default {
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
        const response = await fetch("/tasks", {
          method: "POST",
          headers: {
            "Content-Type": "application/json",
            "X-CSRF-Token": document.querySelector('meta[name="csrf-token"]').content,
          },
          body: JSON.stringify({ task: this.task }),
        });
        if (response.ok) {
          const message = await response.json();

          this.successmessage = Object.values(message).flat().join("");
          this.task = { name: "", description: "", start_datetime: "", end_datetime: "" };
        } else {
          const errors = await response.json();
          this.errormessages = Object.entries(errors)
            .map(([key, message]) => `${key}: ${message.join(", ")}`);
        };
      } catch (error) {
        console.log("Error:", error);
      }
    },
  },
};
</script>
