<?php
// 連接資料庫
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

$user_ID = 1;
$table = 'renaissance';

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $table = $_POST['table'];
    $user_ID = $_POST['user_ID'];
}
if ($table == 'renaissance') {
    $category_ID = 1;
} else if ($table == 'romance') {
    $category_ID = 2;
} else if ($table == 'morden') {
    $category_ID = 3;
} else {
    $category_ID = 4;
}

$query = "SELECT * FROM " . $table;
$stmt = $conn->query($query);
$artworks = $stmt->fetchAll(PDO::FETCH_ASSOC);
echo "<script>sessionStorage.setItem('artworkCount', " . count($artworks) . ");</script>";
setcookie('user_ID', $user_ID, time() + (86400 * 30), "/");
setcookie('category_ID', $category_ID, time() + (86400 * 30), "/");
?>

<!DOCTYPE html>
<html>

<head>
    <title>Exhibition</title>
    <link rel="stylesheet" type="text/css" href="exb.css">
    <script src="exb.js" defer></script>
    <script src="walk.js" defer></script>
</head>

<body>
    <header>
        <button id="home">
            <img src="exb_images/house-fill.png">
        </button>
        <p id="title"><?php echo strtoupper($table); ?></p>
        <div id="collectiondistrict">
            <button id="collection">
                <img src="exb_images/treasure-chest-fill.png">
            </button>
            <div id="usercollection">
                <?php
                $query = "SELECT * FROM user_collection WHERE user_ID = " . $user_ID;
                $stmt = $conn->query($query);
                $collections = $stmt->fetchAll(PDO::FETCH_ASSOC);
                if (empty($collections)) {
                    echo "<p>No collection yet.</p>";
                }
                ?>
                <?php foreach ($collections as $collection): ?>
                    <div id="usercollection<?php echo $collection['ID'] ?>" class="usercollection">
                        <?php
                        $query = "SELECT * FROM total_work WHERE category_ID = " . $collection['category_ID'] . " AND work_ID = " . $collection['work_ID'];
                        $stmt = $conn->query($query);
                        $collect_artworks = $stmt->fetchAll(PDO::FETCH_ASSOC);
                        ?>
                        <?php foreach ($collect_artworks as $collect_artwork): ?>
                            <?php
                            $query = "SELECT * FROM " . $collect_artwork['category'] . " WHERE ID = " . $collect_artwork['work_ID'];
                            $stmt = $conn->query($query);
                            $image = $stmt->fetchAll(PDO::FETCH_ASSOC);
                            $image = $image[0];
                            ?>
                            <img src="<?php echo $image['image'] ?>">
                            <div>
                                <p><?php echo $collect_artwork['title'] ?></p>
                                <p><?php echo $collect_artwork['category'] ?></p>
                            </div>
                        <?php endforeach; ?>
                    </div>
                <?php endforeach; ?>
            </div>
        </div>
    </header>
    <div id="artworks">
        <?php foreach ($artworks as $artwork): ?>
            <div class="artwork" id="artwork<?php echo $artwork['ID'] ?>">
                <img src="<?php echo $artwork['image'] ?>" alt="<?php echo $artwork['ID'] ?>" />
            </div>
        <?php endforeach; ?>
        <button id="magnify">
            <img src="exb_images/magnifying-glass-plus-fill.png">
        </button>
    </div>
    <div id="info">
        <button id="collect">
            <img src="exb_images/star-fill.png">
        </button>
        <?php foreach ($artworks as $artwork): ?>
            <div class="info" id="info<?php echo $artwork['ID'] ?>">
                <h1><?php echo $artwork['title'] ?></h1>
                <h3 class="author"><?php echo $artwork['author'] ?></h3>
                <h4 class="date"><?php echo $artwork['date'] ?></h4>
                <hr>
                <p><?php echo $artwork['description'] ?></p>
            </div>
        <?php endforeach; ?>
        <div id="comments">
            <div id="write">
                <input type="text" id="comment" placeholder="Write a comment...">
                <button id="send">
                    <img src="exb_images/paper-plane-tilt-fill.png">
                </button>
            </div>
            <h4>Comments</h4>
            <div id="allcomments">
                <?php foreach ($artworks as $artwork): ?>
                    <div id="allcomments<?php echo $artwork['ID'] ?>" class="allcomments">
                        <?php
                        $query = "SELECT * FROM user_comment WHERE work_ID = " . $artwork['ID'] . " AND category_ID = " . $category_ID;
                        $stmt = $conn->query($query);
                        $comments = $stmt->fetchAll(PDO::FETCH_ASSOC);
                        if (empty($comments)) {
                            echo "<p>No comment yet.</p>";
                        }
                        ?>
                        <?php foreach ($comments as $comment): ?>
                            <?php
                            $query = "SELECT * FROM users WHERE user_ID = " . $comment['user_ID'];
                            $stmt = $conn->query($query);
                            $user = $stmt->fetchAll(PDO::FETCH_ASSOC);
                            ?>
                            <div class="comment">
                                <p class="account"><?php echo $user[0]['name'] ?></p>
                                <p><?php echo $comment['comment'] ?></p>
                            </div>
                        <?php endforeach; ?>
                    </div>
                <?php endforeach; ?>
            </div>
        </div>
    </div>
    <footer>
        <img id="door" src="exb_images/door.gif" width="150px">
    </footer>
</body>

</html>