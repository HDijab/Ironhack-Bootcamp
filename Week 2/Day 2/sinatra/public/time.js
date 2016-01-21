var hoursLabel = document.getElementById("hours");
var minutesLabel = document.getElementById("minutes");
var secondsLabel = document.getElementById("seconds");
var totalSeconds = parseInt(document.getElementById("seconds").outerText);
var totalMinutes = parseInt(document.getElementById("minutes").outerText);
var totalHours = parseInt(document.getElementById("hours").outerText);
setInterval(setTime, 995);

function setTime() {
    ++totalSeconds;

    if((totalSeconds%60 === 0)){
        ++totalMinutes;
    }

    if((totalMinutes%60 === 0)){
        ++totalHours;
    }

    if((totalHours === 13)){
        totalHours = 1;
    }

    secondsLabel.innerHTML = pad(totalSeconds%60);
    minutesLabel.innerHTML = pad(totalMinutes);
    hoursLabel.innerHTML = pad(totalHours);
}

function pad(val) {
    var valString = val + "";
    if(valString.length < 2)
    {
        return "0" + valString;
    }
    else
    {
        return valString;
    }
}