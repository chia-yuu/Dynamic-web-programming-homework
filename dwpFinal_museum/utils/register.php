<?php
include_once 'connect_db.php';
if($_SERVER['REQUEST_METHOD'] == 'POST'){
    $name = $_POST['name'];
    $mail = $_POST['email'];
    $password = $_POST['password'];
    $hash_pw = hash('sha256', (string)$password);

    // check valid input
    if(empty($name) || empty($mail) || empty($password)){
        // no input
        header("Location: ../register.html?state=no-input");
        return;
    }

    $sql = "SELECT * FROM `users` WHERE `account` = '$mail';";
    $res = $DB -> query($sql);
    if($res->num_rows > 0){
        // account already exist
        header("Location: ../login.html?state=account-exist");
        return;
    }
    else{
        // no account, create one, store to DB and back to login
        $sql = "INSERT INTO users (name, account, password) VALUES ('$name', '$mail', '$hash_pw');";
        if($DB->query($sql) == false){
            echo "註冊失敗！！";
        }
        else{
            header("Location: ../login.html");
            return;
        }
    }
}
?>