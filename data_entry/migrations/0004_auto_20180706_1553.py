# Generated by Django 2.0.4 on 2018-07-06 13:53

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('data_entry', '0003_auto_20180628_1028'),
    ]

    operations = [
        migrations.RenameField(
            model_name='pitmeovalidation',
            old_name='daca_initials',
            new_name='pitmeo_initials',
        ),
        migrations.AlterField(
            model_name='organisationtarget',
            name='organisation_target_option',
            field=models.CharField(default='', max_length=100, unique=True, verbose_name='organisation target group'),
        ),
        migrations.AlterField(
            model_name='stakeholderdirectory',
            name='organisation_district',
            field=models.ForeignKey(default=1, on_delete=django.db.models.deletion.CASCADE, to='data_entry.District', verbose_name='organisation district'),
            preserve_default=False,
        ),
        migrations.AlterField(
            model_name='stakeholderdirectory',
            name='organisation_province',
            field=models.ForeignKey(default=1, on_delete=django.db.models.deletion.CASCADE, to='data_entry.Province'),
            preserve_default=False,
        ),
    ]
