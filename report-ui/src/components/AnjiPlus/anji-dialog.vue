 <!--
 * @Descripttion: 
 * @Author: qianlishi
 * @Date: 2021-12-13 10:17:24
 * @Last Modified by:   qianlishi
 * @Last Modified time: 2021-12-13 11:20:24
 !-->
<template>
  <el-dialog
    :width="dialogWidth"
    :class="dialogFullScreen ? 'full-screen' : 'notfull-screen'"
    center
    :fullscreen="dialogFullScreen"
    :visible.sync="dialogConfig.dialogVisible"
    :before-close="handleDialogClose"
    append-to-body
    modal-append-to-body
  >
    <template v-slot:title>
      {{ getDialogTitle(dialogConfig.dialogType) }}
      <button
        v-if="dialogConfig.isFullScreen"
        type="button"
        aria-label="Close"
        class="el-dialog__headerbtn"
        style="right: 50px"
        @click="dialogFullScreen = !dialogFullScreen"
      >
        <i class="el-dialog__close el-icon el-icon-full-screen" />
      </button>
    </template>
    <div class="card-body">
      <div class="anji-card">
        <div v-if="dialogConfig.isSetColRow" class="card-head">
          <div class="main-card-header-button">
            <el-button type="text" @click="handleSetRowColNum(4)"
              >||||</el-button
            >
            <el-button type="text" @click="handleSetRowColNum(3)"
              >|||</el-button
            >
            <el-button type="text" @click="handleSetRowColNum(2)">||</el-button>
          </div>
        </div>
        <slot name="dialogCont" />
        <slot />
      </div>
    </div>
    <div slot="footer" class="anji-button">
      <el-button
        v-if="isBtnClose"
        type="danger"
        plain
        @click="handleDialogClose"
        >{{ dialogConfig.isBtnClose.text || "关闭" }}</el-button
      >
      <el-button
        v-if="isBtnSave"
        type="primary"
        plain
        @click="handleDialogSave"
        >{{ dialogConfig.isBtnSave.text || "保存" }}</el-button
      >
      <slot name="dialogBtn" />
    </div>
  </el-dialog>
</template>

<script>
export default {
  props: {
    // 弹框配置文件
    dialogConfig: {
      required: true,
      type: Object,
      default: () => {
        return {
          dialogVisible: false,
          dialogType: "add",
          dialogWidth: "60%",
          isFullScreen: true,
          isSetColRow: true,
          isBtnClose: {
            value: true,
            text: "关闭"
          },
          isBtnSave: {
            value: true,
            text: "保存"
          },
          column: 2,
          setColumnFn: () => {}
        };
      }
    }
  },
  data() {
    return {
      dialogFullScreen: false // 弹出框全屏
    };
  },
  computed: {
    dialogWidth() {
      if (this.dialogConfig.dialogWidth) {
        return this.dialogConfig.dialogWidth;
      } else {
        if (this.dialogConfig.column == 2) {
          return "60%";
        }
        if (this.dialogConfig.column == 3) {
          return "70%";
        }
        if (this.dialogConfig.column == 4) {
          return "80%";
        }
      }
      return "60%";
    },
    isBtnClose() {
      return this.dialogConfig.isBtnClose || this.dialogConfig.isBtnClose.value;
    },
    isBtnSave() {
      return this.dialogConfig.isBtnSave || this.dialogConfig.isBtnSave.value;
    }
  },
  methods: {
    getDialogTitle(type) {
      let title = "新增";
      switch (type) {
        case "add":
          title = "新增";
          break;
        case "edit":
          title = "编辑";
          break;
        case "view":
          title = "查看";
          break;
        default:
          title = type;
          break;
      }
      return title;
    },
    handleSetRowColNum(val) {
      const cardRowColSpan = 24 / val;
      this.dialogConfig.setColumnFn(cardRowColSpan);
    },
    handleDialogClose() {
      this.$emit("handleClose");
    },
    handleDialogSave() {
      this.$emit("handleDialogSave");
    }
  }
};
</script>

<style scoped lang="scss">
.notfull-screen {
  /deep/.el-dialog__body {
    background-color: rgb(240, 242, 245);
    padding: 5px;
    max-height: 60vh;
    overflow: auto;
  }
}
.full-screen {
  /deep/.el-dialog__body {
    background-color: rgb(240, 242, 245);
    padding: 5px;
    height: calc(100vh - 110px);
    overflow: auto;
  }
}
.anji-card {
  margin-bottom: 5px;
  box-sizing: border-box;
  padding: 0 20px;
  color: rgba(0, 0, 0, 0.65);
  font-size: 14px;
  font-letiant: tabular-nums;
  line-height: 1.5;
  list-style: none;
  font-feature-settings: "tnum";
  position: relative;
  background: #fff;
  border-radius: 2px;
  transition: all 0.3s;
}
.drawerContainer {
  width: 100%;
  height: 100%;
  display: flex;
  flex-direction: column;
  .drawerMain {
    flex: 1;
    overflow-y: auto;
    overflow-x: hidden;
    padding: 0 20px;
  }
  .footer {
    border-top: 1px solid #eff0f3;
    height: 66px;
    display: flex;
    justify-content: center;
    align-items: center;
  }
}
.addForm {
  text-align: center;
}
.activeColor /deep/.el-form-item__label {
  color: #5887fb;
}
</style>
