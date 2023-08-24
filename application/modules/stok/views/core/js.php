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
    $('#myData').DataTable({
      "processing": true,
      "serverSide": true,
      "order": [],
      "ajax": {
        "url": "<?= site_url('stok/getList'); ?>",
        "type": "POST"
      },
      "columnDefs": [{

        "targets": [0],
        "orderable": false
      }]

    });

    
    
  });
</script>