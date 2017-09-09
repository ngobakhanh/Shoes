//type=alert-success, alert-info, alert-warning, alert-danger
function alert_show(type, title, message) {
    $(".alert").removeClass().addClass("alert " + type);
    $(".alert strong").html(title);
    $(".alert span").html(message);
}
function alert_hide() {
    $(".alert").addClass("hidden");
}