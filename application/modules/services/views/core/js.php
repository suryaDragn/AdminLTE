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
    const form = $('.modal-body .header').html();
    const formDtl = $('.modal-body .detail').html();

    $('#myData').DataTable({
      "processing": true,
      "serverSide": true,
      "order": [],
      "ajax": {
        "url": "<?= site_url('services/getList'); ?>",
        "type": "POST"
      },
      "columnDefs": [{

        "targets": [0],
        "orderable": false
      }]

    });

    $('#tambah').click(function() {
      console.log(form);
      $('.modal-body .header').html(form);
      $('.modal-body .detail').html(formDtl);
      aksi = '<input type="hidden" name="aksi" id="aksi">';
      $('#add').html(aksi);
      $('#modal').find('h5').html('Tambah')
      $('#modal').find('#btn').html('Simpan')
      $('#aksi').val('tambah');
      $('#modal').modal('show');
      $('#tanggal').val('');
      $('#tanggal').removeAttr('disabled');
      $('#btnMember').removeAttr('disabled');
    });
    $('#myData').on('click',
      '.edit',
      function() {
        $('.modal-body .header').html(form);
        aksi = '<input type="hidden" name="aksi" id="aksi">' +
        '<input type="hidden" name="id" id="id">';
        $('#btnMember').attr('disabled','disabled');
        $('#add').html(aksi);
        $('#modal').find('h5').html('Edit')
        $('#modal').find('#btn').html('Edit')
        user = "<?=$this->session->userdata('role') ?>";
        console.log(user);
        if(user == "1"){
          $('#tanggal').removeAttr('disabled');
          // $('#btnMember').removeAttr('disabled');
        }else{
          $('#tanggal').attr('disabled','disabled');
          $('#btnMember').attr('disabled','disabled');
        }
        id = $(this).data('id_service');
        $.ajax({
            url:'<?= site_url('services/getData'); ?>',
            type:'post',
            dataType:'json',
            data:{
              id_service:id,
            },success:function(data){
              $('#id').val(data.id_service);
              $('#id_service').val(data.id_service);
              $('#id_member').val(data.id_member);
              $('#tanggal').val(data.tanggal);
              $('#nama_member').val(data.nama_member);
              $('#jenis_mobil').val(data.jenis_mobil);
              $('#plat_nomor').val(data.plat_nomor);
              $('#alamat').val(data.alamat);
              $('#aksi').val('edit');
              $('#modal').modal('show');
            }
        });
      });
    $('#data').on('click',
      '.hapus',
      function() {
        id = $(this).data('id_service');
        if(confirm("Apakah anda yakin menghapus transaksi ini?")){
          $.ajax({
            url:'<?= site_url('services/aksi'); ?>',
            type:'post',
            dataType:'json',
            data:{
              id:id,
              id_service:'',
              aksi:'hapus',
            },success:function(data){
              
              if (result.status == false) {
                toastr['error'](result.pesan);
              } else if (result.status == true) {
                toastr['success'](result.pesan);
              }
              $('#myData').DataTable().ajax.reload();
            }
          });
        }
      });
      const month = ["January","February","March","April","May","June","July","August","September","October","November","December"];
      $('#data').on('click',
      '.detail',
      function() {
        id = $(this).data('id_service');
          $.ajax({
          url: '<?= site_url('services/getData') ?>',
          type: 'post',
          data: {
            id_service:id,
          },
          dataType: 'json',
          success: function(result) {
            $('#modalDetailTransaksi').modal('show');
            tgl = new Date(result.tanggal);
            tanggal = tgl.getDate()+" "+month[tgl.getMonth()]+" "+tgl.getFullYear();
            $('#dbtanggal').html(tanggal);
            $('#dbnama_member').html(result.nama_member);
            $('#dbjenis_mobil').html(result.jenis_mobil);
            $('#dbplat_nomor').html(result.plat_nomor);
            $('#dbalamat').html(result.alamat);
            getDetail('','DetailBarangData',id,1)

            // $('#modal_member').modal('hide');
          }
        });
      });

    $('#form').submit(function(e) {
      id = $('#id_member').val();
      tgl = $('#tanggal').val();
      if(id == '' | tgl == ''){
        alert('Tolong Lengkapi Data. Lalu Simpan');
        return false;
      }

      e.preventDefault();
      $.ajax({
        url: '<?= site_url('services/aksi') ?>',
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
          $('#id_service').val(result.insert_id);
          $('#myData').DataTable().ajax.reload();
          
          getDetail('modal_detail','detailData',result.insert_id);
          // $('#modal').modal('hide');
        }
      })
    });
    function getDetail(modal,table,id_service,$num){
      if($num == null){
        $num = 0;
      }
      if(modal != ''){
        $('#'+modal).modal('show');
      }
      $('#'+table).DataTable().destroy();
      $('#'+table).DataTable({
      "processing": true,
      "serverSide": true,
      "order": [],
      "ajax": {
        "url": "<?= site_url('services/getDetail'); ?>",
        "type": "POST",
        "data":{
          "id_service":id_service,
          'display':$num,
        }
      },
      "columnDefs": [{

        "targets": [0],
        "orderable": false
      }]

    });
    }
    $('#btnMember').on('click',function(){
      $('#modal_member').modal('show');
      $('#memberData').DataTable({
      "processing": true,
      "serverSide": true,
      "order": [],
      "ajax": {
        "url": "<?= site_url('member/getListMember'); ?>",
        "type": "POST"
      },
      "columnDefs": [{

        "targets": [0],
        "orderable": false
      }]

    });
    });

    $('#dataMember').on('click','.pilih',function(){
      console.log('woyo');
      id = $(this).data('id_member');
      $.ajax({
        url: '<?= site_url('member/getData') ?>',
        type: 'post',
        data: {
          id_member:id,
        },
        dataType: 'json',
        success: function(result) {
          
          $('#id_member').val(id);
          $('#nama_member').val(result.nama_member);
          $('#jenis_mobil').val(result.jenis_mobil);
          $('#plat_nomor').val(result.plat_nomor);
          $('#alamat').val(result.alamat);
          $('#modal_member').modal('hide');
        }
      });
    });
  
  $('#btnTmbh').on('click',function(){
    $('#myData').DataTable().ajax.reload();
    nb = $('#nama_barang').val();
    jml = $('#jumlah_barang').val();
    hrg = $('#harga').val();
    thrg = $('#total_harga').val();
    id_service = $('#id_service').val();
    $.ajax({
        url: '<?= site_url('services/tambahBarang') ?>',
        type: 'post',
        data: {
          id_service:id_service,
          nama_barang:nb,
          jumlah_barang:jml,
          harga:hrg,
          total_harga:thrg,
        },
        dataType: 'json',
        success: function(result) {
          $('#detailData').DataTable().ajax.reload();
          if (result.status == false) {
            toastr['error'](result.pesan);
          } else if (result.status == true) {
            $('#nama_barang').val('');
            $('#jumlah_barang').val('');
            $('#harga').val('');
            $('#total_harga').val('');
            toastr['success'](result.pesan);
          }
        }
      });
  });

  $('#dataDetail').on('click',
      '.hapus',
      function() {
        id = $(this).data('id_service_detail');
        if(confirm("Apakah anda yakin menghapus barang ini?")){
          $.ajax({
            url:'<?= site_url('services/hapusBarang'); ?>',
            type:'post',
            dataType:'json',
            data:{
              id:id,
              aksi:'hapus',
            },success:function(data){
              $('#detailData').DataTable().ajax.reload();
              if (result.status == false) {
                toastr['error'](result.pesan);
              } else if (result.status == true) {
                toastr['success'](result.pesan);
              }
              $('#detailData').DataTable().ajax.reload();
            }
          });
        }
      });
      $('#myData').on('click','.print',function(){
        id = $(this).data('id_service');
        console.log(id);
        $.ajax({
            url: '<?= site_url('services/getPrint') ?>',
            type: 'get',
            data: {
              id:btoa(id),
            },
            dataType: 'json',
            success: function(result) {
              $('#printView').html(result);
            }
        });
        // $('#printView').html();
      });
  });
  function hitungTotal(){
    jml = $('#jumlah_barang').val();
    hrg = $('#harga').val();
    thrg = jml*hrg;
    $('#total_harga').val(thrg);
  }
  
</script>