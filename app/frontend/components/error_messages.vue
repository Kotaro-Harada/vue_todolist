<template>
  <div v-if="errormessages">
      <ul>
        <!-- v-forディレクティブを使用してエラーメッセージをリスト表示 -->
        <!-- :key="error"は各エラーメッセージに一意のキーを与える -->
        <li v-for="error in errormessages" :key="error">{{ error }}</li>
      </ul>
    </div>
</template>

<script>
export default {
  props: {
    errormessages: Array
  },
}
</script>

