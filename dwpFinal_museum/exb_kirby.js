document.addEventListener('DOMContentLoaded', () => {
    const canvas = document.getElementById('canvas');
    const ctx = canvas.getContext('2d');
    const kirby = document.getElementById('kirby');

    // 初始化画布大小
    canvas.width = window.innerWidth;
    canvas.height = window.innerHeight;

    // 其他代码逻辑...
});
const canvas = document.getElementById('gameCanvas');
console.log('Canvas:', canvas); // 如果为 null，表示 HTML 中没有此元素
const ctx = canvas?.getContext('2d');
console.log('Context:', ctx); // 如果为 null，表示 canvas 无法正确初始化
const kirby = document.getElementById('kirby');
console.log('Kirby:', kirby); // 如果为 null，表示 HTML 中没有此元素



// 玩家初始位置和尺寸
const player = {
    x: 1000,
    y: 1000,
    width: 200,
    height: 200,
    speed: 10,
    direction: 'left' // 初始方向
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
    { x: 50, y: 1020 },
    { x: 650, y: 720 },
    { x: 1200, y: 720 },
    { x: 1600, y: 1020 }
];

const searchInput = document.getElementById('searchInput');



// 監聽鍵盤按下事件
document.addEventListener('keydown', (event) => {

    if (event.key === 'w') keys.w = true;
    if (event.key === 'a') keys.a = true;
    if (event.key === 's') keys.s = true;
    if (event.key === 'd') keys.d = true;

});

// 監聽鍵盤釋放事件
document.addEventListener('keyup', (event) => {
    if (event.key === 'w') keys.w = false;
    if (event.key === 'a') keys.a = false;
    if (event.key === 's') keys.s = false;
    if (event.key === 'd') keys.d = false;
});

// 更新GIF方向的函數
function updatePlayerGifDirection() {
    if (player.direction !== lastDirection) {
        switch (player.direction) {
            case 'up':
                playerGif.src = 'homepage_images/stand.gif';
                break;
            case 'down':
                playerGif.src = 'homepage_images/stand.gif';
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

// 更新GIF位置的函數
function updatePlayerGifPosition() {
    playerGif.style.left = `${player.x}px`;
    playerGif.style.top = `${player.y}px`;
    playerGif.style.width = `${player.width}px`;
    playerGif.style.height = `${player.height}px`;
}


// 更新玩家位置的函數
function updatePlayer() {
    //console.log("Keys:", keys);
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
    // else if (keys.s) {
    //     nextY += player.speed;
    //     player.direction = 'down';
    // }
    // else if (keys.w) {
    //     nextY -= player.speed;
    //     player.direction = 'up';
    // }

    // 檢查是否在可行走區域內
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


function checkProximityToDoor() {
    const playerCenter = { x: player.x + player.width / 2, y: player.y + player.height / 2 };
    const doorRect = door.getBoundingClientRect();
    //check proximity to npc;
    const DoorCenter = {
        x: doorRect.left + doorRect.width / 2,
        y: doorRect.top + doorRect.height / 2,
    };

    const distance = Math.sqrt(
        Math.pow(playerCenter.x - DoorCenter.x, 2) +
        Math.pow(playerCenter.y - DoorCenter.y, 2)
    );

    if (distance < 50) {
        console.log('Player is near the door.');
        searchBox.style.display = 'block';

        //搜尋 關閉awsd
    } else {
        searchBox.style.display = 'none';
    }
}

// 按下空白鍵導向展廳頁面
document.addEventListener('keydown', (event) => {
    if (event.code === 'Space' && activeDoor) {
        window.location.href = 'exhibition.html';
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

// 遊戲主迴圈
function gameLoop() {
    // 清除畫布
    ctx.clearRect(0, 0, canvas.width, canvas.height);

    // 繪製背景
    drawBackground();
    drawWalkablePolygon(); // 繪製多邊形


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

    gameLoop();
};
