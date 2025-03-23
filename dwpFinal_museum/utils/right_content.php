<?php
include_once 'connect_db.php';
$img = [];
$name = [];
$comment = [];
$table_name = ["none", "renaissance", "romance", "modern", "medieval"];
$sql = "SELECT user_ID FROM `users`;";
$user_ids = $DB -> query($sql);
while($user_id = $user_ids->fetch_assoc()){
    // img
    $uid = (int)$user_id['user_ID'];
    $sql = "SELECT name FROM `users` WHERE user_ID = $uid;";
    $name_res = $DB -> query($sql) -> fetch_all(MYSQLI_ASSOC)[0]["name"];

    // comment & img url
    $sql = "SELECT category_ID, work_ID, comment FROM `user_comment` WHERE user_ID = $uid;";
    $res = $DB -> query($sql);
    if($res){
        while($row = $res->fetch_assoc()){
            $name[] = $name_res;

            $cid = $row["category_ID"];
            $wid = $row["work_ID"];
            $comment[] = $row["comment"];

            // img
            $sql = "SELECT image FROM $table_name[$cid] WHERE ID = $wid;";
            $img[] = $DB -> query($sql) -> fetch_all(MYSQLI_ASSOC)[0]["image"];
        }
    }
}

echo json_encode(["img" => json_encode($img), "name" => json_encode($name), "comment" => json_encode($comment)]);
?>