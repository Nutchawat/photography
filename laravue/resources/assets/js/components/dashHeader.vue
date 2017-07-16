<template>
  <div id="dash-header">
    <nav v-show="adminDisp" class="navbar-default nav-admin" id="nav-admin">
      <div class="container-fluid">
        <div class="navbar-header">
          <router-link :to="{ name: 'home' }" class="navbar-brand">
            <span>{{ username }}</span>
          </router-link>
        </div>
        <ul class="nav navbar-nav pull-left">
          <li class="pull-left">
            <router-link :to="{ name: 'admin' }">
              <span>Upload</span>
            </router-link>
          </li>
          <li class="pull-left">
            <router-link :to="{ name: 'home' }">
              <span>Logout</span>
            </router-link>
          </li>
        </ul>
      </div>
    </nav>
    <nav class="clearfix section-header" id="section-header">
      <ul class="clearfix font-size-body topnav" id="myTopnav">
        <li class="layout-left font-size-header">
          <router-link :to="{ name: 'home' }">
            <span>VV PHOTOGRAPHER</span>
          </router-link>
        </li>
        <li class="clearfix nav-column layout-right">
          <router-link :to="{ name: 'personal1' }">
            <span>personal1</span>
          </router-link>
        </li>
        <li class="clearfix nav-column layout-right">
          <router-link :to="{ name: 'personal2' }">
            <span>personal2</span>
          </router-link>
        </li>
        <li class="clearfix nav-column layout-right">
          <router-link :to="{ name: 'work1' }">
            <span>work1</span>
          </router-link>
        </li>
        <li class="clearfix nav-column layout-right">
          <router-link :to="{ name: 'work2' }">
            <span>work2</span>
          </router-link>
        </li>
        <li class="clearfix nav-column layout-right">
          <router-link :to="{ name: 'bio' }">
            <span>bio</span>
          </router-link>
        </li>
        <li class="clearfix nav-column layout-right">
          <router-link :to="{ name: 'contact' }">
            <span>contact</span>
          </router-link>
        </li>
        <li class="clearfix icon">
          <a href="javascript:void(0);" style="" @click="hambergerMenu()" id="icon-hambg">☰</a>
        </li>
      </ul>
    </nav>
  </div>
</template>

<script>
  export default {
    name: 'dash-header',
    data () {
      return {
        adminDisp: false,
        username: 'admin'
      }
    },
    methods: {
      hambergerMenu () {

      }
    }
  }
</script>