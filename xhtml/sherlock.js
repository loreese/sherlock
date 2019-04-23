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
                wordsQuotes[i].style.backgroundColor = 'none';
                wordsQuotes[i].style.color = 'black';
            }
        }
    } else {
        for (var i = 0, length = wordsQutoes.length; i < length; i++) {
            wordsQuotes[i].style.backgroundColor = 'pink';
            wordsQuotes[i].style.color = 'black';
        }
    }
}