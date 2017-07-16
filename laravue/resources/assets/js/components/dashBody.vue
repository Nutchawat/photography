<template>
  <div id="dash-body">
    <main>
      <div class="clearfix section-body font-size-body" id="index">
        <div id="loader">
          <div class="cssload-spinner"></div>
        </div>
        <span id="info-delete"></span>
        <router-view />
      </div>
    </main>
  </div>
</template>

<script>
  export default {
    name: 'dash-body'
  }
</script>