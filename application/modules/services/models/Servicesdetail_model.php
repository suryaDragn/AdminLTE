<?php
defined('BASEPATH') or exit('No direct script access allowed');
class Servicesdetail_model extends CI_Model
{
  public $table;
  public $id;
  public $column_order;
  public $column_search;
  public $order;
  function __construct() {
    $this->table = 'service_detail';
    $this->id = 'id_service_detail';
    $this->column_order = array(null,'nama_barang','harga', 'jumlah', 'total_harga');
    $this->column_search = array('nama_barang','harga', 'jumlah', 'total_harga');
    $this->order = array('id_service_detail' => 'desc');
  }
  public function getRows($postData) {
    $this->_get_datatables_query($postData);
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

  public function countFiltered($postData) {
    $this->_get_datatables_query($postData);
    $query = $this->db->get();
    return $query->num_rows();
  }

  private function _get_datatables_query($postData) {
    $this->db->from($this->table);
    $this->db->where('id_service',$postData['id_service']);
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
    // print_r($data);
    unset($data['aksi']);
    $this->db->insert($this->table, $data);
    $insert_id = $this->db->insert_id();
    $data = [
      'insert_id' => $insert_id,
      'status' => true,
      'pesan' => "Data Barang Berhasil Ditambah"
    ];

    return $data;
  }
  public function edit() {
    $data = $_POST;
    unset($data['aksi']);
    if(!empty($data['id_service']) ){
      $data['id'] = $data['id_service'];
      unset($data['id_service']);
    }
    $id = $data['id'];
    $this->db->where($this->id, $data['id']);
    unset($data['id']);

    $this->db->update($this->table, $data);

    $data = [
      'insert_id' => $id,
      'status' => true,
      'pesan' => "Data Barang Berhasil diubah"
    ];

    return $data;
  }
  public function hapus() {
    $id = $_POST['id'];

    $this->db->where($this->id, $id);
    $this->db->delete($this->table);

    $data = [
      'status' => true,
      'pesan' => "Data Barang Berhasil Dihapus"
    ];

    return $data;
  }
  public function changeActive(){
    $data = $_POST;
    $this->db->where($this->id, $data['id_member']);
    $this->db->update($this->table,['is_active' => $data['is_active']]);
    $data = [
      'status' => true,
      'pesan' => "Data Barang Berhasil ".($data['is_active'] == 1)?"diaktifkan":"dinonaktifkan",
    ];

    return $data;
  }
  public function getData(){
    $this->db->select('*');
    $this->db->from($this->table." as s");
    $this->db->join('member m','s.id_member = m.id_member');
    $this->db->where($this->id,$_POST['id_service']);
    $data = $this->db->get()->row();
    return $data;
  }
}?>