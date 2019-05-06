
    }

    // ----------------------------------------------------------------------------


    public function upImage()
    {
        $userId = $this->vendorId;
        $this->global['pageTitle'] = 'Upload Image';

        if($this->isAdmin() == FALSE)
        {
            $data['images'] = $this->uploadimage->get_all();
        }
        else
        {
        $data['images'] = $this->uploadimage->get_imageUser($userId);
      }
        $this->loadViews("upImage", $this->global, $data , NULL);
    }

    public function create()
  	{
      $this->global['pageTitle'] = 'Upload Image';
  		$this->rules();
  		if ($this->form_validation->run() == FALSE) {
  			$data['nama_file'] = $this->input->post('nama_file') ? $this->input->post('nama_file') : '';
        $data['comment'] = $this->input->post('comment') ? $this->input->post('comment') : '';
  		}

      $this->loadViews("addImage", $this->global, $data , NULL);
  	}

  	public function store()
  	{
      $userId = $this->vendorId;
  		$config = array(
  			'upload_path' => './images/',
  			'allowed_types' => 'jpeg|jpg|png',
  			'max_size' => '2048',
  			'max_width' => '2000',
  			'max_height' => '2000'
   		);
  		$this->load->library('upload', $config);

  		if (!$this->upload->do_upload('filefoto')) {
  			$this->session->set_flashdata('message', "<div style='color:#ff0000;'>" . $this->upload->display_errors() . "</div>");
  			redirect(site_url('user/create'));
  		} else {
  			$file = $this->upload->data();
  			$data = array(
  					'nama_file' => $this->input->post('nama_file'),
  					'filefoto' => $file['file_name'],
            'comment' => $this->input->post('comment'),
            'userId' => $userId
  			);

  			$this->uploadimage->insert($data);
  		}
  		$this->session->set_flashdata('message', "<div style='color:#00a65a;'>Gambar berhasil ditambah.</div>");

      if($this->isAdmin() == FALSE){
  		    redirect(site_url('confirm'));
      }
      else{
        redirect(site_url('upImage'));
      }
  	}

  	public function edit($id)
  	{
  		$this->rules();
  		$row = $this->uploadimage->get_by_id($id);
  		$data = array(
  								'id' => $row->id,
  								'nama_file' => $row->nama_file,
                  'comment' => $row->comment,
  								'filefoto' => $row->filefoto
  		);

      $this->loadViews("editImage", $this->global, $data , NULL);
  	}

  	public function update($id)
  	{
  		$row = $this->uploadimage->get_by_id($id);

  		// Do this if there is an image upload
  		if ($_FILES AND $_FILES['filefoto']['name']) {
  				// Start uploading file
  				$config = array(
  						'upload_path' => './images/',
  						'allowed_types' => 'jpeg|jpg|png',
  						'max_size' => '2048',
  						'max_width' => '2000',
  						'max_height' => '2000'
  				);
  				$this->load->library('upload', $config);

  				if (!$this->upload->do_upload('filefoto')) {
  						$this->session->set_flashdata('message', "<div style='color:#ff0000;'>" . $this->upload->display_errors() . "</div>");
  						redirect(site_url('user/edit/' . $row->id));
  				} else {

  						// Remove old image in folder 'images' using unlink()
  						// unlink() use for delete files like image.
  						unlink('images/'.$row->filefoto);

  						// Upload file
  						$file = $this->upload->data();
  						$id = $this->input->post('id');
  						$data = array(
  								'nama_file' => $this->input->post('nama_file'),
                  'comment' => $this->input->post('comment'),
  								'filefoto' => $file['file_name'],
  						);

  						$this->uploadimage->update($id, $data);
  				}
  		}
  		// Do this if there's no image file uploaded
  		else {
  				// No file upload
  				$id = $this->input->post('id');
  				$data = array(
  						'nama_file' => $this->input->post('nama_file'),
              'comment' => $this->input->post('comment'),
  				);
  				$this->uploadimage->update($id, $data);
  		}
  		$this->session->set_flashdata('message', "<div style='color:#00a65a;'>Gambar berhasil diubah.</div>");

      if($this->isAdmin() == FALSE)
      {
      redirect(site_url('confirm'));
      }
      else
      {
        redirect(site_url('upImage'));
      }
  	}



  	public function delete($id)
  	{
  		$row = $this->uploadimage->get_by_id($id);

  		if ($row) {

  				// unlink() use for delete files like image.
  				unlink('images/'.$row->filefoto);

  				$this->uploadimage->delete($id);
  				$this->session->set_flashdata('message', "<div style='color:#00a65a;'>Gambar berhasil dihapus.</div>");
          if($this->isAdmin() == FALSE)
          {
          redirect(site_url('confirm'));
          }
          else
          {
            redirect(site_url('upImage'));
          }

  		} else {
  				$this->session->set_flashdata('message', "<div style='color:#dd4b39;'>Data tidak ditemukan.</div>");
          if($this->isAdmin() == FALSE)
          {
          redirect(site_url('confirm'));
          }
          else
          {
            redirect(site_url('upImage'));
          }

  		}
  	}

  	public function rules()
  	{
  		$this->form_validation->set_rules('nama_file', 'Nama File', 'trim|required');
  		$this->form_validation->set_error_delimiters('<span class="text-danger">', '</span>');
  	}



















    public function confirm()
    {
        $this->global['pageTitle'] = 'Confirmation';
        $data['images'] = $this->uploadimage->get_all();
        $this->loadViews("confirm", $this->global, $data , NULL);
    }

    public function toConfirm($id)
    {
      $sts = 1;
      $rn = $this->uploadimage->get_regNum();
              $data = array(
                  'status' => $sts,
                  'regNum' => $rn,
              );
      $this->uploadimage->update($id, $data);
      $this->session->set_flashdata('message', "<div style='color:#00a65a;'>Payment is Confirmed.</div>");
      redirect(site_url('confirm'));
    }


    function penerima_bantuan(){
        $userId = $this->vendorId;

            $pdf = new FPDF();
            $pdf->AddPage();
            $pdf->SetFont('Arial','B',16);
            $pdf->Cell(40,10,$userId);
            $pdf->Cell(40,10,'Andi Ariyandi - 14116133');
            $pdf->Cell(40,10,'0605190001');
            $pdf->Output();
        }


    public function regNum()
    {
      $userId = $this->vendorId;
      $this->global['pageTitle'] = 'Registration Number';
      $data['images'] = $this->uploadimage->get_regNumUser($userId);
      $this->loadViews("regNum", $this->global, $data , NULL);
    }



}

?>

