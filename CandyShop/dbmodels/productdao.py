from .dbfactory import DBFactory
from .product import Product,orderDetail
from django.contrib.auth.hashers import *

class ProductDAO:

    def getDBCursor(self):
        cursor=DBFactory.getInstance().getDBCursor()
        return cursor

    def upload(self, p):
        dbcursor=self.getDBCursor()
        try:
            dbcursor.execute("INSERT INTO product VALUES('',%s,%s,%s,%s,%s,%s,%s)",[p.getProductTitle(),p.getPrice(),p.getCatagory(),p.getBrand(),p.getQuentity(),p.getImgpath(),p.getDescription()])
        except:
            raise Exception('data insertion error')
        finally:
            dbcursor.close()

    def showall(self):
        dbcursor=self.getDBCursor()
        try:
            dbcursor.execute("SELECT * FROM product")
            result=dbcursor.fetchall()
            productlist=[]
            for row in result:
                prod=Product(row[0],row[1],row[2],row[3],row[4],row[5],row[6],row[7])
                productlist.append(prod)
            return productlist
        except:
            raise Exception('data insertion error')
        finally:
            dbcursor.close()
    def productINFO(self,productId):
        dbcursor=self.getDBCursor()
        try:
            dbcursor.execute("SELECT id,ProductTitle,price,catagory,brand,quentity,imgpath,product_desc FROM product WHERE id=%s",[productId])
            row=dbcursor.fetchall()
            print(row)
            # productlist=Product(row[0],row[1],row[2],row[3],row[4],row[5],row[6],row[7])
            return row
           

        except Exception as e:
            s = str(e)
            print('failed to get product info reson below')
            print(s)
            
        finally:
            dbcursor.close()


    def orderDetail(self):
        dbcursor=self.getDBCursor()
        try:
            dbcursor.execute("SELECT orderdetail.id ,product.ProductTitle,product.price,orderDate,deliveryDate,sheapingDetail,user.FastName,user.LastName from ((orderdetail JOIN product on orderdetail.productID=product.id) JOIN user ON orderdetail.userID=user.id)")
            result=dbcursor.fetchall()
            ordertlist=[]
            for row in result:
                # print(row[0],row[1],row[2],row[3],row[4],row[5],row[6],row[7])
                prod=orderDetail(row[0],row[1],row[2],row[3],row[4],row[5],row[6],row[7])
                ordertlist.append(prod)
            return ordertlist
        except:
            raise Exception('data insertion error')
        finally:
            dbcursor.close()

    def update(self, p):
        dbcursor=self.getDBCursor()
        try:
            dbcursor.execute("UPDATE product SET ProductTitle=%s, price=%s, catagory=%s, brand=%s, quentity=%s, product_desc=%s WHERE id=%s", [p.getProductTitle(),p.getPrice(),p.getCatagory(),p.getBrand(),p.getQuentity(),p.getDescription(),p.getId()])
        except:
            raise Exception('data insertion error')
        finally:
            dbcursor.close()

    def findprod(self, id):
        dbcursor=self.getDBCursor()
        try:
            dbcursor.execute("SELECT * FROM product WHERE id=%s",[id])
            item=dbcursor.fetchall()[0]

            prodobj=Product(item[0],item[1],item[2],item[3],item[4],item[5],item[6],item[7])
            return prodobj
        except:
            raise Exception('data insertion error')
        finally:
            dbcursor.close()

    
    def findCardprod(self, idList):
        dbcursor=self.getDBCursor()
        
        try:
            productlist=[]
            for ids in idList:
                dbcursor.execute("SELECT * FROM product WHERE id=%s",[ids])
                item=dbcursor.fetchall()[0]
                prodobj=Product(item[0],item[1],item[2],item[3],item[4],item[5],item[6],item[7])
                productlist.append(prodobj)
            print(len(productlist))
            return productlist
        except Exception as e:
            s = str(e)
            print('product retrivle failed')
            print(s)
            return []
        finally:
            dbcursor.close()

    def delete(self, pid):
        dbcursor=self.getDBCursor()
        try:
            dbcursor.execute("DELETE FROM product WHERE id=%s", [pid])
        except:
            raise Exception('data insertion error')
        finally:
            dbcursor.close()

    def insertUser(self, user):
        c=self.getDBCursor()
        try:
            c.execute("INSERT INTO user VALUES('',%s,%s,%s,%s,%s,%s,%s,%s,%s)",
            [user.getinputFastName(),user.getinputLastName(),user.getregEmail(),user.getphone(),user.getinputCuntry(),user.getinputCity(),user.getinputZipCode(), make_password(user.getinputPassword()),user.getgender()]) #security SQL injection block
            print('reg true')
            return True
           
        except Exception as e:
            s = str(e)
            print('reg False')
            print(s)
            return False

        finally:
            c.close()

    def authenticate_user(self, loginValue):
        c=self.getDBCursor()
        print(loginValue.getloginEmail())
        try:
            c.execute("SELECT Password ,FastName,LastName ,email  FROM user WHERE email=%s",[loginValue.getloginEmail()]) #security SQL injection block
            ret=c.fetchall()[0] #list of tuple
            print(ret)
            if len(ret)>=1:
                print("yes paise")
                row=ret[0]
                print(row)
                # print(row[0])
                auth=check_password(loginValue.getloginPass(), row)
                if auth is True:
                    return ret
                else:
                    return False
            else:
                return False
        except Exception as e:
            s = str(e)
            print('reg False')
            print(s)
            return False
        finally:
            c.close()
    def saveOrderInfo(self ,card_list, email,Bkashnumber):
        print("+++++++++++++++saveOrderInfo++++++++++++++")
        c=self.getDBCursor()
       
        try:
            c.execute("SELECT id FROM user WHERE email =%s",[email]) #security SQL injection block
            ret=c.fetchall()[0] #list of tuple
            print(ret)
            id_from_database = None
            print(card_list)
            if len(ret)>=1:
                print("yes user id paise")
                id_from_database=ret[0]
                print(id_from_database)
                # print(row[0])
            for producid in card_list:               
                c.execute("INSERT INTO orderdetail (id, productID, userID, sheapingDetail, orderDate, deliveryDate) VALUES (NULL, %s, %s, %s, '2020-10-07', '2020-10-07');",[producid,id_from_database,Bkashnumber])
                
            print("+++++++++++++++saveOrderInfo end++++++++++++++")
            return True
            

        except Exception as e:
            s = str(e)
            print('order  problem database')
            print(s)
            print("+++++++++++++++saveOrderInfo end error ++++++++++++++")
            return False
        finally:
            c.close()