js_Tips = ['1. Have a Firm Grip on the Basics',
    '2. Don’t Set Too Many Parameters',
    '3. Don’t Randomly Name the Variables',
    '4. Delete Deprecated Code',
    '5. Split the Functionality',
    '6. Don’t Write Meaningless Code Comments',
    '7. Document Your Code',
    '8. Use ESLint or Prettier',
    '9. Don’t Ignore Code For Request Failures',
    '10. Be Open to Code Reviews'];

function rand_tips() {
    document.getElementById("para").innerHTML = js_Tips[Math.floor(Math.random() * 10)];
}

// rand_tips();

function date_time_local() {
    const date = new Date();
    document.getElementById('date_local').innerHTML = date.toLocaleString('ar-EG');
}
// date_time_local();

function email_val() {
    user_email = prompt('please enter your email').toLowerCase();
    atsympol = user_email.indexOf('@');

    if (atsympol != 0 && atsympol != user_email.length - 1) {
        document.getElementById('mail').innerHTML = 'valid email';
    }
    else {
        document.getElementById('mail').innerHTML = 'not valid email';
    }
}
// email_val();

function data_regExp_fullname() {
    user_fullName = prompt('From RegExp : \n please enter your full name').toLowerCase();

    //([\w]{3,}) the first name should contain only letters and of length 3 or more
    //+\s the first name should be followed by a space
    //+([\w\s]{3,})+ the second name should contain only letters of length 3
    // or more and can be followed by other names or not
    ///i ignores the case of the letters. Can be uppercase or lowercase letters

    reg_exp_fullname = new RegExp(/^([\w]{3,})+\s+([\w\s]{3,})+$/i);
    t_reg = reg_exp_fullname.test(user_fullName);
    document.getElementById('fullname_reg').innerHTML = t_reg;
}
// data_regExp_fullname();



function data_regExp_email() {
    user_email_reg = prompt('From RegExp : \n please enter your email').toLowerCase();
    domain = 'eg';
    reg_exp_mail = new RegExp(/^\b[A-Z0-9._%-]+@[A-Z0-9.-]+\.[A-Z]{2,4}\b$/i);
    mail_reg = reg_exp_mail.test(user_email_reg);

    while (!reg_exp_mail.test(user_email_reg) || user_email_reg.split('.')[2] != domain) {
        alert('not a valid email address, or the wrong domain!');
        user_email_reg = prompt('From RegExp : \n please enter your email').toLowerCase();
    }
    document.getElementById('mail_reg').innerHTML = mail_reg;




}
// data_regExp_email();

function studens() {
    student_grads = [60, 100, 10, 15, 85];
    document.getElementById('stu_grad').innerHTML = 'sort array numicry desc : ' + student_grads.sort((a, b) => b - a);
    document.getElementById('stu_found').innerHTML = 'highest student degree use find = ' + student_grads.find(e => e <= 100);
    document.getElementById('stu_filter').innerHTML = 'students <60 use filter : ' + student_grads.filter(e => e < 60);
}
studens();


function students_arr_obj() {
    student_arr = [
        {
            name: "tasneem",
            degree: 100
        },
        {
            name: "ahmeed",
            degree: 60
        },
        {
            name: "younis",
            degree: 10
        },
        {
            name: "laren",
            degree: 15
        },
        {
            name: "ayman",
            degree: 85
        },
    ];

    document.getElementById('find').innerHTML = 'student between 90 and 100 : ' + student_arr.find(e => e.degree > 90 && e.degree <= 100).name;
    document.getElementById('filter').innerHTML = ' students less than 60 : ' + student_arr.filter(e => e.degree < 60).name;

    obj = {
        name: 'mai',
        degree: 77
    };
    student_arr.push(obj);

    document.getElementById('push').insertAdjacentHTML('beforeend', 'display with for..in after push an obj ' + '<br>');
    for (i in student_arr) {
        document.getElementById('push').insertAdjacentHTML('beforeend', student_arr[i].name + " : " + student_arr[i].degree + '<br>');
    }

    student_arr.pop();
    document.getElementById('pop').insertAdjacentHTML('beforeend', 'display with for..of after pop ' + '<br>');
    for (i of student_arr) {
        document.getElementById('pop').insertAdjacentHTML('beforeend', i.name + ' : ' + i.degree + '<br>');
    }


    document.getElementById('sort_alpha').insertAdjacentHTML('beforeend', 'sort arr alpha based on name' + '<br>');
    student_arr.sort((a, b) => a.name.localeCompare(b.name));
    for (i in student_arr) {
        document.getElementById('sort_alpha').insertAdjacentHTML('beforeend', student_arr[i].name + ' : ' + student_arr[i].degree + '<br>')
    }

    new_student_arr = [
        {
            name: "hager",
            degree: 67
        },
        {
            name: "khaled",
            degree: 87
        }];
    student_arr.splice(2, 0, ...new_student_arr);
    document.getElementById('splice_add').insertAdjacentHTML('beforeend', 'add two obj after second element use splice' + '<br>');
    for (i in student_arr) {
        document.getElementById('splice_add').insertAdjacentHTML('beforeend', student_arr[i].name + ' : ' + student_arr[i].degree + '<br>');
    }


    student_arr.splice(3, 1);
    document.getElementById('splice_remove').insertAdjacentHTML('beforeend', 'remove one element after third element use splice' + '<br>');
    for (i in student_arr) {
        document.getElementById('splice_remove').insertAdjacentHTML('beforeend', student_arr[i].name + ' : ' + student_arr[i].degree + '<br>');
    }


}
students_arr_obj();

user_birth_date = prompt('please enter birth date in DD-MM-YYYY').toLowerCase();
function birthDate(d) {
    if (d.length == 10 && d.charAt(2) == '-' && d.charAt(5) == '-') {
        create_new_date();
    }
    else {
        alert('wrong date format');
    }
}

function create_new_date() {
    var parts = user_birth_date .split('-');
    var mydate = new Date(parts[2], parts[1]-1, parts[0]);
    document.getElementById('inner').innerHTML = mydate.toDateString();
}

