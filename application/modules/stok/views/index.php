<div class="content-header">
  <div class="container-fluid">
    <div class="row mb-2">
      <div class="col-sm-6">
        <h1 class="m-0 text-dark"><?= $title ?></h1>
      </div>
    </div>
  </div>
</div>
<section class="content">
  <div class="container-fluid">
    <div class="row">
      <div class="col-md-12">
        <div class="card card-primary card-outline">
          <div class="card-header">
            <h3 class="card-title">
              <i class="fas fa-edit"></i>
              Stok Barang Management
            </h3>
            <br>
            <hr>
          </div>
          <div class="card-body pad table-responsive">
            <table class="table table-bordered table-sm dt-responsive nowrap" id="myData" width="100%">
              <thead>
                <tr>
                  <th width="5%">No</th>
                  <th>Kode Barang</th>
                  <th>Nama Barang</th>
                  <th>Stok Awal Barang</th>
                  <th>Barang Masuk</th>
                  <th>Barang Keluar</th>
                  <th>Stok Akhir Barang</th>
                  <th>Harga Barang</th>
                </tr>
              </thead>
              <tbody id="data">
              </tbody>
            </table>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>