<!-- css -->
<script src="<?= base_url() ?>assets/plugins/datatables/jquery.dataTables.min.js"></script>
<script src="<?= base_url() ?>assets/plugins/datatables-responsive/js/dataTables.responsive.min.js"></script>
<script src="<?= base_url() ?>assets/plugins/datatables-responsive/js/responsive.bootstrap4.min.js"></script>
<script src="<?= base_url() ?>assets/plugins/datatables-bs4/js/dataTables.bootstrap4.min.js"></script>


<!-- js -->
<link rel="stylesheet" href="<?= base_url() ?>assets/plugins/datatables-responsive/css/responsive.bootstrap4.min.css">
<link rel="stylesheet" href="<?= base_url() ?>assets/plugins/datatables-bs4/css/dataTables.bootstrap4.min.css">



<!-- Control -->
<script>
  $(document).ready(function() {
    function show_data() {
      $.ajax({
        url: '<?= site_url('admin/menu') ?>',
        type: 'post',
        dataType: 'json',
        success: function(data) {
          var menu = ''
          for (var i = 0; i < data.length; i++) {
            var sub = '';
            var menu_href = data[i].url;
            if(data[i].submenu.length > 0){
            for (var j = 0; j < data[i].submenu.length; j++) {
                submenu = '<li class="nav-item" data-url="' + data[i].submenu[j].url + '">' +
                '<a href="#" class="nav-link">' +
                '<i class="' + data[i].submenu[j].icon + ' nav-icon"></i>' +
                '<p>' + data[i].submenu[j].title + '</p>' +
                '</a>' +
                '</li>';
                sub += submenu;
              }
              menu_href = '';
            }
            menu += '<li class="nav-item has-treeview">' +
            '<a href="#" class="nav-link">' +
            '<i class="nav-icon ' + data[i].icon + '"></i>' +
            '<p>' +
            data[i].title;
            if(sub != ''){
              menu += '<i class="right fas fa-angle-left"></i>' +
              '</p>' +
              '</a>' +
              '<ul class="nav nav-treeview submenu" >' + sub + '</ul>' +
              '</li>';
            }
          }
          $('#menu').html(menu);
          $('.nav-link').click(function() {
            $('.nav-link').removeClass('active');
            $(this).addClass('active');
          });
          $('.submenu').on('click', '.nav-item', function() {
            url = $(this).data('url');
            $('#show_data').load('<?= site_url() ?>' + '/' + url);
          });
        }
      })
    }
    const form = $('.modal-body').html();
    $('#myData').DataTable({
      "processing": true,
      "serverSide": true,
      "order": [],
      "ajax": {
        "url": "<?= site_url('member/getList'); ?>",
        "type": "POST"
      },
      "columnDefs": [{

        "targets": [0],
        "orderable": false
      }]

    });

    $('#tambah').click(function() {
      $('.modal-body').html(form);
      aksi = '<input type="hidden" name="aksi" id="aksi">';
      $('#add').html(aksi);
      $('#modal').find('h5').html('Tambah')
      $('#modal').find('#btn').html('Tambah')
      $('#aksi').val('tambah');
      $('#modal').modal('show');
    });
    $('#data').on('click',
      '.edit',
      function() {
        $('.modal-body').html(form);
        aksi = '<input type="hidden" name="aksi" id="aksi">' +
        '<input type="hidden" name="id" id="id">';
        $('#add').html(aksi);
        $('#modal').find('h5').html('Edit')
        $('#modal').find('#btn').html('Edit')
        id = $(this).data('id_member');
        $.ajax({
            url:'<?= site_url('member/getData'); ?>',
            type:'post',
            dataType:'json',
            data:{
              id_member:id,
            },success:function(data){
              $('#id').val(data.id_member);
              $('#nama_member').val(data.nama_member);
              $('#jenis_mobil').val(data.jenis_mobil);
              $('#plat_nomor').val(data.plat_nomor);
              $('#alamat').val(data.alamat);
              $('#nomor_telepon').val(data.nomor_telepon);
              $('#aksi').val('edit');
              $('#modal').modal('show');
            }
        });
      });
    $('#data').on('click',
      '.hapus',
      function() {
        $('.modal-body').html(form);
        aksi = '<input type="hidden" name="aksi" id="aksi">' +
        '<input type="hidden" name="id" id="id">' +
        '<h3>Apakah Anda Yakin ?</h3>';
        $('.modal-body').html(aksi);
        $('#modal').find('h5').html('Hapus')
        $('#modal').find('#btn').html('Hapus')
        id = $(this).data('id_member');
        $('#aksi').val('hapus');
        $('#id').val(id);
        $('#modal').modal('show');
      });
      $('#data').on('click',
      '.hapus2',
      function() {
        $('.modal-body').html(form);
        aksi = '<input type="hidden" name="aksi" id="aksi">' +
        '<input type="hidden" name="id" id="id">' +
        '<h3>Apakah Anda Yakin ?</h3>';
        $('.modal-body').html(aksi);
        $('#modal').find('h5').html('Hapus')
        $('#modal').find('#btn').html('Hapus')
        id = $(this).data('id_member');
        $('#aksi').val('hapus2');
        $('#id').val(id);
        $('#modal').modal('show');
      });
    $('#form').submit(function(e) {
      e.preventDefault();
      $.ajax({
        url: '<?= site_url('member/aksi') ?>',
        type: 'post',
        data: new FormData(this),
        dataType: 'json',
        processData: false,
        contentType: false,
        async: false,
        success: function(result) {
          if (result.status == false) {
            toastr['error'](result.pesan);
          } else if (result.status == true) {
            toastr['success'](result.pesan);
          }
          $('#myData').DataTable().ajax.reload();
          $('#modal').modal('hide');
        }
      })
    });
    $('#data').on('click', '#is_active', function() {
      id = $(this).data('id_member');
      active = $(this).data('active');
      $.ajax({
            url:'<?= site_url('member/changeActive'); ?>',
            type:'post',
            dataType:'json',
            data:{
              id_member:id,
              is_active:((active == 1)?0:1),
            },success:function(data){
              if (result.status == false) {
                toastr['error'](result.pesan);
              } else if (result.status == true) {
                toastr['success'](result.pesan);
              }
              $('#myData').DataTable().ajax.reload();
            }
      });
    });

  });
</script>