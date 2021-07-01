<template>
  <div class="table">
    <div class="table_header">
      <div>序号</div>
      <div>列1</div>
      <div>列2</div>
      <div>列3</div>
    </div>
    <div class="table_content">
      <div class="table_item">
        <div>1</div>
        <div>我们是第一行</div>
      </div>
    </div>
  </div>
</template>
<script>
export default {
  data() {
    return {
      list: [{ name: 123 }]
    };
  }
};
</script>
<style lang="scss" scoped></style>
