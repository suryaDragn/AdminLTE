<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Regis extends MY_Controller
{

    public function __construct() {
        if ($this->session->userdata('role')) {
            redirect('home');
        }
        parent::__construct();
        $this->load->model('auth/auth_model', 'model');
        $this->load->library('form_validation');
    }

  public function index() {
    $this->form_validation->set_rules($this->model->rulesRegis());

    if ($this->form_validation->run()) {
      $this->model->check($this->mac);
    } else {
      regis('index');
    }
  }
  public function verif(){
    $c = $this->model->getVerif($this->mac);
    $cl = $this->model->getLive($this->mac);
    if($c != 0 & $cl != 0){
      redirect("auth");
    }elseif($cl == 1){
      $this->model->verifLokal($this->mac);
      redirect("auth");
    }else{
      regis("wait");
    }
  }

  public function logout() {
    $this->session->unset_userdata('user');
    $this->session->unset_userdata('role');
    $this->session->unset_userdata('id');
    $this->session->sess_destroy();
    redirect('home');
  }

}