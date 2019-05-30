<template>
  <div id="scss">
    <p>关于scss</p>
    <p>hello</p>
    <div class="se">
      <p>mixin 单行溢出省略 mixin 单行溢出省略 mixin 单行溢出省略 mixin 单行溢出省略 mixin 单行溢出省略 mixin 单行溢出省略 </p>
    </div>
    <div class="mse">
      <p>mixin多行溢出省略 mixin多行溢出省略 mixin多行溢出省略 mixin多行溢出省略 mixin多行溢出省略 mixin多行溢出省略 mixin多行溢出省略 mixin多行溢出省略 mixin多行溢出省略 </p>
    </div>
  </div>
</template>

<script>
export default {
  name: 'scss'
}
</script>

<style lang="scss" scoped>
  @import "../assets/mixin";
#scss {
  .se {
    width: 300px;
    p {
      @include singleEllipsis
    }
  }
  .mse {
    width: 300px;
    height: 200px;
    p {
      @include mutableEllipsis(2)
    }
  }
}
</style>
