$(function () {
    if (!location.hash) {
        location.hash = '#add';
    }
    $(window).on('hashchange', function () {
        $('#mytab').children('li').removeClass('active');
        $('.tab-pane').removeClass('active');
        $(location.hash).closest('li').addClass('active');
        $(location.hash + '-tab').addClass('active');
        if (location.hash === '#show') {
            $.ajax({
                url: '/yueji/index.php/manager/show',
                dataType: 'json',
                success: function (data) {
                    render(data);
                }
            });
        }
    });
    $(window).triggerHandler('hashchange');

    let tbody=$('tbody');
    function render(data){
        tbody.html('');
        let str='';
        $.each(data,function(i,v){
            str+=`
             <tr align="center" id="${v['id']}">
                        <td >${v['id']}</td>
                        <td id="${v['username']}"><input value="${v['username']}" name="username"></td>
                        <td> <button class="btn btn-info">删除</button></td>
                    </tr>
            `
        })
        tbody.html(str)
}

    // 增加
     let addBtn=$('.btn-default');
     let form = $('form');
     addBtn.on('click',function(){
         let data = form.serialize();
         console.log(data)
         $.ajax({
            url:'/yueji/index.php/manager/insert',
             data:data,
             success:function(data){
                 if (data === 'ok') {
                     alert('添加成功');
                 } else {
                     alert('添加失败');
                 }
             }
         })
     })

    //删除
    tbody.on('click','.btn-info',function(){
        let delBtn = $('.btn-info');
        let tr =$(this).closest('tr');
        let ids = tr.attr('id');
        $.ajax({
            url:'/yueji/index.php/manager/del',
            data:{id:ids},
            success:function(data){
                if (data === 'ok') {
                    alert('删除成功');
                    window.location.reload();
                } else {
                    alert('删除失败');
                }
            }
        })
    })

    // 修改

    tbody.on('blur','input',function(){
        let value = $(this).val();
        let type = $(this).attr('type');
        let id = $(this).closest('tr').attr('id');
        $.ajax({
            url:'/yueji/index.php/manager/updates',
            data:{value,type,id},
            success:function(data){
                if(data=='ok'){
                    alert('修改成功');
                }else{
                    alert('修改失败');
                }
            }
        })

    })



})