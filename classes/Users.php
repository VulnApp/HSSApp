<?php
require_once('../config.php');
Class Users extends DBConnection {
    private $settings;

    public function __construct(){
        global $_settings;
        $this->settings = $_settings;
        parent::__construct();
    }

    public function __destruct(){
        parent::__destruct();
    }

    public function save_users(){
        if(!isset($_POST['status']) && $this->settings->userdata('login_type') == 1){
            $_POST['status'] = 1;
            $_POST['type'] = 2;
        }
        extract($_POST);
        $oid = $id;
        $data = '';

        if(isset($oldpassword)){
            if(md5($oldpassword) != $this->settings->userdata('password')){
                return 4;
            }
        }

        $chk = $this->conn->query("SELECT * FROM `users` WHERE username ='{$username}' ".($id>0? " AND id != '{$id}' " : ""))->num_rows;

        if($chk > 0){
            return 3;
            exit;
        }

        foreach($_POST as $k => $v){
            if(in_array($k, array('firstname', 'middlename', 'lastname', 'username', 'type'))){
                if(!empty($data)) $data .=" , ";
                $data .= " {$k} = '{$v}' ";
            }
        }

        if(!empty($password)){
            $password = md5($password);
            if(!empty($data)) $data .=" , ";
            $data .= " `password` = '{$password}' ";
        }

        if(empty($id)){
            $qry = $this->conn->query("INSERT INTO users SET {$data}");
            if($qry){
                $id = $this->conn->insert_id;
                $this->settings->set_flashdata('success', 'User Details successfully saved.');
                $resp['status'] = 1;
            }else{
                $resp['status'] = 2;
            }

        }else{
            $qry = $this->conn->query("UPDATE users SET $data WHERE id = {$id}");
            if($qry){
                $this->settings->set_flashdata('success', 'User Details successfully updated.');
                if($id == $this->settings->userdata('id')){
                    foreach($_POST as $k => $v){
                        if($k != 'id'){
                            if(!empty($data)) $data .=" , ";
                            $this->settings->set_userdata($k, $v);
                        }
                    }
                }
                $resp['status'] = 1;
            }else{
                $resp['status'] = 2;
            }
        }

        if(isset($_FILES['img']) && $_FILES['img']['tmp_name'] != ''){
            $fname = 'uploads/' . $_FILES['img']['name'];
            $dir_path = base_app . $fname;
            $upload = $_FILES['img']['tmp_name'];
            $type = mime_content_type($upload);
            $allowed = array('image/png', 'image/jpeg');

            if(!in_array($type, $allowed)){
                $resp['msg'] .= " But Image failed to upload due to an invalid file type.";
            }else{
                if(move_uploaded_file($upload, $dir_path)){
                    $this->conn->query("UPDATE users SET `avatar` = CONCAT('{$fname}','?v=',unix_timestamp(CURRENT_TIMESTAMP)) WHERE id = '{$id}'");
                    if($id == $this->settings->userdata('id')){
                        $this->settings->set_userdata('avatar', $fname);
                    }
                }else{
                    $resp['msg'] .= " But Image failed to upload due to an unknown reason.";
                }
            }
        }

        if(isset($resp['msg'])){
            $this->settings->set_flashdata('success', $resp['msg']);
        }
        
        return $resp['status'];
    }

    public function delete_users(){
        extract($_POST);
        $avatar = $this->conn->query("SELECT avatar FROM users WHERE id = '{$id}'")->fetch_array()['avatar'];
        $qry = $this->conn->query("DELETE FROM users WHERE id = $id");
        
        if($qry){
            $avatar = explode("?", $avatar)[0];
            $this->settings->set_flashdata('success', 'User Details successfully deleted.');
            
            if(is_file(base_app . $avatar)){
                unlink(base_app . $avatar);
            }
            
            $resp['status'] = 'success';
        }else{
            $resp['status'] = 'failed';
        }
        
        return json_encode($resp);
    }

    public function verify_user(){
        extract($_POST);
        $update = $this->conn->query("UPDATE `users` SET `status` = 1 WHERE id = $id");

        if($update){
            $this->settings->set_flashdata('success', 'User has been successfully verified.');
            $resp['status'] = 'success';
        }else{
            $resp['status'] = 'failed';
        }
        
        return json_encode($resp);
    }
}

$users = new users();
$action = !isset($_GET['f']) ? 'none' : strtolower($_GET['f']);

switch ($action) {
    case 'save':
        echo $users->save_users();
    break;

    case 'delete':
        echo $users->delete_users();
    break;

    case 'verify_user':
        echo $users->verify_user();
    break;

    default:
        // echo $sysset->index();
    break;
}
