<?php
defined('BASEPATH') or exit('No direct script access allowed');
class Stok_model extends CI_Model
{
  public $table;
  public $id;
  public $column_order;
  public $column_search;
  public $order;
  function __construct() {
    $this->table = 'master_barang';
    $this->id = 'id_barang';
    $this->column_order = array(null,'tanggal','kode_barang', 'nama_barang','jumlah_barang',  null);
    $this->column_search = array('tanggal','kode_barang', 'nama_barang','jumlah_barang');
    $this->order = array('id_barang' => 'asc');
  }
  public function getRows($postData,$role) {
    $this->_get_datatables_query($postData,$role);
    if ($postData['length'] != -1) {
      $this->db->limit($postData['length'], $postData['start']);
    }
    $query = $this->db->get();
    return $query->result();
  }
  public function subquery(){
    $subquery = $this->db->select(
      "mb.*, mso.tanggal_stok_opname,
      CASE 
          WHEN tanggal_stok_opname IS NOT NULL THEN 
              (SELECT jumlah_barang FROM stokopname WHERE id_barang = mb.id_barang AND tanggal = mso.tanggal_stok_opname) 
          ELSE 0 
      END AS stok_awal,
      COALESCE(
          (SELECT SUM(jumlah_barang) FROM barang_masuk WHERE id_barang = mb.id_barang AND tanggal > tanggal_stok_opname GROUP BY id_barang), 
          0
      ) AS stok_masuk,
      COALESCE(
          (SELECT SUM(COALESCE(jumlah_barang, 0)) FROM service_detail sd INNER JOIN services s ON sd.id_service = s.id_service WHERE id_barang = mb.id_barang AND tanggal > tanggal_stok_opname GROUP BY id_barang), 
          0
      ) AS stok_keluar"
  )
  ->from("master_barang mb")
  ->join(
      "(SELECT MAX(tanggal) AS tanggal_stok_opname, id_barang, kode_barang FROM stokopname GROUP BY id_barang, kode_barang) AS mso",
      "mb.id_barang = mso.id_barang",
      "left"
  )
  ->get_compiled_select();
  return $subquery;
  }
  public function countAll() {
    $subquery = $this->subquery();
    $this->db->from("($subquery) as stok")
    ->select('stok.*, stok.stok_awal + stok.stok_masuk - stok.stok_keluar AS stok_akhir', FALSE);
    return $this->db->count_all_results();
  }

  public function countFiltered($postData,$role) {
    $this->_get_datatables_query($postData,$role);
    $query = $this->db->get();
    return $query->num_rows();
  }

  private function _get_datatables_query($postData,$role) {
    $subquery = $this->subquery();
    $this->db->from("($subquery) as stok")
    ->select('stok.*, stok.stok_awal + stok.stok_masuk - stok.stok_keluar AS stok_akhir', FALSE);

    $i = 0;
    foreach ($this->column_search as $item) {
      if ($postData['search']['value']) {
        if ($i === 0) {
          $this->db->group_start();
          $this->db->like($item, $postData['search']['value']);
        } else {
          $this->db->or_like($item, $postData['search']['value']);
        }
        if (count($this->column_search) - 1 == $i) {
          $this->db->group_end();
        }
      }
      $i++;
    }
    if (isset($postData['order'])) {
      $this->db->order_by($this->column_order[$postData['order']['0']['column']], $postData['order']['0']['dir']);
    } else if (isset($this->order)) {
      $order = $this->order;
      $this->db->order_by(key($order), $order[key($order)]);
    }
  }
  public function tambah() {
    $data = $_POST;
    $detailBarang = $this->db->get_where('master_barang',['id_barang' => $data['id_barang']])->row_array();
    $data['kode_barang'] = $detailBarang['kode_barang'];
    unset($data['aksi']);
    // var_dump($data['tanggal']);
    // $tgl = str_replace("T"," ",$data['tanggal']);
    // var_dump($tgl);
    // var_dump(strtotime($data['tanggal']));
    // var_dump(strtotime($tgl));
    // exit;
  //   $cek = $this->db->get_where($this->table, [
  //     'kode_barang' => $data['kode_barang'],
  //     "DATE_FORMAT(tanggal, '%Y-%m-%d') =" => date('Y-m-d', strtotime($data['tanggal']))
  // ])->row();
    // if ($cek) {
    //       $hasil['status'] = false;
    //       $hasil['pesan'] = "Kode Barang sudah di Barang tanggal itu";
    //       return $hasil;
    // }
    $this->db->insert($this->table, $data);

    $data = [
      'status' => true,
      'pesan' => "Data Barang Berhasil Ditambah"
    ];

    return $data;
  }
  public function edit() {
    $data = $_POST;
    unset($data['aksi']);
    $this->db->where($this->id, $data['id']);
    unset($data['id']);

    $this->db->update($this->table, $data);

    $data = [
      'status' => true,
      'pesan' => "Data Barang Berhasil diubah"
    ];

    return $data;
  }
  public function hapus() {
    $id = htmlspecialchars($_POST['id']);

    $this->db->where($this->id, $id);
    $this->db->delete($this->table);

    $data = [
      'status' => true,
      'pesan' => "Data Barang Berhasil Dihapus"
    ];

    return $data;
  }
  public function getData(){
    $this->db->select('*');
    $this->db->from($this->table);
    $this->db->where($this->id,$_POST['id_barang_masuk']);
    $data = $this->db->get()->row();
    return $data;
  }
  public function getBarang(){
    $this->db->from("master_barang");
    return $this->db->get()->result_array();
  }
}?>