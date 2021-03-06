# Generated by Django 2.0.4 on 2018-08-28 10:10

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('data_entry', '0018_auto_20180824_1125'),
    ]

    operations = [
        migrations.CreateModel(
            name='SupportByArea',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('support_given_at_area', models.CharField(default='', max_length=100, unique=True)),
            ],
        ),
        migrations.RemoveField(
            model_name='programactivity',
            name='areas_of_support',
        ),
        migrations.AddField(
            model_name='programactivity',
            name='areas_of_support2',
            field=models.ManyToManyField(to='data_entry.SupportByArea', verbose_name='Program activities by geographic area'),
        ),
    ]
