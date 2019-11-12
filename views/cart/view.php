<?php 
use yii\helpers\Html;
use yii\helpers\Url;
use yii\widgets\ActiveForm;
?>
<div class="container">

<?php if ( Yii::$app->session->hasFlash('success') ) : ?>            
	<div class="alert alert-success alert-dismissible" role="alert">
		<button type="button" class="close" data-dismiss="alert" arial-label="Close"><span aria-hidden="true">&times;</span></button>
		<?php echo Yii::$app->session->getFlash('success'); ?>
	</div>
<?php endif; ?>

<?php if ( Yii::$app->session->hasFlash('error') ) : ?>            
	<div class="alert alert-danger alert-dismissible" role="alert">
		<button type="button" class="close" data-dismiss="alert" arial-label="Close"><span aria-hidden="true">&times;</span></button>
		<?php echo Yii::$app->session->getFlash('error'); ?>
	</div>
<?php endif; ?>

<?php if(!empty($session['cart'])): ?>
	<div class="table-responsive">
		<table class="table table-hover table-striped">
			<thead>
				<tr>
					<th>Foto</th>
					<th>Nomi</th>
					<th>Soni</th>
					<th>Narxi</th>
					<th>Summa</th>
					<th><span class="glyphicon glyphicon-remove" aria-hidden="true"></span></th>
				</tr>
			</thead>
			<tbody>
				<?php foreach ($session['cart'] as $id => $item) : ?>
					<tr>
						<td><?= \yii\helpers\Html::img("@web/images/products/{$item['img']}", ['alt' => $item['name'], 'height' => 70]) ?></td>
						<td><a href="<?= Url::to(['product/view', 'id' => $id]) ?>"><?= $item['name'] ?></a></td>
						<td><?= $item['qty'] ?></td>
						<td><?= $item['price'] ?></td>
						<td><?= $item['qty'] * $item['price'] ?></td>
						<td><span data-id=<?= $id ?> class="glyphicon glyphicon-remove text-danger delete-item" aria-hidden="true"></span></td>
					</tr>
				<?php endforeach ?>
					<tr>
						<td colspan="5">Jami soni</td>
						<td><?= $session['cart.qty'] ?></td>
					</tr>
					<tr>
						<td colspan="5">Jami summa</td>
						<td><?= $session['cart.sum'] ?></td>
					</tr>
			</tbody>
		</table>
	</div>
	<hr>
	<?php $form = ActiveForm::begin() ?>
	<?= $form->field( $order, 'name' ) ?>
	<?= $form->field( $order, 'email' ) ?>
	<?= $form->field( $order, 'phone' ) ?>
	<?= $form->field( $order, 'address' ) ?>
	<?= Html::submitButton('Buyurtma berish', ['class' => 'btn btn-success']) ?>
	<?php ActiveForm::end() ?>
<?php else: ?>
	<h3>Korzina bo'sh</h3>
<?php endif; ?>	
</div>