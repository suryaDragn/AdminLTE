<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

/* load the MX_Router class */
require APPPATH . "third_party/MX/Controller.php";

class MY_Controller extends MX_Controller
{	
public $mac;
	function __construct() 
	{
		parent::__construct();
		$this->_hmvc_fixes();
		$this->load->model('verif_model');
		$this->getVerifikasi();
	}
	
	function _hmvc_fixes()
	{		
		//fix callback form_validation		
		//https://bitbucket.org/wiredesignz/codeigniter-modular-extensions-hmvc
		$this->load->library('form_validation');
		$this->form_validation->CI =& $this;
	}
	private function getVerifikasi(){
		$mac = substr(exec("getmac"),0,17);
		$this->mac = $mac;
		$c = $this->verif_model->getVerifed($mac); 
		if($c == 0){
			// echo $mac;
			$count  = $this->verif_model->getCount($mac);
			$cv = $this->verif_model->getVerif($mac);
			if($count == 0){
				if(uri_string() != 'regis'){
					redirect("regis");
				}
			}elseif($cv == 0){
				if(uri_string() != 'regis/verif'){
					  redirect("regis/verif");
				}
				  return true;
			}
		}
	  }
	  

}

/* End of file MY_Controller.php */
/* Location: ./application/core/MY_Controller.php */
