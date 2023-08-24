<?php
defined('BASEPATH') or exit('No direct script access allowed');
class Masterbarang_model extends CI_Model
{
  public $table;
  public $id;
  public $column_order;
  public $column_search;
  public $order;
  function __construct() {
    $this->table = 'master_barang';
    $this->id = 'id_barang';
    $this->column_order = array(null,'kode_barang', 'nama_barang',  null);
    $this->column_search = array('kode_barang', 'nama_barang');
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

  public function countAll() {
    $this->db->from($this->table);
    return $this->db->count_all_results();
  }

  public function countFiltered($postData,$role) {
    $this->_get_datatables_query($postData,$role);
    $query = $this->db->get();
    return $query->num_rows();
  }

  private function _get_datatables_query($postData,$role) {
    $this->db->from($this->table);
    if($role != 1){
      $this->db->where('is_active',1);
    }
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
    $data['is_active'] = 1;
    unset($data['aksi']);
    $cek = $this->db->get_where($this->table, ['kode_barang' => $data['kode_barang']])->row();
    if ($cek) {
          $hasil['status'] = false;
          $hasil['pesan'] = "Kode Barang sudah Terpakai";
          return $hasil;
    }
    $this->db->insert($this->table, $data);

    $data = [
      'status' => true,
      'pesan' => "Data Master Barang Berhasil Ditambah"
    ];

    return $data;
  }
  public function edit() {
    $data = $_POST;
    $data['is_active'] = 1;
    unset($data['aksi']);
    $this->db->where($this->id, $data['id']);
    unset($data['id']);

    $this->db->update($this->table, $data);

    $data = [
      'status' => true,
      'pesan' => "Data Master Barang Berhasil diubah"
    ];

    return $data;
  }
  public function hapus() {
    $id = htmlspecialchars($_POST['id']);

    $this->db->where($this->id, $id);
    $this->db->update($this->table,['is_active' => 0]);

    $data = [
      'status' => true,
      'pesan' => "Data Master Barang Berhasil Dihapus"
    ];

    return $data;
  }
  public function changeActive(){
    $data = $_POST;
    $this->db->where($this->id, $data['id_barang']);
    $this->db->update($this->table,['is_active' => $data['is_active']]);
    $data = [
      'status' => true,
      'pesan' => "Data Master Barang Berhasil ".($data['is_active'] == 1)?"diaktifkan":"dinonaktifkan",
    ];

    return $data;
  }
  public function getData(){
    $this->db->select('*');
    $this->db->from($this->table);
    $this->db->where($this->id,$_POST['id_barang']);
    $data = $this->db->get()->row();
    return $data;
  }
}?>