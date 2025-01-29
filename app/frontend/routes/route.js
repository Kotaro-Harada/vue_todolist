import { createRouter, createWebHistory } from 'vue-router';
import TaskForm from '../components/tasks/task_form.vue';
import Card from '../components/tasks/card.vue';

const routes = [
  { path: '/tasks/new', component: TaskForm },
  { path: '/tasks/card', component: Card },
];

const router = createRouter({
  history: createWebHistory(),
  routes,
});

export default router;
