# Generated by Django 2.0.4 on 2018-07-18 10:34

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('data_entry', '0007_auto_20180718_0604'),
    ]

    operations = [
        migrations.AlterField(
            model_name='dacavalidation',
            name='daca_initials',
            field=models.CharField(max_length=5, verbose_name='DACA Initials'),
        ),
        migrations.AlterField(
            model_name='dacavalidation',
            name='validated_by',
            field=models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL, to=settings.AUTH_USER_MODEL, verbose_name='Validated By'),
        ),
        migrations.AlterField(
            model_name='dacavalidation',
            name='validation_comment',
            field=models.TextField(blank=True, max_length=300, null=True, verbose_name='Validation Comment'),
        ),
        migrations.AlterField(
            model_name='dacavalidation',
            name='validation_date',
            field=models.DateTimeField(auto_now=True, verbose_name='Validation Date'),
        ),
        migrations.AlterField(
            model_name='dacavalidation',
            name='validation_status',
            field=models.CharField(choices=[('submitted', 'Submitted'), ('needs_review', 'Needs Review'), ('approved', 'Approved')], max_length=15, verbose_name='Validation Status'),
        ),
        migrations.AlterField(
            model_name='generalcomment',
            name='general_comment',
            field=models.TextField(blank=True, verbose_name='Additional Comments'),
        ),
        migrations.AlterField(
            model_name='generalcomment2',
            name='general_comment',
            field=models.TextField(blank=True, help_text='Please share any additional comments         or details about your stakeholder activity report form for this (SARF)', verbose_name='Additional Comment'),
        ),
        migrations.AlterField(
            model_name='pitmeovalidation',
            name='pitmeo_initials',
            field=models.CharField(max_length=5, verbose_name='PITMEO Initials'),
        ),
        migrations.AlterField(
            model_name='pitmeovalidation',
            name='validated_by',
            field=models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL, to=settings.AUTH_USER_MODEL, verbose_name='Validated By'),
        ),
        migrations.AlterField(
            model_name='pitmeovalidation',
            name='validation_comment',
            field=models.TextField(blank=True, max_length=300, null=True, verbose_name='Validation Comment'),
        ),
        migrations.AlterField(
            model_name='pitmeovalidation',
            name='validation_date',
            field=models.DateTimeField(auto_now=True, verbose_name='Validation Date'),
        ),
        migrations.AlterField(
            model_name='pitmeovalidation',
            name='validation_status',
            field=models.CharField(choices=[('submitted', 'Submitted'), ('needs_review', 'Needs Review'), ('approved', 'Approved')], max_length=15, verbose_name='Validation Status'),
        ),
        migrations.AlterField(
            model_name='stakeholderverification',
            name='stakeholder_initials',
            field=models.CharField(max_length=5, verbose_name='initials'),
        ),
    ]
