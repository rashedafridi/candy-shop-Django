from django.urls import *
from . import views

urlpatterns = [
    # path('admin/', admin.site.urls),
    path('', views.index, name='index'),
    path('card', views.card, name='card'),
    path('admin/', views.admin, name="admin"),
    path('upload/', views.upload, name="upload"),
    path('delete/', views.delete, name="delete"),
    path('update/<int:pid>/', views.update, name="update"),
    # path('admin/', include('CandyShop.urls')),
    path('register/', views.register, name="register"),
    path('login/', views.login, name="login"),
    path('logout/', views.logout, name="logout"),
    path('addItemInfoToModal/', views.addItemInfoToModal, name="addItemInfoToModal"),
    path('ADDToCard/', views.ADDToCard, name="ADDToCard"),
    path('removeItemFromCard/', views.removeItemFromCard, name="removeItemFromCard"),
    path('chackForelogin/', views.chackForelogin, name="chackForelogin"),
    path('makePayment/', views.makePayment, name="makePayment"),
]