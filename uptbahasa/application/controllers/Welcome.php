<?php
class Welcome extends CI_Controller {
	public function __construct() {
        parent::__construct();
        $this->load->helper(array('url'));
		}
	public function index()
	{
		$this->load->view('header');
		$this->load->view('home');
		$this->load->view('footer');
	}
	public function pendaftaran()
	{
		$this->load->view('header');
		$this->load->view('pendaftaran');
	}
	public function uploadBukti()
	{
		$this->load->view('header');
		$this->load->view('uploadBukti');
	}
	public function uploadBuktiNext()
	{
		$this->load->view('header');
		$this->load->view('uploadBuktiNext');
	}
	public function validasiSertifikat()
	{
		$this->load->view('header');
		$this->load->view('validasiSertifikat');
	}
	public function validasiSertifikatNextFail()
	{
		$this->load->view('header');
		$this->load->view('validasiSertifikatNextFail');
	}
	public function validasiSertifikatNextSuccess()
	{
		$this->load->view('header');
		$this->load->view('validasiSertifikatNextSuccess');
	}
	public function courseToefl()
	{
		$this->load->view('header');
		$this->load->view('courseToefl');
	}

	public function testToefl()
	{
		$this->load->view('header');
		$this->load->view('testToefl');
	}
}
