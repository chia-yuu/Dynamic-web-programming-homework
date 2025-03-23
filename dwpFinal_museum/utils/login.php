<?php
include_once 'connect_db.php';
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $mail = $_POST['email'];
    $password = $_POST['password'];
    $hash_pw = hash('sha256', (string) $password);

    // check valid input
    if (empty($mail) || empty($password)) {
        // no input
        header("Location: ../login.html?state=no-input");
        return;
    }

    $sql = "SELECT * FROM `users` WHERE `account` = '$mail' AND `password` = '$hash_pw';";
    $res = $DB->query($sql);
    if ($res->num_rows > 0) {
        // success login

        // get user id
        $sql = "SELECT user_ID FROM `users` WHERE account = '$mail';";
        $id_ret = $DB->query($sql);
        $user_id = $id_ret->fetch_assoc();
        $user_id = (int) $user_id['user_ID'];

        // use js to redirect instead of php
        echo "<script>localStorage.setItem('user_mail', '$mail'); localStorage.setItem('user_id', $user_id); window.location.href = '../homepage.html';</script>";
        // header("Location: ../index.html");
        return;
    } else {
        $sql = "SELECT * FROM `users` WHERE `account`='$mail';";
        $res = $DB->query($sql);
        if ($res->num_rows > 0) {
            // wrong password
            header("Location: ../login.html?state=wrong-pw");
            return;
        } else {
            // account not exit
            header("Location: ../login.html?state=no-account");
            return;
        }
    }
}
?>