# Zynq7010_eink_controller

## 这是一个基于ZYNQ7010的EINK控制器

**声明:作者还在学习FPGA 并且是个高中生没太多时间来研究 这个项目...鸽鸽鸽要好几年才能搞定哦**

鉴于ZYNQ7000系列arm+fpga的芯片构架和芯片内部总线的高速互联，我认为可以设计一个系统+EINK控制器互相联动的可编程软硬件开发平台。

EBAZ4205控制板搭载的也是ZYNQ7010前段时间在咸鱼20元+10元邮费就可以带回家了呢~

很快我就发现我还是不会玩EBAZ4205于是我又买了一块来自MicroPhase的Z7-Lite(只是我当时太菜了...我现在也觉得没必要...不过总的来说方便一些咯)

Z7-Lite也是这个项目还未成熟之前会一直(可能吧)使用的开发板。

至于核心的屏幕驱动主要借鉴>>>[julbouln/ice40_eink_controller](https://github.com/julbouln/ice40_eink_controller)



## 项目概况：

- #### 20210721：

  1. 使用LCEDA画了一块Z7-Lite测试ED097TC2的小板子，并用捷配打样了

     结果：板子还未到货

  2. 从一个大佬手里扣出了一块TPS65185的Eink电源模块PCB文件，源文件是AD格式由于我不太会用AD转换成LCEDA的格式，打样完成后元器件今天才到齐

     结果：懒得焊接

- #### 20210804：

  1. 实现Verilog状态机读取EC11旋转编码器
  
     结果：效果还可以~
  
  2. 焊接完TPS65185模块
  
     结果：没反应...
     
  3. 焊接完成Z7-Lite测试ED097TC2的小板子
  
     结果：发现对板接口弄反了以及把旋转编码器的B相误接到开发板的网口IC复位腿上

## 计划任务:

- #### 20210721：

  - [ ] 先定个小目标,用PL端或者PS端常规驱动TPS65185模块

- #### 20210804：

  - [x] 重新绘制Z7-Lite测试ED097TC2的小板子

## 项目目标:

- #### 20210721：

  - [ ] 输入视频源/PS端系统视频源显示输出到任意尺寸任意信号(8bit/16bit)的Eink墨水屏



