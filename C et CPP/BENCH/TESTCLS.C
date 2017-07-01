
main()
{
  int i;

  horl_debut();
  for (i=0 ; i<1000 ; i++)
    testcls();
  horl_fin();

}

testcls()
{
  register long far *p=(long far *)0xB8000000L;
  register int i=1000;
  while (i) p[--i]=0;

}
