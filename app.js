// Implementing the PIN validation using Client side Javascript is NOT recommended.
// Validate the PIN using server side logic only. 
// This is just a demo. The secret key is 1234 for %"£%$ sake ! :)

// CORS has been disabled on purpose to discourage client side use of this script.

$(init);

function init() {
    $("#btnValidate").bind("click", btnValidate_click);


    $(document).on('shown.bs.modal',
    function(e) {
        $(".modal-backdrop").remove();
    });


}

function btnValidate_click(e) {
    var pin = $("#pin").val();
    // PLEASE USE A LONGER KEY AND MAKE IT USER-SPECIFIC!
    var url = "/Validate.aspx?Pin=" + pin + "&SecretCode=1234";
    $.get(url, function(data) {
        if (data === "True") {
            bootbox.alert("Access granted");
        } else
            bootbox.alert("Access denied");
        }
    );
    e.preventDefault();
}