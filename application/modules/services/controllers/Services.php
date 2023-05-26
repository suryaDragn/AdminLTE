<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Services extends MY_Controller
{

	public function __construct()
	{
		if (!$this->session->userdata('role')) {
			redirect('auth');
		}
		if ($this->session->userdata('role')) {
			$this->db->select('*');
			$this->db->from('user_access');
			$this->db->join('user_menu', 'user_access.id_menu=user_menu.id_menu', 'inner');
			$this->db->where('user_access.id_role', $this->session->userdata('role'));
			$this->db->where('user_menu.url', 'services');
			$access = $this->db->get()->result();
			if (!$access) {
				redirect('page');
			}
		}
		parent::__construct();
		$this->load->model('services_model', 'model');
	}

	public function index()
	{
		// $sicon = $this->model->get_icon();
		$data = [
			'title' => 'Riwayat Servis',
			'role' => $this->session->userdata('role'), 
			// 'icons' => $sicon
		];

		$this->load->view('_layout/admin/head', $data);
		$this->load->view('core/js', $data);
		$this->load->view('core/modals', $data);
		$this->load->view('index', $data);
	}
    public function getList(){
        $data = array();
		$menu = $this->model->getRows($_POST);
		$i = $_POST['start'];
		foreach ($menu as $d) {
			$i++;
			$btn_detail = '<button type="button" class="btn btn-success btn-xs detail" data-id_member="'.$d->id_member.'"><i class="fas fa-fw fa-pen"></i> Detail</button>';
            $btn_print = '<button type="button" class="btn btn-warning btn-xs print" data-id_member="'.$d->id_member.'"><i class="fas fa-fw fa-print"></i> Print</button>';
			$btn_hapus = '<button  type="button" class="btn btn-danger btn-xs hapus"  data-id_member="' . $d->id_member . '"><i class="fas fa-fw fa-trash"></i> Hapus</button>';
            if($this->session->userdata('role') == '1'){
				$data[] = array($i,date('d M Y',strtotime($d->tanggal)), $d->nama_member, $d->jenis_mobil,$d->plat_nomor, $d->alamat, $btn_detail .' '.$btn_print. ' ' . $btn_hapus);
            }else{
                $data[] = array($i,date('d M Y',strtotime($d->tanggal)), $d->nama_member, $d->jenis_mobil,$d->plat_nomor, $d->alamat, $btn_detail .' '.$btn_print);
            }
		}

		$output = array(
			"draw" => $_POST['draw'],
			"recordsTotal" => $this->model->countAll(),
			"recordsFiltered" => $this->model->countFiltered($_POST,$this->session->userdata('role')),
			"data" => $data,
		);
		echo json_encode($output);
    }
	public function getData(){
		$data = $this->model->getData();
		echo json_encode($data);
	}
	public function aksi()
	{
		if ($_POST['aksi'] == 'tambah') {
			$data = $this->model->tambah();
			echo json_encode($data);
		} else if ($_POST['aksi'] == 'edit') {
			$data = $this->model->edit();
			echo json_encode($data);
		} else if ($_POST['aksi'] == 'hapus') {
			$data = $this->model->hapus();
			echo json_encode($data);
		}
	}
	public function changeActive(){
		$data = $this->model->changeActive();
		echo json_encode($data);
	}

}
?>