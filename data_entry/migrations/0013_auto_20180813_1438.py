# Generated by Django 2.0.4 on 2018-08-13 12:38

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('data_entry', '0012_subheaderlabel1_subheaderlabel2_subheaderlabel3_subheaderlabel4_subheaderlabel5_subheaderlabel6_subh'),
    ]

    operations = [
        migrations.CreateModel(
            name='PreventionMessageList',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('prevention_message_option', models.CharField(default='', max_length=100, unique=True, verbose_name='prevention message')),
            ],
        ),
        migrations.AlterUniqueTogether(
            name='fundingsource',
            unique_together={('name_of_organisation', 'organisation')},
        ),
        migrations.AlterUniqueTogether(
            name='iecmaterial',
            unique_together={('material_type', 'activity_form')},
        ),
        migrations.AlterUniqueTogether(
            name='targetgrouppreventionmessage',
            unique_together={('prevention_message', 'organisation')},
        ),
    ]
