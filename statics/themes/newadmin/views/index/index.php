<div class="container">
    <div class="jumbotron">
        <h2>签证订单管理系统</h2>
        <p></p>
        <p>
            <a class="btn btn-primary btn-lg" href="<?= \yii\helpers\Url::to(['order/create']) ?>" role="button">
                录入订单
            </a>
            <a class="btn btn-info btn-lg" href="<?= \yii\helpers\Url::to(['excel/import']) ?>" role="button">
                导入Excel
            </a>
        </p>
    </div>
</div>