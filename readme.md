HW02 作業
===
## 1. 作業HW02_題目
1. 修改main.s以觀察`push`和`pop`指令。
2. 指令`push`和 `pop`中的暫存器順序是否會影響執行結果。
3. 指令`push`和`pop`動作說明。

## 2. 實驗步驟
1. 先將資料夾gnu-mcu-eclipse-qemu完整複製到ESEmbedded_HW02_Example資料夾中。

2. 修改main.s:
	為了比較`push`、 `pop`的不同，因此輸入3個參數r0、r1、r2，並且特別設計push {r0}、push {r1,r2} 、 pop {r3}、pop {r4,r5}，來觀察暫存器運作方式。

![](https://github.com/o1o1o0123/ESEmbedded_HW02/blob/master/img-folder/0.JPG)

3. 將 main.s 編譯並以 qemu 模擬， `$ make clean`， `$ make`， `$ make qemu`

![](https://github.com/o1o1o0123/ESEmbedded_HW02/blob/master/img-folder/01.JPG)

4. 將r0、r1、r2填入值

![](https://github.com/o1o1o0123/ESEmbedded_HW02/blob/master/img-folder/4.JPG)

5.push

當執行`push {r0}`時， sp為`0x200000fc`， 每放入一次 Stack Pointer 位置減4bytes，此時 `0x200000fc: 0x00000001`。
![](https://github.com/o1o1o0123/ESEmbedded_HW02/blob/master/img-folder/5.JPG)
當執行`push {r1、r2}`時， sp為`0x200000f4`， 此時 `0x200000fc: 0x00000001、
					       0x200000f8: 0x00000003、
					       0x200000f4: 0x00000002。`
![](https://github.com/o1o1o0123/ESEmbedded_HW02/blob/master/img-folder/6.JPG)

6.pop

當執行`pop {r3}`時， sp為`0x200000f8`， 每取出一次 Stack Pointer 位置加 4bytes，此時 r3=2。
![](https://github.com/o1o1o0123/ESEmbedded_HW02/blob/master/img-folder/7.JPG)
當執行`pop {r4、r5}`時， sp為`0x20000100` 歸回原位， 此時 `r3=2、r4=3、r5=1。`
![](https://github.com/o1o1o0123/ESEmbedded_HW02/blob/master/img-folder/8.JPG)

## 3. 結果與討論
1. 對`push`、 `pop`指令進行說明，由上可以了解`push`指令功能為將值放入暫存器中，每放入一次 Stack Pointer 位置減4bytes。

   而`pop`指令功能則為將暫存器中的值取出， 每取出一次 Stack Pointer 位置加 4bytes。
   
2. 針對`push`暫存器順序說明，如實驗步驟5為例，執行`push {r0}`時，會將`r0`存入暫存器中。

   接著執行`push {r1、r2}`指令時， 會先把`r2`暫存器存入。
   
   因此順去變成r0->r2->r1。
   
3. 針對`pop`暫存器順序說明，如實驗步驟6為例，執行`pop {r3}`時會將暫存器最底部的值取出並放入`r3`，因此`r3=r1`。

   接著執行`push {r4、r5}`指令時會將暫存器最底部的值取出並優先放入`r4`接著放入`r5`，因此`r4=r2`、`r5=r0`。
