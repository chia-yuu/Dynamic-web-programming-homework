/* 111550108 吳佳諭 第4次作業 11/17 */
/* 111550108 Chia-Yu Wu The Fourth Homework 11/17 */
let tot_bet = 0, remain = 1000;
let player_sum = 0, dealer_sum = 0;
let dealer_card = {}, player_card = {};
const SUIT = ["C", "D", "H", "S"];
const NUM = ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K'];

function place_bet(n){
    tot_bet += n;
    remain -= n;
    document.getElementById("player-bet").innerHTML = `賭注：${tot_bet}`;
    document.getElementById("player-remain").innerHTML = `餘額：${remain}`;
    document.getElementById("give-card-btn-div").style.display = "flex";
}

function first_start(){
    // hide bet btn, show bets, hide playing btn
    document.getElementById("start-block").style.display = "none";
    document.getElementById("main").style.display = "flex";
    document.getElementById("playing-btns").style.display = "none";
    document.getElementById("bet-btns").style.display = "flex";
    document.getElementById("give-card-btn-div").style.display = "none";
    document.getElementById("restart-btn").style.display = "none";

    // init
    tot_bet = 0;
    remain = 1000;
    document.getElementById("player-remain").innerHTML = `餘額：${remain}`;
    document.getElementById("player-bet").innerHTML = `賭注：${tot_bet}`;

}

function normal_start(){
    tot_bet = 0;
    // hide bet btn, show bets, hide playing btn
    document.getElementById("playing-btns").style.display = "none";
    document.getElementById("bet-btns").style.display = "flex";
    document.getElementById("give-card-btn").style.display = "none";
    document.getElementById("restart-btn").style.display = "none";
    document.getElementById("player-remain").innerHTML = `餘額：${remain}`;
    document.getElementById("player-bet").innerHTML = `賭注：${tot_bet}`;
}

function game_start(){
    // must place bet to start the game
    if(tot_bet == 0){return;}

    // hide bet, show playing btn
    document.getElementById("playing-btns").style.display = "flex";
    document.getElementById("bet-btns").style.display = "none";

    // init
    player_sum = 0, dealer_sum = 0;
    dealer_card = {}, player_card = {};
    document.getElementById("dealer-cards").innerHTML = "";
    document.getElementById("player-cards").innerHTML = "";

    document.getElementById("dealer").style.display = "flex";
    document.getElementById("player").style.display = "flex";
    document.getElementById("result-block").style.display = "none";
    document.getElementById("give-card-btn").style.display = "none";
    document.getElementById("restart-btn").style.display = "none";
    
    let history = JSON.parse(localStorage.getItem('history')) || [];
    if(history.length > 0){remain = Number(history[history.length-1]["remain bet"]);}
    document.getElementById("player-remain").innerHTML = `餘額：${remain}`;
    document.getElementById("player-bet").innerHTML = `賭注：${tot_bet}`;

    // dealer card
    for(let i=0;i<2;i++){
        let suit, num, str;
        do{
            suit = SUIT[Math.floor(Math.random()*4)];
            num = Math.floor(Math.random()*13 + 1);
            str = suit + NUM[num-1];
        }while(dealer_card[str] != undefined || player_card[str] != undefined)

        if(num == 1){num = 11;}
        else if(num > 10){num = 10;}
        dealer_card[str] = num;
        dealer_sum += num;

        if(i == 0){
            // show one card
            document.getElementById("dealer-cards").innerHTML += `<img src="撲克牌/${str}.png" class="card">`;
        }
        else{
            // hide one card
            document.getElementById("dealer-cards").innerHTML += `<img src="撲克牌/背面.jpeg" class="card">`;
        }
    }

    // player card
    for(let i=0;i<2;i++){
        let suit, num, str;
        do{
            suit = SUIT[Math.floor(Math.random()*4)];
            num = Math.floor(Math.random()*13 + 1);
            str = suit + NUM[num-1];
        }while(dealer_card[str] != undefined || player_card[str] != undefined)

        if(num == 1){num = 11;}
        else if(num > 10){num = 10;}
        player_card[str] = num;
        player_sum += num;

        document.getElementById("player-cards").innerHTML += `<img src="撲克牌/${str}.png" class="card">`;

        document.getElementById("player-sum").innerHTML = `${player_sum}`;
    }
}

// 發牌，顯示，判斷輸贏
// 若玩家贏要修改餘額
// agent = player or dealer
function game(agent){
    let res = 0;    // -1 = dealer win, 0 = push, 1 = player win
    // player's turn
    if(agent == 'player'){
        // take card
        let suit, num, str;
        do{
            suit = SUIT[Math.floor(Math.random()*4)];
            num = Math.floor(Math.random()*13 + 1);
            str = suit + NUM[num-1];
        }while(dealer_card[str] != undefined || player_card[str] != undefined)

        if(num == 1){num = 11;}
        else if(num > 10){num = 10;}
        player_card[str] = num;
        player_sum += num;

        let c = has_ace(player_card);
        if(player_sum > 21 && c != "0"){
            player_card[c] = 1;
            player_sum -= 10;
        }

        // show
        document.getElementById("player-cards").innerHTML += `<img src="撲克牌/${str}.png" class="card">`;
        document.getElementById("player-sum").innerHTML = `${player_sum}`;
        
        setTimeout(() => {
            // loss?
            if(player_sum > 21){
                document.getElementById("result-block").innerHTML = "<p>player loss!</p>";
                document.getElementById("dealer").style.display = "none";
                document.getElementById("player").style.display = "none";
                document.getElementById("result-block").style.display = "flex";
                res = -1;
    
                // finish game, store history to local storage
                let game = {
                    "place bet": tot_bet,
                    "dealer card": dealer_card,
                    "player card": player_card,
                    "result": res,
                    "remain bet": remain
                };
                let history = JSON.parse(localStorage.getItem('history')) || [];
                history.push(game);
                localStorage.setItem('history', JSON.stringify(history));
                sessionStorage.setItem('history', JSON.stringify(history));

                // hide playing btn, show give-card-btn
                document.getElementById("playing-btns").style.display = "none";
                document.getElementById("restart-btn").style.display = "flex";
                document.getElementById("dealer-cards").innerHTML = "";
                document.getElementById("player-cards").innerHTML = "";
            }
        }, 2000);
    }

    // dealer's turn
    else{
        document.getElementById("dealer-cards").innerHTML = "";
        for(let str in dealer_card){
            document.getElementById("dealer-cards").innerHTML += `<img src="撲克牌/${str}.png" class="card">`;
        }

        let id = setInterval(() => {
            // dealer end, end this game
            if(dealer_sum >= 17){
                // loss?
                if(dealer_sum > 21 || player_sum > dealer_sum){
                    document.getElementById("result-block").innerHTML = "<p>dealer loss!</p>";
                    res = 1;
                    remain += tot_bet * 1.5;
                    document.getElementById("player-remain").innerHTML = `餘額：${remain}`;
                }
                else if(player_sum < dealer_sum){
                    document.getElementById("result-block").innerHTML = "<p>player loss!</p>";
                    res = -1;
                }
                else{
                    document.getElementById("result-block").innerHTML = "<p>平手!</p>";
                    res = 0;
                }
                document.getElementById("dealer").style.display = "none";
                document.getElementById("player").style.display = "none";
                document.getElementById("result-block").style.display = "flex";
                console.log(`player = ${player_sum}, dealer = ${dealer_sum}`);

                // finish game, store history to local storage
                let game = {
                    "place bet": tot_bet,
                    "dealer card": dealer_card,
                    "player card": player_card,
                    "result": res,
                    "remain bet": remain
                };
                let history = JSON.parse(localStorage.getItem('history')) || [];
                history.push(game);
                localStorage.setItem('history', JSON.stringify(history));
                sessionStorage.setItem('history', JSON.stringify(history));

                clearInterval(id);

                // hide playing btn, show give-card-btn
                document.getElementById("playing-btns").style.display = "none";
                document.getElementById("restart-btn").style.display = "flex";
                document.getElementById("dealer-cards").innerHTML = "";
                document.getElementById("player-cards").innerHTML = "";
                return;
            }
            // take card
            let suit, num, str;
            do{
                suit = SUIT[Math.floor(Math.random()*4)];
                num = Math.floor(Math.random()*13 + 1);
                str = suit + NUM[num-1];
            }while(dealer_card[str] != undefined || player_card[str] != undefined)

            if(num == 1){num = 11;}
            else if(num > 10){num = 10;}
            dealer_card[str] = num;
            dealer_sum += num;

            let c = has_ace(dealer_card);
            if(dealer_sum > 21 && c != "0"){
                dealer_card[c] = 1;
                dealer_sum -= 10;
            }

            // show
            document.getElementById("dealer-cards").innerHTML += `<img src="撲克牌/${str}.png" class="card">`;
        }, 2000);
    }
}

function has_ace(card){
    if(card["C1"] == 11) return "C1";
    if(card["D1"] == 11) return "D1";
    if(card["H1"] == 11) return "H1";
    if(card["S1"] == 11) return "S1";
    return "0";
}

function fill_table(){
    const history = JSON.parse(localStorage.getItem('history'));
    let p = [], d = [];
    const tb = document.getElementById("record-table");
    for(let i=0;i<history.length;i++){
        let str = "";
        for(let key in history[i]["player card"]){
            str += key + ", ";
        }
        str = str.slice(0, -2);
        p.push(str);
        str = "";
        for(let key in history[i]["dealer card"]){
            str += key + ", ";
        }
        str = str.slice(0, -2);
        d.push(str);
    }
    for(let i=0;i<history.length;i++){
        let res = history[i]["result"]==1? "勝" : history[i]["result"]==0? "平手" : "輸";
        tb.innerHTML += `
            <tr>
                <td>${i+1}</td>
                <td>${history[i]["place bet"]}</td>
                <td>${p[i]}</td>
                <td>${d[i]}</td>
                <td>${res}</td>
                <td>${history[i]["remain bet"]}</td>
            </tr>
        `;
    }
}

/*
note
一開始發牌，如果拿到兩張1會變成22 -> 一開始抽牌也要確認1的大小
*/