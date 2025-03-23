let positionx = [0];
let positiony = [0];
let userposition = 1;
let arrowupanddownenable = true;
let num_perartwork = sessionStorage.getItem('artworkCount') || 0;

let artworks = document.getElementById('artworks').getElementsByClassName('artwork');
// 獲取 artworks 容器並檢查是否存在
let artworksContainer = document.getElementById('artworks');
if (!artworksContainer) {
    console.error("Element with ID 'artworks' not found.");
} else {
    let artworks = artworksContainer.getElementsByClassName('artwork');
    if (artworks.length === 0) {
        console.warn("No artworks found in 'artworks'.");
    }
}

// 確認 usercollection 和 collect 存在
/*
if (!collect) {
    console.error("Collect button not found.");
}
if (!usercollection) {
    console.error("User collection container not found.");
}
    */

// 保護 setPositionofArtwork 的執行
function setPositionofArtwork() {
    if (!artworks || artworks.length === 0) {
        console.warn("No artworks to position.");
        return;
    }
    // 你的既有邏輯
}

// 確保後端請求數據格式正確
/*
fetch('react.php', {
    method: 'POST',
    headers: {
        'Content-Type': 'application/json',
    },
    body: JSON.stringify(data),
}).catch((error) => {
    console.error("Failed to send data to react.php:", error);
});
*/


function setPositionofArtwork() {
    document.getElementById('info1').style.display = 'block';
    document.getElementById('allcomments1').style.display = 'block';
    document.getElementById('artworks').style.left = 25 + '%';
    document.getElementById('artworks').style.top = 42.5 + '%';
    for (let i = 0; i < num_perartwork; i++) {
        artworks[i].style.opacity = 1;
        positionx[i] = 50 + i * 10;
        positiony[i] = 65 - i * 10;
        artworks[i].style.left = positionx[i] + '%';
        artworks[i].style.top = positiony[i] + '%';
        artworks[i].style.zIndex = num_perartwork - i;
        artworks[i].style.width = 50 - 8 * i + 'vh';
        artworks[i].style.height = 50 - 8 * i + 'vh';
    }
    for (let i = 5; i < num_perartwork; i++) {
        artworks[i].style.opacity = 0;
    }
    // find if first artwork is collected
    let usercollection = document.getElementById('usercollection');
    let collection = document.getElementsByClassName('usercollection');
    let collectionname = document.getElementById('info1').getElementsByTagName('h1')[0].innerHTML;
    let collect = document.getElementById('collect');
    for (let i = 0; i < collection.length; i++) {
        if (collection[i].getElementsByTagName('p')[0].innerHTML == collectionname) {
            let img = collect.getElementsByTagName('img')[0];
            img.src = 'exb_images/star-fill2.png';
            break;
        }
    }
}

// arrow up and down
function onArrowUpandDownPressed(direction) {
    if ((userposition < num_perartwork && direction == 1) || (userposition > 1 && direction == -1)) {
        document.getElementById('info' + userposition).style.display = 'none';
        document.getElementById('allcomments' + userposition).style.display = 'none';
        if (direction == 1) {
            artworks[userposition - 1].style.opacity = 0;
            if (userposition + 4 < num_perartwork) {
                artworks[userposition + 4].style.opacity = 1;
            }
        }
        else {
            artworks[userposition - 2].style.opacity = 1;
            if (userposition + 3 < num_perartwork) {
                artworks[userposition + 3].style.opacity = 0;
            }
        }
        userposition += direction;
        for (let i = 0; i < num_perartwork; i++) {
            positionx[i] -= 10 * direction;
            positiony[i] += 10 * direction;
            artworks[i].style.left = positionx[i] + '%';
            artworks[i].style.top = positiony[i] + '%';
            artworks[i].style.width = 50 - 8 * (i - userposition + 1) + 'vh';
            artworks[i].style.height = 50 - 8 * (i - userposition + 1) + 'vh';
        }
        document.getElementById('info' + userposition).style.display = 'block';
        document.getElementById('allcomments' + userposition).style.display = 'block';
    }
    // find if artwork is collected
    let usercollection = document.getElementById('usercollection');
    let collection = document.getElementsByClassName('usercollection');
    let collectionname = document.getElementById('info' + userposition).getElementsByTagName('h1')[0].innerHTML;
    for (let i = 0; i < collection.length; i++) {
        if (collection[i].getElementsByTagName('p')[0].innerHTML == collectionname) {
            let img = collect.getElementsByTagName('img')[0];
            img.src = 'exb_images/star-fill2.png';
            break;
        }
        else {
            let img = collect.getElementsByTagName('img')[0];
            img.src = 'exb_images/star-fill.png';
        }
    }
}

window.addEventListener("keydown", function (event) {
    // 檢查按下的鍵是否為方向鍵上鍵
    if (event.key === "ArrowUp" && arrowupanddownenable) {
        // 執行對應函數
        onArrowUpandDownPressed(1);
        arrowupanddownenable = false;
        setTimeout(function () {
            arrowupanddownenable = true;
        }, 300);
    }
    else if (event.key === "ArrowDown" && arrowupanddownenable) {
        onArrowUpandDownPressed(-1);
        arrowupanddownenable = false;
        setTimeout(function () {
            arrowupanddownenable = true;
        }, 300);
    }
});

let collection = document.getElementById('collection');
collection.addEventListener('click', function () {
    let usercollection = document.getElementById('usercollection');
    if (usercollection.style.display == 'block') {
        usercollection.style.display = 'none';
    }
    else {
        usercollection.style.display = 'block';
    }
});

let collect = document.getElementById('collect');
let usercollection = document.getElementById('usercollection');
collect.addEventListener('click', function () {
    let img = collect.getElementsByTagName('img')[0];
    if (img.src.endsWith('exb_images/star-fill.png')) { // not collected
        img.src = 'exb_images/star-fill2.png';
        let newcollection = document.createElement('div');
        newcollection.className = 'usercollection';
        let length = usercollection.getElementsByClassName('usercollection').length + 1;
        if (length == 1) {
            usercollection.innerHTML = '';
        }
        newcollection.id = 'usercollection' + length;
        let newcollection_img = document.createElement('img');
        newcollection_img.src = document.getElementById('artwork' + userposition).getElementsByTagName('img')[0].src;
        let newcollection_p = document.createElement('p');
        newcollection_p.innerHTML = document.getElementById('info' + userposition).getElementsByTagName('h1')[0].innerHTML;
        let category = document.createElement('p');
        let cat_ID = parseInt(sessionStorage.getItem('category_ID'));
        if (cat_ID == 1) {
            category.innerHTML = 'renaissance';
        } else if (cat_ID == 2) {
            category.innerHTML = 'romance';
        } else if (cat_ID == 3) {
            category.innerHTML = 'morden';
        } else {
            category.innerHTML = 'medieval';
        }
        let div = document.createElement('div');
        newcollection.appendChild(newcollection_img);
        div.appendChild(newcollection_p);
        div.appendChild(category);
        newcollection.appendChild(div);
        usercollection.appendChild(newcollection);
        // Send POST request to server
        let data = { 'workID': userposition, 'operation': 'collect' };
        fetch('react.php', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
            },
            body: JSON.stringify(data),
        })
    }
    else { // cancel collection
        img.src = 'exb_images/star-fill.png';
        let collection = document.getElementsByClassName('usercollection');
        for (let i = 0; i < collection.length; i++) {
            if (collection[i].getElementsByTagName('p')[0].innerHTML == document.getElementById('info' + userposition).getElementsByTagName('h1')[0].innerHTML) {
                usercollection.removeChild(collection[i]);
                break;
            }
        }
        if (usercollection.getElementsByClassName('usercollection').length == 0) {
            usercollection.innerHTML = 'No collection yet.';
        }
        // Send POST request to server
        let data = { 'workID': userposition, 'operation': 'cancelcollect' };
        fetch('react.php', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
            },
            body: JSON.stringify(data),
        })
    }
});

let send = document.getElementById('send');
let comment = document.getElementById('comment');
send.addEventListener('click', function () {
    if (comment.value == '') {
        return;
    }
    let length = document.getElementById('allcomments' + userposition).getElementsByClassName('comment').length;
    if (length == 0) {
        document.getElementById('allcomments' + userposition).innerHTML = '';
    }
    let newcomment = document.createElement('div');
    newcomment.className = 'comment';
    let newcomment_p = document.createElement('p');
    newcomment_p.innerHTML = comment.value;
    let account = document.createElement('p');
    account.innerHTML = 'Me';
    newcomment.appendChild(account);
    newcomment.appendChild(newcomment_p);
    document.getElementById('allcomments' + userposition).appendChild(newcomment);
    // Send POST request to server
    let data = { 'comment': comment.value, 'operation': 'comment', 'workID': userposition };
    console.log(data);
    fetch('react.php', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json',
        },
        body: JSON.stringify(data),
    })
    comment.value = '';
});

let home = document.getElementById('home');
home.addEventListener('click', function () {
    window.location.href = 'homepage.html';
});

let usercollections = document.getElementById('usercollection');
usercollections.addEventListener('click', function () {
    window.location.href = 'collection.html';
});

let magnify = document.getElementById('magnify');
magnify.addEventListener('click', function () {
    let gallery = document.createElement('div');
    gallery.className = 'gallery';
    let img = document.createElement('img');
    img.src = document.getElementById('artwork' + userposition).getElementsByTagName('img')[0].src;
    gallery.appendChild(img);
    let closeBtn = document.createElement('button');
    closeBtn.id = 'closeBtn';
    let closeIcon = document.createElement('img');
    closeIcon.src = 'exb_images/x-square-fill.png';
    closeBtn.appendChild(closeIcon);
    closeBtn.addEventListener('click', function () {
        document.body.removeChild(gallery);
    });
    gallery.appendChild(closeBtn);
    document.body.appendChild(gallery);
});

setPositionofArtwork();