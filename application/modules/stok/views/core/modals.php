<!-- modal -->
<div class="modal fade" id="modal"  role="dialog" aria-labelledby="myExtraLargeModalLabel" aria-hidden="true">
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
                        <label for="title">Tanggal Barang Masuk</label>
                        <input type="datetime-local" name="tanggal" id="tanggal" class="form-control form-control-sm" placeholder="Masukan Tanggal Opname" required>
                    </div>
                    <div class="form-group">
                        <label for="title">Barang</label>
                        <!-- <input type="text" name="kode_barang" id="kode_barang" class="form-control form-control-sm" placeholder="Masukan Kode Barang" required> -->
                        <select name="id_barang" id="id_barang" class="form-control form-control-sm" required>
                            <option> -- Pilih Barang -- </option>
                            <?php 
                                foreach($listBarang as $row){
                                    echo  "<option value='".$row['id_barang']."'> ".$row['kode_barang']." | ".$row['nama_barang']." </option>";
                                }
                            ?>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="title">Jumlah Barang</label>
                        <input type="number" min="0" name="jumlah_barang" id="jumlah_barang" class="form-control form-control-sm" placeholder="Masukan Jumlah Barang" required>
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
