<!-- modal -->
<div class="modal fade" id="modal" tabindex="-1" role="dialog" aria-labelledby="myExtraLargeModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Tambah</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <form id="form">
                <div class="modal-body">
                    <div class="form-group">
                        <label for="title">Nama Member</label>
                        <input type="text" name="nama_member" id="nama_member" class="form-control form-control-sm" placeholder="Nama Member" required>
                    </div>
                    <div class="form-group">
                        <label for="icon">Jenis Mobil</label>
                        <input type="text" name="jenis_mobil" id="jenis_mobil" class="form-control icp icp-auto" placeholder="Masukan Jenis Mobil" required>

                    </div>
                    <div class="form-group">
                        <label for="plat_nomor">Plat Nomor</label>
                        <input type="text" name="plat_nomor" id="plat_nomor" class="form-control form-control-sm" placeholder="Masukan Plat Nomor Kendaraan" required>
                    </div>
                    <div class="form-group">
                        <label for="alamat">Alamat</label>
                        <input type="text" name="alamat" id="alamat" class="form-control form-control-sm" placeholder="Masukan Alamat Member" required>
                    </div>
                    <div class="form-group">
                        <label for="nomor_telepon">Nomor Telepon</label>
                        <input type="text" name="nomor_telepon" id="nomor_telepon" class="form-control form-control-sm" placeholder="Masukan Nomor Telepon Member" required>
                    </div>
                    <div id="add">
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Tutup</button>
                    <button type="submit" class="btn btn-primary" id="btn">Tambah</button>
                </div>
            </form>
        </div>
    </div>
</div>
<style>
    select {
        font-family: 'FontAwesome', 'sans-serif';
    }
</style>