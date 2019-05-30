<template>
<div id="less">
  <p>关于less,详情查看源码</p>
  <p class="linkColor">less 可以定义变量 使用 @ 开头</p>
  <p>变量不仅可以用在css中,也可以在选择器,url,import语句中使用</p>
</div>
</template>

<script>
export default {
  name: 'less'
}
</script>

<style lang="less">
  // 使用 @ 开头定义一个变量
  @link-color: #428bca;
  // 1.less 支持和html标签结构类似的嵌套方式来组织样式
  #less {
    p:first-child {
      color: black;
      // $color 可以使用临近的颜色
      // background-color: $color;
      // 2. &代表上父级选择器
      &:after {
        display: block;
        content: 'less中 & 代表父级选择器';
      }
    }

    .linkColor {
      color: @link-color;
    }

  }
</style>
