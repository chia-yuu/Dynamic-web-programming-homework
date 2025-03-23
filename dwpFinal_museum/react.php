<?php

$host = 'localhost';
$dbname = 'final_proj';
$username = 'root';
$password = '';

try {
    $conn = new PDO("mysql:host=$host;dbname=$dbname", $username, $password);
    $conn->exec("set names utf8");
} catch (PDOException $e) {
    echo "連接失敗: " . $e->getMessage();
}

$user_ID = isset($_COOKIE['user_ID']) ? $_COOKIE['user_ID'] : null;
$category_ID= isset($_COOKIE['category_ID']) ? $_COOKIE['category_ID'] : null;

if($_SERVER['REQUEST_METHOD'] == 'POST') {
    $data= json_decode(file_get_contents('php://input'), true);
    $workID = isset($data['workID']) ? $data['workID'] : null;
    if($data['operation']=== 'comment'){
        $comment = $data['comment'];
        $query= "INSERT INTO user_comment (user_ID, category_ID, work_ID, comment) VALUES ($user_ID, $category_ID, $workID, '$comment')";
    }
    else if($data['operation']=== 'collect') {
        $query= "INSERT INTO user_collection (user_ID, category_ID, work_ID) VALUES ($user_ID, $category_ID, $workID)";
    }
    else{
        $query= "DELETE FROM user_collection WHERE user_ID = $user_ID AND category_ID = $category_ID AND work_ID = $workID";
    }
    $stmt = $conn->prepare($query);
    if($stmt->execute()){
    }
    else{
        echo 'fail';
    }
}
$stmt= null;
$conn = null;
?>