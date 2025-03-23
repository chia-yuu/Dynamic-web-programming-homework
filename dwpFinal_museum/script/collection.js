// render HTML. get colllection from DB
let mail = localStorage.getItem("user_mail");

// redirect to login if haven't login
if (mail == null) {
    window.location.href = 'login.html';
}
$.ajax({
    url: 'utils/collection.php',
    type: 'POST',
    data: { action: "fill content", mail: mail },
    success: function (response) {
        // console.log(response);
        let res = JSON.parse(response);
        let img = JSON.parse(res["img"]);
        let title = JSON.parse(res["title"]);
        let author = JSON.parse(res["author"]);
        let content = "";
        for (let i = 0; i < img.length; i++) {
            let t = title[i];
            if (t.length > 50) {
                t = t.substring(0, 50);
                let idx = t.lastIndexOf(' ');
                if (idx != -1) {
                    t = t.substring(0, idx);
                }
                t += " ...";
            }

            let a = author[i];
            if (a.length > 50) {
                a = a.substring(0, 50);
                let idx = a.lastIndexOf(' ');
                if (idx != -1) {
                    a = a.substring(0, idx);
                }
                a += " ...";
            }

            content += `
                <div class="collection-block">
                    <img class="heart-img" src="asset/full-star.png">
                    <div class="block-up-container">
                        <div class="block-up">
                            <img class="art-img" src="${img[i]}">
                        </div>
                    </div>
                    <div class="block-bottom">
                        <p class="title">${t}</p>
                        <p class="author">${a}</p>
                    </div>
                </div>
            `;
        }
        // no collection
        if (img.length == 0) {
            document.getElementById("main").innerHTML += `<h3>You don't have any collections yet. Visit our <a class="mu" href="homepage.html">museum</a> to start collecting your favorites!</h3>`;
        }

        document.getElementById("collections").innerHTML = content;
    },
    error: function () {
        console.log("collection ajax fail:(");
    }
});

// click heart to remove / add collection (wait 100ms for html render)
setTimeout(() => {
    const hearts = document.querySelectorAll(".heart-img");
    hearts.forEach(function (heart, index) {
        heart.addEventListener("click", function (event) {
            event.stopPropagation();    // don't pass to parent element
            // console.log("click");
            if (heart.src.includes("asset/full-star.png")) {
                // remove collection
                heart.src = "asset/empty-star.png";
                $.ajax({
                    url: 'utils/collection.php',
                    type: 'POST',
                    data: { action: "remove collection", index: index, mail: mail },
                    success: function (response) {
                        // do nothing
                        console.log(response);
                    },
                    error: function () {
                        console.log("remove collection ajax fail:(");
                    }
                });
            } else {
                // add collection
                heart.src = "asset/full-star.png";
                const all_title = document.querySelectorAll(".title");
                const all_author = document.querySelectorAll(".author");
                $.ajax({
                    url: 'utils/collection.php',
                    type: 'POST',
                    data: { action: "add collection", index: index, mail: mail, title: all_title[index].innerHTML, author: all_author[index].innerHTML },
                    success: function (response) {
                        console.log(response);
                    },
                    error: function () {
                        console.log("add collection ajax fail:(");
                    }
                });
            }
        });
    });
}, 1000);

// popup
setTimeout(() => {
    const all_collection = document.querySelectorAll(".collection-block");
    all_collection.forEach(function (collection, index) {
        collection.addEventListener("click", function () {
            const popup = document.getElementById("popup-container");
            popup.style.display = "flex";
            localStorage.setItem('popup_index', index);

            // render popup html
            $.ajax({
                url: 'utils/collection.php',
                type: 'POST',
                data: { action: "render popup", mail: mail, index: index },
                success: function (response) {
                    // do nothing
                    // console.log(response);
                    let res = JSON.parse(response);
                    let img = res["img"];
                    let title = res["title"];
                    let author = res["author"];
                    let date = res["date"];
                    let description = res["description"];
                    let comment = JSON.parse(res["comment"]);
                    let comment_user = JSON.parse(res["comment_user"]);
                    // console.log(comment);
                    // console.log(comment_user);
                    let content = "";
                    content = `
                        <img class="popup-art-img" src="${img}">
                        <div class="popup-right">
                            <img class="star-img" id="star-img" src="asset/full-star.png" onclick="click_star()">
                            <h1>${title}</h1>
                            <h2>${author}</h2>
                            <h4 class="prh4">${date}</h4>
                            <p>${description}</p>
                            <form method="post" onsubmit="submit_form(event)">
                                <input type="text" name="comment" placeholder="Write a comment..." class="comment-input">
                                <input type="submit" class="submit-btn" value="">
                            </form>
                            <h3>Comments</h3>
                    `;
                    if (comment.length > 0) {
                        let tmp = "";
                        for (let i = 0; i < comment.length; i++) {
                            tmp += `<h4>${comment_user[i]}</h4>`;
                            tmp += `<p>${comment[i]}</p>`;
                        }
                        tmp += "</div>"
                        document.getElementById("popup-content").innerHTML = content + tmp;
                    }
                    else {
                        document.getElementById("popup-content").innerHTML = content + "<p>No comments yet.</p></div>";
                    }
                },
                error: function () {
                    console.log("render popup ajax fail:(");
                }
            });
        });
    });
}, 1000);

// close popup using esc key
document.addEventListener('keydown', function (event) {
    if (event.key === 'Escape' || event.keyCode === 27) {
        document.getElementById("popup-container").style.display = "none";
    }
});

// make a comment
function submit_form(event) {
    event.preventDefault();
    let cmt = document.querySelector('input[name="comment"]').value;
    let idx = localStorage.getItem('popup_index');

    $.ajax({
        url: 'utils/collection.php',
        type: 'POST',
        data: { action: "make comment", mail: mail, comment: cmt, index: idx },
        success: function (response) {
            console.log(response);
            document.querySelector('input[name="comment"]').value = '';
        },
        error: function () {
            console.log("make comment submit_form() ajax fail:(");
        }
    });
}

function close_pop() {
    const popup = document.getElementById("popup-container");
    popup.style.display = "none";
}
// click star in popup
function click_star() {
    const star = document.getElementById("star-img");
    let index = localStorage.getItem('popup_index');
    if (star.src.includes("asset/full-star.png")) {
        // remove collection
        star.src = "asset/empty-star.png";
        $.ajax({
            url: 'utils/collection.php',
            type: 'POST',
            data: { action: "remove collection", index: index, mail: mail },
            success: function (response) {
                // do nothing
                console.log(response);
            },
            error: function () {
                console.log("remove collection ajax fail:(");
            }
        });
    }
    else {
        // add collection
        star.src = "asset/full-star.png";
        const all_title = document.querySelectorAll(".title");
        const all_author = document.querySelectorAll(".author");
        $.ajax({
            url: 'utils/collection.php',
            type: 'POST',
            data: { action: "add collection", index: index, mail: mail, title: all_title[index].innerHTML, author: all_author[index].innerHTML },
            success: function (response) {
                console.log(response);
            },
            error: function () {
                console.log("add collection ajax fail:(");
            }
        });
    }
}

/*
TODO
- popup 裡刪除收藏，收藏頁的星星也要暗掉
- esc close popup
*/