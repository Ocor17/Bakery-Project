# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#   * Rearrange models' order
#   * Make sure each model has one field with primary_key=True
#   * Make sure each ForeignKey and OneToOneField has `on_delete` set to the desired behavior
#   * Remove `managed = False` lines if you wish to allow Django to create, modify, and delete the table
# Feel free to rename the models, but don't rename db_table values or field names.
from django.db import models


class AuthGroup(models.Model):
    name = models.CharField(unique=True, max_length=150)

    class Meta:
        managed = False
        db_table = 'auth_group'


class AuthGroupPermissions(models.Model):
    id = models.BigAutoField(primary_key=True)
    group = models.ForeignKey(AuthGroup, models.DO_NOTHING)
    permission = models.ForeignKey('AuthPermission', models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'auth_group_permissions'
        unique_together = (('group', 'permission'),)


class AuthPermission(models.Model):
    name = models.CharField(max_length=255)
    content_type = models.ForeignKey('DjangoContentType', models.DO_NOTHING)
    codename = models.CharField(max_length=100)

    class Meta:
        managed = False
        db_table = 'auth_permission'
        unique_together = (('content_type', 'codename'),)


class AuthUser(models.Model):
    password = models.CharField(max_length=128)
    last_login = models.DateTimeField(blank=True, null=True)
    is_superuser = models.IntegerField()
    username = models.CharField(unique=True, max_length=150)
    first_name = models.CharField(max_length=150)
    last_name = models.CharField(max_length=150)
    email = models.CharField(max_length=254)
    is_staff = models.IntegerField()
    is_active = models.IntegerField()
    date_joined = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'auth_user'


class AuthUserGroups(models.Model):
    id = models.BigAutoField(primary_key=True)
    user = models.ForeignKey(AuthUser, models.DO_NOTHING)
    group = models.ForeignKey(AuthGroup, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'auth_user_groups'
        unique_together = (('user', 'group'),)


class AuthUserUserPermissions(models.Model):
    id = models.BigAutoField(primary_key=True)
    user = models.ForeignKey(AuthUser, models.DO_NOTHING)
    permission = models.ForeignKey(AuthPermission, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'auth_user_user_permissions'
        unique_together = (('user', 'permission'),)


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


class DjangoAdminLog(models.Model):
    action_time = models.DateTimeField()
    object_id = models.TextField(blank=True, null=True)
    object_repr = models.CharField(max_length=200)
    action_flag = models.PositiveSmallIntegerField()
    change_message = models.TextField()
    content_type = models.ForeignKey('DjangoContentType', models.DO_NOTHING, blank=True, null=True)
    user = models.ForeignKey(AuthUser, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'django_admin_log'


class DjangoContentType(models.Model):
    app_label = models.CharField(max_length=100)
    model = models.CharField(max_length=100)

    class Meta:
        managed = False
        db_table = 'django_content_type'
        unique_together = (('app_label', 'model'),)


class DjangoMigrations(models.Model):
    id = models.BigAutoField(primary_key=True)
    app = models.CharField(max_length=255)
    name = models.CharField(max_length=255)
    applied = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'django_migrations'


class DjangoSession(models.Model):
    session_key = models.CharField(primary_key=True, max_length=40)
    session_data = models.TextField()
    expire_date = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'django_session'


class Orders(models.Model):
    transactionid = models.ForeignKey('Purchase', models.DO_NOTHING, db_column='TransactionID')  # Field name made lowercase.
    pid = models.ForeignKey('Products', models.DO_NOTHING, db_column='PID')  # Field name made lowercase.
    oquantity = models.IntegerField(db_column='OQuantity')  # Field name made lowercase.
    oid = models.IntegerField(db_column='OID', primary_key=True)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'orders'


class PollsChoice(models.Model):
    id = models.BigAutoField(primary_key=True)
    choice_text = models.CharField(max_length=200)
    votes = models.IntegerField()
    question = models.ForeignKey('PollsQuestion', models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'polls_choice'


class PollsQuestion(models.Model):
    id = models.BigAutoField(primary_key=True)
    question_text = models.CharField(max_length=200)
    pub_date = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'polls_question'


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
