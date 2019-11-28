# how java work
### A Brief History of How Programming Languages Work
所有高级（也叫第三代）编程语言允许你使用和自然语言相似的语言来编写程序。这些高等级的程序就是源代码
低等级的编程语言更像是给计算机读的。
### compilers 编译器
大多数计算机语言使用“编译--链接--执行”的形式。你用源代码（高级语言）开始然后编译器把程序转换为低等级语言供计算机识别。
在大多数编译语言中，包含编译后生成的低等级语言代码的文件成为对象文件（object file）。把这些对象文件收集并链接在一起就创建出了可执行文件（executable file）。可执行文件的另一个术语叫做机器码。
###  Interpreters
有较少的语言避开了“编译--链接--执行”的序列。解释型语言用即使转换来运行。就是确定每个高级版本的低级版本，需要的时候就及时执行。
There are a smaller number of languages (Lisp and Scheme are most famous; CMU uses ML in 15-212) that avoid the "compile-link-execute" sequence and instead try to do the conversion "on-the-fly" (also called "as needed").
In other words, an interpreted language takes each high-level statement, determines its low-level version and executes (while linking if need be) the result. This is done for each statement in succession (before the next high-level statement is even looked at).

当编译型语言编译完之后一般都比解释型语言执行要快，因为编译完成后更符合机器取识别。
### how java works
java是第一种结合2中形式的语言，有2种形式的优点。
#### 平台独立
其他语言都是有平台限制的（比如c++），java用java虚拟机消除了平台的限制。它不是把代码编译为可执行文件，而是编译为字节码.class，然后在由虚拟机来解释执行字节码文件，解释（类似即使编译）为可执行文件。虚拟机在不同的平台通过不同的底层原理使得他们都能够运行字节码文件，从而实现平台独立。
较早的语言都是“编译链接再执行”，而java是“编译再连接执行”。
字节码文件编译为可执行文件会运行更快（再jvm中），但可执行文件只能再本平台使用。
### others advantages of java
java其他的优势和其他语言一样，比如分布式编程，多线程，安全性等。
java是一个基于库的语言，有许多前人的成果，可以拿来用。api（application programmer interface）。
c#语言和java很相似，也有字节码文件，但它是微软的，没有字节码面向linux系统的解释器。



