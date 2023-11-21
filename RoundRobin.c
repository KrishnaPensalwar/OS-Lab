Name :Krishna Rajendra Pensalwar
Roll No. : TIA54

#include "iostream"
using namespace std;

void rr(int num,int bt[],int tq);

int main(){
    int num,tq;

    cout<<"Enter number of processes";
    cin>>num;

    int bt[num];
    cout<<"Enter processes";
    for (int i = 0; i < num; i++) {
        cout<<"ENTER BT OF "<<i+1;
        cin>>bt[i];
    }

    cout<<"Enter time qu";
    cin>>tq;

    rr(num,bt,tq);

    return 0;

}

void rr(int num,int bt[],int tq){
    int rem_bt[num],wt[num],tat[num];

    float avgwt=0;
    float avgtat=0;

    int te=0;

    for (int i = 0; i < num; i++) {
        rem_bt[i]=bt[i];
    }
    while(1){
        int flag=0;

        for (int i = 0; i < num; i++) {
            if(rem_bt[i]>0){
                flag=1;

                if(rem_bt[i] > tq){
                    rem_bt[i] -= tq;
                    te +=tq;

                }else{
                    te+= rem_bt[i];
                    tat[i]=te;
                    rem_bt[i]=0;

                }
            }

        }
       if(flag==0){
           break;
       }

    }
    cout<<"Process\tBT\tWT\tTAT\n";
    for (int i = 0; i < num; i++) {
        wt[i] = tat[i] - bt[i];
        avgwt +=wt[i];
        avgtat+=tat[i];
        cout<<i+1<<"\t\t"<<bt[i]<<"\t"<<wt[i]<<"\t"<<tat[i]<<"\n";
    }

    avgwt /= num;
    avgtat /= num;

    printf("Average Waiting-Time = %f\n", avgwt);
    printf("Average Turnaround-Time = %f\n", avgtat);

}
