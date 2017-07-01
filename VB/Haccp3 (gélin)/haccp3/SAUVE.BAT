del hac*.arj
arj a hacc%1.arj -wc:\tmp *.* setups\haccp\*.* setups\hacmod\*.* setups\instmod\*.*  -x*.exe -x*.hlp
arj a hacc%1.arj -wc:\tmp help\*.* -r -x*.exe -x*.hlp
arj a hacc%1.arj -wc:\tmp c:\real\haccp\*.*
xcopy hacc%1.arj a: /v