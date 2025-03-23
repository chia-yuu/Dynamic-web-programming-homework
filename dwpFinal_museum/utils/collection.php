<?php
include_once 'connect_db.php';
if($_POST["action"] == "fill content"){
    $table_name = ["none", "renaissance", "romance", "modern", "medieval"];
    $mail = $_POST['mail'];
    
    $ret_img = [];
    $ret_title = [];
    $ret_author = [];
    
    // get user id
    $sql = "SELECT user_ID FROM `users` WHERE account = '$mail';";
    $id_ret = $DB -> query($sql);
    $user_id = $id_ret -> fetch_assoc();
    $user_id = (int)$user_id['user_ID'];
    
    $sql = "SELECT category_ID, work_ID FROM `user_collection` WHERE user_ID = $user_id;";
    $res = $DB -> query($sql);
    if($res){
        while($row = $res -> fetch_assoc()){
            $cid = $row["category_ID"];
            $wid = $row["work_ID"];
            $sql = "SELECT image, title, author FROM $table_name[$cid] WHERE ID = $wid;";
            $tmp_ = $DB -> query($sql);
            $tmp = $tmp_ -> fetch_assoc();
            if($tmp){
                $ret_img[] = $tmp["image"];
                $ret_title[] = $tmp["title"];
                $ret_author[] = $tmp["author"];
            }
        }
    }
    echo json_encode(["img" => json_encode($ret_img), "title" => json_encode($ret_title), "author" => json_encode($ret_author)]);
}
// add collection to user_collection, no return
else if($_POST["action"] == "add collection"){
    $mail = $_POST['mail'];
    $index = $_POST['index'];
    $index = (int)$index - 1;
    $title = $_POST['title'];
    $author = $_POST['author'];
    
    // get user id
    $sql = "SELECT user_ID FROM `users` WHERE account = '$mail';";
    $id_ret = $DB -> query($sql);
    $user_id = $id_ret -> fetch_assoc();
    $user_id = (int)$user_id['user_ID'];

    $table_name = ["none", "renaissance", "romance", "modern", "medieval"];
    for($i=1;$i<=3;$i++){
        $sql = "SELECT category, ID FROM `$table_name[$i]` WHERE title = '$title' AND author LIKE '$author%';";
        $res = $DB -> query($sql);
        if($res->num_rows > 0){
            $row = $res->fetch_assoc();
            $cid = $row["category"];
            $wid = $row["ID"];

            $sql = "INSERT INTO `user_collection` (user_ID, category_ID, work_ID) VALUES ('$user_id', '$cid', '$wid');";
            $tmp = $DB -> query($sql);
        }
    }
}
// remove collection from user_collection, no return
else if($_POST["action"] == "remove collection"){
    $mail = $_POST['mail'];
    $index = $_POST['index'];
    $index = (int)$index;

    // get user id
    $sql = "SELECT user_ID FROM `users` WHERE account = '$mail';";
    $id_ret = $DB -> query($sql);
    $user_id = $id_ret -> fetch_assoc();
    $user_id = (int)$user_id['user_ID'];

    // remove collection
    $sql = "DELETE FROM `user_collection` WHERE  ID = (SELECT ID FROM `user_collection` WHERE user_ID = $user_id ORDER BY ID LIMIT $index, 1);";
    $res = $DB->query($sql);
}
else if($_POST["action"] == "render popup"){
    $mail = $_POST['mail'];
    $index = $_POST["index"];
    $index = (int)$index;

    // get user id
    $sql = "SELECT user_ID FROM `users` WHERE account = '$mail';";
    $id_ret = $DB -> query($sql);
    $user_id = $id_ret -> fetch_assoc();
    $user_id = (int)$user_id['user_ID'];

    // get cid, wid
    $sql = "SELECT * FROM `user_collection` WHERE user_ID = $user_id ORDER BY ID LIMIT $index, 1;";
    $res = $DB -> query($sql) -> fetch_assoc();
    $cid = (int)$res["category_ID"];
    $wid = (int)$res["work_ID"];

    // get img, title, author, date, description
    $table_name = ["none", "renaissance", "romance", "modern", "medieval"];
    $cnt = 0;
    for($i=1;$i<=3;$i++){
        $sql = "SELECT image, title, author, date, description FROM `$table_name[$i]` WHERE ID = $wid AND category = $cid;";
        $res = $DB -> query($sql);
        if($res->num_rows > 0){
            $row = $res->fetch_assoc();
            $img = $row["image"];
            $title = $row["title"];
            $author = $row["author"];
            $date = $row["date"];
            $description = $row["description"];
        }
    }

    // get comment
    $comment = [];
    $comment_user = [];
    $sql = "SELECT comment, user_ID FROM `user_comment` WHERE category_ID = $cid AND work_ID = $wid;";
    $res = $DB -> query($sql);
    if($res->num_rows > 0){
        while($row = $res -> fetch_assoc()){
            $comment[] = $row["comment"];
    
            $uid = $row["user_ID"];
            $sql = "SELECT name FROM `users` WHERE user_ID = $uid;";
            $name = $DB -> query($sql) ->fetch_assoc();
            $comment_user[] = $name["name"];
        }
    }
    echo json_encode(["img" => $img, "title" => $title, "author" => $author, "date" => $date, "description" => $description, "comment" => json_encode($comment), "comment_user" => json_encode($comment_user)]);
}
else if($_POST["action"] == "make comment"){
    $comment = $_POST["comment"];
    $mail = $_POST["mail"];
    $index = $_POST["index"];

    // get user id
    $sql = "SELECT user_ID FROM `users` WHERE account = '$mail';";
    $id_ret = $DB -> query($sql);
    $user_id = $id_ret -> fetch_assoc();
    $user_id = (int)$user_id['user_ID'];

    // get cid, wid
    $sql = "SELECT * FROM `user_collection` WHERE user_ID = $user_id ORDER BY ID LIMIT $index, 1;";
    $res = $DB -> query($sql) -> fetch_assoc();
    $cid = (int)$res["category_ID"];
    $wid = (int)$res["work_ID"];

    // add comment to db
    $sql = "INSERT INTO `user_comment` (user_ID, category_ID, work_ID, comment) VALUES (?, ?, ?, ?)";

    // avoid special char
    $stmt = $DB->prepare($sql);
    $stmt->bind_param("iiis", $user_id, $cid, $wid, $comment);
    $stmt->execute();
    $stmt->close();
}
?>