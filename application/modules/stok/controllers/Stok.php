<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Stok
 extends MY_Controller
{

	public function __construct()
	{
		if (!$this->session->userdata('role')) {
			redirect('auth');
		}
		if ($this->session->userdata('role')) {
			$this->db->select('*');
			$this->db->from('user_access');
			$this->db->join('user_submenu', 'user_access.id_menu=user_submenu.id_menu', 'inner');
			$this->db->where('user_access.id_role', $this->session->userdata('role'));
			$this->db->where('user_submenu.url', 'stok');
			$access = $this->db->get()->result();
			if (!$access) {
				redirect('page');
			}
		}
		parent::__construct();
		$this->load->model('stok_model', 'model');
	}

	public function index()
	{
		// $sicon = $this->model->get_icon();
		$data = [
			'title' => 'Stok Barang',
			'role' => $this->session->userdata('role'), 
			'listBarang' => $this->model->getBarang(),
			// 'icons' => $sicon
		];

		$this->load->view('_layout/admin/head', $data);
		$this->load->view('core/js', $data);
		$this->load->view('core/modals', $data);
		$this->load->view('index', $data);
	}
    public function getList(){
        $data = array();
		$menu = $this->model->getRows($_POST,$this->session->userdata('role'));
		$i = $_POST['start'];
		foreach ($menu as $d) {
			$i++;
				$data[] = array($i, $d->kode_barang, $d->nama_barang,$d->stok_awal,$d->stok_masuk,$d->stok_keluar,$d->stok_akhir,$d->harga);
		}

		$output = array(
			"draw" => $_POST['draw'],
			"recordsTotal" => $this->model->countAll(),
			"recordsFiltered" => $this->model->countFiltered($_POST,$this->session->userdata('role')),
			"data" => $data,
		);
		echo json_encode($output);
    }
	

}
?>