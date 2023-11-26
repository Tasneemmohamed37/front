var fname = document.getElementById('fname');

function fname_focus() {
    fname.style.border = '3px blue solid';
}

function fname_blur() {
    if (fname.value.length < 3) {
        document.getElementById('invalid_name').innerHTML = 'invalid name <br>';
        fname.style.background = 'gray';
        fname.focus();
        fname.select();
        return true
    }
    else {
        fname.style.background = 'white';
        fname.style.border = '0';
        document.getElementById('invalid_name').innerHTML = '';
        return true;
    }
}

var pass = document.getElementById('pass');
var re_pass = document.getElementById('rPass');
function check_comfirm() {
    if (pass.value.length < 5 && !(pass.value == re_pass.value)) {
        document.getElementById('repassShouldBeSame').innerHTML = 'password and repeat password should be the same <br><br>';
        return false;
    }
    else {
        document.getElementById('repassShouldBeSame').innerHTML = '';
        return true;
    }
}

document.getElementById("submit").addEventListener("click", function (event) {
    if (!fname_blur() || !check_comfirm()) {
        event.preventDefault();
        alert('plz correct validation errors first');
    }
    else{

    }
});

var currentImage = 0;

    var c;

    var imageArray = [];

    imageArray[0] = "1.jpg";
    imageArray[1] = "2.jpg";
    imageArray[2] = "3.jpg";
    imageArray[3] = "4.jpg";
    imageArray[4] = "5.jpg";
    imageArray[5] = "6.jpg";
    imageArray[6] = "7.jpg";
    imageArray[7] = "8.jpg";

    function playSlider() {
        c = setInterval(nextImage, 500);
    }

    function nextImage() {
        currentImage++;
        if (currentImage > 7)
            currentImage = 0;

        document.querySelector('#img').src = imageArray[currentImage];
    }
