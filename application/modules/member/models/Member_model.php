<?php
defined('BASEPATH') or exit('No direct script access allowed');
class Member_model extends CI_Model
{
  public $table;
  public $id;
  public $column_order;
  public $column_search;
  public $order;
  function __construct() {
    $this->table = 'member';
    $this->id = 'id_member';
    $this->column_order = array(null, 'nama_member', 'jenis_mobil', null, null, null, null);
    $this->column_search = array('nama_member','jenis_mobil','nomor_telepon');
    $this->order = array('id_member' => 'asc');
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
    $cek = $this->db->get_where($this->table, ['plat_nomor' => $data['plat_nomor']])->row();
    if ($cek) {
          $hasil['status'] = false;
          $hasil['pesan'] = "Plat Nomor sudah Terpakai";
          return $hasil;
    }
    $this->db->insert($this->table, $data);

    $data = [
      'status' => true,
      'pesan' => "Data Menu Berhasil Ditambah"
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
      'pesan' => "Data Menu Berhasil diubah"
    ];

    return $data;
  }
  public function hapus() {
    $id = htmlspecialchars($_POST['id']);

    $this->db->where($this->id, $id);
    $this->db->update($this->table,['is_active' => 0]);

    $data = [
      'status' => true,
      'pesan' => "Data Menu Berhasil Dihapus"
    ];

    return $data;
  }
  public function hapus2() {
    $id = htmlspecialchars($_POST['id']);

    $this->db->where($this->id, $id);
    $this->db->delete($this->table);

    $data = [
      'status' => true,
      'pesan' => "Data Menu Berhasil Dihapus"
    ];

    return $data;
  }
  public function changeActive(){
    $data = $_POST;
    $this->db->where($this->id, $data['id_member']);
    $this->db->update($this->table,['is_active' => $data['is_active']]);
    $data = [
      'status' => true,
      'pesan' => "Data Menu Berhasil ".($data['is_active'] == 1)?"diaktifkan":"dinonaktifkan",
    ];

    return $data;
  }
  public function getData(){
    $this->db->select('*');
    $this->db->from($this->table);
    $this->db->where($this->id,$_POST['id_member']);
    $data = $this->db->get()->row();
    return $data;
  }
}?>