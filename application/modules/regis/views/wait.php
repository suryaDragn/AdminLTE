<div class="login-box">
  <div class="login-logo">
    <h1>Bengkel<b>In</b></h1>
  </div>
  <!-- /.login-logo -->
  <div class="card">
    <div class="card-body login-card-body">
      <p class="login-box-msg">
        Checking Registred User
      </p>
      <?= $this->session->flashdata('pesan') ?>
      <form action="<?= site_url('regis/verif') ?>" method="post">
        <p class="login-box-msg">
            <i class="fa fa-phone"></i>
            Hubungi Penjual untuk Verifikasi 
        </p>
        <div class="form-group">
          <button type="submit" class="btn btn-success w-100">Muat Ulang</button>
        </div>
      </form>
    </div>
  </div>
</div>
<?php
if (form_error('user')) : ?>
<script>
  $('#user').css('background-color', '#FFEFF0');
  $('#tes').css('background-color', '#FFEFF0');
</script>
<?php endif; ?>
<?php
if (form_error('pass')) : ?>
<script>
  $('#pass').css('background-color', '#FFEFF0');
  $('#tes2').css('background-color', '#FFEFF0');
</script>
<?php endif; ?>
<script>
  $(document).ready(function() {
    var user = $('#user').val();
    var pass = $('#pass').val();
    if (!user) {
      $('#user').attr('data-toggle', 'tooltip');
      $('#user').attr('data-placement', 'left');
      $('#user').attr('title', 'Masukkan Username');
    }
    if (!pass) {
      $('#pass').attr('data-toggle', 'tooltip');
      $('#pass').attr('data-placement', 'left');
      $('#pass').attr('title', 'Masukkan Password');
    }
    $(function() {
      $('[data-toggle="tooltip"]').tooltip()
    })
    $('#eye').click(function() {
      if ($('#pass').is(':password')) {
        $('#pass').attr('type', 'text');
        $('#eye').removeClass('fa-eye');
        $('#eye').addClass('fa-eye-slash');
      } else {
        $('#pass').attr('type', 'password');
        $('#eye').addClass('fa-eye');
        $('#eye').removeClass('fa-eye-slash');
      }
    });
  });
</script>