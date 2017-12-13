'use strict';

$(function () {
    var btn = $('.btn');
    var username = $('.username');
    var password = $('.password');

    $('input').on('blur', function () {
        var e = $(this);
        var validate = e.attr('data-validate');
        if (validate) {
            var value = e.val().trim();
            var arr = validate.split(';');
            var flag = true;
            for (var i = 0; i < arr.length; i++) {
                var validateArr = arr[i].split(':');
                if (!validateType(value, validateArr[0])) {
                    e.closest('.form-group').find('.form-help').remove();
                    $('<div>').addClass('form-help').text(validateArr[1]).insertAfter(this);
                    flag = false;
                    break;
                }
            }
            if (flag) {
                $(this).closest('.form-group').find('.form-help').remove();
            }
        }
    });

    function validateType(value, type) {
        switch (type) {
            case 'require':
                return (/[^(^\s*|\s*$)]/.test(value)
                );
                // return !!value.length;
                break;
            case 'username':
                return (/^[a-zA-Z]{3,10}$/.test(value)
                );
                break;
            case 'password':
                return (/\w{5,10}/.test(value)
                );
                break;
            // case 'qq':
            //     return /[1-9]/
        }
    }

    btn.on('click', function () {
        $('input').trigger('blur');
        if ($('form').find('.form-help').length) {
            return;
        }

        var data = { username: username.val(), password: password.val() };
        $.ajax({
            data: data,
            url: '/yueji/index.php/login/check',
            success: function success(data) {

                if (data === 'ok') {
                    location.href = '/yueji/index.php/manager/index';
                } else {
                    alert('登录失败');
                }
            }
        });
        return false;
    });
});