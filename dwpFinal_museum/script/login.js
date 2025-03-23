// show error message
let url_parm = new URLSearchParams(window.location.search);
if(url_parm.has('state')){
    // show error message
    if(url_parm.get('state') == 'wrong-pw'){
        // wrong password
        document.getElementById('wrong-pw').style.display = 'block';
    }
    else if(url_parm.get('state') == 'no-account'){
        // no accuont
        document.getElementById('no-account').style.display = 'block';
    }
    else if(url_parm.get('state') == 'no-input'){
        // no input
        document.getElementById('no-input').style.display = 'block';
    }
    else if(url_parm.get('state') == 'account-exist'){
        // account already exist
        document.getElementById('account-exist').style.display = 'block';
    }

    // modify margin bottom
    const blocks = document.querySelectorAll('.form-block');
    blocks.forEach(function(block){
        block.style.marginBottom = "15px";
    });
}

// main right content
document.addEventListener("DOMContentLoaded", function(){
    $.ajax({
        url: 'utils/right_content.php',
        type: 'POST',
        data: {},
        success: function(response){
            let block1 = ""; let block2 = "";
            // console.log(response);
            let res = JSON.parse(response);
            let img = JSON.parse(res["img"]);
            let name = JSON.parse(res["name"]);
            let comment = JSON.parse(res["comment"]);
            
            // render HTML
            for(let i=0;i<img.length;i++){
                let cmt = comment[i];
                if(cmt.length > 130){
                    cmt = cmt.substring(0, 120);
                    let idx = cmt.lastIndexOf(' ');
                    if(idx != -1){
                        cmt = cmt.substring(0, idx);
                    }
                    cmt += " ...";
                }
                block1 += `
                    <div class="comment-block">
                        <img src="${img[i]}">
                        <div class="content">
                            <h3>${name[i]}</h3>
                            <p>"${cmt}"</p>
                        </div>
                    </div>
                `;
                block2 += `
                    <div class="comment-block">
                        <img src="${img[i]}">
                        <div class="content">
                            <h3>${name[i]}</h3>
                            <p>"${cmt}"</p>
                        </div>
                    </div>
                `;
            }
            document.getElementById("right-first").innerHTML = block1;
            document.getElementById("right-second").innerHTML = block2;

            // adjust css animation time
            let n = img.length;
            let t = n * 2 * 6.7;
            document.documentElement.style.setProperty('--ani-time', `${t}s`);
            document.documentElement.style.setProperty('--half-ani-time', `-${t/2}s`);
        },
        error: function(){
            console.log("main right content ajax fail:(");
        }
    });
});


// main right scroll
// wait 100ms for innerHTML to write
setTimeout(() => {
    const blocks = this.document.querySelectorAll('.comment-block');
    const height = this.window.innerHeight;
    setInterval(() => {
        blocks.forEach(function(block){
            const top = block.getBoundingClientRect().top;
            const bot = block.getBoundingClientRect().bottom;

            if(bot >= height * 5/12){
                block.classList.add('active');
            }
            if(top >= height * 47/100){
                block.classList.remove('active');
            }
        });
    }, 100);
}, 1000);