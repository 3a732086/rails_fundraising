// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.


function countdown(){
    $('.seconds_countdown').each(function (){
        var newSeconds = parseInt($(this).data('seconds')) - 1;
        $(this).data('seconds', newSeconds);
        if (newSeconds <= 0){
            $(this).html("募資已經結束");
        }
        else{
            var daysLeft = secondsToDaysLeft(newSeconds);
            $(this).html("將於" + daysLeft + "後結束");
        }
    })
}

    function secondsToDaysLeft(number){
    number = Number(number);
    var day = Math.floor(number / 3600 / 24);
    var hour = Math.floor(number / 3600 % 24);
    var minutes = Math.floor(number % 3600 / 60);
    var seconds = Math.floor(number % 3600 % 60);

    var dDisplay = day == 0 ? "" : day + "天 ";
    var hDisplay = (day == 0 && hour == 0) ? "" : hour + "小時 ";
    var mDisplay = (day == 0 && hour == 0 && minutes == 0) ? "" : minutes + "分 ";
    var sDisplay = seconds + "秒 ";
    return dDisplay + hDisplay + mDisplay + sDisplay;
}
