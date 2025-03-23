/* 111550108 吳佳諭 第II次作業10/11 */
/* 111550108 Chua-Yu Wu The Second Homework 10/11 */

let n1, n2, n3, n4, n5, n6, n7, n8;
let b = -6.87, c = 36.54, d = 78.58, target = 0, dir = 1;

function change_bg_color(){
    // let a = Math.random() * 30 * (Math.random()>0.5? 1 : (-1));
    // let b = -6.87 + a;
    // let c = Math.max(26.54 + a, 0);
    // let d = Math.max(58.58 + a, c+30);
    // d = Math.min(d, 100);
    // document.body.style.background = `
    //     linear-gradient(
    //         to right bottom,
    //         #FFE9D0 ${b}%,
    //         #F19ED2 ${c}%,
    //         #B1AFFF ${d}%)
    // `;
    // console.log(a, Math.min(26.54 + a, 100), Math.min(58.58 + a, 100));
    b += 0.2 * Math.random() * dir; b = Math.max(b, -20);
    c += 0.2 * Math.random() * dir; c = Math.max(b, c);
    d += 0.2 * Math.random() * dir; d = Math.max(c, d); d = Math.min(d, 100);
    if(b > target - 1 && b < target + 1){
        target = -6.87 + Math.random() * 30 * (Math.random()>0.5? 1 : (-1));
        target = Math.max(-20, target);
        dir = target > b? 1 : -1;
    }
    document.body.style.background = `
        linear-gradient(
            to right bottom,
            #FFE9D0 ${b}%,
            #F19ED2 ${c}%,
            #B1AFFF ${d}%)
    `;
}
setInterval(change_bg_color, 10);

// store input to n1 - n8
function get_input(){
    document.getElementById('enter-number-form').addEventListener('submit', function(event) {
        event.preventDefault();
        let tmp = document.getElementById("num1").value;
        if(tmp < 1 || tmp > 999){
            alert(`您現在的數字1為 ${tmp}，請輸入範圍內的數字(1-999)！`);
            return;
        }
        else{n1 = Number(tmp);}
        tmp = document.getElementById("num2").value;
        if(tmp < 1 || tmp > 999){
            alert(`您現在的數字2為 ${tmp}，請輸入範圍內的數字(1-999)！`);
            return;
        }
        else{n2 = Number(tmp);}
        tmp = document.getElementById("num3").value;
        if(tmp < 1 || tmp > 999){
            alert(`您現在的數字3為 ${tmp}，請輸入範圍內的數字(1-999)！`);
            return;
        }
        else{n3 = Number(tmp);}
        tmp = document.getElementById("num4").value;
        if(tmp < 1 || tmp > 999){
            alert(`您現在的數字4為 ${tmp}，請輸入範圍內的數字(1-999)！`);
            return;
        }
        else{n4 = Number(tmp);}
        tmp = document.getElementById("num5").value;
        if(tmp < 1 || tmp > 999){
            alert(`您現在的數字5為 ${tmp}，請輸入範圍內的數字(1-999)！`);
            return;
        }
        else{n5 = Number(tmp);}
        tmp = document.getElementById("num6").value;
        if(tmp < 1 || tmp > 999){
            alert(`您現在的數字6為 ${tmp}，請輸入範圍內的數字(1-999)！`);
            return;
        }
        else{n6 = Number(tmp);}
        tmp = document.getElementById("num7").value;
        if(tmp < 1 || tmp > 999){
            alert(`您現在的數字7為 ${tmp}，請輸入範圍內的數字(1-999)！`);
            return;
        }
        else{n7 = Number(tmp);}
        tmp = document.getElementById("num8").value;
        if(tmp < 1 || tmp > 999){
            alert(`您現在的數字8為 ${tmp}，請輸入範圍內的數字(1-999)！`);
            return;
        }
        else{n8 = Number(tmp);}
        compute();
        show();
    });
}

// compute result (max, min, mid, prime, arms, fib)
function compute(){
    // max
    let mx = Math.max(n1, n2, n3, n4, n5, n6, n7, n8);
    write_ans("mx", mx.toString());

    // min
    let mn = Math.min(n1, n2, n3, n4, n5, n6, n7, n8);
    write_ans("mn", mn.toString());

    // sort
    let tmp;
    if (n1 > n2) tmp = n1, n1 = n2, n2 = tmp;
    if (n1 > n3) tmp = n1, n1 = n3, n3 = tmp;
    if (n1 > n4) tmp = n1, n1 = n4, n4 = tmp;
    if (n1 > n5) tmp = n1, n1 = n5, n5 = tmp;
    if (n1 > n6) tmp = n1, n1 = n6, n6 = tmp;
    if (n1 > n7) tmp = n1, n1 = n7, n7 = tmp;
    if (n1 > n8) tmp = n1, n1 = n8, n8 = tmp;

    if (n2 > n3) tmp = n2, n2 = n3, n3 = tmp;
    if (n2 > n4) tmp = n2, n2 = n4, n4 = tmp;
    if (n2 > n5) tmp = n2, n2 = n5, n5 = tmp;
    if (n2 > n6) tmp = n2, n2 = n6, n6 = tmp;
    if (n2 > n7) tmp = n2, n2 = n7, n7 = tmp;
    if (n2 > n8) tmp = n2, n2 = n8, n8 = tmp;

    if (n3 > n4) tmp = n3, n3 = n4, n4 = tmp;
    if (n3 > n5) tmp = n3, n3 = n5, n5 = tmp;
    if (n3 > n6) tmp = n3, n3 = n6, n6 = tmp;
    if (n3 > n7) tmp = n3, n3 = n7, n7 = tmp;
    if (n3 > n8) tmp = n3, n3 = n8, n8 = tmp;

    if (n4 > n5) tmp = n4, n4 = n5, n5 = tmp;
    if (n4 > n6) tmp = n4, n4 = n6, n6 = tmp;
    if (n4 > n7) tmp = n4, n4 = n7, n7 = tmp;
    if (n4 > n8) tmp = n4, n4 = n8, n8 = tmp;

    if (n5 > n6) tmp = n5, n5 = n6, n6 = tmp;
    if (n5 > n7) tmp = n5, n5 = n7, n7 = tmp;
    if (n5 > n8) tmp = n5, n5 = n8, n8 = tmp;

    if (n6 > n7) tmp = n6, n6 = n7, n7 = tmp;
    if (n6 > n8) tmp = n6, n6 = n8, n8 = tmp;

    if (n7 > n8) tmp = n7, n7 = n8, n8 = tmp;

    // median
    let mid = (n4 + n5)/2;
    write_ans("mid", mid.toString());

    // prime
    let str = "";
    if(is_prime(n1)){str += `${n1}, `;}
    if(is_prime(n2) && n2!=n1){str += `${n2}, `;}
    if(is_prime(n3) && n3!=n1 && n3!=n2){str += `${n3}, `;}
    if(is_prime(n4) && n4!=n1 && n4!=n2 && n4!=n3){str += `${n4}, `;}
    if(is_prime(n5) && n5!=n1 && n5!=n2 && n5!=n3 && n5!=n4){str += `${n5}, `;}
    if(is_prime(n6) && n6!=n1 && n6!=n2 && n6!=n3 && n6!=n4 && n6!=n5){str += `${n6}, `;}
    if(is_prime(n7) && n7!=n1 && n7!=n2 && n7!=n3 && n7!=n4 && n7!=n5 && n7!=n6){str += `${n7}, `;}
    if(is_prime(n8) && n8!=n1 && n8!=n2 && n8!=n3 && n8!=n4 && n8!=n5 && n8!=n6 && n8!=n7){str += `${n8}, `;}

    if(str != ""){
        str = str.replace(/,\s*$/, '');
        write_ans("prime", str);
    }
    else{
        document.getElementById("prime").textContent = "無";
    }

    // Armstrong numbers
    str = "";
    if(is_ams(n1)){str += `${n1}, `;}
    if(is_ams(n2) && n2!=n1){str += `${n2}, `;}
    if(is_ams(n3) && n3!=n1 && n3!=n2){str += `${n3}, `;}
    if(is_ams(n4) && n4!=n1 && n4!=n2 && n4!=n3){str += `${n4}, `;}
    if(is_ams(n5) && n5!=n1 && n5!=n2 && n5!=n3 && n5!=n4){str += `${n5}, `;}
    if(is_ams(n6) && n6!=n1 && n6!=n2 && n6!=n3 && n6!=n4 && n6!=n5){str += `${n6}, `;}
    if(is_ams(n7) && n7!=n1 && n7!=n2 && n7!=n3 && n7!=n4 && n7!=n5 && n7!=n6){str += `${n7}, `;}
    if(is_ams(n8) && n8!=n1 && n8!=n2 && n8!=n3 && n8!=n4 && n8!=n5 && n8!=n6 && n8!=n7){str += `${n8}, `;}

    if(str != ""){
        str = str.replace(/,\s*$/, '');
        write_ans("arms", str);
    }
    else{
        document.getElementById("arms").textContent = "無";
    }

    // Fibonacci sequence
    str = "";
    if(is_fib(n1)){str += `${n1}, `;}
    if(is_fib(n2) && n2!=n1){str += `${n2}, `;}
    if(is_fib(n3) && n3!=n1 && n3!=n2){str += `${n3}, `;}
    if(is_fib(n4) && n4!=n1 && n4!=n2 && n4!=n3){str += `${n4}, `;}
    if(is_fib(n5) && n5!=n1 && n5!=n2 && n5!=n3 && n5!=n4){str += `${n5}, `;}
    if(is_fib(n6) && n6!=n1 && n6!=n2 && n6!=n3 && n6!=n4 && n6!=n5){str += `${n6}, `;}
    if(is_fib(n7) && n7!=n1 && n7!=n2 && n7!=n3 && n7!=n4 && n7!=n5 && n7!=n6){str += `${n7}, `;}
    if(is_fib(n8) && n8!=n1 && n8!=n2 && n8!=n3 && n8!=n4 && n8!=n5 && n8!=n6 && n8!=n7){str += `${n8}, `;}

    if(str != ""){
        str = str.replace(/,\s*$/, '');
        write_ans("fib", str);
    }
    else{
        document.getElementById("fib").textContent = "無";
    }
}

// write result to HTML with img
function write_ans(id, ans){
    let cnt = 0;
    document.getElementById(id).innerHTML = "";
    for(let i=0;i<ans.length;i++){
        if(is_digit(ans[i])){
            document.getElementById(id).innerHTML += `<img src="img/${ans[i]}.png">`;
            cnt++;
        }
        else if(ans[i] == '.'){
            document.getElementById(id).innerHTML += `<img src="img/dot.png">`;
            cnt++;
        }
        else if(ans[i] == ','){
            document.getElementById(id).innerHTML += `<img src="img/blank.png">`;
            if(cnt>=10){
                document.getElementById(id).innerHTML += `<br>`;
                cnt = 0;
            }
            else{cnt++;}
        }
    }
}

// show the computing result
function show(){
    const content = document.getElementById("main-bottom");
    content.classList.remove("main-bottom");
    content.classList.add("visible");
    document.getElementById("main-bottom").scrollIntoView({ behavior: 'smooth' });
}

// clear input and scroll up to the input box to enter again
function again_btn(){
    document.getElementById("num1").value = '';
    document.getElementById("num2").value = '';
    document.getElementById("num3").value = '';
    document.getElementById("num4").value = '';
    document.getElementById("num5").value = '';
    document.getElementById("num6").value = '';
    document.getElementById("num7").value = '';
    document.getElementById("num8").value = '';
    write_ans("mx", "");
    write_ans("mn", "");
    write_ans("mid", "");
    write_ans("prime", "");
    write_ans("arms", "");
    write_ans("fib", "");

    document.getElementById("body").scrollIntoView({ behavior: 'smooth' });

    const content = document.getElementById("main-bottom");
    content.classList.remove("visible");
    content.classList.add("main-bottom");
}

function is_prime(a){
    for(let i=2;i*i<=a;i++){
        if(a%i == 0){return false;}
    }
    return true;
}

function is_ams(a){
    let n = a>99? 3 : a>9? 2 : 1;
    let sum = 0, tmp = a;
    for(let i=0;i<n;i++){
        sum += Math.pow(tmp%10, n);
        tmp = Math.floor(tmp /= 10);
    }
    return sum == a;
}

function is_fib(a) {
    let num1 = 0;
    let num2 = 1;
    let sum;
    if (a == 1) {
        return true;
    } else if (a == 2) {
        return true;
    } else {
        for (let i = 3; i < 20; i++) {
            sum = num1 + num2;
            num1 = num2;
            num2 = sum;
            if(sum == a){return true;}
        }
    }
    return false;
}

function is_digit(ch){
    return ch>='0' && ch<='9';
}

// if doesn't move for too long, go to advertisement
let time;
function time_ctl(){
    clearTimeout(time);
    time = setTimeout(() => {
        window.location.href = "ad.html";
    }, 3000);
}
function go_ad(){
    window.onload = time_ctl;
    document.onmousemove = time_ctl;
    document.onscroll = time_ctl;
    document.onclick = time_ctl;
    document.onkeypress = time_ctl;
}