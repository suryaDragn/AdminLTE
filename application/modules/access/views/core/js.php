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
              submenu = '<li class="nav-item ml-2" data-url="' + data[i].submenu[j].url + '">' +
              '<a href="#' + data[i].submenu[j].url + '" class="nav-link">' +
              '<i class="' + data[i].submenu[j].icon + ' nav-icon"></i>' +
              '<p>' + data[i].submenu[j].title + '</p>' +
              '</a>' +
              '</li>';
              sub += submenu;
            }
            menu_href = '';
          }
          menu += '<li class="nav-item has-treeview">' +
          '<a href="#'+menu_href+'" class="nav-link">' +
          '<i class="nav-icon ' + data[i].icon + '"></i>' +
          '<p>' +
          data[i].title ;
          if(sub != ''){
            menu +=
            '<i class="right fas fa-angle-left"></i>' +
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
        // $('.submenu').on('click', '.nav-item', function() {
        //   url = $(this).data('url');
        //   $('#show_data').load('<?= site_url() ?>' + '/' + url);
        // });
        $('.submenu').on('click', 'li', function() {
          link = $(this).data('url');
          $.ajax({
            url: '<?= site_url() ?>' + link,
            type: 'get',
            success: function(data) {
              $('#show_data').html(data);
            },
            error: function(status) {
              let html = '<section class="content">' +
              '<div class="d-flex justify-content-center align-items-center mt-20" id="mnsn">' +
              '<h1 class="mr-3 pr-3 mt-20 align-top border-right inline-block align-content-center">' + status.status + '</h1>' +
              '<div class="inline-block align-middle">' +
              '<h2 class="font-weight-normal lead" id="desc">' + status.statusText + '</h2>' +
              '</div>' +
              '</div>' +
              '</section>';
              // console.log(status.status);
              $('#show_data').html(html);
            }
          })
        });
        $('.nav-item').on('click', 'a', function() {
          link = $(this).attr('href');
          link = link.substring(1,link.length);
          if(link.length > 0){
            $.ajax({
              url: '<?= site_url() ?>' + link,
              type: 'get',
              success: function(data) {
                $('#show_data').html(data);
              },
              error: function(status) {
                let html = '<section class="content">' +
                '<div class="d-flex justify-content-center align-items-center mt-20" id="mnsn">' +
                '<h1 class="mr-3 pr-3 mt-20 align-top border-right inline-block align-content-center">' + status.status + '</h1>' +
                '<div class="inline-block align-middle">' +
                '<h2 class="font-weight-normal lead" id="desc">' + status.statusText + '</h2>' +
                '</div>' +
                '</div>' +
                '</section>';
                // console.log(status.status);
                $('#show_data').html(html);
              }
            })
          }
        });
      }
      });
    }
    $('#data').on('click',
      '.cek',
      function() {
        id_role = $(this).data('id_role');
        id_menu = $(this).data('id_menu');
        $.ajax({
          url: '<?= site_url('access/aksi') ?>',
          type: 'post',
          data: {
            id_role: id_role,
            id_menu: id_menu
          },
          dataType: 'json',
          success: function(result) {
            show_data();
            if (result == true) {
              toastr['success']('Access Diberikan')
            } else {
              toastr['error']('Access Dihapus')
            }

          }
        });
      });
  });
</script>