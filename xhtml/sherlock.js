window.addEventListener('DOMContentLoaded', init, false);

function init() {
    var checkboxes = document.querySelectorAll('input[type="checkbox"]');
    for (var i = 0, length = checkboxes.length; i < length; i++) {
        checkboxes[i].addEventListener('change', checkbox_toggle, false);
        }
    }
    
function checkbox_toggle() {
    var wordsQuotes = document.getElementsByClassName(this.value);
    if (this.name == 'charDesc') {
        for (var i = 0, length = wordsQuotes.length; i < length; i++) {
            if (this.checked == true) {
                wordsQuotes[i].style.backgroundColor = 'green';
                wordsQuotes[i].style.color = 'black';
            } else {
                wordsQuotes[i].style.backgroundColor = 'transparent';
                wordsQuotes[i].style.color = 'black';
            }
        }
    }     if (this.name == 'pos') {
        for (var i = 0, length = wordsQuotes.length; i < length; i++) {
            if (this.checked == true) {
                wordsQuotes[i].style.backgroundColor = 'blue';
                wordsQuotes[i].style.color = 'white';
            } else {
                wordsQuotes[i].style.backgroundColor = 'transparent';
                wordsQuotes[i].style.color = 'black';
            }
        }
    }
}