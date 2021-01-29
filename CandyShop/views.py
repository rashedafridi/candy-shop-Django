from django.urls import reverse
from urllib.parse import urlencode
from django.shortcuts import render,redirect
from . import myform
from django.core.files.storage import FileSystemStorage

from .dbmodels.product import Product,orderDetail,User,Login
from .dbmodels.productdao import ProductDAO

#JsonResponse
from django.http import *

def admin(request):
    django_form=myform.UploadForm()
    dao=ProductDAO()
    prodlist=dao.showall()
    ordertlist=dao.orderDetail()
    # print("++++++++++++++++++++++++++++++++++++++++++++++++++++")
    # print(ordertlist[0].getId)
    return render(request, 'admin.html', {'f':django_form,'success':True ,'data':prodlist,'order':ordertlist})
def upload(request):
    print("uploding 0.0")
    if request.method=="POST":
        print("uploding 0")
        django_form=myform.UploadForm(request.POST, request.FILES)
        print("uploding 1")
        if django_form.is_valid():
            #receiving the cleaned data
            ProductTitle=django_form.cleaned_data['ProductTitle']
            price=django_form.cleaned_data['price']
            catagory=django_form.cleaned_data['catagory']
            brand=django_form.cleaned_data['brand']
            quentity=django_form.cleaned_data['quentity']
            product_desc=django_form.cleaned_data['product_desc']
            image=django_form.cleaned_data['product_img']

            #uploading the file to media folder
            fs=FileSystemStorage()
            filename=fs.save(image.name,image)
            imageurl=fs.url(filename)

            p=Product(-1,ProductTitle,price,catagory,brand,quentity,imageurl,product_desc)
            dao=ProductDAO()
            print("uploding 2")
            dao.upload(p)

                #reinitializing django form
            django_form=myform.UploadForm()
            return redirect(admin)
            # return render(request, 'admin.html', {'f':django_form,'success':True})
            # try:
            #     dao.upload(p)

            #     #reinitializing django form
            #     django_form=myform.UploadForm()
            #     return render(request, 'admin.html', {'f':django_form,'success':True})
            # except:
            #     return render(request, 'admin.html', {'f':django_form,'success':False})
        else:
            return redirect(admin)
    else:
        return render(request, 'index.html', {'f':django_form ,'success':False})
def index(request):

    # django_form=myform.UploadForm()
    dao=ProductDAO()
    prodlist=dao.showall()
    # ordertlist=dao.orderDetail()
    # print("++++++++++++++++++++++++++++++++++++++++++++++++++++")
    # print(ordertlist[0].getId)

    # return render(request, 'index.html', { 'product':prodlist,})
    card_product_list_count=0
    if 'card_product' in request.session:
        card_product_list_count = len(request.session['card_product'])

    registation = request.GET.get('registation')
    if 'email' in request.session:
        email=request.session['email']
        fastName =request.session['fastName']            
        lastName =request.session['lastName']
        return render(request, 'index.html' ,{ 'product':prodlist,'email':email,'fastName':fastName ,'lastName':lastName ,'card_product_list_count':card_product_list_count})
    elif registation:
        print(registation)
        return render(request, 'index.html' ,{'product':prodlist, 'registation': eval(registation) ,'card_product_list_count':card_product_list_count})
    else:
        return render(request, 'index.html' ,{'product':prodlist ,'card_product_list_count':card_product_list_count})

def card(request):
    card_product_list_count=0
    if 'card_product' in request.session:
        card_product_list_count = len(request.session['card_product'])
    try:
        if not 'card_product' in request.session or not request.session['card_product']:
            # return empty
            if 'email' in request.session:
                email=request.session['email']
                fastName =request.session['fastName']            
                lastName =request.session['lastName']
                return render(request, 'card.html' ,{'Product':False, 'email':email,'fastName':fastName ,'lastName':lastName ,'card_product_list_count':card_product_list_count})
            return render(request, 'card.html', {'Product':False ,'card_product_list_count':card_product_list_count})
        else:
            card_list = request.session['card_product']
            print(card_list)
            productInfo=ProductDAO()
            card_product_list=productInfo.findCardprod(card_list)
            print(len(card_product_list))
            print(card_product_list[0].getImgpath())

            if 'email' in request.session:
                email=request.session['email']
                fastName =request.session['fastName']            
                lastName =request.session['lastName']
                return render(request, 'card.html' ,{'product':True,'card_product_list':card_product_list,'email':email,'fastName':fastName ,'lastName':lastName ,'card_product_list_count':card_product_list_count})

            return render(request, 'card.html', {'product':True ,'card_product_list':card_product_list ,'card_product_list_count':card_product_list_count})
    except Exception as e:
        s = str(e)
        print('product retrivle  failed (views)')
        print(s)
        return render(request, 'card.html', {'product':False})
        

    
    return render(request, 'card.html')    
def delete(request):
    if request.method=='POST':
        pid=request.POST['pid']
        dao=ProductDAO()
        try:
            p=dao.delete(pid)
            prodlist=dao.showall() #list of product objects
            return redirect(admin)
            # return render(request, 'admin.html', {'data':prodlist,'success':True})
        except:
            prodlist=dao.showall() #list of product objects
            return redirect(admin)



def update(request, pid):
    if request.method=='GET':
        dao=ProductDAO()
        p=dao.findprod(pid)

        django_form=myform.UpdateForm(initial={'pid':p.getId(), 'ProductTitle':p.getProductTitle(), 'price':p.getPrice(), 'catagory':p.getCatagory(), 'brand':p.getBrand(), 'quentity':p.getQuentity() ,'product_desc':p.getDescription()})
        return render(request,'update.html',{'f':django_form})

    elif request.method=='POST':
        django_form=myform.UpdateForm(request.POST)
        if django_form.is_valid():
            ids=django_form.cleaned_data['pid']
            ProductTitle=django_form.cleaned_data['ProductTitle']
            price=django_form.cleaned_data['price']
            catagory=django_form.cleaned_data['catagory']
            brand=django_form.cleaned_data['brand']
            quentity=django_form.cleaned_data['quentity']
            product_desc=django_form.cleaned_data['product_desc']
            



            p=Product(ids,ProductTitle,price,catagory,brand,quentity,"",product_desc)
            dao=ProductDAO()
            try:
                dao.update(p)
                return redirect(admin)
                # return render(request,'admin.html',{'f':django_form,'success':True})
            except:
                return render(request,'update.html',{'f':django_form,'success':False})
        else:
            return render(request, 'update.html',{'f':django_form})

def login(request):

    django_form=myform.LoginForm()
    if request.method=="POST": 
        django_form=myform.LoginForm(request.POST)
        if django_form.is_valid():
            r_email=django_form.cleaned_data['loginEmail']
            r_pw=django_form.cleaned_data['loginPass']
            # userob=User(r_email, r_pw)
            # userdao=UserDAO()

def register(request):

    django_form=myform.UserForm()
    # if request.method=="GET":
    #     django_form=RegisterForm()
    #     return render(request, 'registerpage.html', {'f':django_form})
    print("++++++++++++++++register++++++++++++++++++++")
    if request.method=="POST":
        print( "++++++++++++++++inside post++++++++++++++++++++")
        django_form=myform.UserForm(request.POST)
        print( "++++++++++++++++ bellow from ++++++++++++++++++++")
        if django_form.is_valid():

            inputFastName=django_form.cleaned_data['inputFastName']
            inputLastName=django_form.cleaned_data['inputLastName']
            regEmail=django_form.cleaned_data['regEmail']
            phone=django_form.cleaned_data['phone']
            inputCuntry=django_form.cleaned_data['inputCuntry']
            inputCity = django_form.cleaned_data['inputCity']
            inputZipCode=django_form.cleaned_data['inputZipCode']
            inputPassword=django_form.cleaned_data['inputPassword']
            Gender = django_form.cleaned_data['Gender']
            print("registation value ")
            print(inputFastName,inputLastName,regEmail,phone,inputCuntry,inputCity,inputZipCode,inputPassword,Gender)
            # return redirect(index)

            userob=User(inputFastName,inputLastName,regEmail,phone,inputCuntry,inputCity,inputZipCode,inputPassword,Gender)
            userdao=ProductDAO()
            try:
                userdao.insertUser(userob)
                print('registation sucess')
                django_form=myform.UserForm()

                base_url = reverse('index')  # 1 /products/
                query_string =  urlencode({'registation': True})  # 2 category=42
                url = '{}?{}'.format(base_url, query_string)  # 3 /products/?category=42
                return redirect(url)
                # return redirect(index, {'registation':True ,'registation_form':django_form})
            except Exception as e:
                s = str(e)
                print(s)
                print('registation failed')
                return redirect(index)
                
        else:
            print("invalide++++++++++++++++++++++++++++++++++++")
            print(django_form.errors)
            return redirect(index)
           
    else:
        print( "++++++++++++++++not post++++++++++++++++++++")

def login(request):
    django_form=myform.LoginForm()
    if request.method=="POST":
        django_form=myform.LoginForm(request.POST)
        if django_form.is_valid():
            loginEmail=django_form.cleaned_data['loginEmail']
            loginPass=django_form.cleaned_data['loginPass']
            userob=Login(loginEmail, loginPass)
            userdao=ProductDAO()
            try:
                is_valid=userdao.authenticate_user(userob)
                print('login sucess')
                # django_form=myform.LoginForm()
                if is_valid:
                    request.session['email']=loginEmail
                    request.session['fastName']=is_valid[1]
                    request.session['lastName']=is_valid[2]
                    # print("----------------------9999999999999999999999999999999999999")

                print(is_valid)

                base_url = reverse('index')  # 1 /products/
                query_string =  urlencode({'login': is_valid})  # 2 category=42
                url = '{}?{}'.format(base_url, query_string)  # 3 /products/?category=42
                return redirect(url)
                # return redirect(index, {'registation':True ,'registation_form':django_form})
            except Exception as e:
                s = str(e)
                print(s)
                print('login failed')
                base_url = reverse('index')  # 1 /products/
                query_string =  urlencode({'login': False})  # 2 category=42
                url = '{}?{}'.format(base_url, query_string)  # 3 /products/?category=42
                return redirect(url)
                
    else:
        print("invalide++++++++++++++++++++++++++++++++++++")
        print(django_form.errors)
        return redirect(index)

def logout(request):
    del request.session['email']
    del request.session['fastName']
    del request.session['lastName']
    return redirect('index')

def addItemInfoToModal(request):
    django_form=myform.productIDForm(request.POST)
    if django_form.is_valid():
        productId=django_form.cleaned_data['productId']

        productINFOdao=ProductDAO()
        try:
            product=productINFOdao.productINFO(productId)
            print('product')
            print(product)
            return JsonResponse({'error': False, 'product': product})
        except:
            return JsonResponse({'error':True})
    else:
        #ajax data pass JSON
        return JsonResponse({'error':True})


def ADDToCard(request):
    django_form=myform.productIDForm(request.POST)
   
    if django_form.is_valid():
        productId=django_form.cleaned_data['productId']

        try:
            if not 'card_product' in request.session or not request.session['card_product']:
                request.session['card_product'] = [productId]
            else:
                card_product_list = request.session['card_product']
                card_product_list.append(productId)
                request.session['card_product'] = card_product_list
            print('card_product')
            print(request.session['card_product'])
            return JsonResponse({'error':False})
        except Exception as e:
            s = str(e)
            print(s)
            print('error,ADDToCard  failed')
            return JsonResponse({'error':True})
    else:
        #ajax data pass JSON
        return JsonResponse({'error':True})


def removeItemFromCard(request):
    django_form=myform.productIDForm(request.POST)
   
    if django_form.is_valid():
        productId=django_form.cleaned_data['productId']

        try:

            card_product_list = request.session['card_product']
            card_product_list.remove(productId)
            request.session['card_product'] = card_product_list

            print('card_product')
            print(request.session['card_product'])
            return redirect(card)

        except Exception as e:
            s = str(e)
            print(s)
            print('error,ADDToCard  failed')
            return redirect(card)
    else:
        #ajax data pass JSON
        return redirect(card)

def chackForelogin(request):
    if request.method=="POST":
        # print(request.session['email'])
        if 'email' in request.session:
            return JsonResponse({'error':False ,'userPresent':True})
        else:
            return JsonResponse({'error':False ,'userPresent':False})
    else:
        return JsonResponse({'error':True ,'userPresent':False})


def makePayment(request):
    print('payment')
    django_form=myform.bkashPayment()
    if request.method=="POST":
        django_form=myform.bkashPayment(request.POST)
        if django_form.is_valid():
            Bkashnumber=django_form.cleaned_data['Bkashnumber']
            try:
                card_list = request.session['card_product']
                print(card_list)
                orderInfo=ProductDAO()
                orderInfo.saveOrderInfo( card_list, request.session['email'],Bkashnumber)
                # print(len(card_product_list))
                # print(card_product_list[0].getImgpath())
                return redirect(card)
            except Exception as e:
                s = str(e)
                print('order failed ')
                print(s)
                return redirect(card)
                

