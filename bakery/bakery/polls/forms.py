
from django import forms
import datetime
from .models import Customers, Products, Purchase, Orders

class addNewCustomer(forms.Form):
    cname = forms.CharField(label='Name', max_length=50)
    caddress = forms.CharField(label='Address',max_length=100,required=False)
    cphonenumber = forms.CharField(label='Phone number', max_length=20,required=False)
    callergies = forms.CharField(label='Allergies',max_length=50,required=False)
    cemail = forms.EmailField(label='Email',max_length=50,required=False)
    #cid = forms.IntegerField(label='ID')
    
    class Meta:
        model = Customers
        fields = ['cname','caddress','cphonenumber','callergies','cemail','cid']

class addNewProduct(forms.Form):
    pname = forms.CharField(label='Name')
    pprice = forms.DecimalField(label='Price',)
    pallergens = forms.CharField(label='Allergens')
    pstock = forms.IntegerField(label='Stock')
    #pid = forms.IntegerField(label='ID')
    
    class Meta:
        model = Products
        fields = ['pname','pprice','pallergens','pstock','pid']

class addNewPurchase(forms.Form):
    #transactionid = forms.IntegerField(label='Transaction ID')
    cid = forms.IntegerField(label='Customer ID') 
    pid = forms.IntegerField(label ='Product ID')
    puquantity = forms.IntegerField(label='Quantity')
    puorderdate = forms.DateField(label='Order Date',label_suffix=' ex.(yyyy-mm-dd)',initial=datetime.date.today)
    pufulfilldate = forms.DateField(label='Delivery Date',label_suffix=' ex.(yyyy-mm-dd)', initial=datetime.date.today)
    pupaid = forms.BooleanField(label='Is Paid',required=False)

    class Meta:
        model=Purchase
        fields = ['transactionid','cid','pid','puquantity','puorderdate','pufilfilldate','pupaid']

class addNewOrder(forms.Form):
    transactionid = forms.IntegerField(label='Transaction ID')
    pid = forms.IntegerField(label ='Product ID')
    oquantity = forms.IntegerField(label='Quantity')
    #oid = forms.IntegerField(label='Order ID')

    class Meta:
        model=Orders
        fields = ['transactionid','pid','oquantity','oid']