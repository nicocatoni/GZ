$(document).on('ready turbolincks:load', function(){
    $("[name='commit']").click(function(event){
        event.preventDefault();
        var review = $('#review_comment').val();
        $.ajax({
            url: '/growshops/reviews',
            type: 'POST',
            dataType: 'script',
            data: {review: { comment, user_id: 1 }}
        })
        .fail(function() {
            console.log("error");
        })
        .always(function() {
            console.log("complete");
        });
    })     
})
