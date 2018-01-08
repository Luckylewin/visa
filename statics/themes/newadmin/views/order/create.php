<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model common\models\Order */


$this->title = '录入订单';
$this->params['breadcrumbs'][] = ['label' => Yii::t('backend', 'Orders'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="order-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>

<script src="/statics/themes/newadmin/js/jquery.min.js?v=2.1.4"></script>
<script src="/statics/themes/newadmin/js/bootstrap.min.js"></script>

<script src="/statics/themes/newadmin/js/content.js?v=1.0.0"></script>
<script src="/statics/themes/newadmin/js/plugins/suggest/bootstrap-suggest.min.js"></script>
<script src="/statics/themes/newadmin/js/plugins/layer/layer.min.js"></script>

<script type="text/javascript">

    //全局选择锁
    var lock = false;

    Array.prototype.del=function(value) {
      for (var i=0; i < this.length; i++) {

          if(value === this[i]) {
              this.splice(i,1);
          }
      }
    };

    //当前选择的产品-套餐
    var currentProductCombo = [];

        //淘宝搜索建议测试
    var taobaoBsSuggest = $("#taobao").bsSuggest({
            indexId: 1, //data.value 的第几个数据，作为input输入框的内容
            indexKey: 2, //data.value 的第几个数据，作为input输入框的内容
            allowNoKeyword: false, //是否允许无关键字时请求数据
            multiWord: true, //以分隔符号分割的多关键字支持
            separator: ",", //多关键字支持时的分隔符，默认为空格
            getDataMethod: "url", //获取数据的方式，总是从 URL 获取
            effectiveFieldsAlias: {
                Id: "序号",
                Keyword: "产品ID",
                Count: "产品名称"
            },
            showHeader: true,
            //url: 'http://suggest.taobao.com/sug?code=utf-8&extras=1&q=',
            url:"<?= \yii\helpers\Url::to(['product/query','q'=>''])?>",
            /*优先从url ajax 请求 json 帮助数据，注意最后一个参数为关键字请求参数*/
            jsonp: 'callback',
            /*如果从 url 获取数据，并且需要跨域，则该参数必须设置*/
            processData: function (json) { // url 获取数据时，对数据的处理，作为 getData 的回调函数
                var i, len, data = {
                    value: []
                };

                if (!json || !json.result || json.result.length == 0) {
                    return false;
                }

                console.log(json);
                len = json.result.length;

                for (i = 0; i < len; i++) {
                    data.value.push({
                        "Id": (i + 1),
                        "Keyword": json.result[i][0],
                        "Count": json.result[i][1]
                    });
                }
                console.log(data);
                //锁定状态
                lock = false;
                return data;
            }
        }).on('onSetSelectValue', function (e, keyword, data) {
            //选择事件
            //console.log('onSetSelectValue: ', keyword);
            var _url = "<?= \yii\helpers\Url::to(['combo/query-combo','id'=>''])?>";
            _url = _url + keyword.id;
            $(this).attr('product-id',keyword.id);
            $.getJSON(_url, function(data) {
                console.log(data);
                var option = '';
                if (data.length > 0) {
                    for (var i in data) {
                        if (typeof(data[i].combo_id) !== 'undefined') {
                            option += "<option value='" + data[i].combo_id + "'>" + data[i].combo_name + "</option>";
                        }
                    }
                    lock = true;
                }
                $('#combo').empty().append(option);
            });
        });

    //确定添加产品套餐
    $('#add-to-body').click(function(){
        //添加之前 判断锁定状态
        if  (lock === false) {
            layer.msg('该产品没有可以选择的套餐!');
            return false;
        }
        //添加之前 确定是否有重复
        var product = $('#taobao');
        var combo = $('#combo');
        var product_id = product.attr('product-id');
        var combo_id = combo.val();
        var comboName = combo.find("option:selected").text();
        var comboBody = '<tr>';
        var key = product_id + '-' + combo_id;

        if (!checkTer.checkIsRepeat(key)) {
           layer.msg('不能重复添加!');
           return false;
        }

        comboBody += ('<td>' + product.val() + '</td>' + '<td>' + comboName + '</td><td><button key="' + key +'" class="btn btn-danger btn-sm combo-del"><i class="fa fa-trash-o"></i> 取消</button></td>');
        $('.product-chose').removeClass('hidden');
        $('.product-body').append(comboBody);
    });

    var checkTer = {
        //判断是否重复
        'checkIsRepeat' : function(key) {

            if (currentProductCombo.length !== 0) {
                for (var i in currentProductCombo) {
                    if (currentProductCombo[i] === key) return false;
                }
            }
            currentProductCombo.push(key);
            console.log(currentProductCombo);
            return true;
        }
    };

    $('.product-body').on('click', 'button', function() {
        var _this = $(this);
        layer.confirm('确定取消添加该产品套餐吗?', {
            btn: ['是','否'] //按钮
        }, function(){
            currentProductCombo.del(_this.attr('key'));
            console.log(currentProductCombo);
            layer.msg('已取消', {icon: 1});
            _this.parent().parent().remove();
        });
    });

    $("form").submit(function (e) {
        return false;
    });
</script>