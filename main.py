from sqlite3 import Connection
from tkinter import*
from tkinter import ttk
from PIL import Image,ImageTk
from tkinter import messagebox

import mysql.connector


def main():
    win=Tk()
    app=Main_Window(win)
    win.mainloop()

class Main_Window:
    def __init__(self,root):
        self.root=root
        self.root.title("Theatre Management System!")
        self.root.geometry("1920x1080+0+0")

        self.bg = ImageTk.PhotoImage(file="C:\Ali\DB\CInema 1.jpg")
        lbl_bg= Label(self.root,image=self.bg)
        lbl_bg.place(x=0,y=0,relwidth=1,relheight=1)
        
        frame = Frame(self.root,bg="#800020")
        frame.place(x=270,y=500,width=750,height=150)

        get_str = Label(frame,text="THEARTRE MANAGEMENT SYSTEM ",font = ("calbiri",20,"bold"),fg="white",bg="#800020")
        get_str.place(x=130,y=0)

        getstartedbtn = Button(frame,text="GET STARTED ",font=("calbiri",20,"bold"),command= self.loginwindow,bd=3,relief =RIDGE,fg = "white", bg = "black",activeforeground="white",activebackground="white")
        getstartedbtn.place(x=260,y=100,width=220,height=40)

    
    def loginwindow(self):
        self.new_window=Toplevel(self.root)
        self.app=Login_Window(self.new_window)   
    
    #def customerlogin_window (self):
        #self.new_window=Toplevel(self.root)
        #self.app=Customer_Login_Window(self.new_window)    

class Login_Window:
    def __init__(self,root):
        self.root=root
        self.root.title("login")
        self.root.geometry("1920x1080+0+0")

        self.bg = ImageTk.PhotoImage(file="C:\Ali\DB\CInema 1.jpg")
        lbl_bg= Label(self.root,image=self.bg)
        lbl_bg.place(x=0,y=0,relwidth=1,relheight=1)
        
        frame = Frame(self.root,bg="#333333")
        frame.place(x=380,y=380,width=550,height=100)

        get_str = Label(frame,text="WELCOME",font = ("calbiri",20,"bold"),fg="white",bg="#333333")
        get_str.place(x=180,y=0)

        adminbtn = Button(frame,text="ADMIN",font=("calbiri",20,"bold"), command= self.adminlogin_window,bd=3,relief =RIDGE,fg = "white", bg = "black",activeforeground="white",activebackground="white")
        adminbtn.place(x=50,y=50,width=130,height=40)

        customerbtn = Button(frame,text="CUSTOMER",font=("calbiri",20,"bold"),command= self.customerlogin_window,bd=3,relief =RIDGE,fg = "white", bg = "black",activeforeground="white",activebackground="white")
        customerbtn.place(x=330,y=50,width=170,height=40)
    
    def adminlogin_window (self):
        self.new_window=Toplevel(self.root)
        self.app=Admin_Window(self.new_window)
   
    
    def customerlogin_window (self):
        self.new_window=Toplevel(self.root)
        self.app=Customer_Login_Window(self.new_window)


class Admin_Window:
    def __init__(self,root):
        self.root=root
        self.root.title("Admin")
        self.root.geometry("1920x1080+0+0")
        
        self.bg = ImageTk.PhotoImage(file="C:\Ali\DB\CInema 1.jpg")
        lbl_bg= Label(self.root,image=self.bg)
        lbl_bg.place(x=0,y=0,relwidth=1,relheight=1)


        frame = Frame(self.root,bg="#333333")
        frame.place(x=750,y=150,width=400,height=410)

        get_str = Label(frame,text="GET STARTED",font = ("CALBIRI",20,"bold"),fg="black",bg="#333333")
        get_str.place(x=100,y=30)

        #label
        username=lbl=Label (frame, text="Username", font=("CALBIRI", 15, "bold"), fg="black", bg="#333333")
        username.place(x=50, y=120)

        self.txtuser=ttk. Entry(frame, font=("CALBIRI", 15, "bold"))
        self.txtuser.place(x=50, y=145,width=270)
      
        password=lbl=Label (frame, text="Password", font=("CALBIRI", 15, "bold"), fg="black", bg="#333333")
        password.place(x=50, y=200)
      
        self.txtpass=ttk. Entry(frame, font=("CALBIRI", 15, "bold"))
        self.txtpass.place(x=50, y=225,width=270)
        
        checkbtn=Checkbutton(frame, text="I Agree The Terms & Conditions", font=("CALBIRI", 15, "bold"), onvalue=1,offvalue=0, bg = "#333333",activeforeground="white",activebackground="#333333")
        checkbtn.place(x=50, y=270)

        loginbtn = Button(frame,text="login",font=("Calibri",15),command=self.login,bd=3,relief =RIDGE,fg = "white", bg = "black",activeforeground="white",activebackground="black")
        loginbtn.place(x=150,y=310,width=90,height=30)

    def login(self):
        if self.txtuser.get()=="" or self.txtpass.get()=="":
            messagebox.showerror("Error","all field required")
        elif self.txtuser.get()=="kapu" and self.txtpass.get()=="ashu":
            messagebox.showinfo("Success")
        else:
            conn=mysql.connector.connect(host="localhost", user="sys", password="bisma123", database="oracle", port=1521)
            my_cursor=conn.cursor()
            my_cursor.execute("select from Admin where ADMIN_ID=%s and PASSWORD=%s",(
                                                                                    self.txtpass.get(),
                                                                                    self.txtuser.get()
                                                                            ))
            row=my_cursor.fetchone()
            # print (row)
            if row==None:
                messagebox.showerror("Error", "Inavalid Username & password")
            else:
                open_main=messagebox.askyesno ("YesNo", "Access only admin")
                if open_main>0:
                    self.new_window=Toplevel(self.root)
                    self.app=Main_Window(self.new_window)
                else:
                    if not open_main:
                        return
            conn.commit()
            conn.close()
    


class Customer_Login_Window:
    def __init__(self,root):
        self.root=root
        self.root.title("Customer")
        self.root.geometry("1920x1080+0+0")
        
        self.bg = ImageTk.PhotoImage(file="C:\Ali\DB\CInema 1.jpg")
        lbl_bg= Label(self.root,image=self.bg)
        lbl_bg.place(x=0,y=0,relwidth=1,relheight=1)


        frame = Frame(self.root,bg="#333333")
        frame.place(x=450,y=150,width=400,height=410)

        get_str = Label(frame,text="GET STARTED",font = ("calbiri",20,"bold"),fg="black",bg="#333333")
        get_str.place(x=100,y=30)

        #label
        username=lbl=Label (frame, text="Username", font=("calbiri", 15, "bold"), fg="black", bg="#333333")
        username.place(x=50, y=120)

        self.txtuser=ttk. Entry(frame, font=("calbiri", 15, "bold"))
        self.txtuser.place(x=50, y=145,width=270)
      
        password=lbl=Label (frame, text="Password", font=("calbiri", 15, "bold"), fg="black", bg="#333333")
        password.place(x=50, y=200)
      
        self.txtpass=ttk. Entry(frame, font=("calbiri", 15, "bold"))
        self.txtpass.place(x=50, y=225,width=270)
        
        checkbtn=Checkbutton(frame, text="I Agree The Terms & Conditions", font=("calbiri", 15, "bold"), onvalue=1,offvalue=0, bg = "#333333",activeforeground="black",activebackground="#333333")
        checkbtn.place(x=50, y=270)

        loginbtn = Button(frame,text="login",font=("Calibri",15),command=self.Customer_login,bd=3,relief =RIDGE,fg = "white", bg = "black",activeforeground="white",activebackground="black")
        loginbtn.place(x=150,y=310,width=90,height=30)

    def Customer_login(self):
        if self.txtuser.get()=="" or self.txtpass.get()=="":
            messagebox.showerror("Error","all field required")
        elif self.txtuser.get()=="kapu" and self.txtpass.get()=="ashu":
            messagebox.showinfo("Success")
        else:
            conn=mysql.connector.connect(host="127.0.0.1 localhost", user="sys", password="aliatta123", database="oracle")
            my_cursor=conn.cursor()
            my_cursor.execute("select from register where email=%s and password=%s",(
                                                                                    self.txtpass.get(),
                                                                                    self.txtuser.get()
                                                                            ))
            row=my_cursor.fetchone()
            # print (row)
            if row==None:
                messagebox.showerror("Error", "Inavalid Username & password")
            else:
                open_main=messagebox.askyesno ("YesNo", "Access only admin")
                if open_main>0:
                    self.new_window=Toplevel(self.root)
                    self.app=Main_Window(self.new_window)
                else:
                    if not open_main:
                        return
            conn.commit()
            conn.close() 
            
             
class Admin_Details_Window:
    def __init__(self,root):
        self.root=root
        self.root.title("Welcome to Admin")
        self.root.geometry("1920x1080+0+0")
        
        self.bg = ImageTk.PhotoImage(file="c:\Ali\DB\CInema 1.jpg")
        lbl_bg= Label(self.root,image=self.bg)
        lbl_bg.place(x=0,y=0,relwidth=1,relheight=1)


        frame = Frame(self.root,bg="#333333")
        frame.place(x=750,y=150,width=400,height=410)

        get_str = Label(frame,text="GET STARTED",font = ("CALBIRI",20,"bold"),fg="black",bg="#333333")
        get_str.place(x=100,y=30)

        #label
        username=lbl=Label (frame, text="Username", font=("CALBIRI", 15, "bold"), fg="black", bg="#333333")
        username.place(x=50, y=120)

        self.txtuser=ttk. Entry(frame, font=("CALBIRI", 15, "bold"))
        self.txtuser.place(x=50, y=145,width=270)
      
        password=lbl=Label (frame, text="Password", font=("CALBIRI", 15, "bold"), fg="black", bg="#333333")
        password.place(x=50, y=200)
      
        self.txtpass=ttk. Entry(frame, font=("CALBIRI", 15, "bold"))
        self.txtpass.place(x=50, y=225,width=270)
        
        checkbtn=Checkbutton(frame, text="I Agree The Terms & Conditions", font=("CALBIRI", 15, "bold"), onvalue=1,offvalue=0, bg = "#333333",activeforeground="white",activebackground="#333333")
        checkbtn.place(x=50, y=270)

        loginbtn = Button(frame,text="login",font=("Calibri",15),command=self.login,bd=3,relief =RIDGE,fg = "white", bg = "black",activeforeground="white",activebackground="black")
        loginbtn.place(x=150,y=310,width=90,height=30)

    def login(self):
        if self.txtuser.get()=="" or self.txtpass.get()=="":
            messagebox.showerror("Error","all field required")
        elif self.txtuser.get()=="kapu" and self.txtpass.get()=="ashu":
            messagebox.showinfo("Success")
        else:
            conn=mysql.connector.connect(host="127.0.0.1 localhost", user="sys", password="aliatta123", database="mydata")
            my_cursor=conn.cursor()
            my_cursor.execute("select from Admin where name=%s and password=%s",(
                                                                                self.txtpass.get(),
                                                                                self.txtuser.get()
                                                                            ))
            row=my_cursor.fetchone()
            # print (row)
            if row==None:
                messagebox.showerror("Error", "Inavalid Username & password")
            else:
                open_main=messagebox.askyesno ("YesNo", "Access only admin")
                if open_main>0:
                    self.new_window=Toplevel(self.root)
                    self.app=Main_Window(self.new_window)
                else:
                    if not open_main:
                        return
            conn.commit()
            conn.close()
                  

if __name__ == "__main__":
    main()