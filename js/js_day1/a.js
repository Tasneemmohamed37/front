// alert('wlcome to my site');

// let userName = prompt('enter your name');
// document.write("Welcome "+ userName);


function sum(n1, n2) {
    var n1 = prompt('enter first num');
    var n2 = prompt('enter second num');

    var s = parseInt(n1) + parseInt(n2);
    document.write('sum = ' + s);
}
sum(n1, n2);

function temp(today_temp) {
    var today_temp = prompt('enter today temp');
    if(today_temp >=30){
        document.write('hot');
    }
    else{
        document.write('cold');
    }
}
temp(today_temp);

function temp_feel(today_temp, feel) {
    var today_temp = prompt('enter today temp');
    var feel = prompt('enter actual feel');
    if (today_temp, feel > 25 && today_temp, feel <= 30) {
        document.write('normal');
    }
    else if (temp < 25 && feel < 25) {
        document.write('cold');
    }
    else if (temp >30 && feel >30) {
        document.write('hot');
    }
    else {
        document.write('cant detect');
    }
}
temp_feel(today_temp, feel);

function fac(faculty) {
    var faculty = prompt('enter yout faculty').toLowerCase();
    switch (faculty) {
        case 'fci':
            document.write('programming track');
            break;
        case 'engneering':
            document.write('network track');
            break;
        case 'commerce':
            document.write('erp track');
            break;
        default:
            document.write('sw track');    
    }
}
fac(faculty);

function odd(start , end){
    var start = prompt('enter start');
    var end = prompt('enter end');
    for(let i=start ; i<=end ; i++){
        if(i%2==0){
            continue
        }
        else{
            document.write(i + "\n");
            
        }
    }
}

odd(start , end)