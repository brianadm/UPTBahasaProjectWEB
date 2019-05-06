<?php if(!defined('BASEPATH')) exit('No direct script access allowed');

require APPPATH . '/libraries/BaseController.php';

/**
 * Class : User (UserController)
 * User Class to control all user related operations.
 * @author : Kishor Mali
 * @version : 1.1
 * @since : 15 November 2016
 */
class User extends BaseController
{
    /**
     * This is default constructor of the class
     */
    public function __construct()
    {
        parent::__construct();
        $this->load->model('user_model');
        $this->load->model('login_model');
        $this->isLoggedIn();
        $this->load->library('pdf');
        $this->load->model('Uploadimage_model', 'uploadimage');
        $this->load->library(array('form_validation', 'session'));
    }

    /**
     * This function used to load the first screen of the user
     */
    public function index()
    {
        $this->global['pageTitle'] = 'Dashboard';

        $this->loadViews("dashboard", $this->global, NULL , NULL);
    }

    /**
     * This function is used to load the user list
     */
    function userListing()
    {
        if($this->isAdmin() == TRUE)
        {
            $this->loadThis();
        }
        else
        {
            $searchText = $this->security->xss_clean($this->input->post('searchText'));
            $data['searchText'] = $searchText;

            $this->load->library('pagination');

            $count = $this->user_model->userListingCount($searchText);

			        $returns = $this->paginationCompress ( "userListing/", $count, 10 );

            $data['userRecords'] = $this->user_model->userListing($searchText, $returns["page"], $returns["segment"]);

            $this->global['pageTitle'] = 'User Management';

            $this->loadViews("users", $this->global, $data, NULL);
        }
    }

    /**
     * This function is used to load the Student list
     */
    function studentListing()
    {
        if($this->isAdmin() == TRUE)
        {
            $this->loadThis();
        }
        else
        {
            $searchText = $this->security->xss_clean($this->input->post('searchText'));
            $data['searchText'] = $searchText;

            $this->load->library('pagination');

            $count = $this->user_model->userListingCount($searchText);

			        $returns = $this->paginationCompress ( "studentListing/", $count, 10 );

            $data['userRecords'] = $this->user_model->userListing($searchText, $returns["page"], $returns["segment"]);

            $this->global['pageTitle'] = 'User Management';

            $this->loadViews("students", $this->global, $data, NULL);
        }
    }


    /**
     * This function is used to load the add new form
     */
    function addNew()
    {
            $this->load->model('user_model');
             $data['roles'] = $this->user_model->getUserRoles();

            $this->global['pageTitle'] = 'Add New User';

            $this->loadViews("addNew", $this->global, $data, NULL);

    }

    /**
     * This function is used to check whether email already exist or not
     */
    function checkEmailExists()
    {
        $userId = $this->input->post("userId");
        $email = $this->input->post("email");

        if(empty($userId)){
            $result = $this->user_model->checkEmailExists($email);
        } else {
            $result = $this->user_model->checkEmailExists($email, $userId);
        }

        if(empty($result)){ echo("true"); }
        else { echo("false"); }
    }

    /**
     * This function is used to add new user to the system
     */
    function addNewUser()
    {
        if($this->isAdmin() == TRUE)
        {
            $this->loadThis();
        }
        else
        {
            $this->load->library('form_validation');

            $this->form_validation->set_rules('fname','Full Name','trim|required|max_length[128]');
            $this->form_validation->set_rules('email','Email','trim|required|valid_email|max_length[128]');
            $this->form_validation->set_rules('password','Password','required|min_length[6]');
            $this->form_validation->set_rules('cpassword','Confirm Password','trim|required|matches[password]|min_length[6]');
            $this->form_validation->set_rules('role','Role','trim|required|numeric');
            $this->form_validation->set_rules('mobile','Mobile Number','required|min_length[10]');

            $this->form_validation->set_rules('nim','NIM','required|min_length[8]');
            $this->form_validation->set_rules('prodi','Program Studi','trim|required|min_length[2]');
            $this->form_validation->set_rules('jurusan','Jurusan','trim|required|min_length[2]');
            $this->form_validation->set_rules('tmptLahir','Tempat Lahir','required|min_length[4]');
            $this->form_validation->set_rules('tglLahir','Tanggal Lahir','required');
            $this->form_validation->set_rules('angkatan','Angkatan','required|max_length[4]');

            if($this->form_validation->run() == FALSE)
            {
                $this->addNew();
            }
            else
            {
                $name = ucwords(strtolower($this->security->xss_clean($this->input->post('fname'))));
                $email = strtolower($this->security->xss_clean($this->input->post('email')));
                $password = $this->input->post('password');
                $roleId = $this->input->post('role');
                $mobile = $this->security->xss_clean($this->input->post('mobile'));
                $nim = $this->input->post('nim');
                $prodi = $this->input->post('prodi');
                $jurusan = $this->input->post('jurusan');
                $angkatan = $this->input->post('angkatan');
                $tglLahir = $this->input->post('tglLahir');
                $tmptLahir = $this->input->post('tmptLahir');

                $userInfo = array('email'=>$email, 'password'=>getHashedPassword($password), 'roleId'=>$roleId, 'name'=> $name,
                                    'mobile'=>$mobile, 'nim'=> $nim, 'prodi'=> $prodi,'jurusan'=> $jurusan,'angkatan'=> $angkatan,'tglLahir'=> $tglLahir, 'tmptLahir'=>$tmptLahir, 'createdBy'=>$this->vendorId, 'createdDtm'=>date('Y-m-d H:i:s'));

                $this->load->model('user_model');

                if($this->login_model->checkEmailExist($email)){
                  $this->session->set_flashdata('error', 'Email Exist');
                }else{
                  $result = $this->login_model->addNewUser1($userInfo);
                  if($result > 0){
                      $this->session->set_flashdata('success', 'New User created successfully');
                  }
                  else  {
                      $this->session->set_flashdata('error', 'User creation failed');
                  }
                }

                redirect('addNew');
            }
        }
    }


    /**
     * This function is used load user edit information
     * @param number $userId : Optional : This is user id
     */
    function editOld($userId = NULL)
    {
        if($this->isAdmin() == TRUE || $userId == 1)
        {
            $this->loadThis();
        }
        else
        {
            if($userId == null)
            {
                redirect('userListing');
            }

            $data['roles'] = $this->user_model->getUserRoles();
            $data['userInfo'] = $this->user_model->getUserInfo($userId);

            $this->global['pageTitle'] = 'Edit User';

            $this->loadViews("editOld", $this->global, $data, NULL);
        }
    }


    /**
     * This function is used to edit the user information
     */
    function editUser()
    {
        if($this->isAdmin() == TRUE)
        {
            $this->loadThis();
        }
        else
        {
            $this->load->library('form_validation');

            $userId = $this->input->post('userId');

            $this->form_validation->set_rules('fname','Full Name','trim|required|max_length[128]');
            $this->form_validation->set_rules('email','Email','trim|required|valid_email|max_length[128]');
            $this->form_validation->set_rules('password','Password','required|min_length[6]');
            $this->form_validation->set_rules('cpassword','Confirm Password','trim|required|matches[password]|min_length[6]');
            $this->form_validation->set_rules('role','Role','trim|required|numeric');
            $this->form_validation->set_rules('mobile','Mobile Number','required|min_length[10]');

            $this->form_validation->set_rules('nim','NIM','required|min_length[8]');
            $this->form_validation->set_rules('prodi','Program Studi','trim|required|min_length[2]');
            $this->form_validation->set_rules('jurusan','Jurusan','trim|required|min_length[2]');
            $this->form_validation->set_rules('tmptLahir','Tempat Lahir','required|min_length[4]');
            $this->form_validation->set_rules('tglLahir','Tanggal Lahir','required');
            $this->form_validation->set_rules('angkatan','Angkatan','required|max_length[4]');
            if($this->form_validation->run() == FALSE)
            {
                $this->editOld($userId);
            }
            else
            {
                $name = ucwords(strtolower($this->security->xss_clean($this->input->post('fname'))));
                $email = strtolower($this->security->xss_clean($this->input->post('email')));
                $password = $this->input->post('password');
                $roleId = $this->input->post('role');
                $mobile = $this->security->xss_clean($this->input->post('mobile'));

                $nim = $this->input->post('nim');
                $prodi = $this->input->post('prodi');
                $jurusan = $this->input->post('jurusan');
                $angkatan = $this->input->post('angkatan');
                $tglLahir = $this->input->post('tglLahir');
                $tmptLahir = $this->input->post('tmptLahir');

                $userInfo = array();

                if(empty($password))
                {
                    $userInfo = array('email'=>$email, 'roleId'=>$roleId, 'name'=>$name,
                                    'mobile'=>$mobile, 'updatedBy'=>$this->vendorId, 'updatedDtm'=>date('Y-m-d H:i:s'));

                    $userInfo = array('email'=>$email, 'roleId'=>$roleId, 'name'=>$name,
                                    'mobile'=>$mobile, 'nim'=> $nim, 'prodi'=> $prodi,'jurusan'=> $jurusan,'angkatan'=> $angkatan,'tglLahir'=> $tglLahir, 'tmptLahir'=>$tmptLahir, 'updatedBy'=>$this->vendorId,
                                    'updatedDtm'=>date('Y-m-d H:i:s'));
                }
                else
                {
                    $userInfo = array('email'=>$email, 'password'=>getHashedPassword($password), 'roleId'=>$roleId, 'name'=>ucwords($name),
                                            'mobile'=>$mobile, 'nim'=> $nim, 'prodi'=> $prodi,'jurusan'=> $jurusan,'angkatan'=> $angkatan,'tglLahir'=> $tglLahir, 'tmptLahir'=>$tmptLahir, 'updatedBy'=>$this->vendorId,
                                            'updatedDtm'=>date('Y-m-d H:i:s'));
                }

                $result = $this->user_model->editUser($userInfo, $userId);

                if($result == true)
                {
                    $this->session->set_flashdata('success', 'User updated successfully');
                }
                else
                {
                    $this->session->set_flashdata('error', 'User updation failed');
                }

                redirect('userListing');
            }
        }
    }


    /**
     * This function is used to delete the user using userId
     * @return boolean $result : TRUE / FALSE
     */
    function deleteUser()
    {
        if($this->isAdmin() == TRUE)
        {
            echo(json_encode(array('status'=>'access')));
        }
        else
        {
            $userId = $this->input->post('userId');
            $userInfo = array('isDeleted'=>1,'updatedBy'=>$this->vendorId, 'updatedDtm'=>date('Y-m-d H:i:s'));

            $result = $this->user_model->deleteUser($userId, $userInfo);

            if ($result > 0) { echo(json_encode(array('status'=>TRUE))); }
            else { echo(json_encode(array('status'=>FALSE))); }
        }
    }

    /**
     * Page not found : error 404
     */
    function pageNotFound()
    {
        $this->global['pageTitle'] = '404 - Page Not Found';

        $this->loadViews("404", $this->global, NULL, NULL);
    }

    /**
     * This function used to show login history
     * @param number $userId : This is user id
     */
    function loginHistoy($userId = NULL)
    {
        if($this->isAdmin() == TRUE)
        {
            $this->loadThis();
        }
        else
        {
            $userId = ($userId == NULL ? 0 : $userId);

            $searchText = $this->input->post('searchText');
            $fromDate = $this->input->post('fromDate');
            $toDate = $this->input->post('toDate');

            $data["userInfo"] = $this->user_model->getUserInfoById($userId);

            $data['searchText'] = $searchText;
            $data['fromDate'] = $fromDate;
            $data['toDate'] = $toDate;

            $this->load->library('pagination');

            $count = $this->user_model->loginHistoryCount($userId, $searchText, $fromDate, $toDate);

            $returns = $this->paginationCompress ( "login-history/".$userId."/", $count, 10, 3);

            $data['userRecords'] = $this->user_model->loginHistory($userId, $searchText, $fromDate, $toDate, $returns["page"], $returns["segment"]);

            $this->global['pageTitle'] = 'User Login History';

            $this->loadViews("loginHistory", $this->global, $data, NULL);
        }
    }

    /**
     * This function is used to show users profile
     */
    function profile($active = "details")
    {
        $data["userInfo"] = $this->user_model->getUserInfoWithRole($this->vendorId);
        $data["active"] = $active;

        $this->global['pageTitle'] = $active == "details" ? 'My Profile' : 'Change Password';
        $this->loadViews("profile", $this->global, $data, NULL);
    }

    /**
     * This function is used to update the user details
     * @param text $active : This is flag to set the active tab
     */
    function profileUpdate($active = "details")
    {
        $this->load->library('form_validation');

        $this->form_validation->set_rules('fname','Full Name','trim|required|max_length[128]');
        $this->form_validation->set_rules('mobile','Mobile Number','required|min_length[10]');
        $this->form_validation->set_rules('email','Email','trim|required|valid_email|max_length[128]|callback_emailExists');
        $this->form_validation->set_rules('mobile','Mobile Number','required|min_length[10]');
        $this->form_validation->set_rules('nim','NIM','required|min_length[8]');
        $this->form_validation->set_rules('prodi','Program Studi','trim|required|min_length[2]');
        $this->form_validation->set_rules('jurusan','Jurusan','trim|required|min_length[2]');
        $this->form_validation->set_rules('tmptLahir','Tempat Lahir','required|min_length[4]');
        $this->form_validation->set_rules('tglLahir','Tanggal Lahir','required');
        $this->form_validation->set_rules('angkatan','Angkatan','required|max_length[4]');

        if($this->form_validation->run() == FALSE)
        {
            $this->profile($active);
        }
        else
        {
            $name = ucwords(strtolower($this->security->xss_clean($this->input->post('fname'))));
            $mobile = $this->security->xss_clean($this->input->post('mobile'));
            $email = strtolower($this->security->xss_clean($this->input->post('email')));

            $userInfo = array('name'=>$name, 'email'=>$email, 'mobile'=>$mobile, 'updatedBy'=>$this->vendorId, 'updatedDtm'=>date('Y-m-d H:i:s'));

            $result = $this->user_model->editUser($userInfo, $this->vendorId);

            if($result == true)
            {
                $this->session->set_userdata('name', $name);
                $this->session->set_flashdata('success', 'Profile updated successfully');
            }
            else
            {
                $this->session->set_flashdata('error', 'Profile updation failed');
            }

            redirect('profile/'.$active);
        }
    }

    /**
     * This function is used to change the password of the user
     * @param text $active : This is flag to set the active tab
     */
    function changePassword($active = "changepass")
    {
        $this->load->library('form_validation');

        $this->form_validation->set_rules('oldPassword','Old password','required|max_length[20]');
        $this->form_validation->set_rules('newPassword','New password','required|max_length[20]');
        $this->form_validation->set_rules('cNewPassword','Confirm new password','required|matches[newPassword]|max_length[20]');

        if($this->form_validation->run() == FALSE)
        {
            $this->profile($active);
        }
        else
        {
            $oldPassword = $this->input->post('oldPassword');
            $newPassword = $this->input->post('newPassword');

            $resultPas = $this->user_model->matchOldPassword($this->vendorId, $oldPassword);

            if(empty($resultPas))
            {
                $this->session->set_flashdata('nomatch', 'Your old password is not correct');
                redirect('profile/'.$active);
            }
            else
            {
                $usersData = array('password'=>getHashedPassword($newPassword), 'updatedBy'=>$this->vendorId,
                                'updatedDtm'=>date('Y-m-d H:i:s'));

                $result = $this->user_model->changePassword($this->vendorId, $usersData);

                if($result > 0) { $this->session->set_flashdata('success', 'Password updation successful'); }
                else { $this->session->set_flashdata('error', 'Password updation failed'); }

                redirect('profile/'.$active);
            }
        }
    }

    /**
     * This function is used to check whether email already exist or not
     * @param {string} $email : This is users email
     */
    function emailExists($email)
    {
        $userId = $this->vendorId;
        $return = false;

        if(empty($userId)){
            $result = $this->user_model->checkEmailExists($email);
        } else {
            $result = $this->user_model->checkEmailExists($email, $userId);
        }

        if(empty($result)){ $return = true; }
        else {
            $this->form_validation->set_message('emailExists', 'The {field} already taken');
            $return = false;
        }

        return $return;
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
