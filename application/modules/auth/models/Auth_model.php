<?php
defined('BASEPATH') or exit('No direct script access allowed');
class Auth_model extends CI_Model
{
  public $table;
  public $id;
  public function __construct() {
    parent::__construct();
    $this->table = "user";
    $this->id = "id_user";
  }
  public function rules() {
    return [
      [
        'field' => 'user',
        'label' => 'Username',
        'rules' => 'trim|required',
        'errors' => [
          'required' => 'Field %s Tidak Boleh Kosong'
        ]
      ],
      [
        'field' => 'pass',
        'label' => 'Password',
        'rules' => 'trim|required',
        'errors' => [
          'required' => 'Field %s Tidak Boleh Kosong'
        ]
      ]

    ];
  }
  public function rulesRegis() {
    return [
      [
        'field' => 'user',
        'label' => 'Username',
        'rules' => 'trim|required',
        'errors' => [
          'required' => 'Field %s Tidak Boleh Kosong'
        ]
      ],
    ];
  }
  public function login() {
    $user = htmlspecialchars($_POST['user']);
    $pass = htmlspecialchars($_POST['pass']);
    $cek = $this->db->get_where('user', ['username' => $user])->row();
    if ($cek) {
      if ($cek->is_active == 0) {
        $this->session->set_flashdata('pesan', '<div class="alert alert-danger text-center" role="alert">
                Akun anda belum diaktivasi silahkan hubungi admin
              </div>');
        redirect('auth');
      }
      // exit;
      if (md5($pass) == $cek->password) {
        $data = [
          'user' => $cek->username,
          'role' => $cek->id_role,
          'id' => $cek->id_user
        ];
        $this->session->set_userdata($data);
        $this->session->set_flashdata('pesan', '<div class="alert alert-success text-center" role="alert">
                Selamat datang ' . $cek->username . ' !!!
              </div>');
        redirect('admin');
      }
      $this->session->set_flashdata('pesan', '<div class="alert alert-danger text-center" role="alert">
            Username atau Password salah !!!
          </div>');
      redirect('auth');
    }
    $this->session->set_flashdata('pesan', '<div class="alert alert-danger text-center" role="alert">
        Username atau Password salah !!!
      </div>');
    redirect('auth');
  }
  public function check($mac){
    $post = $_POST;
    if(!empty($this->dblive)){
      $this->dblive->from("verif");
      $this->dblive->where([
        'username' => $post['user'],
        'mac_address' => $mac,
        'key_verif' => 1
      ]);
      $data = $this->dblive->get()->result();
      if(empty($data)){
        // insert local + live
        $this->db->insert("tbl_verifikasi",['mac_address'=>$mac]);
        $this->dblive->insert("verif",[
          'username'=>$post['user'],
          'mac_address' => $mac,
        ]);
      }else{
        // cek local
        $this->db->from("tbl_verifikasi");
        $this->db->where([
          'mac_address' => $mac,
          'verifikasi' => md5($mac)
        ]);
        $dataLokal = $this->db->get()->result();
        if(empty($dataLokal)){
          $this->db->insert("tbl_verifikasi",['mac_address'=>$mac]);
        }
      }
      redirect("regis");
    }
    $this->session->set_flashdata('pesan', '<div class="alert alert-danger text-center" role="alert">
        Hubungkan Dengan Internet untuk registrasi.
      </div>');
    redirect("regis");
  }
  public function getVerif($mac){
      return $this->db->get_where("tbl_verifikasi",['mac_address' => $mac,'verifikasi ' =>  md5($mac)])->num_rows();
  }
  public function getLive($mac){
    if(!empty($this->dblive)){
      return $this->dblive->get_where("verif",['mac_address' => $mac,'key_verif !=' =>  null])->num_rows();
    }
    return $this->getVerif($mac);
  }
  public function verifLokal($mac){
    $this->db->where(['mac_address' => $mac,]);
    $this->db->update("tbl_verifikasi",['verifikasi' => md5($mac)]);
    return true;
  }
}