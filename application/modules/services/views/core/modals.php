<!-- modal -->
<div class="modal fade" id="modal" tabindex="-1" role="dialog" aria-labelledby="myExtraLargeModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-xl">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Tambah</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form id="form">
                <div class="modal-body header">
                    <input type="hidden" id="id_service" name="id_service">
                    <input type="hidden" id="id_member" name="id_member">
                <div class="form-group">
                        <label for="icon">Tanggal Service</label>
                        <input type="date" name="tanggal" id="tanggal" class="form-control icp icp-auto" placeholder="Masukan tanggal" required>
                    </div>
                    <div class="form-group">
                        <label for="title">Nama Member</label>
                        <div class="input-group input-group-sm mb-3">
                            <div class="input-group-prepend">
                                <button id="btnMember" class="btn btn-outline-secondary" type="button">Pilih Member</button>
                            </div>
                            <input type="text" disabled name="nama_member" id="nama_member" class="form-control form-control-sm" placeholder="Nama Member" required>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="icon">Jenis Mobil</label>
                        <input type="text" disabled name="jenis_mobil" id="jenis_mobil" class="form-control icp icp-auto" placeholder="Masukan Jenis Mobil" required>

                    </div>
                    <div class="form-group">
                        <label for="plat_nomor">Plat Nomor</label>
                        <input type="text" disabled name="plat_nomor" id="plat_nomor" class="form-control form-control-sm" placeholder="Masukan Plat Nomor Kendaraan" required>
                    </div>
                    <div class="form-group">
                        <label for="alamat">Alamat</label>
                        <input type="text" disabled name="alamat" id="alamat" class="form-control form-control-sm" placeholder="Masukan Alamat Member" required>
                    </div>
                    <div id="add">
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Tutup</button>
                    <button type="submit" class="btn btn-primary" id="btn">Simpan</button>
                </div>
            </form>
            <form id="form_detail">
                <div class="modal-body detail">
                    <!-- <div class="card"> -->
                        <div class="row">
                            <div class="col-3">
                                <div class="form-group">
                                    <label for="title">Nama Barang</label>
                                    <input type="text" name="nama_barang" id="nama_barang" class="form-control form-control-sm" placeholder="Nama Barang" required>
                                </div>
                            </div>
                            <div class="col-3">
                                <div class="form-group">
                                    <label for="title">Jumlah Barang</label>
                                    <input type="text" name="jumlah_barang" id="jumlah_barang" class="form-control form-control-sm" placeholder="Jumlah Barang" required>
                                </div>
                            </div>
                            <div class="col-3">
                                <div class="form-group">
                                    <label for="title">Harga</label>
                                    <input type="text" name="harga" id="harga" class="form-control form-control-sm" placeholder="Harga" required>
                                </div>
                            </div>
                            <div class="col-3">
                                <div class="form-group">
                                    <label for="title">Simpan Data</label>
                                    <input type="submit" class="form-control form-control-sm btn btn-primary" id="btnTmbh" value="Simpan">
                                </div>
                            </div>
                        </div>
                    <!-- </div> -->
                    
                </div>
            </form>
        </div>
    </div>
</div>
<div class="modal fade" id="modal_member" tabindex="-1" role="dialog" aria-labelledby="myExtraLargeModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-xl">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Daftar Member</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="card-body pad table-responsive">
                    <table class="table table-bordered table-sm dt-responsive nowrap" id="memberData" width="100%">
                    <thead>
                        <tr>
                        <th width="5%">Aksi</th>
                        <th>Nama Member</th>
                        <th width="10%">Jenis Mobil</th>
                        <th width="5%">Plat Nomor</th>
                        <th width="10%">Alamat</th>
                        <th width="5%">Nomor Telepon</th>
                        </tr>
                    </thead>
                    <tbody id="dataMember">
                    </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
<style>
    select {
        font-family: 'FontAwesome', 'sans-serif';
    }
</style>