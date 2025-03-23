<?php
$DB = mysqli_connect("localhost", "root", "", "final_proj");
$DB->set_charset("UTF8");
if (mysqli_connect_errno()) {
    echo "failed to connect database!";
}
?>