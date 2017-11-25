$(document).ready(function() {
    $('#Popup').click(function() {
        var newwindow = window.open($(this).prop('href'), '', 'height=130,width=300');
        if (window.focus) {
            newwindow.focus();
        }
        return false;
    });

    $('#NewTab').click(function() {
        $(this).target = "_blank";
        window.open($(this).prop('href'));
        return false;
    });
});
