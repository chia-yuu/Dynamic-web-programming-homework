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
$search_keyword = '';

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $search_keyword = $_POST['keyword'];
    $user_ID = $_POST['user_ID'];
}
// 搜尋四個 table
$query = "
    SELECT 'renaissance' AS table_name, ID, title, description, image, author, date 
    FROM renaissance WHERE title LIKE :keyword OR description LIKE :keyword
    UNION ALL
    SELECT 'romance' AS table_name, ID, title, description, image, author, date 
    FROM romance WHERE title LIKE :keyword OR description LIKE :keyword
    UNION ALL
    SELECT 'modern' AS table_name, ID, title, description, image, author, date 
    FROM modern WHERE title LIKE :keyword OR description LIKE :keyword
    UNION ALL
    SELECT 'medieval' AS table_name, ID, title, description, image, author, date 
    FROM medieval WHERE title LIKE :keyword OR description LIKE :keyword
";
$stmt = $conn->prepare($query);
$stmt->bindValue(':keyword', '%' . $search_keyword . '%', PDO::PARAM_STR);
$stmt->execute();
if (!$stmt->execute()) {
    print_r($stmt->errorInfo()); // 輸出錯誤信息
    die("Database query failed.");
}
$artworks = $stmt->fetchAll(PDO::FETCH_ASSOC);

// 設定搜尋結果數量到 session
echo "<script>sessionStorage.setItem('artworkCount', " . count($artworks) . ");</script>";

setcookie('user_ID', $user_ID, time() + (86400 * 30), "/");
// setcookie('category_ID', $category_ID, time() + (86400 * 30), "/");

$count= 1;
?>

<!DOCTYPE html>
<html>

<head>
    <title>Exhibition</title>
    <link rel="stylesheet" type="text/css" href="exb.css">
    <script src="search.js" defer></script>
    <script src="walk.js" defer></script>
</head>

<body>
    <header>
        <button id="home">
            <img src="exb_images/house-fill.png">
        </button>
        <p id="title">Artworks</p>
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
        <?php if (!empty($artworks)): ?>
            <?php foreach ($artworks as $artwork): ?>
                <div class="artwork" id="artwork<?php echo $count ?>">
                    <img src="<?php echo $artwork['image'] ?>" alt="<?php echo $artwork['title'] ?>" />
                </div>
                <?php $count++; ?>
            <?php endforeach; ?>
        <?php else: ?>
            <p>No results found for "<?php echo htmlspecialchars($search_keyword); ?>"</p>
        <?php endif; ?>
        <button id="magnify">
            <img src="exb_images/magnifying-glass-plus-fill.png">
        </button>
    </div>
    <div id="info">
        <button id="collect">
            <img src="exb_images/star-fill.png">
        </button>
        <?php $count= 1; ?>
        <?php foreach ($artworks as $artwork): ?>
            <div class="info" id="info<?php echo $count ?>">
                <h1><?php echo $artwork['title'] ?></h1>
                <h3 class="author"><?php echo $artwork['author'] ?></h3>
                <h4 class="date"><?php echo $artwork['date'] ?></h4>
                <hr>
                <p><?php echo $artwork['description'] ?></p>
            </div>
            <?php $count++; ?>
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
                <?php $count= 1; ?>
                <?php foreach ($artworks as $artwork): ?>
                    <div id="allcomments<?php echo $count ?>" class="allcomments">
                        <?php
                        $cat= $artwork['table_name'];
                        $cat_id;
                        if($cat == 'renaissance'){
                            $cat_id= '1';
                        }else if($cat == 'romance'){
                            $cat_id= '2';
                        }else if($cat == 'modern'){
                            $cat_id= '3';
                        }else if($cat == 'medieval'){
                            $cat_id= '4';
                        }
                        $query = "SELECT * FROM user_comment WHERE work_ID = " . $artwork['ID'] . " AND category_ID = " . $cat_id;
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
                    <?php $count++; ?>
                <?php endforeach; ?>
            </div>
        </div>
    </div>
    <footer>
        <img id="door" src="exb_images/door.gif" width="150px">
    </footer>
</body>

</html>