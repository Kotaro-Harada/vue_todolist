import { createRouter, createWebHistory } from 'vue-router';
import TaskForm from '../components/tasks/task_form.vue';
import Index from '../components/tasks/index.vue';

const routes = [
  { path: '/tasks/new', component: TaskForm },
  { path: '/tasks', component: Index },
];

const router = createRouter({
  history: createWebHistory(),
  routes,
});

export default router;
