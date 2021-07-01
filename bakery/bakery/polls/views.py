
import polls
from django.http import HttpResponseRedirect
from django.http.response import HttpResponse
from django.shortcuts import get_object_or_404, render
from django.urls import reverse
from django.views import generic
from .models import Choice, Customers, Question, Products,Purchase,Orders
from django.utils import timezone
from .forms import addNewCustomer, addNewOrder, addNewProduct, addNewPurchase
from django.contrib import messages
from django.db.models import Max,Sum


class IndexView(generic.ListView):
    template_name = 'polls/index.html'
    context_object_name = 'latest_question_list'

    def get_queryset(self):
        """
        Return the last five published questions (not including those set to be
        published in the future).
        """
        return Question.objects.filter(
            pub_date__lte=timezone.now()
        ).order_by('-pub_date')[:5]


class DetailView(generic.DetailView):
    model = Question
    template_name = 'polls/detail.html'

    def get_queryset(self):
        """
        Excludes any questions that aren't published yet.
        """
        return Question.objects.filter(pub_date__lte=timezone.now())


class ResultsView(generic.DetailView):
    model = Question
    template_name = 'polls/results.html'


def vote(request, question_id):
    question = get_object_or_404(Question, pk=question_id)
    try:
        selected_choice = question.choice_set.get(pk=request.POST['choice'])
    except (KeyError, Choice.DoesNotExist):
        # Redisplay the question voting form.
        return render(request, 'polls/detail.html', {
            'question': question,
            'error_message': "You didn't select a choice.",
        })
    else:
        selected_choice.votes += 1
        selected_choice.save()
        # Always return an HttpResponseRedirect after successfully dealing
        # with POST data. This prevents data from being posted twice if a
        # user hits the Back button.
        return HttpResponseRedirect(reverse('polls:results', args=(question.id,)))

def home(request):
    test={'hey':'test','adfasdf':'test','asfdasdfasdf':'tttttt'}

    return render(request, 'polls/mainMenu.html',{'title':'About'})

def viewCustomers(request):
    dis = Customers.objects.all()
    return render(request,'polls/viewCustomers.html', {'dis':dis})

def viewProducts(request):
    product = Products.objects.all()
    return render(request, 'polls/viewProducts.html',{'product':product})

def viewPurchase(request):
    #customer and product objects are passed. Values can be called from html
    purchase = Purchase.objects.all()
    return render(request, 'polls/viewPurchase.html',{'purchase':purchase})

def mainMenu(request):
    return render(request, 'polls/mainMenu.html')

def addCustomer(request):

    if request.method == 'POST':
        form = addNewCustomer(request.POST)
        if form.is_valid():
            cname = form.cleaned_data['cname']
            caddress = form.cleaned_data['caddress']
            cphonenumber = form.cleaned_data['cphonenumber']
            callergies = form.cleaned_data['callergies']
            cemail = form.cleaned_data['cemail']
            #cid = form.cleaned_data['cid']

            max_num = Customers.objects.all().aggregate(Max('cid'))

            if max_num['cid__max'] == None:
                cid = 0
            else:
                cid = max_num["cid__max"] +1

            cust = Customers(cname, caddress,cphonenumber,callergies,cemail,cid)
            cust.save()

            return HttpResponseRedirect('/viewCustomers')
    else:
        form = addNewCustomer()

    return render(request, 'polls/addCustomer.html', {'form':form})

def addProduct(request):
    
    if request.method == 'POST':
        form = addNewProduct(request.POST)
        if form.is_valid():

            #may need to refractor for ModelForm in future
            pname = form.cleaned_data['pname']
            pprice= form.cleaned_data['pprice']
            pallergens = form.cleaned_data['pallergens']
            pstock= form.cleaned_data['pstock']
            #pid = form.cleaned_data['pid']
            
            max_num = Products.objects.all().aggregate(Max('pid'))

            if max_num['pid__max'] == None:
                pid = 0
            else:
                pid = max_num["pid__max"] +1

            prod = Products(pname, pprice,pallergens,pstock,pid)
            prod.save()

            messages.success(request, 'Entry successful')
            return HttpResponseRedirect('/viewProducts')
    else:
        form = addNewProduct()

    return render(request, 'polls/addProduct.html', {'form':form})

def addPurchase(request):
    
    if request.method == 'POST':
        form = addNewPurchase(request.POST)
        if form.is_valid():

            #tid = form.cleaned_data['transactionid']
            cid = form.cleaned_data['cid']
            pid = form.cleaned_data['pid']
            quantity = form.cleaned_data['puquantity']
            orderdate = form.cleaned_data['puorderdate']
            fulfilldate = form.cleaned_data['pufulfilldate']
            paid = form.cleaned_data['pupaid']

            
            max_num = Purchase.objects.all().aggregate(Max('transactionid'))
            if max_num["transactionid__max"] == None:
                tid = 0
            else:
                tid = max_num["transactionid__max"] +1

            pur = Purchase(tid,cid,pid,quantity,orderdate,fulfilldate,paid)
            pur.save()

            return HttpResponseRedirect('/viewPurchase')
    else:
        form = addNewPurchase()

    return render(request, 'polls/addPurchase.html', {'form':form})

def addOrder(request):
    #need to do summing of right column for total of this order
    order = Orders.objects.all()
    total = Orders.objects.filter(transactionid = 0).values_list('pid')[0]
    total = total[0]
    summin = Products.objects.filter(pid=total).aggregate(Sum('pprice'))
    #return HttpResponse(summin['pprice__sum'])

    if request.method == 'POST':
        form = addNewOrder(request.POST)
        if form.is_valid():

            #tid = form.cleaned_data['transactionid']
            transactionid = form.cleaned_data['transactionid']
            pid = form.cleaned_data['pid']
            oquantity = form.cleaned_data['oquantity']

            
            max_num = Orders.objects.all().aggregate(Max('oid'))

            if max_num["oid__max"] == None:
                oid = 0
            else:
                oid = max_num["oid__max"] +1

            orde = Orders(transactionid,pid,oquantity,oid)
            orde.save()

            return HttpResponseRedirect('/addOrder')
    else:
        form = addNewOrder()

    return render(request, 'polls/addOrder.html', {'order':order,'form':form})


def  deleteCustomer(request):
    print('g')

def  deleteProduct(request):
    print('f')

def  deletePurchase(request):
    print('f')

def test(request):
    return HttpResponse('Hi')