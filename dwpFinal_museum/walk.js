let gifdiv = document.createElement('div');
gifdiv.className = 'gifdiv';
gifdiv.style.height = 10 + '%';
gifdiv.style.width = 'fit-content';
gifdiv.style.position = 'fixed';
gifdiv.style.bottom = 30 + 'px';
gifdiv.style.right = 30 + 'px';
gifdiv.style.transition = 'all 1s ease';
let gif = document.createElement('img');
gif.src = 'character/stand.gif';
gif.style.height = 100 + '%';
gifdiv.style.width = 'auto';
gifdiv.appendChild(gif);
document.body.appendChild(gifdiv);
let nowX = 75;
let nowY = 30;
let nowDirection = 0; // 0: stand, 1: walk_r, 2: walk_l

window.onload = function () {
    gif.src = 'character/walk_l.gif';
    gifdiv.style.right = 75 + '%';
    gifdiv.style.transition = 'all 4s ease';
    setTimeout(function () {
        gifdiv.style.transition = '';
        gif.src = 'character/stand.gif';
        wsad();
    }, 4100);
}

function wsad() {
    window.addEventListener("keydown", function (event) {
        let isInput = this.document.getElementById('comment').contains(document.activeElement);
        console.log(event.code);
        if (!isInput) {
            if (event.code === "KeyA") {
                if (nowX < 90) {
                    if (nowDirection != 2) gif.src = 'character/walk_l.gif';
                    nowX += 1;
                    gifdiv.style.right = nowX + '%';
                    nowDirection = 2;
                }
            }
            else if (event.code === "KeyD") {
                if (nowX > 5) {
                    if (nowDirection != 1) gif.src = 'character/walk_r.gif';
                    nowX -= 1;
                    gifdiv.style.right = nowX + '%';
                    nowDirection = 1;
                }
            }
            else if (event.code === "Space") {
                if (nowX < 10 && nowX > 4) {
                    nowDirection = 0;
                    let interval = setInterval(function () {
                        nowY += 10;
                        gifdiv.style.bottom = nowY + 'px';
                    }, 20);
                    let interval2;
                    this.setTimeout(function () {
                        clearInterval(interval);
                        interval2 = setInterval(function () {
                            nowY -= 10;
                            gifdiv.style.bottom = nowY + 'px';
                        }, 20);
                    }, 300);
                    this.setTimeout(function () {
                        clearInterval(interval2);
                        window.location.href = 'homepage.html';
                    }, 600);
                }
            }
        }
    });
    window.addEventListener("keyup", function (event) {
        let isInput = this.document.getElementById('comment').contains(document.activeElement);
        if (!isInput) {
            if (event.code === "KeyA" || event.code === "KeyD") {
                gif.src = 'character/stand.gif';
                nowDirection = 0;
            }
        }
    });
}