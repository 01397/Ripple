<?php echo $this->element('admin_menu');?>
<?php echo $this->Html->css('select2.min.css');?>
<?php echo $this->Html->script('select2.min.js');?>
<div class="admin-lessons-edit">
<?php echo $this->Html->link(__('<< 戻る'), array('action' => 'index'))?>
	<div class="panel panel-default">
		<div class="panel-heading">
			<?php echo ($this->action == 'admin_edit') ? __('編集') :  __('追加'); ?>
		</div>
		<div class="panel-body">
			<?php echo $this->Form->create('Lesson'); ?>
			<?php
				echo $this->Form->input('id');
				echo $this->Form->input('date',	array(
          'label' => __('授業日'),
          'dateFormat' => 'YMD',
          'monthNames' => false,
          'separator' => ' : ',
          'minYear' => date('Y')-1,
          'maxYear' => date('Y')+1,
          'class'=>'form-inline',
          'style' => 'display: inline;'
        ));
				echo $this->Form->input('period',	array(
          'label'   => __('時限'),
          'options' => Configure::read('period')
        ));
        echo $this->Form->input('start', array(
          'label'      => __('開始時刻'),
          'type'       => 'time',
          'timeFormat' => 24,
          'separator'  => ' : ',
          'class'=>'form-inline',
          'style' => 'display: inline;'
        ));
        echo $this->Form->input('end', array(
          'label'      => __('終了時刻'),
          'type'       => 'time',
          'timeFormat' => 24,
          'separator'  => ' : ',
          'class'=>'form-inline',
          'style' => 'display: inline;'
        ));
			?>
			<div class="form-group">
        <div class="pull-right">
					<?php echo $this->Form->submit('保存', Configure::read('form_submit_defaults')); ?>
				</div>
			</div>
			<?php echo $this->Form->end(); ?>
		</div>
	</div>
</div>
