from tkinter import*
from tkinter import ttk
from PIL import Image,ImageTk
from tkinter import messagebox
import mysql.connector

def main():
    win=Tk()
    app=Welcome_Window(win)
    win.mainloop()


class Welcome_Window:
    def __init__(self,root):
        self.root=root
        self.root.title("CINEMA MANAGEMENT SYSTEM -->  'Welcome' ")
        self.root.geometry("1366x768+0+0")

        self.bg = ImageTk.PhotoImage(file="C:\Ali\DB\Cinema main.jpg")
        lbl_bg= Label(self.root,image=self.bg)
        lbl_bg.place(x=0,y=0,relwidth=1,relheight=1)
        
        frame = Frame(self.root,bg="black")
        frame.place(x=320,y=570,width=700,height=100)

        #img1 = Image.open("C:\Ali\DB\CInema 1.jpg")
       
        #self.photoimg1=ImageTk.PhotoImage(img1)
        #lblimg1=Label(image=self.photoimg1, borderwidth=0)
        #lblimg1.place(x=390,y=450,width=700,height=200)

        get_str = Label(frame,text="CINEMA MANAGEMENT SYSTEM",font = ("times new roman",20,"bold"),fg="white",bg="black")
        get_str.place(x=150,y=0)

        adminbtn = Button(frame,text="ADMIN",font=("times new roman",20,"bold"), command= self.adminlogin_window,bd=3,relief =RIDGE,fg = "white", bg = "black",activeforeground="white",activebackground="white")
        adminbtn.place(x=70,y=50,width=130,height=40)

        employeebtn = Button(frame,text="EMPLOYEE",font=("times new roman",20,"bold"),command= self.employeelogin_window,bd=3,relief =RIDGE,fg = "white", bg = "black",activeforeground="white",activebackground="white")
        employeebtn.place(x=290,y=50,width=170,height=40)

        customerbtn = Button(frame,text="CUSTOMER",font=("times new roman",20,"bold"),command= self.customerlogin_window,bd=3,relief =RIDGE,fg = "white", bg = "black",activeforeground="white",activebackground="white")
        customerbtn.place(x=510,y=50,width=170,height=40)
    
    def adminlogin_window (self):
        self.new_window=Toplevel(self.root)
        self.app=Admin_Login_Window(self.new_window)

    def employeelogin_window (self):
        self.new_window=Toplevel(self.root)
        self.app=Employee_Login_Window(self.new_window)    
    
    def customerlogin_window (self):
        self.new_window=Toplevel(self.root)
        self.app=Customer_Login_Window(self.new_window)    



class Admin_Login_Window:
    def __init__(self,root):
        self.root=root
        self.root.title("Admin")
        self.root.geometry("1366x768+0+0")
        
        self.bg = ImageTk.PhotoImage(file="C:\Ali\DB\cinepax-jpg.webp")
        lbl_bg= Label(self.root,image=self.bg)
        lbl_bg.place(x=50,y=50,width=600,height=600)

        #img1 = Image.open("C:\Ali\Machine Learning\cinepax-jpg.webp")
       
        #self.photoimg1=ImageTk.PhotoImage(img1)
        #lblimg1=Label(image=self.photoimg1, borderwidth=0)
        #lblimg1.place(x=50,y=50,width=600,height=600)

        frame = Frame(self.root,bg="#65350F")
        frame.place(x=750,y=150,width=400,height=410)

        get_str = Label(frame,text="GET STARTED",font = ("times new roman",20,"bold"),fg="black",bg="#65350F")
        get_str.place(x=100,y=30)

        #label
        username=lbl=Label (frame, text="Username", font=("times new roman", 15, "bold"), fg="black", bg="#65350F")
        username.place(x=50, y=120)

        self.txtuser=ttk. Entry(frame, font=("times new roman", 15, "bold"))
        self.txtuser.place(x=50, y=145,width=270)
      
        password=lbl=Label (frame, text="Password", font=("times new roman", 15, "bold"), fg="black", bg="#65350F")
        password.place(x=50, y=200)
      
        self.txtpass=ttk. Entry(frame, font=("times new roman", 15, "bold"))
        self.txtpass.place(x=50, y=225,width=270)
        
        checkbtn=Checkbutton(frame, text="I Agree The Terms & Conditions", font=("times new roman", 15, "bold"), onvalue=1,offvalue=0, bg = "#65350F",activeforeground="white",activebackground="#65350F")
        checkbtn.place(x=50, y=270)

        loginbtn = Button(frame,text="login",font=("Calibri",15),command=self.login,bd=3,relief =RIDGE,fg = "white", bg = "black",activeforeground="white",activebackground="black")
        loginbtn.place(x=150,y=310,width=90,height=30)

    def login(self):
        if self.txtuser.get()=="" or self.txtpass.get()=="":
            messagebox.showerror("Error","all field required")
        elif self.txtuser.get()=="kapu" and self.txtpass.get()=="ashu":
            messagebox.showinfo("Success")
        else:
            conn=mysql.connector.connect(host="localhost", user="sys", password="aliatta123", database="mydata", port = 1521)
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
                    self.app=Welcome_Window(self.new_window)
                else:
                    if not open_main:
                        return
            conn.commit()
            conn.close()


class Employee_Login_Window:
    def __init__(self,root):
        self.root=root
        self.root.title("Employee")
        self.root.geometry("1366x768+0+0")
        
        self.bg = ImageTk.PhotoImage(file="C:\Ali\DB\cinema 2.jpg")
        lbl_bg= Label(self.root,image=self.bg)
        lbl_bg.place(x=0,y=0,relwidth=1,relheight=1)

        #img1 = Image.open("C:\Ali\Machine Learning\cinepax-jpg.webp")
       
        #self.photoimg1=ImageTk.PhotoImage(img1)
        #lblimg1=Label(image=self.photoimg1, borderwidth=0)
        #lblimg1.place(x=50,y=50,width=600,height=600)

        frame = Frame(self.root,bg="#550015")
        frame.place(x=450,y=150,width=400,height=410)

        get_str = Label(frame,text="GET STARTED",font = ("times new roman",20,"bold"),fg="black",bg="#550015")
        get_str.place(x=100,y=30)

        #label
        username=lbl=Label (frame, text="Username", font=("times new roman", 15, "bold"), fg="black", bg="#550015")
        username.place(x=50, y=120)

        self.txtuser=ttk. Entry(frame, font=("times new roman", 15, "bold"))
        self.txtuser.place(x=50, y=145,width=270)
      
        password=lbl=Label (frame, text="Password", font=("times new roman", 15, "bold"), fg="black", bg="#550015")
        password.place(x=50, y=200)
      
        self.txtpass=ttk. Entry(frame, font=("times new roman", 15, "bold"))
        self.txtpass.place(x=50, y=225,width=270)
        
        checkbtn=Checkbutton(frame, text="I Agree The Terms & Conditions", font=("times new roman", 15, "bold"), onvalue=1,offvalue=0, bg = "#550015",activeforeground="white",activebackground="#65350F")
        checkbtn.place(x=50, y=270)

        loginbtn = Button(frame,text="login",font=("Calibri",15),command=self.Elogin,bd=3,relief =RIDGE,fg = "white", bg = "black",activeforeground="white",activebackground="black")
        loginbtn.place(x=150,y=310,width=90,height=30)

    def Elogin(self):
        if self.txtuser.get()=="" or self.txtpass.get()=="":
            messagebox.showerror("Error","all field required")
        elif self.txtuser.get()=="kapu" and self.txtpass.get()=="ashu":
            messagebox.showinfo("Success")
        else:
            conn=mysql.connector.connect(host="localhost", user="sys", password="aliatta123", database="oracle")
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
                    self.app=Welcome_Window(self.new_window)
                else:
                    if not open_main:
                        return
            conn.commit()
            conn.close()


class Customer_Login_Window:
    def __init__(self,root):
        self.root=root
        self.root.title("Customer")
        self.root.geometry("1366x768+0+0")
        
        self.bg = ImageTk.PhotoImage(file="C:\Ali\DB\Felix-mooneeram-evlkOfkQ5rE-unsplash.jpg")
        lbl_bg= Label(self.root,image=self.bg)
        lbl_bg.place(x=0,y=0,relwidth=1,relheight=1)

        #img1 = Image.open("C:\Ali\DB\cinepax-jpg.webp")
       
        #self.photoimg1=ImageTk.PhotoImage(img1)
        #lblimg1=Label(image=self.photoimg1, borderwidth=0)
        #lblimg1.place(x=50,y=50,width=600,height=600)

        frame = Frame(self.root,bg="#550015")
        frame.place(x=450,y=150,width=400,height=410)

        get_str = Label(frame,text="GET STARTED",font = ("times new roman",20,"bold"),fg="black",bg="#550015")
        get_str.place(x=100,y=30)

        #label
        username=lbl=Label (frame, text="Username", font=("times new roman", 15, "bold"), fg="black", bg="#550015")
        username.place(x=50, y=120)

        self.txtuser=ttk. Entry(frame, font=("times new roman", 15, "bold"))
        self.txtuser.place(x=50, y=145,width=270)
      
        password=lbl=Label (frame, text="Password", font=("times new roman", 15, "bold"), fg="black", bg="#550015")
        password.place(x=50, y=200)
      
        self.txtpass=ttk. Entry(frame, font=("times new roman", 15, "bold"))
        self.txtpass.place(x=50, y=225,width=270)
        
        checkbtn=Checkbutton(frame, text="I Agree The Terms & Conditions", font=("times new roman", 15, "bold"), onvalue=1,offvalue=0, bg = "#550015",activeforeground="white",activebackground="#65350F")
        checkbtn.place(x=50, y=270)

        loginbtn = Button(frame,text="login",font=("Calibri",15),command=self.Clogin,bd=3,relief =RIDGE,fg = "white", bg = "black",activeforeground="white",activebackground="black")
        loginbtn.place(x=150,y=310,width=90,height=30)

    def Clogin(self):
        if self.txtuser.get()=="" or self.txtpass.get()=="":
            messagebox.showerror("Error","all field required")
        elif self.txtuser.get()=="kapu" and self.txtpass.get()=="ashu":
            messagebox.showinfo("Success")
        else:
            conn=mysql.connector.connect(host="localhost", user="sys", password="aliatta123", database="oracle")
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
                    self.app=Welcome_Window(self.new_window)
                else:
                    if not open_main:
                        return
            conn.commit()
            conn.close()


if __name__ == "__main__":
    main()
