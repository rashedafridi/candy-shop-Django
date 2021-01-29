class Product:
    #constructor
    def __init__(self, id, ProductTitle, price,catagory,brand, quentity,imgpath ,product_desc ):
        self.__id=id
        self.__ProductTitle=ProductTitle
        self.__price=price
        self.__catagory=catagory
        self.__brand=brand
        self.__quentity=quentity
        self.__product_desc=product_desc
        # self.__upldate=upldate
        
        self.__imgpath=imgpath
        

    def getId(self):
        return self.__id
    def setId(self, id):
        self.__id=id

    def getProductTitle(self):
        return self.__ProductTitle
    def setProductTitle(self, ProductTitle):
        self.__ProductTitle=ProductTitle

    def getPrice(self):
        return self.__price
    def setPrice(self, price):
        self.__price=price

    def getCatagory(self):
        return self.__catagory
    def setCatagory(self, catagory):
        self.__catagory=catagory

    def getBrand(self):
        return self.__brand
    def setBrand(self, brand):
        self.__brand=brand

    def getQuentity(self):
        return self.__quentity
    def setQuentity(self, quentity):
        self.__quentity=quentity        

    # def getUpldate(self):
    #     return str(self.__upldate)
    # def setUpldate(self, upldate):
    #     self.__upldate=upldate

    def getImgpath(self):
        return self.__imgpath
    def setImgpath(self, imgpath):
        self.__imgpath=imgpath

    def getDescription(self):
        return self.__product_desc
    def setDescription(self, product_desc):
        self.__product_desc=product_desc


class orderDetail:
    
    def __init__(self, orderid, ProductTitle, price  ,orderDate,deliveryDate,sheapingDetail,fastName,lastName):
        self.__orderid=orderid
        self.__ProductTitle=ProductTitle
        self.__price=price
        self.__orderDate=orderDate
        self.__deliveryDate=deliveryDate
        self.__fastName=fastName
        self.__lastName=lastName
        self.__sheapingDetail=sheapingDetail
    def getId(self):
        return self.__orderid
    def setId(self, orderid):
        self.__orderid=orderid
    
    def getProductTitle(self):
        return self.__ProductTitle
    def setProductTitle(self, ProductTitle):
        self.__ProductTitle=ProductTitle

    def getPrice(self):
        return self.__price
    def setPrice(self, price):
        self.__price=price

    def getfastName(self):
        return self.__fastName
    def setfastName(self, fastName):
        self.__fastName=fastName

    def getorderDate(self):
        return self.__orderDate
    def setorderDate(self, orderDate):
        self.__orderDate=orderDate

    def getdeliveryDate(self):
        return self.__deliveryDate
    def setdeliveryDate(self, deliveryDate):
        self.__deliveryDate=deliveryDate

    def getsheapingDetail(self):
        return self.__sheapingDetail
    def setsheapingDetail(self, sheapingDetail):
        self.__sheapingDetail=sheapingDetail

    def getlastName(self):
        return self.__lastName
    def setlastName(self, lastName):
        self.__lastName=lastName

class User:
    def __init__(self, inputFastName, inputLastName ,regEmail ,phone ,inputCuntry ,inputCity,inputZipCode,inputPassword ,gender):
        self.__inputFastName=inputFastName
        self.__inputLastName=inputLastName
        self.__regEmail=regEmail
        self.__phone=phone
        self.__inputCuntry=inputCuntry
        self.__inputCity=inputCity
        self.__inputZipCode=inputZipCode
        self.__inputPassword=inputPassword
        self.__gender=gender

    def getinputFastName(self):
        return self.__inputFastName
    def setinputFastName(self, inputFastName):
        self.__inputFastName=inputFastName

    def getinputLastName(self):
        return self.__inputLastName
    def setinputLastName(self, inputLastName):
        self.__inputLastName=inputLastName

    def getregEmail(self):
        return self.__regEmail
    def setregEmail(self, regEmail):
        self.__regEmail=regEmail

    def getphone(self):
        return self.__phone
    def setphone(self, phone):
        self.__phone=phone

    def getinputCuntry(self):
        return self.__inputCuntry
    def setinputCuntry(self, inputCuntry):
        self.__inputCuntry=inputCuntry

    def getinputCity(self):
        return self.__inputCity
    def setinputCity(self, inputCity):
        self.__inputCity=inputCity

    def getinputZipCode(self):
        return self.__inputZipCode
    def setinputZipCode(self, inputZipCode):
        self.__inputZipCode=inputZipCode

    def getinputPassword(self):
        return self.__inputPassword
    def setinputPassword(self, inputPassword):
        self.__inputPassword=inputPassword

    def getgender(self):
        return self.__gender
    def setgender(self, gender):
        self.__gender=gender

class Login:
    def __init__(self, loginEmail,loginPass):
        self.__loginEmail=loginEmail
        self.__loginPass=loginPass

    def getloginEmail(self):
        return self.__loginEmail
    def setloginEmail(self, loginEmail):
        self.__loginEmail=loginEmail

    def getloginPass(self):
        return self.__loginPass
    def setloginPass(self, loginPass):
        self.__loginPass=loginPass    
  