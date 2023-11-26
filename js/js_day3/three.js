function text_eve_pro() {
    document.getElementById('key_code').addEventListener('keypress', (event) => {
        key_name = event.key;
        key_code = event.keyCode;
        // Alert the key name and key code on keydown
        alert(`Key pressed ${key_name} \r\n Key code value: ${key_code}`);
    }, false);

    document.getElementById('key_code').addEventListener("mousedown", function (e) {
        switch (e.buttons) {
            case 1:
                alert('Left Mouse button pressed.');
                break;
            case 2:
                alert('middle Mouse button pressed.');
                break;
            case 3:
                alert('right Mouse button pressed.');
                break;
        }
    });
}
text_eve_pro();

function get_clock() {
    t_obj = new Date;
    document.getElementById('local_clock').innerHTML = t_obj.toLocaleTimeString('ar-EG');
}

function start_clock() {
    alert('clock started');
    c = setInterval(get_clock, 1000);
}

function Stopclock() {
    document.addEventListener("keydown", function (event) {
        if (event.altKey && (event.keyCode === 75 || event.which === 75)) {
            clearInterval(c);
            alert("click stopped");
        }
    });

}
Stopclock();

var img_conter = 0;
document.getElementById('p_img_counter').innerHTML = img_conter;
function lol() {
    img_conter += 1;
    document.getElementById('p_img_counter').innerHTML = img_conter;
}
document.getElementById('div_img_counter').addEventListener("click", lol);

setTimeout(function () {
    document.getElementById('div_img_counter').removeEventListener("click", lol);
}, 3000);


document.getElementById('a_link').addEventListener("click", function colse_link_fun(){
    setTimeout(function(){
        newWindow = window.open("http://www.google.com", "_blank", "width=500,height=500");
        newWindow.document.write("Advertising is the practice and techniques employed to bring attention to a product or service. Advertising aims to put a product or service in the spotlight in hopes of drawing it attention from consumers. It is typically used to promote a specific good or service, but there are wide range of uses, the most common being the commercial advertisement Commercial advertisements often seek to generate increased consumption of their products or services through , which associates a product name or image with certain qualities in the minds of consumers. On the other hand, ads that intend to elicit an immediate sale are known as direct-response advertising. Non-commercial entities that advertise more than consumer products or services include political parties, interest groups, religious organizations and governmental agencies. Non-profit organizations may use free modes of persuasion, such as a public service announcement. Advertising may also help to reassure employees or shareholders that a company is viable or successful.");
        newWindow.document.bgColor = "gray"
    }, 3000);
});

document.getElementById('close_link').addEventListener("click", function(){
    newWindow.close();
});