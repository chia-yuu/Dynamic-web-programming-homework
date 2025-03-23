const canvas = document.getElementById('gameCanvas');
const ctx = canvas.getContext('2d');
const playerGif = document.getElementById('playerGif');
const door = document.getElementById('npc_dog');
const searchBox = document.getElementById('searchBox');


canvas.width = window.innerWidth;
canvas.height = window.innerHeight;

// 加載背景圖片
const background = new Image();
background.src = 'homepage_images/indoor_scene.jpg'; // 替換為室內透視圖的圖片路徑

// 玩家初始位置和尺寸
const player = {
    x: canvas.width * 0.4, // 初始位置 40% 寬度
    y: canvas.height * 0.7, // 初始位置 80% 高度
    width: canvas.width * 0.1, // 寬度為畫布的 10%
    height: canvas.height * 0.1, // 高度為畫布的 10%
    speed: canvas.width * 0.005, // 根據畫布寬度計算速度
    direction: 'down'
};
let lastDirection = player.direction;

const keys = {
    w: false,
    a: false,
    s: false,
    d: false
};

// 可行走區域（地面範圍）
const walkablePolygon = [
    { x: canvas.width * 0.05, y: canvas.height * 0.95 },
    { x: canvas.width * 0.3, y: canvas.height * 0.65 },
    { x: canvas.width * 0.6, y: canvas.height * 0.65 },
    { x: canvas.width * 0.88, y: canvas.height * 0.95 }
];


const searchInput = document.getElementById('searchInput');

// 動態檢測輸入框內容是否有文字
function InputContent() {
    return searchInput.value.trim() !== ''; // 判斷是否有文字
}

// 監聽鍵盤按下事件
document.addEventListener('keydown', (event) => {
    if (searchBox.style.display == 'none' || !InputContent()) {
        console.log('Key pressed:', event.code);
        switch (event.code) {
            case 'KeyW':
                keys.w = true;
                break;
            case 'KeyA':
                keys.a = true;
                break;
            case 'KeyS':
                keys.s = true;
                break;
            case 'KeyD':
                keys.d = true;
                break;
        }
    }
});

document.addEventListener('keyup', (event) => {
    switch (event.code) {
        case 'KeyW':
            keys.w = false;
            break;
        case 'KeyA':
            keys.a = false;
            break;
        case 'KeyS':
            keys.s = false;
            break;
        case 'KeyD':
            keys.d = false;
            break;
    }

});


function updatePlayerGifDirection() {
    //console.log("Direction:", player.direction);
    if (player.direction !== lastDirection) {
        switch (player.direction) {
            case 'up':
                playerGif.src = 'homepage_images/walk_l.gif';
                break;
            case 'down':
                playerGif.src = 'homepage_images/walk_r.gif';
                break;
            case 'left':
                playerGif.src = 'homepage_images/walk_l.gif';
                break;
            case 'right':
                playerGif.src = 'homepage_images/walk_r.gif';
                break;
        }
        lastDirection = player.direction; // 更新上次方向
    }
}

function updatePlayerGifPosition() {

    playerGif.style.left = `${(player.x / canvas.width) * 100}%`;
    playerGif.style.top = `${(player.y / canvas.height) * 100}%`;
}


function updatePlayer() {
    let nextX = player.x;
    let nextY = player.y;
    if (keys.d) {
        nextX += player.speed;
        player.direction = 'right';
    }
    else if (keys.a) {
        nextX -= player.speed;
        player.direction = 'left';
    }
    else if (keys.s) {
        nextX -= player.speed / 2;
        nextY += player.speed;
        player.direction = 'down';
    }
    else if (keys.w) {
        nextX += player.speed / 2;
        nextY -= player.speed;
        player.direction = 'up';
    }

    const nextPosition = { x: nextX + player.width, y: nextY + player.height };

    // 檢查是否在多邊形內
    if (isPointInPolygon(nextPosition, walkablePolygon)) {
        player.x = nextX;
        player.y = nextY;

    }
    updatePlayerGifDirection(); // 更新方向
    updatePlayerGifPosition(); // 更新位置
}
function isPointInPolygon(point, polygon) {
    let x = point.x, y = point.y;
    let inside = false;

    for (let i = 0, j = polygon.length - 1; i < polygon.length; j = i++) {
        let xi = polygon[i].x, yi = polygon[i].y;
        let xj = polygon[j].x, yj = polygon[j].y;

        let intersect = ((yi > y) !== (yj > y)) &&
            (x < (xj - xi) * (y - yi) / (yj - yi) + xi);
        if (intersect) inside = !inside;
    }
    return inside;
}


let activePainting = null;
function checkProximityToPaintings() {
    const playerCenter = { x: player.x + player.width / 2, y: player.y + player.height / 2 };
    const paintings = document.querySelectorAll('.painting');
    const npcRect = door.getBoundingClientRect();


    paintings.forEach(painting => {
        const rect = painting.getBoundingClientRect();
        const paintingBottom = { x: rect.left + rect.width / 2, y: rect.bottom };

        const distance = Math.sqrt(
            Math.pow(playerCenter.x - paintingBottom.x, 2) +
            Math.pow(playerCenter.y - paintingBottom.y, 2)
        );

        if (distance < 200) {
            activePainting = painting;
            //console.log('Player is near a painting.', painting);
            painting.classList.add('active');
            painting.style.transform = 'scale(1.2)';
            painting.style.opacity = '1';

        } else {
            if (painting.classList.contains('active')) {
                //console.log('Player is not near a painting.');
                activePainting = null;
                painting.classList.remove('active');
                painting.style.transform = 'scale(1)';
                painting.style.opacity = '0.8';
            }
        }
    });
    //check proximity to npc;
    const npcCenter = {
        x: npcRect.left + npcRect.width / 2,
        y: npcRect.top + npcRect.height / 2,
    };

    const distance = Math.sqrt(
        Math.pow(playerCenter.x - npcCenter.x, 2) +
        Math.pow(playerCenter.y - npcCenter.y, 2)
    );

    if (distance < canvas.height * 0.1) {
        console.log('Player is near the NPC.');
        searchBox.style.display = 'block';
    } else {
        searchBox.style.display = 'none';
    }
}
function submitSearch() {
    const keyword = document.getElementById('searchInput').value;
    if (keyword.trim() === "") {
        alert("Please enter a keyword to search.");
        return;
    }
    document.getElementById('keyword').value = keyword;
    const userID = localStorage.getItem('user_id');
    document.getElementById('user_ID2').value = userID;
    document.getElementById('searchingForm').submit();
}
function cancelSearch() {
    console.log('Search cancelled.');
    //clear input
    searchInput.value = '';
    searchBox.style.display = 'none';
}

// 按下空白鍵導向展廳頁面
document.addEventListener('keydown', (event) => {
    if (event.code === 'Space' && activePainting) {
        const paintingName = activePainting.textContent.trim();

        if (paintingName === "collection") {
            console.log('Redirecting to collection page...');
            window.location.href = 'collection.html';
        }
        else {
            // 將畫作名稱填入隱藏表單
            const userID = localStorage.getItem('user_id');
            document.getElementById('paintingName').value = paintingName;
            document.getElementById('user_ID').value = userID;
            console.log('User ID:', userID);
            console.log('Painting name:', paintingName);

            // 提交表單
            document.getElementById('paintingForm').submit();
        }

    }
});


// 繪製背景圖片的函數
function drawBackground() {
    //console.log("Drawing background...");
    ctx.drawImage(background, 0, 0, canvas.width, canvas.height);
}


// 繪製畫的範圍的函數
function drawPaintings() {
    paintings.forEach(painting => {
        ctx.fillStyle = 'rgba(255, 255, 0, 0.5)';
        ctx.fillRect(painting.x, painting.y, painting.width, painting.height);
    });
}

function gameLoop() {
    ctx.clearRect(0, 0, canvas.width, canvas.height);
    drawBackground();
    //drawWalkablePolygon(); // 繪製多邊形


    // 更新和繪製玩家
    updatePlayer();
    updatePlayerGifPosition();

    checkProximityToPaintings();


    // 繪製輔助範圍（可隱藏）
    // drawPaintings();

    // 重複呼叫gameLoop
    requestAnimationFrame(gameLoop);
}
//可視化多邊形
function drawWalkablePolygon() {
    ctx.beginPath();
    ctx.moveTo(walkablePolygon[0].x, walkablePolygon[0].y);

    for (let i = 1; i < walkablePolygon.length; i++) {
        ctx.lineTo(walkablePolygon[i].x, walkablePolygon[i].y);
    }
    ctx.closePath();
    ctx.strokeStyle = 'rgba(0, 255, 0, 0.5)';
    ctx.stroke();
}


// 開始遊戲，等背景和角色圖片加載完成
background.onload = () => {
    console.log("Background loaded successfully.");
    playerGif.classList.add('fall-animation');

    // 等待動畫結束後移除 class（防止後續操作影響）
    playerGif.addEventListener('animationend', () => {
        playerGif.classList.remove('fall-animation');
    });


    gameLoop();
};
const userEmail = localStorage.getItem('user_mail');
if (userEmail) {
    // 取出 email 的前半部分
    const userName = userEmail.split('@')[0];
    const greetingElement = document.getElementById('greeting');
    greetingElement.textContent = `Hello, ${userName}!`;
}

// 设置登出按钮功能
const logoutButton = document.getElementById('logoutButton');
logoutButton.addEventListener('click', () => {
    // 清除 Local Storage 中的用户信息
    localStorage.removeItem('user_mail');
    localStorage.removeItem('user_id');

    window.location.href = 'login.html';
});