# Generated by Django 2.0.4 on 2018-06-19 21:51

import datetime
from django.db import migrations, models
from django.utils.timezone import utc


class Migration(migrations.Migration):

    dependencies = [
        ('data_entry', '0002_auto_20180619_2329'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='dacavalidation',
            name='form_validated',
        ),
        migrations.AddField(
            model_name='dacavalidation',
            name='daca_validation_statement',
            field=models.CharField(default=datetime.datetime(2018, 6, 19, 21, 51, 17, 913052, tzinfo=utc), max_length=1200),
            preserve_default=False,
        ),
        migrations.AddField(
            model_name='dacavalidation',
            name='validation_comment',
            field=models.CharField(default='', max_length=300),
            preserve_default=False,
        ),
        migrations.AddField(
            model_name='dacavalidation',
            name='validation_status',
            field=models.CharField(choices=[('submitted', 'Submitted'), ('needs_review', 'Needs Review'), ('approved', 'Approved')], default='submitted', max_length=15),
            preserve_default=False,
        ),
    ]