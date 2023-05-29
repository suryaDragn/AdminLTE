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
		$this->load->model('servicesdetail_model','detail');
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
			$btn_detail = '<button type="button" class="btn btn-success btn-xs detail" data-id_service="'.$d->id_service.'"><i class="fas fa-fw fa-file"></i> Detail</button>';
            $btn_print = '<a type="button" class="btn btn-primary btn-xs print" target="_blank" href="'.base_url('/services/print?id=').base64_encode($d->id_service).'" data-id_service="'.$d->id_service.'"><i class="fas fa-fw fa-print"></i> Print</a>';
            $btn_edit = '<button type="button" class="btn btn-warning btn-xs edit" data-id_service="'.$d->id_service.'"><i class="fas fa-fw fa-pen"></i> Edit</button>';
			$btn_hapus = '<button  type="button" class="btn btn-danger btn-xs hapus"  data-id_service="' . $d->id_service . '"><i class="fas fa-fw fa-trash"></i> Hapus</button>';
            if($this->session->userdata('role') == '1'){
				$data[] = array($i,date('d M Y',strtotime($d->tanggal)), $d->nama_member, $d->jenis_mobil,$d->plat_nomor, $d->alamat, $btn_detail .' '.$btn_edit.' '.$btn_print. ' ' . $btn_hapus);
            }else{
                $data[] = array($i,date('d M Y',strtotime($d->tanggal)), $d->nama_member, $d->jenis_mobil,$d->plat_nomor, $d->alamat, $btn_detail .' '.$btn_edit.' '.$btn_print);
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
	public function getBarang(){
		$data = $this->detail->getData();
		echo json_encode($data);
	}
	public function aksi()
	{
		if ($_POST['aksi'] == 'tambah' & ($_POST['id_service'] == '' | $_POST['id_service'] == 0)) {
			$data = $this->model->tambah();
			echo json_encode($data);
		} else if ($_POST['aksi'] == 'edit') {
			$data = $this->model->edit();
			echo json_encode($data);
		} else if ($_POST['aksi'] == 'hapus') {
			$data = $this->model->hapus();
			echo json_encode($data);
		} else if($_POST['id_service'] != ''){
			$data = $this->model->edit();
			echo json_encode($data);
		}
	}
	public function changeActive(){
		$data = $this->model->changeActive();
		echo json_encode($data);
	}
	public function getDetail(){
        $data = array();
		$menu = $this->detail->getRows($_POST);
		$i = $_POST['start'];
		foreach ($menu as $d) {
			$i++;
			$btn_hapus = '<button  type="button" class="btn btn-danger btn-xs hapus"  data-id_service_detail="' . $d->id_service_detail . '"><i class="fas fa-fw fa-trash"></i> Hapus</button>';
			if($_POST['display'] == 1){
				$data[] = array($d->nama_barang, $d->jumlah_barang,$d->harga, $d->total_harga);
			}else{
				$data[] = array($btn_hapus, $d->nama_barang, $d->jumlah_barang,$d->harga, $d->total_harga);
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
	public function tambahBarang(){
		$data = $this->detail->tambah();
		echo json_encode($data);
	}
	public function hapusBarang(){
		$data = $this->detail->hapus();
		echo json_encode($data);
	}
	public function print(){
		$id = $_GET['id'];
		$id = base64_decode($id);
		$_POST['id_service'] = $id;
		$data = $this->model->getData();
		// print_r('<pre>');
		$data->tanggal = date('d M Y',strtotime($data->tanggal));
		$data->detail_barang = $this->detail->getData();
		// print_r($data);
		$this->load->view('print/cetaknota',$data);
	}
}
?>