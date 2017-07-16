<template>
  <div class="page-login">
    <form action="" method="post" name="login_form">
      <div class="head-login"><label><h3>Log in</h3></label></div>
      <hr>
      <div class="clearfix layout-login input-group">
        <span class="input-group-addon"><i class="fa fa-user"></i></span>
        <input type="text" class="form-control" name="username" id="username" placeholder="username">
      </div>
      <div class="clearfix layout-login input-group">
        <span class="input-group-addon"><i class="fa fa-key"></i></span>
        <input type="password" class="form-control" name="password" id="password" placeholder="password">
      </div>
      <div class="clearfix layout-btn">
        <input type="submit" class="btn btn-login" name="submit" value="Login" onclick="">
      </div>
    </form>
  </div>
</template>

<script>
  export default {
    name: 'admin'
  }
</script>