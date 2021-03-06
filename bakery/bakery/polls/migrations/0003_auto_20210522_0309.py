# Generated by Django 3.2.3 on 2021-05-22 09:09

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('polls', '0002_customer'),
    ]

    operations = [
        migrations.CreateModel(
            name='Customers',
            fields=[
                ('cname', models.CharField(blank=True, db_column='CName', max_length=50, null=True)),
                ('caddress', models.CharField(blank=True, db_column='CAddress', max_length=100, null=True)),
                ('cphonenumber', models.IntegerField(blank=True, db_column='CPhoneNumber', null=True)),
                ('cid', models.IntegerField(db_column='CID', primary_key=True, serialize=False)),
            ],
            options={
                'db_table': 'customers',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='Products',
            fields=[
                ('pname', models.CharField(blank=True, db_column='PName', max_length=50, null=True)),
                ('pprice', models.DecimalField(blank=True, db_column='PPrice', decimal_places=2, max_digits=5, null=True)),
                ('pingredients', models.CharField(blank=True, db_column='PIngredients', max_length=100, null=True)),
                ('pstock', models.IntegerField(blank=True, db_column='PStock', null=True)),
                ('pid', models.IntegerField(db_column='PID', primary_key=True, serialize=False)),
            ],
            options={
                'db_table': 'products',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='Purchase',
            fields=[
                ('transactionid', models.IntegerField(db_column='TransactionID', primary_key=True, serialize=False)),
                ('puquantity', models.IntegerField(blank=True, db_column='PuQuantity', null=True)),
                ('puorderdate', models.DateField(blank=True, db_column='PuOrderDate', null=True)),
                ('pufulfilldate', models.DateField(blank=True, db_column='PuFulfillDate', null=True)),
                ('pupaid', models.IntegerField(blank=True, db_column='PuPaid', null=True)),
            ],
            options={
                'db_table': 'purchase',
                'managed': False,
            },
        ),
        migrations.DeleteModel(
            name='Customer',
        ),
    ]
