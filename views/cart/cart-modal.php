<?php if(!empty($session['cart'])): ?>
	<div class="table-responsive">
		<table class="table table-hover table-striped">
			<thead>
				<tr>
					<th>Foto</th>
					<th>Nomi</th>
					<th>Soni</th>
					<th>Narxi</th>
					<th><span class="glyphicon glyphicon-remove" aria-hidden="true"></span></th>
				</tr>
			</thead>
			<tbody>
				<?php foreach ($session['cart'] as $id => $item) : ?>
					<tr>
						<td><?= \yii\helpers\Html::img("@web/images/products/{$item['img']}", ['alt' => $item['name'], 'height' => 70]) ?></td>
						<td><?= $item['name'] ?></td>
						<td><?= $item['qty'] ?></td>
						<td><?= $item['price'] ?></td>
						<td><span data-id=<?= $id ?> class="glyphicon glyphicon-remove text-danger del-item" aria-hidden="true"></span></td>
					</tr>
				<?php endforeach ?>
					<tr>
						<td colspan="4">Jami soni</td>
						<td><?= $session['cart.qty'] ?></td>
					</tr>
					<tr>
						<td colspan="4">Jami summa</td>
						<td><?= $session['cart.sum'] ?></td>
					</tr>
			</tbody>
		</table>
	</div>
<?php else: ?>
	<h3>Korzina bo'sh</h3>
<?php endif; ?>