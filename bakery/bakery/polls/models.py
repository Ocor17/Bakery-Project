import datetime

from django.db import models
from django.utils import timezone
from django.contrib import admin
from django.contrib.auth.models import User


class Question(models.Model):
    question_text = models.CharField(max_length=200)
    pub_date = models.DateTimeField('date published')
    def __str__(self):
        return self.question_text
    def was_published_recently(self):
        now = timezone.now()
        return now - datetime.timedelta(days=1) <= self.pub_date <= now
    @admin.display(
    boolean=True,
    ordering='pub_date',
    description='Published recently?',
    )
    def was_published_recently(self):
        now = timezone.now()
        return now - datetime.timedelta(days=1) <= self.pub_date <= now


class Choice(models.Model):
    question = models.ForeignKey(Question, on_delete=models.CASCADE)
    choice_text = models.CharField(max_length=200)
    votes = models.IntegerField(default=0)
    def __str__(self):
        return self.choice_text

class Customers(models.Model):
    cname = models.CharField(db_column='CName', max_length=50, blank=True, null=True)  # Field name made lowercase.
    caddress = models.CharField(db_column='CAddress', max_length=100, blank=True, null=True)  # Field name made lowercase.
    cphonenumber = models.CharField(db_column='CPhoneNumber', max_length=20, blank=True, null=True)  # Field name made lowercase.
    callergies = models.CharField(db_column='CAllergies', max_length=50, blank=True, null=True)  # Field name made lowercase.
    cemail = models.CharField(db_column='CEmail', max_length=50, blank=True, null=True)  # Field name made lowercase.
    cid = models.IntegerField(db_column='CID', primary_key=True)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'customers'

class Products(models.Model):
    pname = models.CharField(db_column='PName', max_length=50, blank=True, null=True)  # Field name made lowercase.
    pprice = models.DecimalField(db_column='PPrice', max_digits=5, decimal_places=2, blank=True, null=True)  # Field name made lowercase.
    pallergens = models.CharField(db_column='PAllergens', max_length=100, blank=True, null=True)  # Field name made lowercase.
    pstock = models.IntegerField(db_column='PStock', blank=True, null=True)  # Field name made lowercase.
    pid = models.IntegerField(db_column='PID', primary_key=True)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'products'


class Purchase(models.Model):
    transactionid = models.IntegerField(db_column='TransactionID', primary_key=True)  # Field name made lowercase.
    cid = models.ForeignKey(Customers, models.DO_NOTHING, db_column='CID', blank=True, null=True)  # Field name made lowercase.
    pid = models.ForeignKey(Products, models.DO_NOTHING, db_column='PID', blank=True, null=True)  # Field name made lowercase.
    puquantity = models.IntegerField(db_column='PuQuantity', blank=True, null=True)  # Field name made lowercase.
    puorderdate = models.DateField(db_column='PuOrderDate', blank=True, null=True)  # Field name made lowercase.
    pufulfilldate = models.DateField(db_column='PuFulfillDate', blank=True, null=True)  # Field name made lowercase.
    pupaid = models.IntegerField(db_column='PuPaid', blank=True, null=True)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'purchase'

class Orders(models.Model):
    transactionid = models.ForeignKey('Purchase', models.DO_NOTHING, db_column='TransactionID')  # Field name made lowercase.
    pid = models.ForeignKey('Products', models.DO_NOTHING, db_column='PID')  # Field name made lowercase.
    oquantity = models.IntegerField(db_column='OQuantity')  # Field name made lowercase.
    oid = models.IntegerField(db_column='OID', primary_key=True)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'orders'





