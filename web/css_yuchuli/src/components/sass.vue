<template>
  <div id="sass">
    <p>关于sass</p>
    <p>缩排语法</p>
  </div>
</template>

<script>
export default {
  name: 'sass'
}
</script>

<style lang="sass" scoped>
#sass
  p:first-child
    color: red
  p:last-child
    color: green
</style>
