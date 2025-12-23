OUTPUT_FORMAT("elf64-littleaarch64", "elf64-littleaarch64", "elf64-littleaarch64")
/*定义输出文件格式为 64 位小端序 AArch64 ELF 格式
  三个相同参数表示默认、大端和小端格式都使用同一种格式
*/
OUTPUT_ARCH(aarch64) /*定义输出文件架构为 AArch64*/
ENTRY(_start) /*指定程序入口点为 _start 符号*/
SECTIONS
{
 . = 0x00000000;
 . = ALIGN(8);  /*设置当前位置计数器为 0，并 8 字节对齐*/
 .text :
 {
  *(.__image_copy_start)   /*重定位复制起始标记*/
  arch/arm/cpu/armv8/start.o (.text*)  /*优先放置启动代码*/
 }
 .efi_runtime : {
                __efi_runtime_start = .;
  *(.text.efi_runtime*)
  *(.rodata.efi_runtime*)
  *(.data.efi_runtime*)
                __efi_runtime_stop = .;
 } //EFI 运行时重定位信息段
 .text_rest :  //放置剩余的代码段
 {
  *(.text*)
 }
 . = ALIGN(8);
 .rodata : { *(SORT_BY_ALIGNMENT(SORT_BY_NAME(.rodata*))) }  //只读数据段，按名称和对齐方式排序
 . = ALIGN(8);
 .data : {  //已初始化数据段
  *(.data*)
 }
 . = ALIGN(8);
 . = .;
 . = ALIGN(8);
 .u_boot_list : {
  KEEP(*(SORT(.u_boot_list*)));
 }
 . = ALIGN(8);
 .efi_runtime_rel : {
                __efi_runtime_rel_start = .;
  *(.rel*.efi_runtime)
  *(.rel*.efi_runtime.*)
                __efi_runtime_rel_stop = .;
 }
 . = ALIGN(8);
 .image_copy_end :
 {
  *(.__image_copy_end)
 }
 . = ALIGN(8);
 .rel_dyn_start :
 {
  *(.__rel_dyn_start)
 }
 .rela.dyn : {
  *(.rela*)
 }
 .rel_dyn_end :
 {
  *(.__rel_dyn_end)
 }
 _end = .;
 . = ALIGN(8);
 .bss_start : {
  KEEP(*(.__bss_start));
 }
 .bss : {  //BSS 段（未初始化数据）
  *(.bss*)
   . = ALIGN(8);
 }
 .bss_end : {
  KEEP(*(.__bss_end));
 }
 /DISCARD/ : { *(.dynsym) }
 /DISCARD/ : { *(.dynstr*) }
 /DISCARD/ : { *(.dynamic*) }
 /DISCARD/ : { *(.plt*) }
 /DISCARD/ : { *(.interp*) }
 /DISCARD/ : { *(.gnu*) }
}
