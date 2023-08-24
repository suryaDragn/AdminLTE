<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Stokopname
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
			$this->db->where('user_submenu.url', 'stokopname');
			$access = $this->db->get()->result();
			if (!$access) {
				redirect('page');
			}
		}
		parent::__construct();
		$this->load->model('stokopname_model', 'model');
	}

	public function index()
	{
		// $sicon = $this->model->get_icon();
		$data = [
			'title' => 'Master Barang',
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
			if ($d->is_active == 1) {
				$active = '<input type="checkbox"  name="active" id="is_active"  class="form-control-sm" data-id_stokopname="' . $d->id_stokopname . '" data-active="' . $d->is_active . '" form-control-sm" checked>';
			} else {
				$active = '<input type="checkbox"  name="active" id="is_active"  class="form-control-sm" data-id_stokopname="' . $d->id_stokopname . '" data-active="' . $d->is_active . '" form-control-sm" >';
			}
			$btn_edit = '<button type="button" class="btn btn-success btn-xs edit" data-id_stokopname="'.$d->id_stokopname.'"><i class="fas fa-fw fa-pen"></i> Edit</button>';
			$btn_hapus = '<button  type="button" class="btn btn-danger btn-xs hapus"  data-id_stokopname="' . $d->id_stokopname . '"><i class="fas fa-fw fa-trash"></i> Hapus</button>';
			$tgl = date('D,d M Y [H:i] a',strtotime($d->tanggal));
			if($this->session->userdata('role') == '1'){
				$data[] = array($i, $tgl,$d->kode_barang, $d->nama_barang,$d->jumlah_barang, $btn_edit . ' ' . $btn_hapus);
			}else{
				$data[] = array($i,$tgl, $d->kode_barang, $d->nama_barang,$d->jumlah_barang, $btn_edit . ' ' . $btn_hapus);
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
	public function getListMember(){
        $data = array();
		$menu = $this->model->getRows($_POST,$this->session->userdata('role'));
		$i = $_POST['start'];
		foreach ($menu as $d) {
			$i++;
			
			$btn_pilih = '<button  id="pilihMember" class="btn btn-success btn-xs pilih"  data-id_stokopname="' . $d->id_stokopname . '">Pilih</button>';
			$data[] = array($btn_pilih, $d->nama_member, $d->jenis_mobil,$d->plat_nomor, $d->alamat, $d->nomor_telepon);
			
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