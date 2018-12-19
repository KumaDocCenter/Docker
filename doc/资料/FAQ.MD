# FAQ

【注意，Docker容器是在VirtualBox的虚拟机里面，不是在Windows里面，所以不能用127.0.0.1访问】 



## Kitematic 更改卷时报错

**错误信息** 

```
Invalid directory - Please make sure the directory exists and you can read/write to it.
```

**翻译** 

```
无效目录-请确保目录存在，您可以对它进行读写。
```

**分析** 

卷 目录的设置，只能设置在当前用户目录下。如

`C:\Users\<username>\Documents\Kitematic`