# Generated by Django 2.0.4 on 2018-07-23 07:33

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('data_entry', '0009_auto_20180718_2121'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='stakeholderverification',
            name='approval',
        ),
    ]
