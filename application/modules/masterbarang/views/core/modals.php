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
                        <label for="title">Kode Barang</label>
                        <input type="text" name="kode_barang" id="kode_barang" class="form-control form-control-sm" placeholder="Masukan Kode Barang" required>
                    </div>
                    <div class="form-group">
                        <label for="icon">Nama Barang</label>
                        <input type="text" name="nama_barang" id="nama_barang" class="form-control icp icp-auto" placeholder="Masukan Nama Barang" required>

                    </div>
                    <div class="form-group">
                        <label for="icon">Harga Barang</label>
                        <input type="text" name="harga" id="harga" class="form-control icp icp-auto" placeholder="Masukan Harga Barang" required>

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