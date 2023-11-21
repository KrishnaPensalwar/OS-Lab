#include "iostream"

using namespace std;

struct Process{
    int at;
    int bt;
    int wt;
    int id;
    int tat;
};

void del(Process p[],int n){
    for (int i = 0; i < n; i++) {
        p[i]=p[i+1];
    }
}

void sortprocess(Process p[],int n){
    for (int i = 1; i < n; i++)
    {
        for (int j = 0; j < n - i; j++)
        {
            if (p[j].bt > p[j + 1].bt)
            {
                Process temp = p[j];
                p[j] = p[j + 1];
                p[j + 1] = temp;
            }
        }
    }
}

int main(){
    int n;
    cout<<"Enter the number of processes.";
    cin>>n;

    int position=0,i=0,totaltime=0,count=0;

    Process p[10],temp[10],executed;
    for (i = 0; i < n; i++) {
        cout<<"Enter AT of "<<i+1;
        cin>>p[i].at;
        cout<<"Enter BT of "<<i+1;
        cin>>p[i].bt;
    }

    temp[position++]=p[i++];

    totaltime=temp[0].bt;

    for(int j=0;j<totaltime;j++){
        executed=temp[0];
        executed.bt -= 1;
        count++;
        temp[0]=executed;

        if(executed.bt==0)
        {
            temp[0]=executed;
            for(int t=0;t<n;t++){
                if(executed.id==p[t].id){
                    int temperory= p[t].bt;
                    p[t]=executed;
                    p[t].bt=temperory;
                    p[t].wt=count-p[t].bt-p[t].at;
                    p[t].tat=p[t].wt+p[t].bt;
                }
            }

            cout<<"Process "<<executed.id<<" ended at :"<<count<<endl;
            del(temp,n);
            position--;
        }

        if(p[i].at <=count){
            for(int x=i;x<n;x++){
                if(p[x].at<=count){
                    temp[position++]=p[i++];
                    totaltime +=p[x].bt;
                }
            }
            sortprocess(temp,position);
        }
    }

}
