# Example of drawing

from tkinter import *

class App:

    def __init__(self, master):
        self.canvas = Canvas(master, width=400, height=400)
        self.canvas.pack()
        master.wm_title('Drawing with tk')

    def Draw(self):
        self.canvas.create_line(0, 0, 400, 200, fill='black', width=1)        

root = Tk()
app = App(root)
#root.wm_title('Temp Converter')
app.Draw()

root.mainloop()
