const mixin = {
  methods: {
    // 数组 元素互换位置
    swapArr(arr, oldIndex, newIndex) {
      arr[oldIndex] = arr.splice(newIndex, 1, arr[oldIndex])[0];
      return arr;
    },
    // 删除
    deletelayer() {
      this.widgets.splice(this.rightClickIndex, 1);
    },
    // 锁定
    lockLayer() {
      const obj = this.widgets[this.rightClickIndex];
      this.$set(obj.value.position, "disabled", true);
    },
    //  解除锁定
    noLockLayer() {
      const obj = this.widgets[this.rightClickIndex];
      this.$set(obj.value.position, "disabled", false);
    },
    // 复制
    copylayer() {
      const obj = this.deepClone(this.widgets[this.rightClickIndex]);
      obj.value.position.top += 40; // 复制的元素向右下角偏移一点
      obj.value.position.left += 40;
      obj.value.widgetId = Number(Math.random().toString().substr(2)).toString(
        36
      );
      this.widgets.splice(this.widgets.length, 0, obj);
      this.$nextTick(() => {
        this.layerClick(this.widgets.length - 1); // 复制后定位到最新的组件
      });
    },
    // 置顶
    istopLayer() {
      if (this.rightClickIndex + 1 < this.widgets.length) {
        const temp = this.widgets.splice(this.rightClickIndex, 1)[0];
        this.widgets.push(temp);
      }
    },
    // 置底
    setlowLayer() {
      if (this.rightClickIndex != 0) {
        this.widgets.unshift(this.widgets.splice(this.rightClickIndex, 1)[0]);
      }
    },
    // 上移一层
    moveupLayer() {
      if (this.rightClickIndex != 0) {
        this.widgets[this.rightClickIndex] = this.widgets.splice(
          this.rightClickIndex - 1,
          1,
          this.widgets[this.rightClickIndex]
        )[0];
      } else {
        this.widgets.push(this.widgets.shift());
      }
    },
    // 下移一层
    movedownLayer() {
      if (this.rightClickIndex != this.widgets.length - 1) {
        this.widgets[this.rightClickIndex] = this.widgets.splice(
          this.rightClickIndex + 1,
          1,
          this.widgets[this.rightClickIndex]
        )[0];
      } else {
        this.widgets.unshift(this.widgets.splice(this.rightClickIndex, 1)[0]);
      }
    },
  }
}

export default mixin