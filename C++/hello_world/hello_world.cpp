#include <iostream>
#include <vector>

using namespace std;

int main()
{   vector<int> v ={1,2,3,4,5};
    v.push_back(4);
    for (int element : v)
    {
        cout << element << " "; 
    }
    cout <<endl;
    return(0); 


}