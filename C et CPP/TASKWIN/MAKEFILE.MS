taskwind.exe: taskwind.obj taskwind.res
  link /ON:N /A:16 taskwind.obj, taskwind, , \
      LIBW.LIB SLIBCEW.LIB,taskwind.def
  RC  taskwind.res taskwind.exe

taskwind.obj: taskwind.c taskwind.h
  CL /GA /c taskwind.c

taskwind.res: taskwind.rc 
	RC -R -FO taskwind.res TASKWIND.RC
