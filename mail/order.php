<div class="table-responsive">
	<table class="table table-hover table-striped">
		<thead>
			<tr>
				<th>Nomi</th>
				<th>Soni</th>
				<th>Narxi</th>
				<th>Summa</th>
			</tr>
		</thead>
		<tbody>
			<?php foreach ($session['cart'] as $id => $item) : ?>
				<tr>
					<td><?= $item['name'] ?></td>
					<td><?= $item['qty'] ?></td>
					<td><?= $item['price'] ?></td>
					<td><?= $item['qty'] * $item['price'] ?></td>
				</tr>
			<?php endforeach ?>
				<tr>
					<td colspan="3">Jami soni</td>
					<td><?= $session['cart.qty'] ?></td>
				</tr>
				<tr>
					<td colspan="3">Jami summa</td>
					<td><?= $session['cart.sum'] ?></td>
				</tr>
		</tbody>
	</table>
</div>