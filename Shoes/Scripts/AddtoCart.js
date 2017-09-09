// AddtoCart 
$(".add-to-cart").click(function () {
    var quantity = 1;
    var q = $(".input-quantity").val();
    if (typeof q != 'undefined') {
        quantity = q;
    }
    console.log(quantity);
    $.ajax({
        url: "/Carts/Add",//Controller/Action xu ly yeu cau
        method: "GET",//Phuong thuc gui du lieu len server
        async: true,//Xu ly yeu cau theo kieu bat dong bo
        cache: false,//Khong cache du lieu
        data: {//Du lieu gui len server
            id: $(this).data("param"),
            quantity: quantity
        },
        beforeSend: function () {//Duoc goi truoc khi gui yeu cau len server
            alert_show("alert-info", "Info!", "Adding the item. Please wait...");
        }
    }).done(function (result) {//Duoc goi sau khi server da xu ly xong yeu cau
        if (result.Status == "OK") {
            $("#total_amount").html(result.TotalAmount);
            var totalItems = $("#total_items").text();
            $("#total_items").html(parseInt(totalItems) + parseInt(quantity));
            alert_show("alert-success", "Success!", "Adding the item successfully");
        }
        else {
            alert_show("alert-danger", "Error!", "Error", result.Message);
        }
    }).fail(function (xhr, status) {//Duoc goi khi server bi loi khi xu ly yeu cau
        //xhr: la doi tuong HttpRequest dung de gui yeu cau va nhan ket qua
        //status: la tinh trang loi
        alert_show("alert-danger", "Error!", "Error " + status + " :" + xhr.statusText);
    }).always(function () {//Luon duoc goi sau khi server xu ly xong yeu cau
    })
});
/*
$("#btnReset").click(function () {
    $(this).closest("form").each(function () {
        //Xoa tat ca cac value cua input
        $(this).find(":input").val("");
    }).submit();
});
*/