```c
 #include <stdio.h>
#include <stdlib.h>
int main(void)
{
 FILE *fp = NULL;
 char rd_buf[500] = {0};
 char wr_buf[] = "正点原子 http://www.openedv.com/forum.php end";
 int ret;
    /* 打开文件 */
    if (NULL == (fp = fopen("./IO-operation/wr.txt", "w+"))) {
        perror("fopen error\n");
        exit(-1);
    }
    printf("sucess to open!\n");
    /* 写文件 */
    if (sizeof(wr_buf) >fwrite(wr_buf, 1, sizeof(wr_buf), fp)) {
        printf("fwrite error\n");
        fclose(fp);
        exit(-1);
    }
    printf("sucess to write!\n");
    /* 将读写位置移动到文件头部 */
    if (0 > fseek(fp, 0, SEEK_SET)) {
        perror("fseek error\n");
        fclose(fp);
        exit(-1);
    }
    /* 读文件 */
    if (sizeof(wr_buf) > (ret = fread(rd_buf, 1, sizeof(wr_buf), fp))) 
    {
        printf("fread error\n");
        fclose(fp);
        exit(-1);
    }
    printf("read sucess:%d numbers strings is: %s\n", ret, rd_buf);
    /* 将读写位置移动到文件末尾 */
    if (0 > fseek(fp, 0, SEEK_END)) {
        perror("fseek error\n");
        fclose(fp);
        exit(-1);
    }
    printf("sucess to move to end!\n");
    /* 获取当前位置偏移量 */
    if (0 > (ret = ftell(fp))) {
        perror("ftell error\n");
        fclose(fp);
        exit(-1);
    }
    printf("sucess to get offset!\n");
    printf("file size: %d byte\n", ret);

    /* 关闭文件 */
    fclose(fp);
    exit(0);
}
```