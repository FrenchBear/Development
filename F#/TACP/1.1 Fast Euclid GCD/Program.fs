// Fast Euclid CDG Algorithm
// Exercice 1.1:3 of The Art of Computer Programming, Vol. 1
// 2014-09-28   PV

// Original algorithm E
let egcd m0 n0 =
    let mutable m:int = m0
    let mutable n:int = n0
    while n > 0 do
        let r = m % n
        m <- n
        n <- r
    m // that's the gcd!

// Much better in F#
let rec e2 m n =
    let r = m % n
    if r = 0
    then n
    else e2 n r 

// Recursive definition, but the compiler generate it as a loop:
//.method public static int32  e2(int32 m, int32 n) cil managed
//{
//  .custom instance void [FSharp.Core]Microsoft.FSharp.Core.CompilationArgumentCountsAttribute::.ctor(int32[]) = ( 01 00 02 00 00 00 01 00 00 00 01 00 00 00 00 00 ) 
//  // Code size       22 (0x16)
//  .maxstack  4
//  .locals init ([0] int32 r)
//  IL_0000:  nop
//  IL_0001:  ldarg.0
//  IL_0002:  ldarg.1
//  IL_0003:  rem
//  IL_0004:  stloc.0
//  IL_0005:  ldloc.0
//  IL_0006:  brtrue.s   IL_000a
//  IL_0008:  br.s       IL_000c
//  IL_000a:  br.s       IL_000e
//  IL_000c:  ldarg.1
//  IL_000d:  ret
//  IL_000e:  ldarg.1
//  IL_000f:  ldloc.0
//  IL_0010:  starg.s    n
//  IL_0012:  starg.s    m
//  IL_0014:  br.s       IL_0000
//} // end of method Program::e2

[<EntryPoint>]
let main argv = 
    let g1 = egcd 119 544
    printfn "%d" g1 
    let g2 = e2 119 544
    printfn "%d" g2 

    ignore(System.Console.ReadLine())
    0 // return an integer exit code
