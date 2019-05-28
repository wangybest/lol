import java.util.Arrays;
public class arrays {
    
    //完成 main 方法
    public static void main(String[] args) {
        int[] scores={ 89 , -23 , 64 , 91 , 119 , 52 , 73};
        int[] print=mc(scores);
        System.out.print("前三"+Arrays.toString(print));
        
        
    }
    
    //定义方法完成成绩排序并输出前三名的功能
    public static int[] mc(int[] a){
        Arrays.sort(a);
        int j=0;
        int[] b=new int[3];
        for(int i=a.length-1;i>=0&&j<3;i--){
            if(a[i]>100||a[i]<0){
                continue;
            }
            b[j]=a[i];
            j++;
   
            }
            return b;
        }
    }
    
    
