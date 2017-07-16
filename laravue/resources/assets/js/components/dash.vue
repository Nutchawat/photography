<template>
  <div id="dash">
    <dash-header />
    <dash-body />
    <dash-footer />
  </div>
</template>

<script>
  import dashHeader from './dashHeader.vue'
  import dashBody from './dashBody.vue'
  import dashFooter from './dashFooter.vue'

  export default {
    name: 'dash',
    components: {
      dashHeader,
      dashBody,
      dashFooter
    }
  }
</script>