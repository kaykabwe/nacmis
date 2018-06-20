# Generated by Django 2.0.4 on 2018-06-20 05:55

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('data_entry', '0005_auto_20180620_0005'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='dacavalidation',
            name='daca_validation_statement',
        ),
        migrations.AddField(
            model_name='dacavalidation',
            name='daca_acknowledgement',
            field=models.TextField(default='"I acknowledge that I have validated this SARF for data accuracy to the best of my ability. \n                             Any necessary corrections were discussed with the stakeholder prior to this approval. \n                  \n                             Please type your initials below as acknowledgement of the above statement', max_length=1200),
        ),
    ]
