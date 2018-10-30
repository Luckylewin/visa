<div class="container">
    <div class="jumbotron" style="margin-top: 30px;">
        <h2>签证订单管理系统</h2>
        <h2> <p id="localtime"></p></h2>
        <p></p>
        <p>
            <a class="btn btn-primary btn-lg" href="<?= \yii\helpers\Url::to(['order/create']) ?>" role="button">
               <i class="fa-plus-square-o fa"></i> 录入订单
            </a>
            <a class="btn btn-info btn-lg" href="<?= \yii\helpers\Url::to(['excel/import']) ?>" role="button">
               <i class="fa-file-excel-o fa"></i> 导入Excel
            </a>
        </p>
    </div>
</div>



<?php \common\widgets\Jsblock::begin() ?>


<script type="text/javascript">
    function showLocale(objD){
        var str,colorhead,colorfoot;
        var year = objD.getYear();
        if(year < 1900) year = year+1900;
        var month = objD.getMonth()+1;
        if(month < 10) month = '0' + month;
        var day = objD.getDate();
        if(day < 10) day = '0' + day;
        var hour = objD.getHours();
        if(hour < 10) hour = '0' + hour;
        var min = objD.getMinutes();
        if(min < 10) min = '0' + min;
        var second = objD.getSeconds();
        if(second < 10) second = '0' + second;
        var weekDay = objD.getDay();
        if  ( weekDay === 0 )  colorhead="";
        if  ( weekDay > 0 && weekDay < 6 )  colorhead="";
        if  ( weekDay === 6 )  colorhead="";
        if  (weekDay === 0)  weekDay="星期日";
        if  (weekDay === 1)  weekDay="星期一";
        if  (weekDay === 2)  weekDay="星期二";
        if  (weekDay === 3)  weekDay="星期三";
        if  (weekDay === 4)  weekDay="星期四";
        if  (weekDay === 5)  weekDay="星期五";
        if  (weekDay === 6)  weekDay="星期六";
        colorfoot="";
        str = colorhead + year + "/" + month + "/" + day + " " + hour + ":" + min + ":" + second + "  " + weekDay + colorfoot;
        return(str);
    }

    function tick(){
        var today;
        today = new Date();
        document.getElementById("localtime").innerHTML =  " " + showLocale(today);
        window.setTimeout("tick()", 1000);
    }
    tick();
</script>

<?php \common\widgets\Jsblock::end() ?>