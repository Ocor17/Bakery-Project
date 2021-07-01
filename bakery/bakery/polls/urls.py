from django.urls import path

from . import views

app_name = 'polls'
urlpatterns = [
    path('', views.mainMenu, name='index'),
    path('<int:pk>/', views.DetailView.as_view(), name='detail'),
    path('<int:pk>/results/', views.ResultsView.as_view(), name='results'),
    path('<int:question_id>/vote/', views.vote, name='vote'),
    path('home/', views.home, name='home'),
    path('viewCustomers/',views.viewCustomers,name='viewCustomers'),
    path('viewProducts/', views.viewProducts,name='viewProducts'),
    path('viewPurchase/', views.viewPurchase, name='viewPurchase'),
    path('mainMenu/', views.mainMenu, name='mainMenu'),
    path('addCustomer/', views.addCustomer, name='addCustomer'),
    path('addProduct/', views.addProduct, name='addProduct'),
    path('addPurchase/', views.addPurchase, name='addPurchase'),
    path('deleteCustomer/', views.deleteCustomer, name='deleteCustomer'),
    path('deleteProduct/', views.deleteProduct, name='deleteProduct'),
    #delete purchase doesn't make sense to have but will have functinality
    #path('deletePurchase' view.deletePurchase, name='deletePurchase'),
    path('addOrder/', views.addOrder, name='addOrder'),
    path('test/', views.test,name='test'),
]