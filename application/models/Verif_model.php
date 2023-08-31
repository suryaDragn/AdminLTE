<?php
defined('BASEPATH') or exit('No direct script access allowed');
require_once BASEPATH . "core/Model.php";
class Verif_model extends CI_Model
{
  public function __construct() {
    parent::__construct();
  }

  public function getCount($mac){
    $c = $this->db->get_where("tbl_verifikasi",['mac_address' => $mac])->num_rows();
    return $c;
  }
  public function getVerif($mac){
    return $this->db->get_where("tbl_verifikasi",['mac_address' => $mac,'verifikasi !=' =>  null])->num_rows();
}
  public function setVerifikasi($mac){
    $c = $this->db->get_where("tbl_verifikasi",['mac_address' => $mac])->num_rows();
    print_r($c);
    if($c < 1){
      var_dump("Setverif");
      $data = [
        'mac_address' => $mac,
      ];
      $this->db->insert("tbl_verifikasi", $data);
      return true;
    }
    return false;
  }
  public function getVerifed($mac){
		return $this->db->get_where("tbl_verifikasi",['mac_address' => $mac,'verifikasi ' =>  md5($mac)])->num_rows();
	}
}