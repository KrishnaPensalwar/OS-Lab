#!bin/bash
ch=0
while [ $ch != 7 ]
do
echo -e "Enter your choice.\n1.Create Record Book.\n2.Insert Record.\
n3.Delete Record.\n4.Modify Record.\n5.Display Record Book.\n6.Search Record.\
n7.Exit"
read ch
case $ch in
1)
echo "Enter File Name."
read fname
touch $fname.txt
;;
2)
echo "Enter Emp Id"
read E_id
if grep -q $E_id Record_Book.txt
then
echo -e "Employee id already exists...\n"
echo "Enter Emp Id"
read E_id
fi
echo -e "\nEnter name"
read E_Name
echo -e "\nEnter mobile number"
read mobile
if (( ${#mobile} != 10 ))
then
echo "Enter 10 digit mobile number."
echo -e "\nEnter mobile number"
read mobile
fi
echo -e "\nEnter city"
read city
echo $E_id " " $E_Name " " $mobile " "$city
>>Record_Book.txt
;;
3)
echo "Employee Id of the record you want to delete."
read temp
sed -i '/'$temp'/d' Record_Book.txt
;;
4)
echo "Enter employee id of employee to be modify"
read empid
no=`grep -n $empid Record_Book.txt | cut -c 1`
echo -e "Enter what you want to modify.\n1.Name\n2.Mobile Number \n
3.City \n 4.Exit"
read change
case $change in
1)
echo "Enter old name"
read oldname
echo "Enter new name"
read newname
sed -i "$no s/$oldname/$newname/" Record_Book.txt
;;
2)
echo "Enter old mobile number"
read oldmobile
echo "Enter new mobile number"
read newmobile
sed -i "$no s/$oldmobile/$newmobile/" Record_Book.txt
;;
3)
echo "Enter old city"
read oldcity
echo "Enter new city."
read newcity
sed -i "$no s/$oldcity/$newcity/" Record_Book.txt
;;
4) ;;
esac
;;
5)
echo -e "-------------------------------------------------\n"
echo -e " Address Book \n"
echo -e "-------------------------------------------------\n"
cat Record_Book.txt
echo -e "-------------------------------------------------\n"
;;
6)
echo -e "Enter Employee Id."
read eid
echo -e "\nYour Searched Record...\n"
grep -i $eid Record_Book.txt
echo -e "\n"
;;
7)
;;
esac
done


/*
--------------------------OUTPUT-----------------------------
krishna@Krishna:~$ bash book.sh
Enter your choice.
1.Create Record Book.
2.Insert Record.
3.Delete Record.
4.Modify Record.
5.Display Record Book.
6.Search Record.
7.Exit
1
Enter File Name.
Record_Book
Enter your choice.
1.Create Record Book.
2.Insert Record.
3.Delete Record.
4.Modify Record.
5.Display Record Book.
6.Search Record.
7.Exit
2
Enter Emp Id
ID1
Enter name
Krishna
Enter mobile number
8085138939
Enter city
Latur
Enter your choice.
1.Create Record Book.
2.Insert Record.
3.Delete Record.
4.Modify Record.
5.Display Record Book.
6.Search Record.
7.Exit
5
-------------------------------------------------
Address Book
-------------------------------------------------
ID1 Krishna 8085138939 Latur
-------------------------------------------------
Enter your choice.
1.Create Record Book.
2.Insert Record.
3.Delete Record.
4.Modify Record.
5.Display Record Book.
6.Search Record.
7.Exit
2
Enter Emp Id
ID2
Enter name
Shantanu
Enter mobile number
6204071
Enter 10 digit mobile number.
Enter mobile number
1234567890
Enter city
Jalgaon
Enter your choice.
1.Create Record Book.
2.Insert Record.
3.Delete Record.
4.Modify Record.
5.Display Record Book.
6.Search Record.
7.Exit
5
-------------------------------------------------
Address Book
-------------------------------------------------
ID1 Krishna 8085138939 Latur
ID2 Shantanu 1234567890 Jalgaon
-------------------------------------------------
Enter your choice.
1.Create Record Book.
2.Insert Record.
3.Delete Record.
4.Modify Record.
5.Display Record Book.
6.Search Record.
7.Exit
4
Enter employee id of employee to be modify
ID2
Enter what you want to modify.
1.Name
2.Mobile Number
3.City
4.Exit
1
Enter old name
Shantanu
Enter new name
Om
Enter your choice.
1.Create Record Book.
2.Insert Record.
3.Delete Record.
4.Modify Record.
5.Display Record Book.
6.Search Record.
7.Exit
5
-------------------------------------------------
Address Book
-------------------------------------------------
ID1 Krishna 8085138939 Latur
ID2 Om 1234567890 Jalgaon
-------------------------------------------------
Enter your choice.
1.Create Record Book.
2.Insert Record.
3.Delete Record.
4.Modify Record.
5.Display Record Book.
6.Search Record.
7.Exit
3
Employee Id of the record you want to delete.
ID2
Enter your choice.
1.Create Record Book.
2.Insert Record.
3.Delete Record.
4.Modify Record.
5.Display Record Book.
6.Search Record.
7.Exit
5
-------------------------------------------------
Address Book
-------------------------------------------------
ID1 Krishna 8085138939 Latur
-------------------------------------------------
Enter your choice.
1.Create Record Book.
2.Insert Record.
3.Delete Record.
4.Modify Record.
5.Display Record Book.
6.Search Record.
7.Exit
6
Enter Employee Id.
ID1
Your Searched Record...
ID1 Krishna 8085138939 Latur
Enter your choice.
1.Create Record Book.
2.Insert Record.
3.Delete Record.
4.Modify Record.
5.Display Record Book.
6.Search Record.
7.Exit
7

*/
