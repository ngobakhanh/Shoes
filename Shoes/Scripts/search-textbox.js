// Search textbox 

$(".search-textbox").focus(function () {
    $(this).animate({ width: '+=25' }, "slow");
}).blur(function () {
    $(this).animate({ width: '-=25' }, "slow");
});