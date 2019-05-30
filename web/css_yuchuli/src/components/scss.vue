<template>
  <div id="scss">
    <p>关于scss</p>
    <p>hello</p>
  </div>
</template>

<script>
export default {
  name: 'scss'
}
</script>

<style lang="scss" scoped>
#scss {
  p:first-child {
    color: green;
  }
  p:last-child {
    color: aqua;
  }
}
</style>
