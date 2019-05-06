<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Student extends CI_Controller {

	function __construct(){
		parent::__construct();
		$this->load->model('Student_model');
	}

	function index(){
		$this->load->view('user_view');
	}

	function get_data_user()
	{
		$list = $this->Student_model->get_datatables();
		$data = array();
		$no = $_POST['start'];
		foreach ($list as $field) {
			$no++;
			$row = array();
			$row[] = $no;
			$row[] = $field->name;
			$row[] = $field->nim;
			$row[] = $field->prodi;
			$row[] = $field->jurusan;
			$row[] = $field->angkatan;
			$row[] = $field->email;

			$data[] = $row;
		}

		$output = array(
			"draw" => $_POST['draw'],
			"recordsTotal" => $this->Student_model->count_all(),
			"recordsFiltered" => $this->Student_model->count_filtered(),
			"data" => $data,
		);
		//output dalam format JSON
		echo json_encode($output);
	}

}
