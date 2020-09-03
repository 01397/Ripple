<?php echo $this->element('admin_menu');?>
<?php $this->start('script-embedded'); ?>
<script>
	$(function(){
		$('#sortable-table tbody').sortable(
		{
			helper: function(event, ui)
			{
				var children = ui.children();
				var clone = ui.clone();

				clone.children().each(function(index)
				{
					$(this).width(children.eq(index).width());
				});
				return clone;
			},
			update: function(event, ui)
			{
				var id_list = new Array();

				$('.category_id').each(function(index)
				{
					id_list[id_list.length] = $(this).val();
				});

				$.ajax({
					url: "<?php echo Router::url(array('action' => 'order')) ?>",
					type: "POST",
					data: { id_list : id_list },
					dataType: "text",
					success : function(response){
						//通信成功時の処理
						//alert(response);
					},
					error: function(){
						//通信失敗時の処理
						//alert('通信失敗');
					}
				});
			},
			cursor: "move",
			opacity: 0.5
		});
	});
</script>
<?php $this->end(); ?>
<div class="admin-courses-index full-view rounded shadow-lg m-4 p-3 ">
	<div class="ib-page-title"><?php echo __('カテゴリ一覧'); ?></div>
	<div class="buttons_container">
		<button type="button" class="btn btn-outline-primary btn-add" onclick="location.href='<?php echo Router::url(array('action' => 'add')) ?>'">+ 追加</button>
	</div>

	<div class="alert alert-warning">ドラッグアンドドロップでカテゴリの並び順が変更できます。</div>
	<table id='sortable-table'>
	<thead>
	<tr>
		<th nowrap><?php echo __('カテゴリ名'); ?></th>
		<th nowrap class="ib-col-datetime"><?php echo __('作成日時'); ?></th>
		<th nowrap class="ib-col-datetime"><?php echo __('更新日時'); ?></th>
		<th class="ib-col-action"><?php echo __('Actions'); ?></th>
	</tr>
	</thead>
	<tbody>
	<?php foreach ($categories as $category): ?>
	<tr>
		<td nowrap>
			<?php
				echo $this->Html->link($category['Category']['title'], array('controller' => 'contents', 'action' => 'index', $category['Category']['id']));
				echo $this->Form->hidden('id', array('id'=>'', 'class'=>'category_id', 'value'=>$category['Category']['id']));
			?>
		</td>
		<td nowrap class="ib-col-datetime"><?php echo h(Utils::getYMDHN($category['Category']['created'])); ?>&nbsp;</td>
		<td nowrap class="ib-col-datetime"><?php echo h(Utils::getYMDHN($category['Category']['modified'])); ?>&nbsp;</td>
		<td class="ib-col-action">
			<?php
			if($loginedUser['role']=='admin')
			{
				echo $this->Form->postLink(__('削除'),
					array('action' => 'delete', $category['Category']['id']),
					array('class'=>'btn btn-danger'),
					__('[%s] を削除してもよろしいですか?', $category['Category']['title'])
				);
			}?>
			<button type="button" class="btn btn-success" onclick="location.href='<?php echo Router::url(array('action' => 'edit', $category['Category']['id'])) ?>'">編集</button>

		</td>
	</tr>
	<?php endforeach; ?>
	</tbody>
	</table>
</div>
