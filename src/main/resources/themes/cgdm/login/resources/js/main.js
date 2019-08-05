
(function ($) {
    "use strict";


    /*==================================================================
    [ Focus input on start ]*/
    var AUTOFILLED = 'is-autofilled';
    function onAutoFillStart(elt) {
        elt.addClass(AUTOFILLED);
    }
    function onAutoFillCancel(elt) {
        elt.removeClass(AUTOFILLED);
    }
    function onAnimationStart(target, animationName) {
        switch (animationName) {
            case 'onAutoFillStart':
                return onAutoFillStart(target)
            case 'onAutoFillCancel':
                return onAutoFillCancel(target)
        }
    }
    $("input[name='username']").on('animationstart', function(e) {
        onAnimationStart($(this), e.originalEvent.animationName); 
        if (e.originalEvent.animationName == 'onAutoFillStart') {
            $(this).addClass('has-val');
            $("input[name='password']").addClass('has-val');
        }
    });

    /*==================================================================
    [ Focus input ]*/
    $('.input-login').each(function(){
        $(this).on('blur', function(){
            $(".focus-input-login").removeClass('has-error');
            if($(this).val().trim() != "") {
                $(this).addClass('has-val');               
            }
            else {
                $(this).removeClass('has-val');
            }
        })
    })
  
  
    /*==================================================================
    [ Validate ]*/
    var input = $('.validate-input .input-login');

    $('.validate-form').on('submit',function(){
        var check = true;

        for(var i=0; i<input.length; i++) {
            if(validate(input[i]) == false){
                showValidate(input[i]);
                check=false;
            }
        }

        return check;
    });


    $('.validate-form .input-login').each(function(){
        $(this).focus(function(){
           hideValidate(this);
        });
    });

    function validate (input) {
        if($(input).attr('type') == 'email' || $(input).attr('name') == 'username') {
            if($(input).val().trim().match(/^([a-zA-Z0-9_\-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([a-zA-Z0-9\-]+\.)+))([a-zA-Z]{1,5}|[0-9]{1,3})(\]?)$/) == null) {
                return false;
            }
        }
        else {
            if($(input).val().trim() == ''){
                return false;
            }
        }
    }

    function showValidate(input) {
        var thisAlert = $(input).parent();

        $(thisAlert).addClass('alert-validate');
        $(input).next().addClass('has-error');
    }

    function hideValidate(input) {
        var thisAlert = $(input).parent();

        $(thisAlert).removeClass('alert-validate');
        $(input).next().removeClass('has-error');
    }
    
    
})(jQuery);