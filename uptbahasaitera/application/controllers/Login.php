<?php if(!defined('BASEPATH')) exit('No direct script access allowed');

/**
 * Class : Login (LoginController)
 * Login class to control to authenticate user credentials and starts user's session.
 * @author : Kishor Mali
 * @version : 1.1
 * @since : 15 November 2016
 */
class Login extends CI_Controller
{
    /**
     * This is default constructor of the class
     */
    public function __construct()
    {
        parent::__construct();
        $this->load->model('login_model');
        $this->load->model('user_model');

    }

    /**
     * Index Page for this controller.
     */
    public function index()
    {
        $this->isLoggedIn();
    }

    /**
     * This function used to load forgot password view
     */
    public function addNew1()
    {
        $isLoggedIn = $this->session->userdata('isLoggedIn');

        if(!isset($isLoggedIn) || $isLoggedIn != TRUE)
        {
            $this->load->view('addNew1');
        }
        else
        {
            redirect('/dashboard');
        }
    }

    function addNewUser1()
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
                $this->addNew1();
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
                $created = '0';
                $userInfo = array('email'=>$email, 'password'=>getHashedPassword($password), 'roleId'=>$roleId, 'name'=> $name,
                                    'mobile'=>$mobile, 'nim'=> $nim, 'prodi'=> $prodi,'jurusan'=> $jurusan,'angkatan'=> $angkatan,'tglLahir'=> $tglLahir, 'tmptLahir'=>$tmptLahir, 'createdBy'=>$created, 'createdDtm'=>date('Y-m-d H:i:s'));

                $this->load->model('login_model');

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




                redirect('addNew1');
        }
    }

    /**
     * This function used to check the user is logged in or not
     */
    function isLoggedIn()
    {
        $isLoggedIn = $this->session->userdata('isLoggedIn');

        if(!isset($isLoggedIn) || $isLoggedIn != TRUE)
        {
            $this->load->view('login');
        }
        else
        {
            redirect('/dashboard');
        }
    }


    /**
     * This function used to logged in user
     */
    public function loginMe()
    {
        $this->load->library('form_validation');

        $this->form_validation->set_rules('email', 'Email', 'required|valid_email|max_length[128]|trim');
        $this->form_validation->set_rules('password', 'Password', 'required|max_length[32]');

        if($this->form_validation->run() == FALSE)
        {
            $this->index();
        }
        else
        {
            $email = strtolower($this->security->xss_clean($this->input->post('email')));
            $password = $this->input->post('password');

            $result = $this->login_model->loginMe($email, $password);

            if(!empty($result))
            {
                $lastLogin = $this->login_model->lastLoginInfo($result->userId);

                $sessionArray = array('userId'=>$result->userId,
                                        'role'=>$result->roleId,
                                        'roleText'=>$result->role,
                                        'name'=>$result->name,
                                        'lastLogin'=> $lastLogin->createdDtm,
                                        'isLoggedIn' => TRUE
                                );

                $this->session->set_userdata($sessionArray);

                unset($sessionArray['userId'], $sessionArray['isLoggedIn'], $sessionArray['lastLogin']);

                $loginInfo = array("userId"=>$result->userId, "sessionData" => json_encode($sessionArray), "machineIp"=>$_SERVER['REMOTE_ADDR'], "userAgent"=>getBrowserAgent(), "agentString"=>$this->agent->agent_string(), "platform"=>$this->agent->platform());

                $this->login_model->lastLogin($loginInfo);

                redirect('/dashboard');
            }
            else
            {
                $this->session->set_flashdata('error', 'Email or password mismatch');

                $this->index();
            }
        }
    }