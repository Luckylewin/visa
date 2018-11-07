<?php
/**
 * Created by PhpStorm.
 * User: lychee
 * Date: 2018/11/7
 * Time: 17:28
 */

//$this->registerJsFile('/statics/js/echarts.simple.min.js', ['depends' => 'yii\web\JqueryAsset'])
$this->registerJsFile('https://cdn.bootcss.com/echarts/4.1.0-release/echarts.common.js', ['position' => $this::POS_HEAD])
?>

<style>
    .item
    {
        width: 350px;height:250px;float: left;margin: 20px;background: #F6F6F6;
    }
</style>

<div>
    <div id="main1" class="item"></div>
    <div id="main2" class="item"></div>
    <div id="main3" class="item"></div>
</div>

<div>
    <div id="main4" class="item"></div>
    <div id="main5" class="item"></div>
    <div id="main6" class="item"></div>
</div>

<div>
    <div id="main7" class="item"></div>
    <div id="main8" class="item"></div>
    <div id="main9" class="item"></div>
</div>


<div class="col-md-12 text-center">
   
</div>

<?php

$data = json_encode($data);

$JS=<<<JS

option = {
    title: {
        text: '数据对比'
    },
    color: ['#3398DB'],
    tooltip : {
        trigger: 'axis',
        axisPointer : {            // 坐标轴指示器，坐标轴触发有效
            type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
        }
    },
    grid: {
        left: '3%',
        right: '4%',
        bottom: '3%',
        containLabel: true
    },
    xAxis : [
        {
            type : 'category',
            data : ['今天', '昨天'],
            axisTick: {
                alignWithLabel: true
            }
        }
    ],
    yAxis : [
        {
            type : 'value'
        }
    ],
    series : [
        {
            name:'直接访问',
            type:'bar',
            barWidth: '88%',
            data:[10, 52]
        }
    ]
};
  
 // 直客

 var data = eval($data);
 var index = 1; 
 console.log(data)
 for(var type in data) {
     var item = data[type];
     for (var field in item) {
         var myChart = echarts.init(document.getElementById('main' + index));
         option.title.text = type + field + ' 数据对比'; 
         var today = item[field]['今天']
         var yesterday = item[field]['昨天']
         option.series[0].data = [today, yesterday]
         myChart.setOption(option)
         index++;
     }
}
 
 
JS;

$this->registerJs($JS);

?>
