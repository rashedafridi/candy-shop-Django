from django import forms
class UploadForm(forms.Form):
    ProductTitle=forms.CharField()
    price=forms.DecimalField(widget=forms.TextInput)
    catagory=forms.CharField()
    brand=forms.CharField()
    quentity=forms.DecimalField()
    product_desc=forms.CharField(widget=forms.Textarea)
    product_img=forms.FileField()

class UpdateForm(forms.Form):
    pid=forms.IntegerField(widget=forms.TextInput)
    ProductTitle=forms.CharField()
    price=forms.DecimalField(widget=forms.TextInput)
    catagory=forms.CharField()
    brand=forms.CharField()
    quentity=forms.DecimalField()
    product_desc=forms.CharField(widget=forms.Textarea)
class UserForm(forms.Form):
    inputFastName=forms.CharField()
    inputLastName=forms.CharField()
    regEmail=forms.EmailField()
    phone=forms.DecimalField()
    CHOICES=[
    ('bangladesh', 'bangladesh'),
    ]
    inputCuntry=forms.ChoiceField(choices=CHOICES, widget=forms.Select)
    inputCity = forms.CharField()
    inputZipCode=forms.CharField()
    inputPassword=forms.CharField(widget=forms.PasswordInput)
    radioCHOICES=[('male','male'),
        ('female','female'),
        ('other','other')]
    Gender   = forms.ChoiceField(choices=radioCHOICES, widget=forms.RadioSelect)

class LoginForm(forms.Form):
    loginEmail=forms.EmailField()
    loginPass=forms.CharField(widget=forms.PasswordInput)

class productIDForm(forms.Form):
    productId=forms.CharField()
class bkashPayment(forms.Form):
    Bkashnumber=forms.DecimalField()
    

    

