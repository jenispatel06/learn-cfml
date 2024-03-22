function prev_page() {
    let page = document.querySelector("input[name=page]").value;
    document.querySelector("input[name=page]").value = page--;
    window.location.href = `${location.origin}/${location.pathname}?page=${page}`;
}

function next_page() {
    let page = document.querySelector("input[name=page]").value;
    document.querySelector("input[name=page]").value = page++;
    window.location.href = `${location.origin}/${location.pathname}?page=${page}`;
}




function isBlank( obj, message = 'Field must contain string!') {
    const value = obj.value.trim();
        if(value === "") {
            alert(message);
            obj.value = "";
            obj.focus();
            return false;
        }
        return true;
}


function isEmail( obj, message = 'Field must contain Email!') {
    const value = obj.value.trim();
    const mail = /^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$/; 
            if(!value.match(mail)) {
            alert(message);
            obj.mail = "";
            obj.focus();
            return false;
        }
        return true;
}

function isNumber( obj, message = 'Field must contain number!') {
    const value = obj.value.trim();
    const num = /^([+]\d{2})?\d{10}$/;
        if(!value.match(num)) {
        alert(message);
        obj.value = "";
        obj.focus();
        return false;
    }
    return true;
}

function isCheck(obj, message = 'At least one option should selected!') {
    const isChecked = Array.from(obj).some(element => element.checked);
        if(!isChecked){
        alert(message);        
        obj[0].focus();
        return false;
    }
    return true;
}

function checkAll(obj) {
    const isChecked = obj.checked;
    const inputs = document.getElementsByName('sport');
    for (const input of inputs) {
        if (!isChecked) {
            input.removeAttribute('checked');
        } else {
            input.setAttribute('checked', isChecked);
        }
    }
}